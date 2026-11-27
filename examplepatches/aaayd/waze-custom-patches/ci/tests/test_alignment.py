import struct
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from alignment import normalise_native_alignment


class AlignmentTests(unittest.TestCase):
    def test_updates_stale_native_hint_without_moving_or_changing_payloads(self):
        with tempfile.TemporaryDirectory() as folder:
            apk = Path(folder) / "fixture.apk"
            with zipfile.ZipFile(apk, "w") as archive:
                for name, compression in [("lib/arm64-v8a/native.so", zipfile.ZIP_STORED),
                                           ("assets/icon.png", zipfile.ZIP_STORED),
                                           ("assets/compressed.so", zipfile.ZIP_DEFLATED)]:
                    entry = zipfile.ZipInfo(name)
                    entry.compress_type = compression
                    entry.extra = struct.pack("<HHHHH", 0, 0, 0xD935, 2, 4096)
                    archive.writestr(entry, b"original payload")
            before = apk.read_bytes()
            self.assertEqual(normalise_native_alignment(apk), 1)
            after = apk.read_bytes()
            self.assertEqual(len(before), len(after))
            self.assertEqual(sum(a != b for a, b in zip(before, after)), 1)
            self.assertEqual(normalise_native_alignment(apk), 0)
            with zipfile.ZipFile(apk) as archive, apk.open("rb") as source:
                for entry in archive.infolist():
                    self.assertEqual(archive.read(entry), b"original payload")
                    source.seek(entry.header_offset + 26)
                    name_length, extra_length = struct.unpack("<HH", source.read(4))
                    source.read(name_length)
                    extra = source.read(extra_length)
                    expected = 16384 if entry.filename.startswith("lib/") else 4096
                    self.assertEqual(struct.unpack_from("<H", extra, 8)[0], expected)
