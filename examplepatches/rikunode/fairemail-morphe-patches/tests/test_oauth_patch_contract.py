"""Static fail-closed contract for the FairEmail OAuth setup menu-only patch."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/EnableOAuthForResignedApkPatch.kt"


class OAuthPatchContract(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = PATCH.read_text(encoding="utf-8")

    def test_opt_in_only(self):
        self.assertIn("default = false", self.source)

    def test_exact_app_target(self):
        self.assertIn('packageName = "eu.faircode.email"', self.source)
        self.assertIn('AppTarget(version = "1.2338", versionCode = 2338)', self.source)

    def test_only_setup_menu_class(self):
        self.assertIn('FragmentSetup\\$7\\$1;', self.source)
        self.assertIn('"onMenuItemClick"', self.source)
        self.assertIn('listOf("Landroid/view/MenuItem;")', self.source)
        self.assertIn('require(checkIndices.size == 2)', self.source)

    def test_results_not_global_helper(self):
        self.assertIn('Opcode.MOVE_RESULT', self.source)
        self.assertIn('method.replaceInstruction(index + 1,', self.source)
        self.assertIn('const/4 v', self.source)
        self.assertNotIn('mutableClassDefBy("Leu/faircode/email/Helper;")', self.source)
        self.assertNotIn('method.addInstructions(', self.source)

    def test_original_certificate_and_google_id_unchanged(self):
        self.assertNotIn("GET_SIGNATURES", self.source)
        self.assertNotIn("getPackageInfo", self.source)
        self.assertNotIn("googleusercontent.com", self.source)
        self.assertNotIn("clientSecret", self.source)

    def test_fail_closed_on_unexpected_register(self):
        self.assertIn('register in 0..15', self.source)
        self.assertIn('OneRegisterInstruction', self.source)
        self.assertIn('Opcode.INVOKE_STATIC', self.source)
        self.assertIn('reference.name == "hasValidFingerprint"', self.source)


if __name__ == "__main__":
    unittest.main()
