import sys
import json
import copy
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from validate_morphe_release import validate_manifest, validate_index, validate_bundle, VERSION

class RemoteManagerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.metadata = json.loads((ROOT/"patches-bundle.json").read_text(encoding="utf-8"))
        cls.index = json.loads((ROOT/"patches-list.json").read_text(encoding="utf-8"))

    def test_valid_morphe_source_manifest(self):
        validate_manifest(self.metadata)

    def test_timezone_regression_from_fairemail(self):
        for suffix in ("+09:00", "Z", ".100+09:00"):
            with self.subTest(suffix=suffix):
                m = {**self.metadata, "created_at": "2026-10-14T02:44:33" + suffix}
                with self.assertRaisesRegex(ValueError, "WITHOUT offset"):
                    validate_manifest(m)

    def test_invalid_calendar_date(self):
        with self.assertRaisesRegex(ValueError, "valid date"):
            validate_manifest({**self.metadata, "created_at": "2026-02-30T01:00:00"})

    def test_wrong_download_url(self):
        with self.assertRaisesRegex(ValueError, "download_url"):
            validate_manifest({**self.metadata, "download_url": "https://github.com/rikunode/other/releases/download/v0.4.5/patches-0.4.5.mpp"})

    def test_valid_patch_index(self):
        validate_index(self.index)

    def test_reject_wrong_package(self):
        index = copy.deepcopy(self.index)
        index["patches"][0]["compatiblePackages"][0]["packageName"] = "com.example.different"
        with self.assertRaisesRegex(ValueError, "package name"):
            validate_index(index)

    def test_android_mpp_contains_actual_patch_dex(self):
        validate_bundle(ROOT / "patches/build/libs" / f"patches-{VERSION}.mpp")

if __name__ == "__main__":
    unittest.main()
