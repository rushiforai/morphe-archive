#!/usr/bin/env python3
"""Configure SyncClipboard on this Mac for the SwiftKey patch.

Quit SyncClipboard, run this script, then start SyncClipboard again.
Running it again keeps the existing password and certificate.

The Mac app talks to its own server over plain HTTP bound to 127.0.0.1:5032,
so that traffic never leaves the machine. The phone reaches the server over
HTTPS on port 5033 with a self-signed certificate that the patch pins by its
public key. Secrets are written to owner-only files and never printed.
"""
import base64
import json
import os
import secrets
import subprocess
from pathlib import Path

APP_DIR = Path.home() / "Library/Application Support/SyncClipboard"
TLS_DIR = APP_DIR / "phone-tls"
CONFIG = APP_DIR / "SyncClipboard.json"
KESTREL = APP_DIR / "phone-kestrel.json"
SECRET = APP_DIR / "phone-pairing.json"
LOOPBACK_PORT = 5032
PHONE_PORT = 5033
USER_NAME = "swiftkey"


def openssl(*args, data=None):
    return subprocess.run(["openssl", *args], input=data, check=True, capture_output=True).stdout


def create_certificate():
    TLS_DIR.mkdir(mode=0o700, exist_ok=True)
    os.chmod(TLS_DIR, 0o700)
    key, cert = TLS_DIR / "key.pem", TLS_DIR / "cert.pem"
    if not key.exists():
        openssl("req", "-x509", "-newkey", "ec", "-pkeyopt", "ec_paramgen_curve:prime256v1",
                "-nodes", "-keyout", str(key), "-out", str(cert), "-days", "3650",
                "-subj", "/CN=SyncClipboard for SwiftKey",
                "-addext", "subjectAltName=DNS:localhost,IP:127.0.0.1")
    os.chmod(key, 0o600)
    public_key = openssl("x509", "-in", str(cert), "-pubkey", "-noout")
    der = openssl("pkey", "-pubin", "-outform", "der", data=public_key)
    digest = openssl("dgst", "-sha256", "-binary", data=der)
    return key, cert, base64.b64encode(digest).decode()


def write_private_json(path, data):
    path.touch(mode=0o600, exist_ok=True)
    os.chmod(path, 0o600)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False))


def main():
    key, cert, pin = create_certificate()
    existing_secret = json.loads(SECRET.read_text()) if SECRET.exists() else {}
    password = existing_secret.get("password") or secrets.token_urlsafe(32)

    write_private_json(KESTREL, {
        "AllowedHosts": "*",
        "Kestrel": {"Endpoints": {
            "mac": {"Url": f"http://127.0.0.1:{LOOPBACK_PORT}"},
            "phone": {"Url": f"https://*:{PHONE_PORT}",
                      "Certificate": {"Path": str(cert), "KeyPath": str(key)}},
        }},
    })

    config = json.loads(CONFIG.read_text()) if CONFIG.exists() else {"ConfigVersion": 3}
    config["ServerService"] = {
        **config.get("ServerService", {}),
        "SwitchOn": True, "Port": PHONE_PORT, "UserName": USER_NAME, "Password": password,
        "EnableHttps": True, "CertificatePemPath": str(cert), "CertificatePemKeyPath": str(key),
        "EnableCustomConfigurationFile": True, "CustomConfigurationFilePath": str(KESTREL),
        # Raycast keeps the long-term history. The server keeps only recent items.
        "MaxHistoryCount": 20, "HistoryRetentionMinutes": 60,
    }
    config["SyncService"] = {
        **config.get("SyncService", {}),
        "SyncSwitchOn": True, "PullSwitchOn": True, "PushSwitchOn": True,
        "EnableUploadText": True, "EnableUploadImage": False,
        "EnableUploadSingleFile": False, "EnableUploadMultiFile": False,
        "NotifyOnDownloaded": False, "IntervalTime": 1,
    }
    config["Account"] = {"AccountId": "this-mac", "AccountType": "SyncClipboard"}
    config.setdefault("SavedAccounts", {}).setdefault("SyncClipboard", {})["this-mac"] = {
        "RemoteURL": f"http://127.0.0.1:{LOOPBACK_PORT}", "UserName": USER_NAME,
        "Password": password, "DeletePreviousFilesOnPush": True, "CustomName": "This Mac",
    }
    write_private_json(CONFIG, config)
    write_private_json(SECRET, {"user": USER_NAME, "password": password, "port": PHONE_PORT, "pin": pin})
    print("pin sha256/" + pin)


if __name__ == "__main__":
    main()
