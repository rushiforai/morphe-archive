import io
import tempfile
import unittest
import zipfile
from pathlib import Path

from verify_apkm import audit


def archive(name, data, compression=zipfile.ZIP_STORED):
    output = io.BytesIO()
    with zipfile.ZipFile(output, "w", compression=compression) as z:
        z.writestr(name, data)
    return output.getvalue()


class ArchiveIntegrityTest(unittest.TestCase):
    def check_archive(self, data):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.apkm"
            path.write_bytes(data)
            try:
                return audit(path)
            finally:
                self.assertEqual(path.read_bytes(), data)

    def test_valid_nested_archive(self):
        report = self.check_archive(archive("base.apk", archive("assets/test", b"payload")))
        self.assertEqual(report["status"], "PASS")
        self.assertEqual(len(report["splits"]), 1)
        self.assertEqual(report["splits"][0]["name"], "base.apk")
        self.assertEqual(report["splits"][0]["entries"], 1)

    def test_standalone_apk_is_a_single_input(self):
        output = io.BytesIO()
        with zipfile.ZipFile(output, "w") as apk:
            apk.writestr("AndroidManifest.xml", b"manifest")
            apk.writestr("classes.dex", b"dex")
            apk.writestr("assets/test", b"payload")
        report = self.check_archive(output.getvalue())
        self.assertEqual(report["status"], "PASS")
        self.assertEqual(len(report["splits"]), 1)
        self.assertEqual(report["splits"][0]["entries"], 3)

    def test_invalid_stored_deflate_block(self):
        data = bytearray(archive("base.apk", archive("assets/test", b"payload"),
                                 zipfile.ZIP_DEFLATED))
        # This fixture has no local extra field. Replace its first DEFLATE block
        # with a stored block whose LEN and NLEN are not complements.
        offset = 30 + len("base.apk")
        data[offset:offset + 5] = b"\x01\x00\x00\x00\x00"
        with self.assertRaisesRegex(ValueError, "base.apk.*invalid stored block lengths"):
            self.check_archive(bytes(data))

    def test_corrupt_outer_entry(self):
        data = archive("base.apk", archive("assets/test", b"payload"))
        with self.assertRaisesRegex(ValueError, "base.apk.*CRC"):
            self.check_archive(data.replace(b"payload", b"damaged", 1))

    def test_corrupt_inner_entry_with_valid_outer_crc(self):
        split = archive("assets/test", b"payload").replace(b"payload", b"damaged", 1)
        with self.assertRaisesRegex(ValueError, "base.apk.*assets/test.*CRC"):
            self.check_archive(archive("base.apk", split))

    def test_truncated_input(self):
        with self.assertRaises(zipfile.BadZipFile):
            self.check_archive(archive("base.apk", b"payload")[:25])

    def test_non_apkm(self):
        with self.assertRaisesRegex(ValueError, "no APK splits"):
            self.check_archive(archive("info.json", b"{}"))


if __name__ == "__main__":
    unittest.main()
