"""Pure-data, no-device tests for the read-only clone update preflight."""
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from check_clone_upgrade import (
    UpgradePreflightError,
    assert_upgrade_identity,
    installed_base_apk,
    parse_package,
    parse_signers,
)

SIGNED_OLD = ("eu.faircode.email.morphe", 2338, "1.2338")
SIGNED_NEW = ("eu.faircode.email.morphe", 2338, "1.2338")
CERT1 = ("a" * 64,)
CERT2 = ("b" * 64,)


class CloneUpgradePreflightTests(unittest.TestCase):
    def test_parses_aapt_package(self):
        blob = "package: name='eu.faircode.email.morphe' versionCode='2338' versionName='1.2338'\n"
        self.assertEqual(parse_package(blob), SIGNED_OLD)

    def test_parses_signer_digests(self):
        report = "Signer #1 certificate SHA-256 digest: " + "A" * 64 + "\n"
        self.assertEqual(parse_signers(report), CERT1)

    def test_rejects_missing_digest(self):
        with self.assertRaises(UpgradePreflightError):
            parse_signers("Warning: no valid signers")

    def test_basename_only_from_pm_path(self):
        paths = "package:/data/app/~~AbCd/eu.faircode.email.morphe-xyz/base.apk\npackage:/data/app/~~AbCd/eu.faircode.email.morphe-xyz/split_config.apk\n"
        self.assertEqual(installed_base_apk(paths),
                         "/data/app/~~AbCd/eu.faircode.email.morphe-xyz/base.apk")

    def test_rejects_unknown_paths(self):
        with self.assertRaises(UpgradePreflightError):
            installed_base_apk("package:/sdcard/other/base.apk")

    def test_allows_same_package_same_signer_non_downgrade(self):
        assert_upgrade_identity(SIGNED_OLD, SIGNED_NEW, CERT1, CERT1)
        assert_upgrade_identity(SIGNED_OLD, ("eu.faircode.email.morphe", 2339, "1.2339"), CERT1, CERT1)

    def test_rejects_changed_clone_package(self):
        with self.assertRaisesRegex(UpgradePreflightError, "exact clone package"):
            assert_upgrade_identity(SIGNED_OLD, ("eu.faircode.email.morphe2", 2338, "1.2338"), CERT1, CERT1)

    def test_rejects_changed_signer(self):
        with self.assertRaisesRegex(UpgradePreflightError, "Signing certificate mismatch"):
            assert_upgrade_identity(SIGNED_OLD, SIGNED_NEW, CERT1, CERT2)

    def test_rejects_downgrade(self):
        with self.assertRaisesRegex(UpgradePreflightError, "downgrade"):
            assert_upgrade_identity(SIGNED_OLD, ("eu.faircode.email.morphe", 2337, "1.2337"), CERT1, CERT1)

    def test_rejects_missing_base_path(self):
        with self.assertRaises(UpgradePreflightError):
            installed_base_apk("package:/data/app/~~path/split_config.apk")


if __name__ == "__main__":
    unittest.main()
