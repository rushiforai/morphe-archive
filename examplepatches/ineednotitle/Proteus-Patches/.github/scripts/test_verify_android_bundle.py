import importlib.util
import json
import tempfile
import unittest
import zipfile
from pathlib import Path

spec = importlib.util.spec_from_file_location("verify_android_bundle", Path(__file__).with_name("verify_android_bundle.py"))
verifier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verifier)


class VerifyAndroidBundleTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.bundle = self.root / "patches-2.2.3.mpp"
        self.patch_list = self.root / "patches-list.json"
        self.patch_list.write_text(json.dumps({"version": "2.2.3", "patches": [{"name": "example"}]}))

    def make_bundle(self, dex=b"dex\n035\0" + bytes(104), version="2.2.3"):
        with zipfile.ZipFile(self.bundle, "w") as archive:
            archive.writestr("META-INF/MANIFEST.MF", f"Manifest-Version: 1.0\r\nVersion: {version}\r\n\r\n")
            if dex is not None:
                archive.writestr("classes.dex", dex)

    def verify(self):
        verifier.verify_bundle(self.bundle, "2.2.3", self.patch_list)

    def test_valid_bundle(self):
        self.make_bundle()
        self.verify()

    def test_jvm_only_archive_rejected(self):
        self.make_bundle(dex=None)
        with self.assertRaisesRegex(ValueError, "missing classes.dex"):
            self.verify()

    def test_empty_or_invalid_dex_rejected(self):
        for dex in (b"", b"not dex" + bytes(112)):
            with self.subTest(dex=dex):
                self.make_bundle(dex=dex)
                with self.assertRaisesRegex(ValueError, "Invalid or empty DEX"):
                    self.verify()

    def test_wrong_manifest_version_rejected(self):
        self.make_bundle(version="2.2.2")
        with self.assertRaisesRegex(ValueError, "manifest version"):
            self.verify()

    def test_empty_patch_list_rejected(self):
        self.make_bundle()
        self.patch_list.write_text(json.dumps({"version": "2.2.3", "patches": []}))
        with self.assertRaisesRegex(ValueError, "Patch list is empty"):
            self.verify()

    def test_wrong_patch_list_version_rejected(self):
        self.make_bundle()
        self.patch_list.write_text(json.dumps({"version": "2.2.2", "patches": [{"name": "example"}]}))
        with self.assertRaisesRegex(ValueError, "Patch list version"):
            self.verify()


if __name__ == "__main__":
    unittest.main()
