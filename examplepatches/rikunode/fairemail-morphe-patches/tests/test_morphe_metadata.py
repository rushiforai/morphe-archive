import copy
import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))
from validate_morphe_metadata import validate_asset


class MorpheMetadataTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bundle = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
        cls.index = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))

    def test_valid_release(self):
        validate_asset(self.bundle, self.index)

    def test_reject_offset_timezone_regression(self):
        for bad in ("2026-10-13T10:10:00+09:00", "2026-10-13T01:10:00Z", "2026-10-13T10:10:00.000+09:00"):
            with self.subTest(bad=bad):
                payload = {**self.bundle, "created_at": bad}
                with self.assertRaisesRegex(ValueError, "offset-free"):
                    validate_asset(payload, self.index)

    def test_reject_invalid_dates(self):
        with self.assertRaisesRegex(ValueError, "valid calendar"):
            validate_asset({**self.bundle, "created_at": "2026-13-50T10:10:00"}, self.index)

    def test_reject_wrong_url(self):
        with self.assertRaisesRegex(ValueError, "download_url"):
            validate_asset({**self.bundle, "download_url": "https://github.com/no/missing/releases/download/v0.2.0/patches-0.2.0.mpp"}, self.index)

    def test_reject_wrong_version_code(self):
        index = copy.deepcopy(self.index)
        index["patches"][0]["compatiblePackages"][0]["targets"][0]["versionCodes"]["ARM64_V8A"] = 999
        with self.assertRaisesRegex(ValueError, "versionCode"):
            validate_asset(self.bundle, index)


if __name__ == "__main__":
    unittest.main()
