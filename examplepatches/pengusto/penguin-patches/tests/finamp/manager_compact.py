#!/usr/bin/env python3
"""Reapply the compact patch through Manager on a disposable Android 35 AVD.

Precondition: install Manager, import the supplied local bundle, install a
same-key Finamp fixture, then open Finamp's patch selector with only the compact
source enabled. The fixture should already have a visible language preference.
This script never clears data or uninstalls an app.
"""
import argparse
import hashlib
import io
from pathlib import Path
import re
import subprocess
import time
import zipfile

import android_acceptance as base

NAME = "Finamp complete: all eight fixes"
ORIGINAL_SHA = "0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581"
NATIVE_PATH = "lib/arm64-v8a/libapp.so"
PACKAGE = "com.unicornsonlsd.finamp"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ("adb", "apksigner", "original-apk", "bundle", "out-root"):
        p.add_argument("--" + name, type=Path, required=True)
    p.add_argument("--serial", required=True)
    p.add_argument("--avd", required=True)
    p.add_argument("--expected-welcome", required=True)
    p.add_argument("--source-label", required=True,
                   choices=("Penguin Patches", "Penguin Patches - Finamp"))
    p.add_argument("--disposable-fixture", action="store_true", required=True)
    args = p.parse_args()
    if not re.fullmatch(r"emulator-\d+", args.serial) or args.avd != "penguin-compact-test":
        p.error("Only the explicitly named disposable penguin-compact-test AVD is allowed")
    if sha(args.original_apk.read_bytes()) != ORIGINAL_SHA:
        raise ValueError("Wrong original Finamp APK")
    base.SERIAL, base.AVD, base.PACKAGE = args.serial, args.avd, "app.morphe.manager"
    base.OUT_ROOT = args.out_root.resolve()
    if not base.OUT_ROOT.is_relative_to((base.REPO_ROOT / ".scratch").resolve()):
        raise ValueError("Output must stay in repository .scratch")
    # Existing guards remain in force; status is reported on stdout, not as JSON.
    base.write_json = lambda *_args, **_kwargs: None
    ui = base.Android(adb=args.adb)
    if not re.search(r"Accounts: 0\b", ui.adb("shell", "dumpsys", "account")):
        raise RuntimeError("Fixture emulator must not contain Android accounts")
    cached = "/data/user/0/app.morphe.manager/app_original-apks/com.unicornsonlsd.finamp_1.0.1_original.apk"
    if ui.adb("shell", "sha256sum", cached).split()[0] != ORIGINAL_SHA:
        raise RuntimeError("Manager did not cache the official original APK")
    bundle_sha = sha(args.bundle.read_bytes())
    cached_bundles = ui.adb("shell", "find", "/data/user/0/app.morphe.manager/app_patch_bundles",
                            "-name", "patches.jar").splitlines()
    if not any(ui.adb("shell", "sha256sum", path).split()[0] == bundle_sha for path in cached_bundles):
        raise RuntimeError("Manager did not import the supplied compact bundle")
    with zipfile.ZipFile(args.bundle) as z:
        props = z.read("finamp/1.0.1/manifest.properties").decode()
    native_sha = re.search(r"^abi\.arm64-v8a\.mask\.255\.sha256=([0-9a-f]{64})$", props, re.M)
    if not native_sha:
        raise ValueError("Missing compact output hash")

    def installed_apk():
        paths = ui.adb("shell", "pm", "path", PACKAGE).splitlines()
        if len(paths) != 1 or not paths[0].startswith("package:/data/app/"):
            raise RuntimeError("Expected one previously installed fixture APK")
        return ui.adb("exec-out", "cat", paths[0].removeprefix("package:"), binary=True, timeout=60)

    def signer(apk, name):
        path = base.OUT_ROOT / name
        if path.exists():
            raise RuntimeError("Refusing to overwrite a previous test APK")
        path.write_bytes(apk)
        output = subprocess.check_output([str(args.apksigner), "verify", "--print-certs", str(path)], text=True)
        matches = set(re.findall(
            r"(?im)^(?:Signer #\d+|V\d+(?:\.\d+)? Signer):? certificate SHA-256 digest: ([0-9a-f]{64})$",
            output,
        ))
        if len(matches) != 1:
            raise RuntimeError("Expected one verified signer")
        return next(iter(matches))

    user = ui.adb("shell", "am", "get-current-user").strip()
    if user != "0":
        raise RuntimeError("This disposable fixture requires foreground Android user 0")
    ui.adb("shell", "am", "force-stop", "--user", user, PACKAGE)
    before_signer = signer(installed_apk(), "before.apk")
    settings = "/data/user/0/com.unicornsonlsd.finamp/app_flutter/finampsettings.hive"
    before_settings = ui.adb("shell", "sha256sum", settings).split()[0]
    root, _ = ui.dump()
    ui.find(root, args.source_label, class_name="android.widget.TextView")
    ui.find(root, NAME, class_name="android.widget.TextView")
    if any(n.get("content-desc") == NAME + ", Disabled" for n in root.iter("node")):
        ui.tap(NAME, class_name="android.widget.TextView")
    ui.tap("Patch", class_name="android.widget.TextView")
    deadline = time.monotonic() + 180
    while time.monotonic() < deadline:
        labels = ui.labels(ui.dump()[0])
        text = {item["text"] for item in labels}
        if "Patching failed" in text:
            raise RuntimeError("Manager patching failed")
        if "Patched" in text and "Install" in text:
            break
        time.sleep(1)
    else:
        raise RuntimeError("Manager did not finish patching")
    ui.tap("Install", class_name="android.widget.TextView")
    deadline = time.monotonic() + 90
    while time.monotonic() < deadline:
        focus = ui.adb("shell", "dumpsys", "window")
        if re.search(r"mCurrentFocus=.*com\.android\.packageinstaller/", focus):
            base.PACKAGE = "com.android.packageinstaller"
            ui.tap("UPDATE")
            base.PACKAGE = "app.morphe.manager"
            time.sleep(1)
            continue
        if not re.search(r"mCurrentFocus=.*app\.morphe\.manager/", focus):
            time.sleep(1)
            continue
        if "Installed" in {item["text"] for item in ui.labels(ui.dump()[0])}:
            break
        time.sleep(1)
    else:
        raise RuntimeError("Manager did not confirm installation")
    after_apk = installed_apk()
    if signer(after_apk, "after.apk") != before_signer:
        raise RuntimeError("Update signer changed")
    with zipfile.ZipFile(io.BytesIO(after_apk)) as z:
        if sha(z.read(NATIVE_PATH)) != native_sha.group(1):
            raise RuntimeError("Installed native snapshot differs from the all-fixes output")
    if ui.adb("shell", "sha256sum", settings).split()[0] != before_settings:
        raise RuntimeError("Existing Finamp settings changed during same-key update")
    ui.adb("shell", "am", "start", "--user", user, "-n", PACKAGE + "/.MainActivity")
    base.PACKAGE = PACKAGE
    deadline = time.monotonic() + 30
    while time.monotonic() < deadline:
        try:
            ui.find(ui.dump()[0], args.expected_welcome)
            break
        except RuntimeError:
            time.sleep(0.5)
    else:
        raise RuntimeError("Finamp did not open with the expected saved language")
    print("Manager applied and installed the compact patch; signer, native output, settings and welcome verified")


if __name__ == "__main__":
    main()
