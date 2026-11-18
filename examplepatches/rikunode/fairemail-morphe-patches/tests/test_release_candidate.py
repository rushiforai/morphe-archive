import copy
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from verify_release_candidate import PATCHES, CLONE, DEV3, SIX_PATCH_VERSIONS, verify_index


class ReleaseReadinessTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import json
        cls.asset = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
        cls.index = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))

    def test_index_matches_exact_release_set(self):
        verify_index(self.index, self.asset["version"])
        self.assertEqual(len(self.index["patches"]), 6 if self.asset["version"] in SIX_PATCH_VERSIONS else 5)

    def test_cannot_drop_changelog_suppression(self):
        idx = copy.deepcopy(self.index)
        idx["patches"] = [p for p in idx["patches"] if p["name"] != "Suppress automatic changelog popup"]
        with self.assertRaisesRegex(ValueError, "Expected exactly"):
            verify_index(idx, self.asset["version"])

    def test_oauth_remains_opt_in(self):
        idx = copy.deepcopy(self.index)
        p = next(p for p in idx["patches"] if p["name"].startswith("Enable OAuth"))
        p["default"] = True
        with self.assertRaisesRegex(ValueError, "unsafe default"):
            verify_index(idx, self.asset["version"])

    def test_reject_unreviewed_12337_oauth_compatibility(self):
        idx = copy.deepcopy(self.index)
        p = next(p for p in idx["patches"] if p["name"].startswith("Enable OAuth"))
        p["compatiblePackages"][0]["targets"].insert(0, {
            "version": "1.2337",
            "versionCodes": {x: 2337 for x in ("ARM", "ARM64_V8A", "X86", "X86_64")},
        })
        with self.assertRaisesRegex(ValueError, "wrong version"):
            verify_index(idx, self.asset["version"])

    def test_no_hidden_pro_default(self):
        idx = copy.deepcopy(self.index)
        p = next(p for p in idx["patches"] if p["name"].startswith("Enable local Pro"))
        p["default"] = True
        with self.assertRaisesRegex(ValueError, "unsafe default"):
            verify_index(idx, self.asset["version"])

    def test_clone_is_on_and_targeted_only_for_dev3(self):
        idx = copy.deepcopy(self.index)
        idx["version"] = DEV3
        clone = {
            "name": "Clone FairEmail alongside official app",
            "default": True,
            "compatiblePackages": [{
                "packageName": "eu.faircode.email",
                "targets": [{"version": "1.2338",
                    "versionCodes": {name: 2338 for name in ("ARM", "ARM64_V8A", "X86", "X86_64")}}],
            }],
        }
        idx["patches"] = [p for p in idx["patches"] if p["name"] != clone["name"]]
        idx["patches"].append(clone)
        verify_index(idx, DEV3)
        clone["default"] = False
        with self.assertRaisesRegex(ValueError, "unsafe default"):
            verify_index(idx, DEV3)

    def test_release_candidate_has_six_strict_patches(self):
        idx = copy.deepcopy(self.index)
        for target in ("0.3.0-rc.1", "0.3.0", "0.3.1"):
            idx["version"] = target
            verify_index(idx, target)

    def test_release_default_clone_cannot_be_disabled(self):
        idx = copy.deepcopy(self.index)
        item = next(p for p in idx["patches"] if p["name"].startswith("Clone FairEmail"))
        item["default"] = False
        for target in ("0.3.0-rc.1", "0.3.0", "0.3.1"):
            idx["version"] = target
            with self.assertRaisesRegex(ValueError, "unsafe default"):
                verify_index(idx, target)

    def test_known_patch_count(self):
        self.assertEqual(len(PATCHES), 5)
        self.assertEqual(len(CLONE), 1)


if __name__ == "__main__":
    unittest.main()
