#!/usr/bin/env python3
"""Exercise the compact MPP with the real Morphe Desktop and official APK."""
import argparse
import hashlib
from pathlib import Path
import re
import subprocess
import zipfile

NAME = "Finamp complete: all eight fixes"
ORIGINAL_SHA = "0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581"
NATIVE_PATH = "lib/arm64-v8a/libapp.so"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def run(cmd, *, success=True):
    result = subprocess.run(cmd, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if (result.returncode == 0) != success:
        raise RuntimeError(f"Unexpected patcher exit {result.returncode}:\n{result.stdout}")
    return result.stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for arg in ("java", "desktop", "bundle", "original-apk", "work-dir"):
        parser.add_argument("--" + arg, type=Path, required=True)
    args = parser.parse_args()
    work = args.work_dir.resolve()
    work.mkdir(parents=True, exist_ok=False)
    original = args.original_apk.resolve()
    bundle = args.bundle.resolve()
    if digest(original.read_bytes()) != ORIGINAL_SHA:
        raise ValueError("Original APK does not match the pinned official release")
    cli = [str(args.java.resolve()), "-jar", str(args.desktop.resolve())]
    listing = run(cli + ["list-patches", "--patches", str(bundle), "-f", "com.unicornsonlsd.finamp",
                         "--with-universal-patches=false"])
    if re.findall(r"^Name: (.+)$", listing, flags=re.MULTILINE) != [NAME]:
        raise ValueError("Published bundle must expose exactly the complete Finamp patch")
    if not re.search(r"^Enabled: true$", listing, flags=re.MULTILINE):
        raise ValueError("Complete Finamp patch must be enabled by default")
    with zipfile.ZipFile(bundle) as archive:
        names = archive.namelist()
        if len(names) != len(set(names)):
            raise ValueError("Duplicate bundle entries")
        if any(name.lower().endswith((".apk", ".jks", ".keystore", ".p12")) for name in names):
            raise ValueError("An APK or signing key must never be bundled")
        properties = archive.read("finamp/1.0.1/manifest.properties").decode()
    match = re.search(r"^abi\.arm64-v8a\.mask\.255\.sha256=([0-9a-f]{64})$", properties, re.MULTILINE)
    if not match:
        raise ValueError("Missing expected all-fixes output hash")
    output = work / "patched.apk"
    common = cli + ["patch", "--unsigned", "--exclusive", "-p", str(bundle), "-e", NAME]
    run(common + ["-o", str(output), "-t", str(work / "first"), str(original)])
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(output) as after:
        old = {x.filename for x in before.infolist() if not x.is_dir()}
        new = {x.filename for x in after.infolist() if not x.is_dir()}
        expected = {n for n in old if not n.startswith("lib/") or n.startswith("lib/arm64-v8a/")}
        if expected != new:
            raise ValueError("Patched APK contains missing or unexpected entries")
        for name in expected - {NATIVE_PATH}:
            if digest(before.read(name)) != digest(after.read(name)):
                raise ValueError(f"Unexpected change to {name}")
        if digest(after.read(NATIVE_PATH)) != match.group(1):
            raise ValueError("Patched native snapshot differs from the pinned all-fixes output")
    rejected = work / "rejected.apk"
    message = run(common + ["-o", str(rejected), "-t", str(work / "second"), str(output)], success=False)
    if "unsupported or already patched" not in message or rejected.exists():
        raise ValueError("Already patched input was not rejected cleanly")
    print("Compact bundle: one patch, pinned all-fixes output, retained APK entries and input rejection verified")


if __name__ == "__main__":
    main()
