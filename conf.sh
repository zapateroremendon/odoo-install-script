#!/bin/bash
##fixed parameters
#odoo

OE_VERSION="17.0"
OE_INSTALL_DIR="$OE_HOME/$OE_VERSION"
OE_REPO="$OE_INSTALL_DIR/odoo"
#Set to true if you want to install it, false if you don't need it or have it already installed.
INSTALL_WKHTMLTOPDF="True"
OE_PORT="8069"
OE_NETRPC_PORT="8070"
OE_LONGPOOL_PORT="8072"
OE_WORKERS="2"
#Choose the Odoo version which you want to install. For example: 9.0, 8.0, 7.0 or saas-6. When using 'trunk' the master version will be installed.
#IMPORTANT! This script contains extra libraries that are specifically needed for Odoo 9.0

# Set this to True if you want to install Odoo Enterprise!
IS_ENTERPRISE="False"
#set the superadmin password
OE_SUPERADMIN="admin"

INSTALL_PG_SERVER="True" # if false, than only client will be installed
OE_DB_HOST="localhost"
OE_DB_PORT="5432"
OE_DB_USER="odoo"
OE_DB_PASSWORD="odoo"
PG_VERSION=16

WEB_SERVER="nginx" # or "apache2"

HTTP_PROTOCOL="https"
HTTPS_PORT="443"
INSTALL_CERTIFICATE="True"
PUBLIC_IP="85.31.224.197" # SET MANUALLY
DOMAIN_NAME="dynamicprocesscloud.com" # DNS SHOULD BE ALREADY CONFIGURED!
DOMAIN_ALIASES=() # ("www.demo.ventortech.com" "zzz.demo.ventortech.com")
LE_EMAIL="xavierojeda27@gmail.com"
LE_CRON_SCRIPT="/etc/cron.daily/certbot-renew"

if [ $IS_ENTERPRISE = "True" ]; then
    OE_CONFIG="$OE_INSTALL_DIR/odoo-enterprise.conf"
    OE_INIT="odoo-$OE_VERSION-enterprise"
    OE_WEBSERV_CONF="odoo-$OE_VERSION-enterprise.conf"
    OE_WEBSERVER_HOST="odoo$OE_VERSION-e"
    OE_ADDONS_PATH="$OE_REPO/addons,$OE_REPO/themes,$OE_REPO/cus_addons,$OE_REPO/oca_addons,$OE_REPO/ent_addons"
    OE_LOG_PATH="$OE_INSTALL_DIR/logs/enterprise"
    OE_TEXT="Enterprise"
else
    OE_CONFIG="$OE_INSTALL_DIR/odoo.conf"
    OE_INIT="odoo-$OE_VERSION"
    OE_WEBSERV_CONF="odoo-$OE_VERSION.conf"
    OE_WEBSERVER_HOST="odoo$OE_VERSION"
    OE_ADDONS_PATH="$OE_REPO/addons,$OE_REPO/themes,$OE_REPO/ent_addons,$OE_REPO/cus_addons,$OE_REPO/oca_addons"
    OE_LOG_PATH="$OE_INSTALL_DIR/logs/community"
    OE_TEXT="Community"
fi

if [ $OE_VERSION = "15.0" ] || [ $OE_VERSION = "16.0" ] || [ $OE_VERSION = "17.0" ]; then
    PYTHON_VERSION="3"
else
    echo "Odoo version $OE_VERSION is not supported. Use 15.0, 16.0 or 17.0."
fi
