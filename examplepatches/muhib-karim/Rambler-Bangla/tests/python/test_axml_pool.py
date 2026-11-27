#!/usr/bin/env python3
"""Unit tests for rename/axml_pool.py StringPool.rebuild length prefixes.

Needs only Python 3 (stdlib). Run with pytest or:
    python3 -m unittest discover -s tests/python -v
"""
import importlib.util
import os
import struct
import unittest

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
POOL = os.path.join(ROOT, "rename", "axml_pool.py")

_spec = importlib.util.spec_from_file_location("axml_pool", POOL)
ap = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(ap)

ASTRAIL = "\U0001F3ACx"  # "🎬x": 2 code points, 3 UTF-16 code units


def build_pool(value, utf8):
    """Minimal one-string ResStringPool chunk; header_size 28, styles 0."""
    if utf8:
        raw = value.encode("utf-8")
        data = bytes([len(value), len(raw)]) + raw + b"\x00"
        flags = 0x100
    else:
        raw = value.encode("utf-16-le")
        data = struct.pack("<H", len(value)) + raw + b"\x00\x00"
        flags = 0
    while len(data) % 4:
        data += b"\x00"
    header_size = 28
    strings_start = header_size + 4
    size = strings_start + len(data)
    return (struct.pack("<HHI", 0x0001, header_size, size)
            + struct.pack("<IIIII", 1, 0, flags, strings_start, 0)
            + struct.pack("<I", 0) + data)


def stored_length(new_bytes):
    """Return the raw stored length prefix of the single entry after [0]=offset."""
    p = 28 + 4 + struct.unpack_from("<I", new_bytes, 28)[0]
    return new_bytes[p]


class AstralLengthTests(unittest.TestCase):
    def check(self, utf8, original):
        pool = ap.StringPool(build_pool(original, utf8), 0)
        self.assertEqual(pool.strings, [original])
        rebuilt = pool.rebuild({0: ASTRAIL})
        got = stored_length(rebuilt)
        self.assertEqual(
            got, len(ASTRAIL.encode("utf-16-le")) // 2,
            "stored length prefix %d != utf-16 code-unit count %d (utf8=%s)"
            % (got, len(ASTRAIL.encode("utf-16-le")) // 2, utf8))

    def test_utf8_astral(self):
        self.check(utf8=True, original="a")

    def test_utf16_astral(self):
        self.check(utf8=False, original="a")


class BmpControlTests(unittest.TestCase):
    def check(self, utf8):
        pool = ap.StringPool(build_pool("ab", utf8), 0)
        self.assertEqual(pool.strings, ["ab"])
        rebuilt = pool.rebuild({0: "xyz"})
        self.assertEqual(stored_length(rebuilt), 3)

    def test_utf8_bmp(self):
        self.check(utf8=True)

    def test_utf16_bmp(self):
        self.check(utf8=False)


if __name__ == "__main__":
    unittest.main()
