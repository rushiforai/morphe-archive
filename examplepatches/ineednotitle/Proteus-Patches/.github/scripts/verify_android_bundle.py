#!/usr/bin/env python3
"""Reject JVM-only or corrupt patch bundles before publishing them to Android users."""

import argparse
import json
import re
import sys
import zipfile
from pathlib import Path


def verify_bundle(bundle: Path, version: str, patch_list: Path | None = None) -> None:
    if bundle.name != f"patches-{version}.mpp":
        raise ValueError(f"Unexpected bundle filename: {bundle.name}")

    with zipfile.ZipFile(bundle) as archive:
        bad_entry = archive.testzip()
        if bad_entry:
            raise ValueError(f"Corrupt archive entry: {bad_entry}")
        dex_entries = [entry for entry in archive.infolist() if re.fullmatch(r"classes(?:[2-9]|[1-9][0-9]+)?\.dex", entry.filename)]
        if not any(entry.filename == "classes.dex" for entry in dex_entries):
            raise ValueError("Android bundle is missing classes.dex (it may have been overwritten by the JVM jar task)")
        for entry in dex_entries:
            with archive.open(entry) as dex:
                header = dex.read(8)
            if entry.file_size < 112 or not re.fullmatch(rb"dex\n\d{3}\x00", header):
                raise ValueError(f"Invalid or empty DEX entry: {entry.filename}")

        # Manifest lines may be folded per the JAR specification.
        manifest = archive.read("META-INF/MANIFEST.MF").decode("utf-8").replace("\r\n ", "").replace("\n ", "")
        attributes = dict(line.split(": ", 1) for line in manifest.splitlines() if ": " in line)
        if attributes.get("Version") != version:
            raise ValueError(f"Bundle manifest version is {attributes.get('Version')!r}, expected {version!r}")

    if patch_list is not None:
        metadata = json.loads(patch_list.read_text(encoding="utf-8"))
        if metadata.get("version") != version:
            raise ValueError("Patch list version does not match the bundle")
        if not isinstance(metadata.get("patches"), list) or not metadata["patches"]:
            raise ValueError("Patch list is empty or invalid")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", type=Path)
    parser.add_argument("version")
    parser.add_argument("--patch-list", type=Path)
    args = parser.parse_args()
    try:
        verify_bundle(args.bundle, args.version, args.patch_list)
    except (OSError, ValueError, KeyError, zipfile.BadZipFile) as error:
        print(f"Bundle verification failed: {error}", file=sys.stderr)
        return 1
    print(f"Verified Android bundle {args.bundle} (version {args.version})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
