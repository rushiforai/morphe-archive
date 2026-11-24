"""Tests for localized string resource coverage and extension hygiene."""
from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
STRINGS_KT = ROOT / "patches/src/main/kotlin/app/linenotifications/patches/settings/NotificationStrings.kt"
EXTENSION_JAVA_ROOT = ROOT / "extensions/extension/src/main/java/app/linenotifications/extension"
PATCHES_KOTLIN_ROOT = ROOT / "patches/src/main/kotlin/app/linenotifications/patches"

EXPECTED_QUALIFIERS = [
    "values",
    "values-ko",
    "values-ja",
    "values-zh-rTW",
    "values-zh-rCN",
    "values-th",
    "values-in",
]

HANGUL_RE = re.compile(r"[\uAC00-\uD7A3]")


def parse_notification_strings() -> dict[str, dict[str, str]]:
    text = STRINGS_KT.read_text(encoding="utf-8")
    locales: dict[str, dict[str, str]] = {}
    locale_pattern = re.compile(r'"(values(?:-[^"]+)*)"\s+to\s+linkedMapOf\((.*?)\n    \),', re.S)
    entry_pattern = re.compile(r'"(line_notify_[a-z0-9_]+)"\s+to\s+"([^"]*)"')
    for match in locale_pattern.finditer(text):
        qualifier, block = match.group(1), match.group(2)
        entries: dict[str, str] = {}
        for key, value in entry_pattern.findall(block):
            if key in entries:
                raise AssertionError(f"Duplicate key {key!r} in {qualifier}")
            entries[key] = value
        locales[qualifier] = entries
    return locales


class I18nResourcesTest(unittest.TestCase):
    def test_all_expected_locales_and_keys_present(self):
        locales = parse_notification_strings()
        self.assertEqual(sorted(locales.keys()), sorted(EXPECTED_QUALIFIERS))
        base = locales["values"]
        self.assertEqual(len(base), 77)
        for qualifier, entries in locales.items():
            self.assertEqual(set(entries.keys()), set(base.keys()), f"Key mismatch in {qualifier}")
            for key, value in entries.items():
                self.assertTrue(value.strip(), f"Empty value for {key} in {qualifier}")
                self.assertNotIn("'", value, f"Raw ASCII apostrophe in {qualifier}/{key}")
                self.assertNotIn('"', value, f"Raw ASCII quote in {qualifier}/{key}")

    def test_all_extension_string_keys_exist_in_bundle(self):
        locales = parse_notification_strings()
        defined = set(locales["values"].keys())
        referenced = set()
        key_re = re.compile(r'"(line_notify_[a-z0-9_]+)"')
        for java_file in EXTENSION_JAVA_ROOT.rglob("*.java"):
            for key in key_re.findall(java_file.read_text(encoding="utf-8")):
                if key == "line_notify_ic_settings":
                    continue
                referenced.add(key)
        missing = referenced - defined
        self.assertEqual(missing, set(), f"Missing localized keys: {sorted(missing)}")

    def test_no_hardcoded_korean_in_extension_or_patches(self):
        for java_file in EXTENSION_JAVA_ROOT.rglob("*.java"):
            text = java_file.read_text(encoding="utf-8")
            self.assertIsNone(
                HANGUL_RE.search(text),
                f"Unexpected Korean text in extension file: {java_file.relative_to(ROOT)}",
            )
        for kt_file in PATCHES_KOTLIN_ROOT.rglob("*.kt"):
            if kt_file == STRINGS_KT:
                continue
            text = kt_file.read_text(encoding="utf-8")
            self.assertIsNone(
                HANGUL_RE.search(text),
                f"Unexpected Korean text in patch file: {kt_file.relative_to(ROOT)}",
            )


if __name__ == "__main__":
    unittest.main()
