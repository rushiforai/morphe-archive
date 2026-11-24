import json
import unittest

import resolve

UPSTREAM = """## [2.0.0](https://example.invalid/compare/v1.0.0...v2.0.0) (2026-01-02)

### ✨ New Features

* **Gboard:** add A.

### 🐛 Bug Fixes

* **Gboard:** fix B.

### ✨ 新功能

* **Gboard:** 新增 A。

### 🐛 修復

* **Gboard:** 修復 B。

## [1.0.0](https://example.invalid/compare/v0.9.0...v1.0.0) (2026-01-01)

### ✨ New Features

* **Gboard:** first.
"""

FORK = """## [1.0.0-jp.1](https://example.invalid/compare/v1.0.0...v1.0.0-jp.1) (2026-01-01)

### ✨ New Features

* **Gboard:** fork only.

## [0.5.0-jp.1](https://example.invalid/compare/v0.5.0...v0.5.0-jp.1) (2025-12-01)

### ✨ New Features

* **Gboard:** orphan.

## [1.0.0](https://example.invalid/compare/v0.9.0...v1.0.0) (2026-01-01)

### ✨ New Features

* **Gboard:** first.
"""


class ChangelogTest(unittest.TestCase):
    def test_new_section_adds_placeholder_bullets_in_place(self):
        body = resolve.new_section_body(resolve.split_sections(UPSTREAM)[1], "2.0.0", True)
        self.assertEqual(
            body,
            "### ✨ New Features\n\n* **Gboard:** add A.\n" + resolve.EN_PLACEHOLDER_BULLET
            + "\n\n### 🐛 Bug Fixes\n\n* **Gboard:** fix B.\n\n### ✨ 新功能\n\n* **Gboard:** 新增 A。\n"
            + resolve.ZH_PLACEHOLDER_BULLET + "\n\n### 🐛 修復\n\n* **Gboard:** 修復 B。",
        )

    def test_skipped_upstream_releases_are_merged_into_the_new_section(self):
        upstream = (
            "## [2.0.1](x) (2026-01-03)\n\n### 🐛 Bug Fixes\n\n* fix C.\n\n### 🐛 修復\n\n* 修復 C。\n\n"
            "## [2.0.1-dev.1](x) (2026-01-03)\n\n### 🐛 Bug Fixes\n\n* dev only.\n\n"
            + UPSTREAM
        )
        sections = resolve.split_sections(upstream)[1]
        body = resolve.new_section_body(sections, "2.0.1", False, previous="1.0.0")
        self.assertEqual(
            body,
            "### ✨ New Features\n\n* **Gboard:** add A.\n\n### 🐛 Bug Fixes\n\n* fix C.\n* **Gboard:** fix B."
            "\n\n### ✨ 新功能\n\n* **Gboard:** 新增 A。\n\n### 🐛 修復\n\n* 修復 C。\n* **Gboard:** 修復 B。",
        )
        self.assertEqual(resolve.last_fork_base(FORK), "1.0.0")

    def test_missing_feature_headings_are_created(self):
        body = "### 🐛 Bug Fixes\n\n* fix.\n\n### 🐛 修復\n\n* 修復。"
        body = resolve.append_bullet(body, resolve.EN_FEATURES, "* en")
        body = resolve.append_bullet(body, resolve.ZH_FEATURES, "* zh", before=resolve.ZH_FIXES)
        self.assertEqual(
            body, "### ✨ New Features\n\n* en\n\n### 🐛 Bug Fixes\n\n* fix.\n\n### ✨ 新功能\n\n* zh\n\n### 🐛 修復\n\n* 修復。"
        )

    def test_splice_places_fork_sections_above_their_base(self):
        text = resolve.splice_changelog(UPSTREAM, FORK, "## [2.0.0-jp.1](x) (2026-01-03)", "### ✨ New Features\n\n* new.")
        headings = [line for line in text.splitlines() if line.startswith("## ")]
        self.assertEqual(
            [resolve.heading_base(h) for h in headings], ["2.0.0-jp.1", "0.5.0-jp.1", "2.0.0", "1.0.0-jp.1", "1.0.0"]
        )
        self.assertIn("* new.\n\n## [0.5.0-jp.1]", text)
        self.assertIn("* fork only.\n\n## [1.0.0]", text)
        self.assertTrue(text.endswith("* **Gboard:** first.\n"))
        self.assertNotIn("\n\n\n", text)


