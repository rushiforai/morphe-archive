"""Run each release_text command on a temporary tree and read back what it wrote."""

import argparse
import contextlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

# py -I leaves the script's own folder off the path.
sys.path.insert(0, str(Path(__file__).resolve().parent))
import release_text  # noqa: E402  # pyright: ignore[reportMissingImports]

CHANGELOG = """# Changelog

## Unreleased

* **TikTok:** Hide footnotes is new (#5).

* **TikTok:** About 6.7 MB smaller.

## 0.1.0 (2026-01-01)

* **TikTok:** First.
"""
README = """[![v](https://img.shields.io/badge/version-0.1.0-blue)](x)

Hushfeed v0.1.0 contains 1 patches for TikTok 1.0.0. New in this one: things. It needs Morphe Manager 1.34.0 or newer.

Use Morphe Manager 1.34.0 or newer.

The main branch contains 2 patches, one more than v0.1.0.

Manager shows all 1 Hushfeed patches in ten categories.
"""


def catalog(*versions: str) -> str:
    targets = [{"version": v} for v in versions] + [{"version": "9.9.9", "experimental": True}]
    patch = {"name": "A", "compatibility": [{"packageName": "com.zhiliaoapp.musically", "targets": targets}]}
    return json.dumps({"version": "v0.2.0", "patches": [patch, dict(patch, name="B")]})


