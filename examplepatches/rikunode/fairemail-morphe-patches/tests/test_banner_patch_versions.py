"""Contract checks: donation banner layout patch stays version-scoped."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parent.parent
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/HideSupportBannerPatch.kt"

class BannerCompatibilityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = PATCH.read_text(encoding="utf-8")

    def test_both_source_reviewed_versions_are_listed(self):
        self.assertIn('AppTarget(version = "1.2337", versionCode = 2337)', self.source)
        self.assertIn('AppTarget(version = "1.2338", versionCode = 2338)', self.source)

    def test_fail_closed_on_layout_changes(self):
        for value in ('tvSupport', 'vSeparatorSupport', 'grpSupport'):
            self.assertIn(value, self.source)
        self.assertIn('require(matches.size == 1)', self.source)
        self.assertIn('require(group.getAttribute(', self.source)

    def test_banner_patch_does_not_edit_entitlements(self):
        self.assertNotIn('ActivityBilling.isPro', self.source)
        self.assertNotIn('onExportDialog', self.source)

if __name__ == "__main__":
    unittest.main()
