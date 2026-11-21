"""Validate that the test clone can coexist with the untouched Hatena install.

Checks only APK metadata and cryptographic APK signing; never connects to a
real phone, changes installed apps, or bypasses Play/Pairip licensing.
"""
from pathlib import Path
import os
import subprocess
import unittest

ROOT = Path(__file__).resolve().parents[1]
APK = ROOT / "apk-inspection/HatenaBookmark-5.84-PR-hidden-clone-test.apk"
SDK_ROOT = Path(os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or (Path.home() / "AppData/Local/Android/Sdk"))
SDK = SDK_ROOT / "build-tools" / "36.0.0"
AAPT = SDK / "aapt.exe"
SIGNER = SDK / "apksigner.bat"
OLD = "com.hatena.android.bookmark"
NEW = "com.hatena.android.bookmark.morphe"

@unittest.skipUnless(APK.is_file() and AAPT.is_file(), "Local clone APK/Android build tools unavailable")
class SideBySideApkTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.badging = subprocess.run(
            [str(AAPT), "dump", "badging", str(APK)],
            encoding="utf-8", errors="replace", capture_output=True, check=True
        ).stdout
        cls.tree = subprocess.run(
            [str(AAPT), "dump", "xmltree", str(APK), "AndroidManifest.xml"],
            encoding="utf-8", errors="replace", capture_output=True, check=True
        ).stdout

    def test_clone_package_and_original_components(self):
        self.assertIn(f"package: name='{NEW}' versionCode='58400' versionName='5.84'", self.badging)
        self.assertIn("com.hatena.android.bookmark.RootMenuActivity", self.badging)
        self.assertIn('com.pairip.application.Application', self.tree)
        self.assertIn('com.pairip.licensecheck.LicenseActivity', self.tree)

    def test_no_permission_or_provider_authority_collision(self):
        self.assertIn(f'{NEW}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION', self.tree)
        self.assertEqual(self.tree.count(f'{NEW}.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION'), 4)
        for authority in (
            f'{NEW}.androidx-startup',
            f'{NEW}.com.squareup.picasso',
            f'{NEW}.firebaseinitprovider',
        ):
            self.assertIn(f'"{authority}"', self.tree)
        # Look only at provider authorities, not DEX classes which retain the old name.
        import re
        authorities = re.findall(r'android:authorities[^\n]*?"([^"]+)"', self.tree)
        self.assertEqual(len(authorities), 3)
        self.assertEqual(len(set(authorities)), 3)
        self.assertTrue(all(name.startswith(NEW + ".") for name in authorities))
        self.assertNotIn(f'"{OLD}.androidx-startup"', self.tree)

    @unittest.skipUnless(SIGNER.is_file(), "SDK APK verifier unavailable")
    def test_valid_v2_signature(self):
        env = os.environ.copy()
        env["JAVA_HOME"] = r"C:\Program Files\Android\Android Studio\jbr"
        result = subprocess.run(
            [str(SIGNER), "verify", "--verbose", "--print-certs", str(APK)],
            encoding="utf-8", errors="replace", capture_output=True, env=env, check=True
        )
        self.assertIn("Verifies", result.stdout)
        self.assertIn("Verified using v2 scheme (APK Signature Scheme v2): true", result.stdout)
        self.assertIn("CN=Morphe", result.stdout)

if __name__ == "__main__":
    unittest.main()