class ReleaseTextTest(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.root = Path(self.folder.name)
        (self.root / "extensions/tiktok/src/main/l10n/notes").mkdir(parents=True)
        (self.root / ".github/ISSUE_TEMPLATE").mkdir(parents=True)
        self.write("CHANGELOG.md", CHANGELOG)
        self.write("README.md", README)
        self.write("patches-list.json", catalog("1.0.0", "1.1.0"))
        self.write("patches-bundle.json", json.dumps({"created_at": "", "description": "", "download_url": "",
                                                      "signature_download_url": "", "version": "0.1.0"}))
        self.write(".github/ISSUE_TEMPLATE/bug_report.yml", "      placeholder: Version 0.1.0 for TikTok 1.1.0\n")
        self.saved = (release_text.ROOT, release_text.CHANGELOG, release_text.NOTES)
        release_text.ROOT = self.root
        release_text.CHANGELOG = self.root / "CHANGELOG.md"
        release_text.NOTES = self.root / "extensions/tiktok/src/main/l10n/notes"

    def tearDown(self):
        release_text.ROOT, release_text.CHANGELOG, release_text.NOTES = self.saved
        self.folder.cleanup()

    def write(self, name: str, text: str) -> None:
        (self.root / name).write_text(text, encoding="utf-8", newline="\n")

    def read(self, name: str) -> str:
        return (self.root / name).read_text(encoding="utf-8")

    def run_command(self, command, **values):
        with contextlib.redirect_stdout(io.StringIO()):
            command(argparse.Namespace(**values))

    def translate_all(self, bullet_one: str = "* **TikTok:** Hinweise (#5).", bullet_two: str = "* **TikTok:** 6,7 MB.") -> None:
        for lang in release_text.LANGUAGES:
            self.write(f"extensions/tiktok/src/main/l10n/notes/{lang}.txt",
                       f"## Unreleased\n\n{bullet_one}\n\n{bullet_two}\n\n## 0.1.0 (2026-01-01)\n\n* **TikTok:** x\n")

    def test_cut_dates_the_unreleased_bullets_and_renames_every_translated_table(self):
        self.translate_all()
        self.run_command(release_text.cut, version="0.2.0", date="2026-10-09")
        changelog = self.read("CHANGELOG.md")
        self.assertIn("## Unreleased\n\n## 0.2.0 (2026-10-09)\n\n* **TikTok:** Hide footnotes", changelog)
        self.assertEqual(changelog.count("## 0.1.0 (2026-01-01)"), 1)
        for lang in release_text.LANGUAGES:
            self.assertTrue(self.read(f"extensions/tiktok/src/main/l10n/notes/{lang}.txt").startswith("## 0.2.0 (2026-10-09)\n"))

    def test_cut_refuses_unscoped_bullets_and_partial_translations_without_writing(self):
        self.write("CHANGELOG.md", CHANGELOG.replace("* **TikTok:** About", "* **Docs:** About"))
        with self.assertRaises(SystemExit):
            self.run_command(release_text.cut, version="0.2.0", date=None)
        self.write("CHANGELOG.md", CHANGELOG)
        self.write("extensions/tiktok/src/main/l10n/notes/de.txt", "## Unreleased\n\n* **TikTok:** a\n\n* **TikTok:** b\n")
        with self.assertRaises(SystemExit):
            self.run_command(release_text.cut, version="0.2.0", date=None)
        # Every table translated, but one lost a bullet since: the cut checks them against the English.
        self.translate_all()
        self.write("extensions/tiktok/src/main/l10n/notes/tr.txt", "## Unreleased\n\n* **TikTok:** Notlar (#5).\n")
        with self.assertRaises(SystemExit) as caught:
            self.run_command(release_text.cut, version="0.2.0", date=None)
        self.assertIn("tr: 1 bullets", str(caught.exception))
        self.assertEqual(self.read("CHANGELOG.md"), CHANGELOG)
        self.assertTrue(self.read("extensions/tiktok/src/main/l10n/notes/de.txt").startswith("## Unreleased\n"))

    def test_check_translations_passes_consistent_tables_and_names_each_slip(self):
        self.translate_all()
        self.run_command(release_text.check_translations, version=None, unreleased=True)
        for bad, why in ((("* **TikTok:** Hinweise.", "* **TikTok:** 6,7 MB."), "issue references"),
                         (("* **TikTok:** Hinweise (#5).", "* **TikTok:** 6.7 MB."), "English number"),
                         (("* **TikTok:** Hinweise (#5) — x.", "* **TikTok:** 6,7 MB."), "dash")):
            self.translate_all(*bad)
            with self.assertRaises(SystemExit) as caught:
                self.run_command(release_text.check_translations, version=None, unreleased=True)
            self.assertIn(why, str(caught.exception))

    def test_github_notes_carry_every_bullet_without_the_scope_tag(self):
        self.run_command(release_text.cut, version="0.2.0", date="2026-10-09")
        self.write("intro.md", "Intro line.\n")
        self.write("checked.md", "* Checked on a phone.\n")
        out = self.root / "notes.md"
        self.run_command(release_text.github_notes, version="0.2.0", intro=str(self.root / "intro.md"),
                         checked=str(self.root / "checked.md"), out=str(out))
        notes = out.read_text(encoding="utf-8")
        self.assertIn("## What's changed\n\n* Hide footnotes is new (#5).\n* About 6.7 MB smaller.\n", notes)
        self.assertNotIn("**TikTok:**", notes)
        self.assertIn("Morphe Manager 1.34.0 or newer", notes)
        self.assertTrue(notes.startswith("Intro line.\n\n") and notes.endswith("* Checked on a phone.\n"))

    def test_index_points_the_bundle_readme_and_bug_form_at_the_release(self):
        for name, text in (("readme.txt", "a fade.\n"), ("bundle.txt", "Fade is new.\n")):
            self.write(name, text)
        self.run_command(release_text.index, version="0.2.0", created="2026-10-09T17:03:42",
                         readme_summary=str(self.root / "readme.txt"), bundle_summary=str(self.root / "bundle.txt"),
                         device_line="Checked on a phone.", runtime=10, patch=4)
        bundle = json.loads(self.read("patches-bundle.json"))
        self.assertEqual(bundle["version"], "0.2.0")
        self.assertEqual(bundle["created_at"], "2026-10-09T17:03:42")
        self.assertTrue(bundle["download_url"].endswith("/v0.2.0/patches-0.2.0.mpp"))
        self.assertIn("2 patches for global TikTok 1.0.0 and 1.1.0", bundle["description"])
        self.assertIn("10 runtime tests passed and 4 patch tests passed", bundle["description"])
        self.assertIn("applied to all two supported APKs", bundle["description"])
        self.assertNotIn("9.9.9", bundle["description"])
        readme = self.read("README.md")
        self.assertIn("Hushfeed v0.2.0 contains 2 patches for TikTok 1.0.0 and 1.1.0. New in this one: a fade.", readme)
        self.assertIn("The main branch contains 2 patches, the same set as v0.2.0.", readme)
        self.assertIn("shows all 2 Hushfeed patches", readme)
        self.assertIn("placeholder: Version 0.2.0 for TikTok", self.read(".github/ISSUE_TEMPLATE/bug_report.yml"))

    def test_index_names_one_target_as_the_supported_apk(self):
        self.write("patches-list.json", catalog("1.1.0"))
        for name in ("readme.txt", "bundle.txt"):
            self.write(name, "x.\n")
        self.run_command(release_text.index, version="0.2.0", created="2026-10-09T17:03:42",
                         readme_summary=str(self.root / "readme.txt"), bundle_summary=str(self.root / "bundle.txt"),
                         device_line="", runtime=1, patch=1)
        self.assertIn("applied to the supported APK", json.loads(self.read("patches-bundle.json"))["description"])


if __name__ == "__main__":
    unittest.main()
