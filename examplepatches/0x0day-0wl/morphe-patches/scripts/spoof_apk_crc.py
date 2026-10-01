#!/usr/bin/env python3
"""
spoof_apk_crc.py — copy zip entry CRC32/timestamps from an original APK onto a patched APK.

PairIP (Google Play app protection) can compare APK zip metadata against baked-in
values. Morphe-modified dex gets new CRCs; restoring the original metadata on dex
entries is a common sideload bypass (see ApkAnalyzer+ / CRCFix).

Usage:
  scripts/spoof_apk_crc.py <original.apk> <patched.apk> [-o output.apk] [--all]

By default only classes*.dex entries are updated. Pass --all to copy metadata for
every entry present in both APKs.
"""

from __future__ import annotations

import argparse
import sys
from io import BytesIO
from os import path
from typing import BinaryIO


def ifb(b: bytes) -> int:
    return int.from_bytes(b, "little")


class ZipEntryMeta:
    __slots__ = (
        "name",
        "cd_lmt_offset",
        "lf_lmt_offset",
        "lmt",
        "cd_lmd_offset",
        "lf_lmd_offset",
        "lmd",
        "cd_crc_offset",
        "lf_crc_offset",
        "crc",
    )

    def __init__(self, name: str) -> None:
        self.name = name
        self.cd_lmt_offset = self.lf_lmt_offset = 0
        self.lmt = b""
        self.cd_lmd_offset = self.lf_lmd_offset = 0
        self.lmd = b""
        self.cd_crc_offset = self.lf_crc_offset = 0
        self.crc = b""


END_OF_CENTRAL_SIG = b"PK\x05\x06"
CENTRAL_HEADER_SIG = b"PK\x01\x02"
LOCAL_HEADER_SIG = b"PK\x03\x04"


def parse_apk_entries(apk_path: str) -> dict[str, ZipEntryMeta]:
    entries: dict[str, ZipEntryMeta] = {}
    with open(apk_path, "rb") as fh:
        data = fh.read()

    f = BytesIO(data)
    f.seek(-22, 2)
    meocd = f.tell()
    central_offset = None

    while f.tell() >= 0:
        if f.read(4) == END_OF_CENTRAL_SIG:
            f.seek(8, 1)
            size_of_cd = ifb(f.read(4))
            central_offset = ifb(f.read(4))
            break
        if meocd - f.tell() > 1 << 16:
            break
        f.seek(-5, 1)

    if central_offset is None:
        raise ValueError(f"{path.basename(apk_path)}: EOCD not found (not a valid APK?)")

    f.seek(central_offset)
    while f.tell() < central_offset + size_of_cd:
        if f.read(4) != CENTRAL_HEADER_SIG:
            raise ValueError(f"{path.basename(apk_path)}: central header not found")

        f.seek(8, 1)
        lmt_offset = f.tell()
        cd_lmt = f.read(2)
        lmd_offset = f.tell()
        cd_lmd = f.read(2)
        crc_offset = f.tell()
        cd_crc = f.read(4)
        f.seek(8, 1)
        file_name_length = ifb(f.read(2))
        extra_field_length = ifb(f.read(2))
        file_comment_length = ifb(f.read(2))
        f.seek(8, 1)
        relative_offset = ifb(f.read(4))
        file_name = f.read(file_name_length).decode()

        zel = ZipEntryMeta(file_name)
        zel.cd_lmt_offset = lmt_offset
        zel.lmt = cd_lmt
        zel.cd_lmd_offset = lmd_offset
        zel.lmd = cd_lmd
        zel.cd_crc_offset = crc_offset
        zel.crc = cd_crc

        saved = f.tell()
        f.seek(relative_offset)
        if f.read(4) != LOCAL_HEADER_SIG:
            raise ValueError(f"{path.basename(apk_path)}: local header not found for {file_name}")
        f.seek(6, 1)
        zel.lf_lmt_offset = f.tell()
        lf_lmt = f.read(2)
        zel.lf_lmd_offset = f.tell()
        lf_lmd = f.read(2)
        zel.lf_crc_offset = f.tell()
        lf_crc = f.read(4)

        if not (cd_lmt == lf_lmt and cd_lmd == lf_lmd and cd_crc == lf_crc):
            raise ValueError(f"{path.basename(apk_path)}: header mismatch for {file_name}")

        entries[file_name] = zel
        f.seek(saved)
        f.seek(extra_field_length + file_comment_length, 1)

    return entries


def should_spoof(name: str, all_entries: bool) -> bool:
    if all_entries:
        return True
    return name.startswith("classes") and name.endswith(".dex")


def spoof_crc(
    original_apk: str,
    patched_apk: str,
    output_apk: str,
    *,
    all_entries: bool = False,
    restore_time: bool = True,
) -> list[str]:
    src = parse_apk_entries(original_apk)
    tar = parse_apk_entries(patched_apk)

    with open(patched_apk, "rb") as fh:
        blob = bytearray(fh.read())

    fixed: list[str] = []
    for name, elem in tar.items():
        if name not in src:
            continue
        if not should_spoof(name, all_entries):
            continue

        src_elem = src[name]
        if restore_time:
            blob[elem.cd_lmt_offset : elem.cd_lmt_offset + 2] = src_elem.lmt
            blob[elem.lf_lmt_offset : elem.lf_lmt_offset + 2] = src_elem.lmt
            blob[elem.cd_lmd_offset : elem.cd_lmd_offset + 2] = src_elem.lmd
            blob[elem.lf_lmd_offset : elem.lf_lmd_offset + 2] = src_elem.lmd

        if elem.crc != src_elem.crc:
            blob[elem.cd_crc_offset : elem.cd_crc_offset + 4] = src_elem.crc
            blob[elem.lf_crc_offset : elem.lf_crc_offset + 4] = src_elem.crc
            fixed.append(name)

    with open(output_apk, "wb") as fh:
        fh.write(blob)

    return fixed


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("original", help="unmodified base APK (CRC source)")
    parser.add_argument("patched", help="Morphe-patched APK to update")
    parser.add_argument("-o", "--output", help="output path (default: <patched>_crc.apk)")
    parser.add_argument("--all", action="store_true", help="spoof all shared entries, not just classes*.dex")
    parser.add_argument("--no-time", action="store_true", help="do not restore zip timestamps")
    args = parser.parse_args()

    for p in (args.original, args.patched):
        if not path.isfile(p):
            print(f"ERROR: not found: {p}", file=sys.stderr)
            return 1

    root, ext = path.splitext(args.patched)
    output = args.output or f"{root}_crc{ext}"

    try:
        fixed = spoof_crc(
            args.original,
            args.patched,
            output,
            all_entries=args.all,
            restore_time=not args.no_time,
        )
    except ValueError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    print(f"Output: {output}")
    if fixed:
        print(f"Spoofed CRC/time on {len(fixed)} entr{'y' if len(fixed) == 1 else 'ies'}:")
        for name in sorted(fixed):
            print(f"  - {name}")
    else:
        print("No CRC changes needed (metadata already matched original).")
    print("\nRe-sign the output APK before installing (e.g. with Morphe / apksigner).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
