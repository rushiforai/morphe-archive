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
