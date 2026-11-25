#!/usr/bin/env python3
"""Show the SwiftKey pairing code for this Mac as a QR image.

Run setup-syncclipboard.py first. The code holds the server password, so this
script writes only an owner-only PNG and never prints the code. Delete the PNG
after pairing.

Usage: python3 scripts/mac/pairing-qr.py ~/Desktop/swiftkey-pairing.png
"""
import base64
import json
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

SECRET = Path.home() / "Library/Application Support/SyncClipboard/phone-pairing.json"
TAILSCALE = "/Applications/Tailscale.app/Contents/MacOS/Tailscale"


def command_output(*args):
    try:
        result = subprocess.run(args, capture_output=True, text=True)
    except FileNotFoundError:
        return ""
    return result.stdout.strip() if result.returncode == 0 else ""


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    qrencode = shutil.which("qrencode") or "/opt/homebrew/bin/qrencode"
    if not os.path.exists(qrencode):
        sys.exit("qrencode is missing. Install it with: brew install qrencode")
    pairing = json.loads(SECRET.read_text())
    # Wi-Fi address first, Tailscale second. The phone keeps using whichever answered last.
    tailscale = command_output(TAILSCALE, "ip", "-4").splitlines()
    hosts = [command_output("ipconfig", "getifaddr", "en0"), tailscale[0] if tailscale else ""]
    hosts = [host for host in hosts if host]
    if not hosts:
        sys.exit("No Wi-Fi or Tailscale address found")
    payload = {
        "hosts": hosts,
        "port": pairing["port"],
        "user": pairing["user"],
        "password": pairing["password"],
        "pin": "sha256/" + pairing["pin"],
    }
    encoded = base64.urlsafe_b64encode(json.dumps(payload, separators=(",", ":")).encode()).decode().rstrip("=")
    # The code goes to qrencode on stdin, because other processes can read command arguments.
    # mkstemp creates an owner-only file, which then replaces any older image in one step.
    destination = Path(sys.argv[1]).expanduser().resolve()
    descriptor, temporary = tempfile.mkstemp(suffix=".png", dir=destination.parent)
    os.close(descriptor)
    try:
        subprocess.run([qrencode, "-s", "10", "-m", "4", "-o", temporary],
                       input=("skclip1:" + encoded).encode(), check=True)
        os.replace(temporary, destination)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)
    print("Pairing QR written for", ", ".join(hosts))


if __name__ == "__main__":
    main()
