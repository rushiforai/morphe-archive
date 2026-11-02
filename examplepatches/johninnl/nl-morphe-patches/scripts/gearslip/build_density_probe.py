#!/usr/bin/env python3
"""Build a debug-signed, separately packaged actual-DEX Gearslip density probe.

This only builds the probe APK. Install and run it against a disposable, matching
debug-signed Gearslip test copy; it writes that copy's density preference.
"""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import zipfile


def run(arguments):
    subprocess.run([str(argument) for argument in arguments], check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path, help="Fresh output directory")
    parser.add_argument("--sdk", type=Path, default=Path(os.environ.get(
        "ANDROID_HOME", os.environ.get("ANDROID_SDK_ROOT", str(Path.home() / "Library/Android/sdk")))))
    parser.add_argument("--target-package", default="app.seb3thehacker.gearslip.morphetest")
    parser.add_argument("--debug-keystore", type=Path, default=Path.home() / ".android/debug.keystore")
    args = parser.parse_args()
    if not args.debug_keystore.is_file():
        raise SystemExit("Android debug keystore is missing")
    tools = max((p for p in (args.sdk / "build-tools").iterdir() if (p / "d8").is_file()),
                key=lambda p: tuple(int(part) for part in p.name.split(".")))
    android = args.sdk / "platforms/android-36/android.jar"
    if not android.is_file():
        raise SystemExit("Install Android platform 36 or choose an SDK containing it")
    args.output.mkdir(parents=True, exist_ok=False)
    output = args.output.resolve()
    classes = output / "classes"
    dex = output / "dex"
    classes.mkdir()
    dex.mkdir()
    source = Path(__file__).with_name("DensityProbe.java")
    run(["javac", "--release", "11", "-cp", android, "-d", classes, source])
    run([tools / "d8", "--lib", android, "--min-api", "31", "--output", dex,
         *sorted(classes.rglob("*.class"))])
    manifest = output / "AndroidManifest.xml"
    manifest.write_text(
        '<manifest xmlns:android="http://schemas.android.com/apk/res/android" '
        'package="nl.johninnl.gearslip.densityprobe">'
        '<uses-sdk android:minSdkVersion="31" android:targetSdkVersion="36"/>'
        '<application android:label="Gearslip Density Probe"/>'
        '<instrumentation android:name="nl.johninnl.gearslip.densityprobe.DensityProbe" '
        f'android:targetPackage="{args.target_package}"/>'
        '</manifest>', encoding="utf-8")
    unsigned = output / "unsigned.apk"
    run([tools / "aapt2", "link", "-I", android, "--manifest", manifest, "-o", unsigned])
    with zipfile.ZipFile(unsigned, "a", compression=zipfile.ZIP_DEFLATED) as archive:
        archive.write(dex / "classes.dex", "classes.dex")
    aligned = output / "aligned.apk"
    run([tools / "zipalign", "-p", "-f", "4", unsigned, aligned])
    signed = output / "density-probe.apk"
    shutil.copy2(aligned, signed)
    run([tools / "apksigner", "sign", "--ks", args.debug_keystore, "--ks-pass", "pass:android", signed])
    run([tools / "apksigner", "verify", signed])
    print(signed)
    print("Install/run only on the intended disposable emulator:")
    print(f"adb -s emulator-5554 install -r {signed}")
    print("adb -s emulator-5554 shell am instrument -w nl.johninnl.gearslip.densityprobe/.DensityProbe")


if __name__ == "__main__":
    main()
