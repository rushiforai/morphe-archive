"""Tests for Morphe source metadata validation."""

from pathlib import Path
import copy
import json
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from prepare_mobile_source import load_config, validate_metadata
from bootstrap_from_release import verify_bundle


class MobileSourceTest(unittest.TestCase):
    def setUp(self):
        self.source, self.provenance = load_config()
        self.manifest = json.loads((ROOT / "patches-bundle.json").read_text())
        self.patches = json.loads((ROOT / "patches-list.json").read_text())

    def validate(self):
        validate_metadata(self.manifest, self.patches, self.source, self.provenance)

    def test_current_snapshots_and_hex_identity(self):
        self.validate()
        self.assertEqual("Hexclyde/bitchord-morphe-patches", self.source["repository"])
        self.assertEqual("GPL-3.0-or-later", self.source["license"])

    def test_external_or_html_download_cannot_replace_mpp(self):
        for url in [
            "https://example.com/patch.mpp",
            self.manifest["page_url"],
            "https://github.com/Hexclyde/bitchord-morphe-patches/archive/main.zip",
        ]:
            with self.subTest(url=url):
                self.manifest["download_url"] = url
                with self.assertRaises(ValueError):
                    self.validate()

    def test_version_mismatch_rejected(self):
        self.patches["version"] = "9.9.9"
        with self.assertRaises(ValueError):
            self.validate()

    def test_timezone_suffix_rejected_for_manager_localdatetime(self):
        self.manifest["created_at"] += "Z"
        with self.assertRaises(ValueError):
            self.validate()

    def test_removed_or_duplicate_patch_rejected(self):
        self.patches["patches"][1] = copy.deepcopy(self.patches["patches"][0])
        with self.assertRaises(ValueError):
            self.validate()

    def test_host_version_mismatch_rejected(self):
        self.patches["patches"][0]["compatiblePackages"][0]["targets"][0][
            "version"
        ] = "1.9.0"
        with self.assertRaises(ValueError):
            self.validate()

    def test_experimental_flag_must_match_declared_candidate(self):
        self.patches["patches"][0]["compatiblePackages"][0]["targets"][0][
            "isExperimental"
        ] = False
        with self.assertRaises(ValueError):
            self.validate()

    def test_api_hash_seed_cannot_be_added(self):
        native = next(
            p
            for p in self.patches["patches"]
            if p["name"] == "Unofficial Telegram music"
        )
        next(o for o in native["options"] if o["key"] == "telegramApplicationHash")[
            "default"
        ] = "synthetic-nonblank-value"
        with self.assertRaises(ValueError):
            self.validate()

    def test_missing_api_options_cannot_hide_a_default(self):
        native = next(
            p
            for p in self.patches["patches"]
            if p["name"] == "Unofficial Telegram music"
        )
        native["options"] = []
        with self.assertRaises(ValueError):
            self.validate()

    def test_tampered_bundle_fails_before_export(self):
        with tempfile.TemporaryDirectory() as temporary:
            file = Path(temporary) / "tampered.mpp"
            file.write_bytes(b"not-the-reviewed-MPP")
            with self.assertRaisesRegex(ValueError, "SHA-256"):
                verify_bundle(file, self.provenance)


if __name__ == "__main__":
    unittest.main()
