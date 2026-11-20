#!/usr/bin/env python3
from __future__ import annotations

"""
Extracts assets/com/tom_roush/ from pdfbox-android AAR and creates pdfbox-assets.zip.
"""

import argparse
import glob
import os
import sys
import zipfile


def find_pdfbox_aar(gradle_user_home: str, version: str | None = None) -> str | None:
    version_pattern = version if version else "*"
    pattern = os.path.join(
        gradle_user_home,
        "caches",
        "modules-2",
        "files-2.1",
        "com.tom-roush",
        "pdfbox-android",
        version_pattern,
        "**",
        "*.aar",
    )
    matches = glob.glob(pattern, recursive=True)
    return matches[0] if matches else None


def main() -> int:
    parser = argparse.ArgumentParser(description="Prepare PDFBox assets zip")
    parser.add_argument("--output", required=True, help="Destination zip path")
    parser.add_argument(
        "--gradle-home", required=True, help="Gradle user home directory"
    )
    parser.add_argument(
        "--version", required=False, default=None, help="pdfbox-android version"
    )
    parser.add_argument(
        "--aar", required=False, default=None, help="Direct path to pdfbox-android AAR"
    )
    args = parser.parse_args()

    if args.aar:
        if not os.path.isfile(args.aar):
            print(f"Error: Specified AAR file not found: {args.aar}", file=sys.stderr)
            return 1
        aar_path = args.aar
    else:
        aar_path = find_pdfbox_aar(args.gradle_home, args.version)
    if not aar_path:
        ver_str = f" {args.version}" if args.version else ""
        print(f"pdfbox-android{ver_str}.aar not found in Gradle cache", file=sys.stderr)
        return 1

    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)

    with (
        zipfile.ZipFile(aar_path, "r") as aar,
        zipfile.ZipFile(args.output, "w", compression=zipfile.ZIP_DEFLATED) as out_zip,
    ):
        prefix = "assets/com/tom_roush/"
        count = 0
        for info in aar.infolist():
            if info.filename.startswith(prefix) and not info.is_dir():
                data = aar.read(info.filename)
                # Store relative to assets/, so entries start with "com/tom_roush/..."
                arcname = info.filename[len("assets/") :]
                out_zip.writestr(arcname, data)
                count += 1

    if count == 0:
        if os.path.exists(args.output):
            os.remove(args.output)
        print(
            f"Error: No PDFBox assets found matching prefix '{prefix}' in {aar_path}",
            file=sys.stderr,
        )
        return 1

    print(f"Packaged {count} PDFBox assets into {args.output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
