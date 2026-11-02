#!/usr/bin/env python3
"""Build/sign a read-only Vela instrumentation probe; never connect to a device."""
import argparse
from pathlib import Path
import shutil
import subprocess
import zipfile


def run(*arguments):
    subprocess.run([str(argument) for argument in arguments], check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True, help="Probe directory containing probe.apk")
    parser.add_argument("--app-key", type=Path, required=True, help="Key that also signs patched app.vela")
    parser.add_argument("--alias", default="vela-test")
    parser.add_argument("--ks-pass", default="pass:android")
    parser.add_argument("--key-pass", default="pass:android")
    parser.add_argument("--build-tools", default="36.0.0")
    args = parser.parse_args()
    source = Path(__file__).resolve().parent
    tools = args.sdk / "build-tools" / args.build_tools
    android = args.sdk / "platforms/android-36/android.jar"
    classes, dex = args.output / "classes", args.output / "dex"
    for generated in (classes, dex):
        if generated.exists():
            shutil.rmtree(generated)
        generated.mkdir(parents=True)
    run("javac", "--release", "8", "-cp", android, "-d", classes, source / "VelaProbe.java")
    run(tools / "d8", "--min-api", "34", "--lib", android, "--output", dex, *sorted(classes.rglob("*.class")))
    unaligned, apk = args.output / "unaligned.apk", args.output / "probe.apk"
    run(tools / "aapt2", "link", "-I", android, "--manifest", source / "vela-manifest.xml", "-o", unaligned)
    with zipfile.ZipFile(unaligned, "a", zipfile.ZIP_DEFLATED) as archive:
        for file in sorted(dex.glob("classes*.dex")):
            archive.write(file, file.name)
    run(tools / "zipalign", "-f", "4", unaligned, apk)
    run(tools / "apksigner", "sign", "--ks", args.app_key, "--ks-key-alias", args.alias,
        "--ks-pass", args.ks_pass, "--key-pass", args.key_pass, apk)
    run(tools / "apksigner", "verify", apk)
    print("Built", apk)


if __name__ == "__main__":
    main()
