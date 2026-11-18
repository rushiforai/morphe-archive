import struct
import sys
import tempfile
from pathlib import Path
from zipfile import ZipFile
import unittest

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
from validate_morphe_bundle import validate_morphe_bundle

class MorpheAndroidBundleTests(unittest.TestCase):
    def new_zip(self, files: dict[str, bytes]):
        path = Path(self.tempdir.name) / "test.mpp"
        with ZipFile(path, "w") as file:
            for k,v in files.items():
                file.writestr(k,v)
        return path

    def setUp(self):
        self.tempdir = tempfile.TemporaryDirectory()
    def tearDown(self):
        self.tempdir.cleanup()

    def test_reject_jvm_only_class_bundle(self):
        bad = self.new_zip({"Test.class":b"jvm","META-INF/MANIFEST.MF":b"Patcher-Version: 1.15.1\r\n"})
        with self.assertRaisesRegex(ValueError,"missing dex entries"):
            validate_morphe_bundle(bad)

    def test_reject_empty_dex(self):
        bad = self.new_zip({"Test.class":b"jvm","classes.dex":b"","META-INF/MANIFEST.MF":b"Patcher-Version: 1.15.1\r\n"})
        with self.assertRaisesRegex(ValueError,"empty dex"):
            validate_morphe_bundle(bad)

    def valid_dex(self):
        dex = bytearray(112)
        dex[:8] = bytes((100, 101, 120, 10, 48, 51, 56, 0))
        struct.pack_into("<I", dex, 0x60, 1)
        return bytes(dex) + b"HideSupportBannerPatchKt: Permanently hide donation banner"

    def test_accept_dex_and_class(self):
        good = self.new_zip({"Test.class":b"jvm","classes.dex":self.valid_dex(),"META-INF/MANIFEST.MF":b"Patcher-Version: 1.15.1\r\n"})
        self.assertEqual(validate_morphe_bundle(good), ["classes.dex"])

    def test_reject_empty_class_defs(self):
        dex = bytearray(self.valid_dex())
        struct.pack_into("<I", dex, 0x60, 0)
        bad = self.new_zip({"Test.class":b"jvm","classes.dex":bytes(dex),"META-INF/MANIFEST.MF":b"Patcher-Version: 1.15.1\r\n"})
        with self.assertRaisesRegex(ValueError,"zero Android class"):
            validate_morphe_bundle(bad)

    def test_reject_stub_dex_missing_patch(self):
        stub = self.valid_dex().replace(b"HideSupportBannerPatchKt",b"SomeOtherPatchNotHere")
        bad = self.new_zip({"Test.class":b"jvm","classes.dex":stub,"META-INF/MANIFEST.MF":b"Patcher-Version: 1.15.1\r\n"})
        with self.assertRaisesRegex(ValueError,"missing FairEmail patch"):
            validate_morphe_bundle(bad)

    def test_reject_missing_file(self):
        with self.assertRaisesRegex(ValueError,"missing patch bundle"):
            validate_morphe_bundle(Path(self.tempdir.name)/"missing.mpp")

if __name__ == "__main__":
    unittest.main()
