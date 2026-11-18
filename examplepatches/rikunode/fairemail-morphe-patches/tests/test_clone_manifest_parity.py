import tempfile
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from check_clone_manifest_parity import check_parity, read_elements

XML = """N: android=http://schemas.android.com/apk/res/android
E: manifest
  A: package="eu.faircode.email.morphe"
  E: uses-permission (line=4)
    A: android:name(0x01010003)="android.permission.INTERNET"
  E: application (line=10)
    E: provider (line=20)
      A: android:name(0x01010003)="androidx.core.content.FileProvider"
      A: android:authorities(0x01010018)="eu.faircode.email.morphe.cropper.fileprovider"
    E: activity (line=30)
      A: android:taskAffinity(0x01010012)="eu.faircode.email.SETUP"
      E: intent-filter (line=31)
        E: data (line=32)
          A: android:scheme(0x01010027)="eu.faircode.email"
          A: android:host(0x01010028)="oauth"
"""


class CloneManifestParityTests(unittest.TestCase):
    def parse(self, text):
        with tempfile.TemporaryDirectory() as d:
            f = Path(d) / "manifest.txt"
            f.write_text(text, encoding="utf-8")
            return read_elements(f)

    def test_expected_clone_manifest(self):
        parsed = self.parse(XML)
        result = check_parity(parsed, parsed)
        self.assertEqual(len(result["provider_authorities"]), 1)
        self.assertEqual(result["deeplink_schemes"], ["eu.faircode.email"])

    def test_reject_unexpected_provider_transform(self):
        ours = self.parse(XML.replace("morphe.cropper", "other.cropper"))
        with self.assertRaisesRegex(ValueError, "provider_authorities parity"):
            check_parity(ours, self.parse(XML))

    def test_reject_silent_deeplink_change(self):
        ours = self.parse(XML.replace('="oauth"', '="wrong"'))
        with self.assertRaisesRegex(ValueError, "deeplink_hosts parity"):
            check_parity(ours, self.parse(XML))

    def test_reject_duplicate_provider_authorities(self):
        ours = self.parse(XML.replace('A: android:authorities(0x01010018)="eu.faircode.email.morphe.cropper.fileprovider"',
            'A: android:authorities(0x01010018)="eu.faircode.email.morphe.cropper.fileprovider;eu.faircode.email.morphe.cropper.fileprovider"'))
        with self.assertRaisesRegex(ValueError, "provider_authorities parity"):
            check_parity(ours, self.parse(XML))

    def test_reject_bad_identifier(self):
        wrong = XML.replace("eu.faircode.email.morphe.cropper", "eu.faircode.email.cropper")
        with self.assertRaisesRegex(ValueError, "un-cloned"):
            check_parity(self.parse(wrong), self.parse(wrong))


if __name__ == "__main__":
    unittest.main()
