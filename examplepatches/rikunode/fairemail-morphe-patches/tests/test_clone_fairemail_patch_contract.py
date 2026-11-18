"""Fail-closed static contract for the optional source-level transplant of Morphe Clone app."""
import pathlib
import unittest

ROOT=pathlib.Path(__file__).resolve().parents[1]
SRC=ROOT / "patches/src/main/kotlin/dev/rikunode/fairemail/CloneFairEmailPatch.kt"

class CloneFairEmailContract(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.s=SRC.read_text(encoding="utf-8")

    def test_license_and_upstream_provenance_preserved(self):
        self.assertIn("Copyright 2026 Morphe.",self.s)
        self.assertIn("Section 7b: Notice Preservation",self.s)
        self.assertIn("Original code hard forked from:",self.s)
        self.assertIn("MorpheApp/morphe-patches/blob/main",self.s)

    def test_clones_by_default_without_changing_upgrade_package(self):
        self.assertIn('name = "Clone FairEmail alongside official app"',self.s)
        self.assertIn("default = true",self.s)
        self.assertIn('private const val DEFAULT_SUFFIX = ".morphe"',self.s)
        self.assertIn('private const val ORIGINAL_PACKAGE = "eu.faircode.email"',self.s)
        self.assertIn("val replacement = if (chosen == \"Default\")",self.s)

    def test_exact_target_and_no_unknown_flavors(self):
        self.assertIn("AppTarget(version = TARGET_VERSION, versionCode = 2338)",self.s)
        self.assertIn('private const val TARGET_VERSION = "1.2338"',self.s)
        self.assertIn("packageName = ORIGINAL_PACKAGE",self.s)

    def test_upstream_option_names_and_defaults(self):
        for key in ("packageName","updatePermissions","updateProviders"):
            self.assertIn(f'key = "{key}"',self.s)
        self.assertIn("val updatePermissionsOption = booleanOption(",self.s)
        self.assertIn("val updateProvidersOption = booleanOption(",self.s)

    def test_safe_manifest_changes_and_duplicate_guard(self):
        self.assertIn('document("AndroidManifest.xml")',self.s)
        self.assertIn("finalize {",self.s)
        self.assertIn("actual == ORIGINAL_PACKAGE || actual == replacement",self.s)
        self.assertIn('return@use',self.s)
        self.assertIn('manifest.setAttribute("package", replacement)',self.s)
        self.assertIn('android:authorities',self.s)
        self.assertIn('authority == original -> "${replacement}_$authority"',self.s)
        self.assertIn('android:name',self.s)
        self.assertIn("another clone patch",self.s)
        self.assertIn("replacement != ORIGINAL_PACKAGE",self.s)

    def test_no_signature_spoof_or_data_reset(self):
        for term in ("hasValidFingerprint","getPackageInfo","removeAccount","clearApplicationUserData","DELETE", "setPackageInfo"):
            self.assertNotIn(term,self.s)

if __name__=="__main__":
    unittest.main()
