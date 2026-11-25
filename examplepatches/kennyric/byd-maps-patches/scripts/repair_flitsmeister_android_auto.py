#!/usr/bin/env python3
"""Check or repair the tested Android Auto installer attribution for Flitsmeister.

Requires Python 3, adb, and an explicitly selected USB-debugging device.
--repair updates the exact installed APK through Google's system installer;
the user must confirm Update on the device. No uninstall or APK rewriting.
"""
import argparse
import hashlib
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import time
import uuid


PACKAGE = "nl.flitsmeister"
INSTALLER = "com.google.android.packageinstaller"
PLAY = "com.android.vending"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--serial", required=True, help="Device serial from adb devices")
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true", help="Read-only check (default)")
    mode.add_argument("--repair", action="store_true", help="Launch an in-place update; confirm on phone")
    args = parser.parse_args()
    sdk = Path(os.environ.get("ANDROID_HOME", str(Path.home() / "Library/Android/sdk")))
    adb = shutil.which("adb") or str(sdk / "platform-tools" / ("adb.exe" if os.name == "nt" else "adb"))

    def run(*command, **kwargs):
        return subprocess.check_output([adb, "-s", args.serial, *command], **kwargs)

    def shell(*command):
        return run("shell", shlex.join(command), text=True)

    def snapshot():
        dump = shell("dumpsys", "package", PACKAGE)
        def field(name):
            match = re.search(r"^\s*" + re.escape(name) + r"=([^\r\n]+)", dump, re.M)
            return match.group(1).strip() if match else None
        paths = shell("pm", "path", PACKAGE).splitlines()
        if len(paths) != 1 or not paths[0].startswith("package:"):
            raise RuntimeError("Expected one installed patched APK; split sets and missing apps are unsupported.")
        path = paths[0][len("package:"):]
        return {
            "initiating": field("initiatingPackageName"),
            "installing": field("installerPackageName"),
            "app_id": field("appId") or field("userId"),
            "first_install": field("firstInstallTime"),
            "path": path,
            "sha256": shell("sha256sum", path).split()[0],
        }

    def accepted_source(state):
        return state["initiating"] == INSTALLER and state["installing"] == PLAY

    before = snapshot()
    print("Initiating package:", before["initiating"] or "not reported")
    print("Installing package:", before["installing"] or "not reported")
    print("Installed APK SHA-256:", before["sha256"], flush=True)
    if accepted_source(before):
        print("Matches the installer pair tested with Android Auto. Check Customize launcher for actual admission.")
        return 0
    if not args.repair:
        print("Does not match the tested installer pair. Use --repair to launch the confirmed update flow.")
        return 2

    shell_permissions = shell("dumpsys", "package", "com.android.shell")
    if "android.permission.INSTALL_PACKAGES: granted=true" not in shell_permissions:
        raise RuntimeError("This device's ADB shell lacks INSTALL_PACKAGES; the tested repair is unavailable.")
    if shell("id", "-u").strip() != "2000":
        raise RuntimeError("Use ordinary ADB shell (UID 2000), not adb root.")
    if not before["app_id"] or not before["first_install"]:
        raise RuntimeError("Cannot verify app/data identity on this device; no installation was started.")
    if not shell("pm", "path", INSTALLER).startswith("package:"):
        raise RuntimeError("Google system Package Installer is absent; this route is not verified here.")

    with tempfile.TemporaryDirectory(prefix="flitsmeister-auto-") as temporary:
        apk = Path(temporary) / "installed.apk"
        run("pull", before["path"], str(apk))
        if hashlib.sha256(apk.read_bytes()).hexdigest() != before["sha256"]:
            raise RuntimeError("Installed APK changed during capture; no installation was started.")
        name = "Flitsmeister-identical-update-" + uuid.uuid4().hex + ".apk"
        shell("content", "insert", "--uri", "content://media/external/downloads",
              "--bind", "_display_name:s:" + name,
              "--bind", "mime_type:s:application/vnd.android.package-archive",
              "--bind", "relative_path:s:Download/")
        row = shell("content", "query", "--uri", "content://media/external/downloads",
                    "--projection", "_id:_display_name", "--where", "_display_name='" + name + "'")
        ids = re.findall(r"\b_id=(\d+)", row)
        if len(ids) != 1:
            raise RuntimeError("Could not identify the staged download: " + name)
        uri = "content://media/external/downloads/" + ids[0]
        with apk.open("rb") as source:
            subprocess.run([adb, "-s", args.serial, "shell", "content", "write", "--uri", uri],
                           stdin=source, check=True)
        result = shell("am", "start", "-W", "-a", "android.intent.action.VIEW",
                       "-d", uri, "-t", "application/vnd.android.package-archive",
                       "-n", INSTALLER + "/com.android.packageinstaller.InstallStart",
                       "--grant-read-uri-permission",
                       "--es", "android.intent.extra.INSTALLER_PACKAGE_NAME", PLAY,
                       "--ez", "android.intent.extra.NOT_UNKNOWN_SOURCE", "true")
        print(result, end="", flush=True)
        if "Error:" in result or "Error type" in result:
            raise RuntimeError("System installer could not open. Staged file: " + name)
        print("Confirm UPDATE on the phone. Waiting up to 180 seconds; do not uninstall the app.", flush=True)
        deadline = time.monotonic() + 180
        while time.monotonic() < deadline:
            time.sleep(2)
            after = snapshot()
            if not accepted_source(after):
                continue
            for key in ("sha256", "app_id", "first_install"):
                if before[key] != after[key]:
                    raise RuntimeError("Unexpected change to " + key + "; inspect the device before continuing.")
            shell("content", "delete", "--uri", uri)
            print("Verified: identical APK, same app ID and first-install time, expected installer pair.")
            print("Reopen Android Auto > Customize launcher to verify Flitsmeister is visible.")
            return 0
        raise RuntimeError("Update was not verified. It may have been cancelled. Staged download: " + name)


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, RuntimeError, subprocess.CalledProcessError) as error:
        print("ERROR:", error, file=sys.stderr)
        sys.exit(1)
