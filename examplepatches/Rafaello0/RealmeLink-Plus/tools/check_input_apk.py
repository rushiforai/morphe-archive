#!/usr/bin/env python3
"""Detect an already Morphe/hxreborn-modified realme Link APK.

Inspect only, never modify APK. Successful exit does NOT prove an APK is clean.
"""
from __future__ import annotations

import argparse
import hashlib
import sys
import zipfile
from pathlib import Path

HX_MARKERS = (b"hx_page", b"hx_surface", b"hx_on_surface")
KNOWN_PATCHED_SHA256 = "d1f2a5d8f8fc0d6c4098fb8aff6ec830af42e92ffd9822563f5c8660a650a2ce"


def inspect_apk(filename: Path) -> tuple[bool, list[str]]:
    evidence: list[str] = []
    with zipfile.ZipFile(filename) as z:
        if z.testzip() is not None:
            raise ValueError("APK archive contains corrupt entries")
        if "resources.arsc" not in z.namelist():
            raise ValueError("resources.arsc missing: not an ordinary APK")
        data = z.read("resources.arsc")
        found = [m.decode("ascii") for m in HX_MARKERS if m in data]
        if len(found) == len(HX_MARKERS):
            evidence.append("hxreborn AMOLED theme resource markers: " + ", ".join(found))
    digest = hashlib.sha256()
    with filename.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    if digest.hexdigest() == KNOWN_PATCHED_SHA256:
        evidence.append("SHA256 matches the previously provided hxreborn-patched APK")
    return bool(evidence), evidence


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    args = parser.parse_args()
    if not args.apk.is_file():
        parser.error("APK not found")
    try:
        patched, reasons = inspect_apk(args.apk)
    except (OSError, zipfile.BadZipFile, ValueError) as exc:
        print(f"INVALID APK: {exc}", file=sys.stderr)
        return 2
    if patched:
        print("BLOCKED: input APK was modified. Do not repatch it.")
        for reason in reasons:
            print("- " + reason)
        print("Use an original, unpatched realme Link 5.8.811.2814 APK instead.")
        return 1
    print("No known hxreborn markers found; original signature is NOT verified.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
