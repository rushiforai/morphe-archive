#!/usr/bin/env python3
"""Inventory the strings of an APK's DEX files and grep them.

This is the entry point for most investigations: it answers "where does this
behaviour live?" long before you need a decompiler.

Usage:
  python3 dexscan.py 'https?://' 'Lcom/wispr/[a-z]+/'    # search (case-insensitive)
  python3 dexscan.py --list                              # dex sizes
  python3 dexscan.py --classes 'wordlimit'               # only class descriptors

Options:
  --apk PATH    APK to read           (default: $APK)
  --limit N     max hits per pattern  (default 60)
  --case        case-sensitive search
  --classes     keep only class descriptors (L...;)
"""
from __future__ import annotations

import argparse
import os
import re
import sys
import zipfile


def apk_path(cli_value: str | None) -> str:
    path = cli_value or os.environ.get("APK")
    if not path:
        sys.exit("error: no APK given (use --apk PATH or set $APK)")
    if not os.path.isfile(path):
        sys.exit(f"error: APK not found: {path}")
    return path


def load_strings(path: str) -> list[str]:
    with zipfile.ZipFile(path) as z:
        dexes = sorted(n for n in z.namelist() if n.endswith(".dex"))
        if not dexes:
            sys.exit("error: no .dex entry in this APK")
        raw = b"".join(z.read(n) for n in dexes)
    found = {m.decode("utf-8", "replace") for m in re.findall(rb"[\x20-\x7e]{3,400}", raw)}
    return sorted(found)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("patterns", nargs="*", help="regular expressions to search for")
    ap.add_argument("--apk")
    ap.add_argument("--limit", type=int, default=60)
    ap.add_argument("--case", action="store_true", help="case-sensitive search")
    ap.add_argument("--classes", action="store_true", help="only class descriptors")
    ap.add_argument("--list", action="store_true", help="only print the dex inventory")
    a = ap.parse_args()

    path = apk_path(a.apk)
    if not a.patterns or a.list:
        with zipfile.ZipFile(path) as z:
            for name in sorted(n for n in z.namelist() if n.endswith(".dex")):
                print(f"{name:<16} {z.getinfo(name).file_size / 1e6:.2f} MB")
    if not a.patterns:
        return 0

    strings = load_strings(path)
    print(f"{len(strings)} unique strings in {path}")
    flags = 0 if a.case else re.I
    for pattern in a.patterns:
        rx = re.compile(pattern, flags)
        hits = [s for s in strings if rx.search(s)]
        if a.classes:
            hits = [h for h in hits if h.startswith("L") and h.endswith(";")]
        print(f"\n=== /{pattern}/ -> {len(hits)} hits ===")
        for hit in hits[: a.limit]:
            print("   ", hit[:220])
        if len(hits) > a.limit:
            print(f"    ... {len(hits) - a.limit} more")
    return 0


if __name__ == "__main__":
    sys.exit(main())
