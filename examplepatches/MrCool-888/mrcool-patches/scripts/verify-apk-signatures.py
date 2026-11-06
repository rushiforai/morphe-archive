#!/usr/bin/env python3
"""Verify release APK packages and signing certificates against public pins."""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path, help="directory containing release APKs")
    parser.add_argument("--java", required=True, type=Path, help="Java executable")
    parser.add_argument("--build-tools", required=True, type=Path, help="Android build-tools directory")
    args = parser.parse_args()

    repo = Path(__file__).resolve().parent.parent
    config = json.loads((repo / "apk-signing-certificates.json").read_text(encoding="utf-8"))
    aapt = args.build_tools / ("aapt2.exe" if sys.platform == "win32" else "aapt2")
    apksigner = args.build_tools / "lib" / "apksigner.jar"
    if not args.directory.is_dir():
        raise ValueError(f"APK directory does not exist: {args.directory}")

    apk_files = sorted(args.directory.glob("*.apk"))
    expected = set()
    for pin in config["certificates"]:
        matches = list(args.directory.glob(pin["pattern"]))
        if len(matches) != 1:
            raise ValueError(f"{pin['pattern']}: expected exactly one APK, found {len(matches)}")
        apk = matches[0]
        expected.add(apk)

        badging = subprocess.run(
            [str(aapt), "dump", "badging", str(apk)], capture_output=True, text=True, encoding="utf-8"
        )
        if badging.returncode:
            raise ValueError(f"aapt2 failed for {apk.name}: {badging.stderr.strip()}")
        packages = re.findall(r"^package: name='([^']+)'", badging.stdout, re.MULTILINE)
        if packages != [pin["package"]]:
            raise ValueError(f"{apk.name}: expected package {pin['package']}, found {packages}")

        verified = subprocess.run(
            [str(args.java), "-jar", str(apksigner), "verify", "--print-certs", str(apk)],
            capture_output=True, text=True, encoding="utf-8",
        )
        if verified.returncode:
            raise ValueError(f"apksigner failed for {apk.name}: {verified.stderr.strip()}")
        digests = re.findall(
            r"^Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]+)$",
            verified.stdout, re.MULTILINE,
        )
        if len(digests) != 1:
            raise ValueError(f"{apk.name}: expected exactly one signing certificate, found {len(digests)}")
        if digests[0].lower() != pin["sha256"].lower():
            raise ValueError(f"{apk.name}: certificate SHA-256 mismatch ({digests[0]})")
        print(f"OK {apk.name}: {pin['package']} signer SHA-256 {digests[0].lower()}")

    unexpected = set(apk_files) - expected
    if unexpected:
        raise ValueError("unexpected APK files: " + ", ".join(sorted(p.name for p in unexpected)))
    print(f"Verified {len(expected)} APKs.")


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, KeyError, json.JSONDecodeError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        sys.exit(1)
