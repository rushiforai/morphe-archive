"""Fail-closed static contract for the FairEmail startup changelog suppression patch."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/SuppressAutomaticChangelogPatch.kt"

class SuppressChangelogPatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.code = PATCH.read_text(encoding="utf-8")

    def test_patch_is_opt_out_and_only_12338(self):
        self.assertIn('name = "Suppress automatic changelog popup"', self.code)
        self.assertIn("default = true", self.code)
        self.assertIn('packageName = "eu.faircode.email"', self.code)
        self.assertIn('AppTarget(version = "1.2338", versionCode = 2338)', self.code)

    def test_only_activity_startup_method_modified(self):
        self.assertIn('val owner = "Leu/faircode/email/ActivityView;"', self.code)
        self.assertIn('it.name == "checkFirst"', self.code)
        self.assertIn("keyLocations.size == 1", self.code)
        self.assertNotIn('mutableClassDefBy("Leu/faircode/email/FragmentDialogMarkdown;")', self.code)
        self.assertNotIn("getSharedPreferences().edit()", self.code)

    def test_exact_preference_getboolean_key_guard(self):
        self.assertIn('?.string == "show_changelog"', self.code)
        self.assertIn('reference.name == "getBoolean"', self.code)
        self.assertIn('reference?.definingClass == "Landroid/content/SharedPreferences;"', self.code)
        self.assertIn("registerArguments.registerD == keyInstruction.registerA", self.code)
        self.assertIn("registerArguments.registerCount == 3", self.code)

    def test_replaces_only_boolean_result_with_zero(self):
        self.assertIn("result.opcode == Opcode.MOVE_RESULT", self.code)
        self.assertIn("resultRegister in 0..15", self.code)
        self.assertIn('method.replaceInstruction(keyIndex + 2, "const/4 v', self.code)
        self.assertIn('0x0")', self.code)
        self.assertNotIn("method.addInstructions(", self.code)

    def test_changelog_asset_and_other_dialogs_not_deleted(self):
        self.assertNotIn("deleteFile", self.code)
        self.assertNotIn("FragmentDialogFirst", self.code)
        self.assertNotIn("FragmentDialogMarkdown;", self.code)
        self.assertNotIn('replaceInstruction(keyIndex + 1', self.code)

if __name__ == "__main__":
    unittest.main()
