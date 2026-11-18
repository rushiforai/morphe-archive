"""Static safety contracts for the local-only FairEmail settings-export experiment.

These do not compile or run the patch; an actual DEX diff and device test are
still required before making any compatibility or migration claims.
"""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parent.parent
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/EnableSettingsExportPatch.kt"

class ExportPatchSafetyContracts(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.code = PATCH.read_text(encoding="utf-8")

    def test_patch_is_explicitly_opt_in(self):
        self.assertIn("default = false", self.code)
        self.assertIn('name = "Enable local settings export (experimental)"', self.code)

    def test_patch_is_pinned_to_source_reviewed_versions(self):
        self.assertIn('packageName = "eu.faircode.email"', self.code)
        self.assertIn('AppTarget(version = "1.2337", versionCode = 2337)', self.code)
        self.assertIn('AppTarget(version = "1.2338", versionCode = 2338)', self.code)

    def test_patch_changes_export_entrypoint_only(self):
        self.assertIn('it.name == "onExportDialog"', self.code)
        self.assertIn('val className = "Leu/faircode/email/FragmentOptionsBackup;"', self.code)
        self.assertIn("mutableClassDefBy(className)", self.code)
        self.assertNotIn('mutableClassDefBy("Leu/faircode/email/ActivityBilling;")', self.code)

    def test_old_gate_and_target_are_verified_before_mutation(self):
        self.assertIn('it.name == "isPro"', self.code)
        self.assertIn('it.name == "askPassword"', self.code)
        self.assertIn('require(matches.size == 1)', self.code)
        self.assertIn('require(implementation.registerCount >= 2)', self.code)
        self.assertIn('require(calls.any', self.code)

    def test_existing_password_encrypted_export_is_invoked(self):
        self.assertIn('const/4 v0, 0x1', self.code)
        self.assertIn('->askPassword(Z)V', self.code)
        self.assertIn('return-void', self.code)

if __name__ == "__main__":
    unittest.main()
