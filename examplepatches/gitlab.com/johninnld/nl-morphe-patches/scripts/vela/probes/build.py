#!/usr/bin/env python3
"""Compile test-only native producer probes. No target APK/model dependency or device interaction."""
import argparse
from pathlib import Path
import subprocess
import zipfile


def run(*arguments):
    subprocess.run([str(argument) for argument in arguments], check=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--app-key", type=Path, help="Local test key used to sign BOTH patched provider APKs")
    parser.add_argument("--alias", default="waze-test")
    parser.add_argument("--ks-pass", default="pass:android", help="apksigner password spec, e.g. env:PROBE_KS_PASSWORD")
    parser.add_argument("--key-pass", default="pass:android")
    parser.add_argument("--build-tools", default="36.0.0")
    parser.add_argument("--compile-only", action="store_true", help="Compile/dex/link without signing; no key needed")
    args = parser.parse_args()
    if not args.compile_only and args.app_key is None:
        parser.error("--app-key required unless --compile-only")
    source = Path(__file__).resolve().parent
    tools = args.sdk / "build-tools" / args.build_tools
    android = args.sdk / "platforms/android-36/android.jar"
    for name, probe in [("waze", "WazeProbe"), ("flitsmeister", "FlitsmeisterProbe")]:
        output = args.output / name
        classes = output / "classes"
        dex = output / "dex"
        classes.mkdir(parents=True, exist_ok=True)
        dex.mkdir(parents=True, exist_ok=True)
        run("javac", "--release", "8", "-cp", android, "-d", classes,
            source / "NativeProbe.java", source / (probe + ".java"))
        run(tools / "d8", "--min-api", "34", "--lib", android, "--output", dex,
            *sorted(classes.rglob("*.class")))
        unaligned = output / "unaligned.apk"
        run(tools / "aapt2", "link", "-I", android, "--manifest", source / (name + "-manifest.xml"), "-o", unaligned)
        with zipfile.ZipFile(unaligned, "a", zipfile.ZIP_DEFLATED) as archive:
            for file in sorted(dex.glob("classes*.dex")):
                archive.write(file, file.name)
        apk = output / "probe.apk"
        run(tools / "zipalign", "-f", "4", unaligned, apk)
        if not args.compile_only:
            run(tools / "apksigner", "sign", "--ks", args.app_key, "--ks-key-alias", args.alias,
                "--ks-pass", args.ks_pass, "--key-pass", args.key_pass, apk)
            run(tools / "apksigner", "verify", apk)
        print("Built", apk)


if __name__ == "__main__":
    main()
