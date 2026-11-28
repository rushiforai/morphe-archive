#!/usr/bin/env python3
"""Extract permissions, components and class names from a binary AndroidManifest.xml.

Full AXML attribute resolution needs the resource table for reference values, so this
tool deliberately stays at the reconnaissance level: it reads the manifest's own
string pool and every plausible class/permission name in the chunk. That is enough to
answer "what is this app allowed to do, and which of its components matter?".

Usage:
  python3 manifest_strings.py --grep 'permission|service'
  python3 manifest_strings.py --classes
  python3 manifest_strings.py

Options:
  --apk PATH     APK to read (default: $APK)
  --grep REGEX   only print matching strings
  --classes      only print package-like identifiers
"""
from __future__ import annotations

import argparse
import os
import re
import struct
import sys
import zipfile


def apk_path(cli_value: str | None) -> str:
    path = cli_value or os.environ.get("APK")
    if not path:
        sys.exit("error: no APK given (use --apk PATH or set $APK)")
    if not os.path.isfile(path):
        sys.exit(f"error: APK not found: {path}")
    return path


def read_string_pool(buf: bytes, off: int) -> list[str]:
    chunk_type, header_size, _ = struct.unpack_from("<HHI", buf, off)
    if chunk_type != 0x0001:
        raise ValueError(f"not a string pool chunk at {off}: 0x{chunk_type:04x}")
    count, _styles, flags, strings_start, _styles_start = struct.unpack_from("<IIIII", buf, off + 8)
    utf8 = bool(flags & (1 << 8))
    offsets = struct.unpack_from(f"<{count}I", buf, off + header_size)
    out = []
    for o in offsets:
        p = off + strings_start + o
        if utf8:
            n = buf[p]
            p += 1
            if n & 0x80:
                n = ((n & 0x7F) << 8) | buf[p]
                p += 1
            m = buf[p]
            p += 1
            if m & 0x80:
                m = ((m & 0x7F) << 8) | buf[p]
                p += 1
            out.append(buf[p : p + m].decode("utf-8", "replace"))
        else:
            n = struct.unpack_from("<H", buf, p)[0]
            p += 2
            if n & 0x8000:
                n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", buf, p)[0]
                p += 2
            out.append(buf[p : p + n * 2].decode("utf-16-le", "replace"))
    return out


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("--apk")
    ap.add_argument("--grep")
    ap.add_argument("--classes", action="store_true")
    a = ap.parse_args()

    with zipfile.ZipFile(apk_path(a.apk)) as z:
        buf = z.read("AndroidManifest.xml")

    seen = set(read_string_pool(buf, 8))
    # Component and permission names also appear verbatim in the attribute payload.
    for m in re.finditer(rb"[a-zA-Z][a-zA-Z0-9_.$]{6,120}", buf):
        seen.add(m.group().decode("ascii", "replace"))

    rx = re.compile(a.grep, re.I) if a.grep else None
    for s in sorted(seen):
        if a.classes and not (s.count(".") >= 2 and " " not in s):
            continue
        if rx and not rx.search(s):
            continue
        print("  ", s)
    return 0


if __name__ == "__main__":
    sys.exit(main())
