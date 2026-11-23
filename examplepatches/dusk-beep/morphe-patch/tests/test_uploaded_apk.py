"""Optional integration test: set FIREFOX_160_APK to the official APK path."""
import os
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from firefox160_dex_audit import audit  # noqa: E402


@unittest.skipUnless(os.environ.get("FIREFOX_160_APK"), "FIREFOX_160_APK not set")
class UploadedApkIntegrationTests(unittest.TestCase):
    def test_uploaded_firefox_apk_matches_the_audited_layout(self):
        report = audit(Path(os.environ["FIREFOX_160_APK"]))
        self.assertEqual(report["package"], "org.mozilla.firefox")
        self.assertEqual(report["versionName"], "160.0")
        self.assertEqual(report["targets"]["uninstallWebExtension"]["failure_callback_parameter"],
                         "p3: Function2.invoke(extensionId: String, error: Throwable)")


if __name__ == "__main__":
    unittest.main()
