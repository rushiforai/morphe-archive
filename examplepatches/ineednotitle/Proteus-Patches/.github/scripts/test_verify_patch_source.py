import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "verify_patch_source", Path(__file__).with_name("verify_patch_source.py")
)
verifier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verifier)


class VerifyPatchSourceTest(unittest.TestCase):
    def setUp(self):
        self.tempdir = tempfile.TemporaryDirectory()
        self.source = Path(self.tempdir.name) / "patches-bundle.json"
        self.write_source()

    def tearDown(self):
        self.tempdir.cleanup()

    def write_source(self, **changes):
        data = {
            "created_at": "2026-11-06T08:32:34",
            "description": "Release notes",
            "download_url": "https://github.com/ineednotitle/Proteus-Patches/releases/download/v2.2.4/patches-2.2.4.mpp",
            "signature_download_url": "",
            "version": "2.2.4",
        }
        data.update(changes)
        self.source.write_text(json.dumps(data), encoding="utf-8")

    def test_valid_source(self):
        verifier.verify_source(self.source, "2.2.4")

    def test_rejects_utc_suffix_without_normalization(self):
        self.write_source(created_at="2026-11-06T08:32:34Z")
        with self.assertRaisesRegex(ValueError, "without a timezone suffix"):
            verifier.verify_source(self.source)

    def test_normalizes_utc_suffix_for_morphe(self):
        self.write_source(created_at="2026-11-06T08:32:34Z")
        verifier.verify_source(self.source, "2.2.4", normalize=True)
        saved = json.loads(self.source.read_text(encoding="utf-8"))
        self.assertEqual(saved["created_at"], "2026-11-06T08:32:34")
        self.assertEqual(saved["signature_download_url"], "")

    def test_normalizes_fractional_seconds(self):
        self.write_source(created_at="2026-11-06T08:32:34.987Z")
        verifier.verify_source(self.source, normalize=True)
        saved = json.loads(self.source.read_text(encoding="utf-8"))
        self.assertEqual(saved["created_at"], "2026-11-06T08:32:34")

    def test_rejects_version_mismatch(self):
        with self.assertRaisesRegex(ValueError, "expected '2.2.5'"):
            verifier.verify_source(self.source, "2.2.5")

    def test_rejects_mismatched_download_url(self):
        self.write_source(
            download_url="https://github.com/ineednotitle/Proteus-Patches/releases/download/v2.2.3/patches-2.2.3.mpp"
        )
        with self.assertRaisesRegex(ValueError, "download_url"):
            verifier.verify_source(self.source)


if __name__ == "__main__":
    unittest.main()
