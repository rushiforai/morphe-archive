"""Static contracts for the optional FairEmail Pro feature patch.

These tests establish source boundaries, not APK build or runtime success.
"""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parent.parent
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/EnableProFeaturesPatch.kt"


class ProPatchContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.code = PATCH.read_text(encoding="utf-8")

    def test_patch_is_explicitly_opt_in(self):
        self.assertIn('name = "Enable local Pro features (experimental)"', self.code)
        self.assertIn('default = false', self.code)

    def test_only_source_reviewed_official_versions(self):
        self.assertIn('packageName = "eu.faircode.email"', self.code)
        self.assertIn('AppTarget(version = "1.2337", versionCode = 2337)', self.code)
        self.assertIn('AppTarget(version = "1.2338", versionCode = 2338)', self.code)

    def test_changes_ispro_only(self):
        self.assertIn('val className = "Leu/faircode/email/ActivityBilling;"', self.code)
        self.assertIn('it.name == "isPro"', self.code)
        self.assertNotIn('mutableClassDefBy("Leu/faircode/email/FragmentOptionsBackup;")', self.code)
        self.assertEqual(self.code.count("mutableClassDefBy("), 1)
        self.assertEqual(self.code.count("method.addInstructions("), 1)

    def test_method_signature_and_original_source_are_checked(self):
        self.assertIn('it.returnType == "Z"', self.code)
        self.assertIn('Landroid/content/Context;', self.code)
        self.assertIn('implementation.registerCount >= 2', self.code)
        self.assertIn('original.accessFlags and 0x0008', self.code)
        self.assertIn("getDefaultSharedPreferences", self.code)
        self.assertIn('it.name == "getBoolean"', self.code)
        self.assertIn('it.string == "pro"', self.code)

    def test_only_early_boolean_true_return(self):
        self.assertIn("const/4 v0, 0x1", self.code)
        self.assertIn("return v0", self.code)
        self.assertNotIn("putBoolean", self.code)
        self.assertNotIn("ActivityBilling.onPurchase", self.code)

    def test_nonroot_signature_limit_is_documented(self):
        self.assertIn("NOT an OS signature bypass", self.code)
        self.assertIn("cannot update a stock-signed installation", self.code)


if __name__ == "__main__":
    unittest.main()