class XmlTest(unittest.TestCase):
    def test_inserts_ja_only_where_missing_and_preserves_rest(self):
        xml = (
            '<?xml version="1.0" encoding="utf-8"?>\n<settings-text locales="en zh-Hant ja">\n'
            '    <string name="a">\n        <translation locale="en">A &amp; b</translation>\n'
            '        <translation locale="zh-Hant">甲</translation>\n    </string>\n'
            '    <string name="b" formatted="false">\n        <translation locale="en">B</translation>\n'
            '        <translation locale="zh-Hant">乙</translation>\n        <translation locale="ja">ビ</translation>\n'
            '    </string>\n    <plurals name="p">\n        <item quantity="one">\n'
            '            <translation locale="en">%d x</translation>\n        </item>\n    </plurals>\n</settings-text>\n'
        )
        out, keys = resolve.fill_ja_placeholders(xml)
        self.assertEqual(keys, ["a", "p[one]"])
        expected = xml.replace(
            '甲</translation>\n', '甲</translation>\n        <translation locale="ja">A &amp; b</translation>\n'
        ).replace(
            '%d x</translation>\n', '%d x</translation>\n            <translation locale="ja">%d x</translation>\n'
        )
        self.assertEqual(out, expected)
        self.assertEqual(resolve.fill_ja_placeholders(out), (out, []))


def settings(locales, *entries):
    return f'<?xml version="1.0" encoding="utf-8"?>\n<settings-text locales="{locales}">\n' + "".join(entries) + "</settings-text>\n"


def entry(name, en, zh, ja=None, gap=""):
    lines = [f'    <string name="{name}">', f'        <translation locale="en">{en}</translation>',
             f'        <translation locale="zh-Hant">{zh}</translation>']
    if ja is not None:
        lines.append(f'        <translation locale="ja">{ja}</translation>')
    return gap + "\n".join(lines + ["    </string>"]) + "\n"


class SettingsMergeTest(unittest.TestCase):
    BASE = settings("en zh-Hant", entry("a", "A", "甲"), entry("b", "B", "乙"), entry("c", "C", "丙"), entry("d", "D", "丁"))
    OURS = settings("en zh-Hant ja", entry("a", "A", "甲", "エー"), entry("b", "B", "乙", "ビー"),
                    entry("f", "F", "戊", "エフ"), entry("c", "C", "丙", "シー"), entry("d", "D", "丁", "ディー", gap="\n"))

    def test_upstream_edits_keep_fork_entries_and_unchanged_ja(self):
        theirs = settings("en zh-Hant", entry("a", "A", "甲"), entry("b", "B2", "乙2"), entry("n", "N", "新"),
                          entry("d", "D", "丁", gap="\n"))
        merged = resolve.merge_settings_xml(self.BASE, self.OURS, theirs)
        expected = settings("en zh-Hant ja", entry("a", "A", "甲", "エー"), entry("b", "B2", "乙2"), entry("f", "F", "戊", "エフ"),
                            entry("n", "N", "新"), entry("d", "D", "丁", "ディー", gap="\n"))
        self.assertEqual(merged, expected)
        self.assertEqual(resolve.fill_ja_placeholders(merged)[1], ["b", "n"])

    def test_fork_edit_of_en_is_kept_when_upstream_left_it(self):
        ours = self.OURS.replace(">C<", ">C fork<")
        theirs = settings("en zh-Hant", entry("a", "A", "甲"), entry("b", "B", "乙"), entry("c", "C", "丙"), entry("d", "D", "丁"))
        self.assertIn(">C fork<", resolve.merge_settings_xml(self.BASE, ours, theirs))

    def test_both_sides_editing_an_entry_is_a_conflict(self):
        ours = self.OURS.replace(">C<", ">C fork<")
        theirs = self.BASE.replace(">C<", ">C upstream<")
        self.assertIsNone(resolve.merge_settings_xml(self.BASE, ours, theirs))


class BundleTest(unittest.TestCase):
    def test_render_bundle_matches_upstream_layout(self):
        upstream = '{\n  "created_at": "old",\n  "description": "old",\n  "download_url": "old",\n  "signature_download_url": "",\n  "version": "2.0.0"\n}'
        out = resolve.render_bundle(upstream, "### ✨ 新功能\n\n* 甲", "2.0.0-jp.1", "o/r", "2026-01-03T00:00:00")
        self.assertEqual(
            out,
            '{\n  "created_at": "2026-01-03T00:00:00",\n  "description": "### ✨ 新功能\\n\\n* 甲",\n'
            '  "download_url": "https://github.com/o/r/releases/download/v2.0.0-jp.1/patches-2.0.0-jp.1.mpp",\n'
            '  "signature_download_url": "",\n  "version": "2.0.0-jp.1"\n}',
        )
        self.assertEqual(json.loads(out)["version"], "2.0.0-jp.1")

    def test_gradle_version(self):
        self.assertEqual(resolve.set_gradle_version("a = 1\nversion = 2.0.0\n", "2.0.0-jp.1"), "a = 1\nversion = 2.0.0-jp.1\n")


class PostTextTest(unittest.TestCase):
    def test_posted_texts_contain_no_links_or_mentions(self):
        body = resolve.pr_body("v2.0.0", "2.0.0-jp.1", ["CHANGELOG.md"], ["gboard_patches_a_title"])
        notes = resolve.release_notes("v2.0.0", "2.0.0-jp.1")
        self.assertIn("- `gboard_patches_a_title`", body)
        self.assertIn("`v2.0.0-jp.0`", notes)
        for text in (body, notes):
            self.assertNotRegex(text, r"https?://|www\.|@|#\d")


if __name__ == "__main__":
    unittest.main()
