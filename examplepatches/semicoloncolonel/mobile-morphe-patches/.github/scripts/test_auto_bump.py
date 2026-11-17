"""Tests for auto_bump.py: a bump adds the new version and keeps the old ones.

Run from the repository root: python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import tempfile
import unittest
from pathlib import Path

import auto_bump

SINGLE_LINE = '''package semicoloncolonel.mobilestream.patches.walgreens.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Walgreens",
        packageName = "com.usablenet.mobile.walgreen",
        targets = listOf(AppTarget("118.0"))
    )
}
'''

MULTI_LINE = '''package semicoloncolonel.mobilestream.patches.cnn.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNN",
        packageName = "com.cnn.mobile.android.phone",
        targets = listOf(
            AppTarget("26.21.0"),
            devTarget("26.23.0", description = "Phone build"),
        )
    )
}
'''


class BumpConstantsTest(unittest.TestCase):
    def bump(self, source, package, old, new, code=None):
        with tempfile.TemporaryDirectory() as repo:
            path = Path(repo, "patches/src/main/kotlin/app/shared/Constants.kt")
            path.parent.mkdir(parents=True)
            path.write_text(source)
            reason = auto_bump.bump_constants(repo, package, old, new, code)
            return reason, path.read_text()

    def test_single_line_keeps_the_old_pin(self):
        reason, text = self.bump(SINGLE_LINE, "com.usablenet.mobile.walgreen", "118.0", "118.1", 1181)
        self.assertIsNone(reason)
        self.assertIn('targets = listOf(AppTarget("118.0"), devTarget("118.1", versionCode = 1181))', text)
        self.assertIn("import app.morphe.patcher.patch.AppTarget", text)
        self.assertIn(auto_bump.DEV_TARGET_IMPORT, text)

    def test_multi_line_adds_a_line_after_the_newest_pin(self):
        reason, text = self.bump(MULTI_LINE, "com.cnn.mobile.android.phone", "26.23.0", "26.24.0")
        self.assertIsNone(reason)
        self.assertIn(
            '            AppTarget("26.21.0"),\n'
            '            devTarget("26.23.0", description = "Phone build"),\n'
            '            devTarget("26.24.0", description = "Phone build"),\n'
            '        )', text)
        self.assertEqual(text.count(auto_bump.DEV_TARGET_IMPORT), 1)

    def test_version_already_targeted_is_not_added_twice(self):
        reason, text = self.bump(MULTI_LINE, "com.cnn.mobile.android.phone", "26.23.0", "26.21.0")
        self.assertEqual(reason, "26.21.0 is already a target")
        self.assertEqual(text, MULTI_LINE)

    def test_unknown_pin_is_refused(self):
        reason, text = self.bump(SINGLE_LINE, "com.usablenet.mobile.walgreen", "117.0", "118.1")
        self.assertEqual(reason, "no pin is 117.0")
        self.assertEqual(text, SINGLE_LINE)


class BumpReadmeTest(unittest.TestCase):
    def test_new_version_is_listed_above_the_old_one(self):
        with tempfile.TemporaryDirectory() as repo:
            readme = Path(repo, "docs", "apps.md")
            readme.parent.mkdir()
            readme.write_text("| App | Patches | Tested version | Last updated |\n"
                              "| Walgreens | Skip ads | `118.0` | 11/01/26 |\n")
            self.assertTrue(auto_bump.bump_readme(repo, "Walgreens", "118.0", "118.1"))
            row = readme.read_text().splitlines()[1]
            self.assertIn("| `118.1`<br>`118.0` |", row)
            self.assertNotIn("11/01/26", row)


class QualifiesTest(unittest.TestCase):
    def test_app_with_several_pins_can_be_bumped(self):
        record = {"status": "update", "cert": "matches", "patched_apk": "x.apk", "package": "p",
                  "latest": "2.0", "targets": ["1.0", "1.5"]}
        self.assertIsNone(auto_bump.qualifies(record, {"p": {"version": "2.0", "result": "opened"}}))


if __name__ == "__main__":
    unittest.main()
