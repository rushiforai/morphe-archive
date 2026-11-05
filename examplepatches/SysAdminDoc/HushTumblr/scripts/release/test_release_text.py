"""Unit tests for release_text.py, each on a small checkout of its own in a temporary folder.

  py -3 -m unittest discover -s scripts/release -p "test_*.py"
"""

import contextlib
import io
import json
import re
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import release_text  # noqa: E402

CHANGELOG = """# Changelog

Every HushTumblr release, newest first.

## Unreleased

* **Tooling:** The gate runs the quick checks first.

* Hide ads now covers the shopping row.
* **Tumblr:** Download board saves more pins.

## 0.0.6 (2026-10-10)

* HushTumblr now patches Tumblr 46.4.0.110 only.
"""

README = """# HushTumblr

<img src="https://img.shields.io/badge/version-0.0.7-446B93" alt="Version 0.0.7">
<img src="https://img.shields.io/badge/platform-Android%208%2B-3DDC84" alt="Platform Android 8+">

The latest release is [v0.0.6](https://github.com/SysAdminDoc/HushTumblr/releases/tag/v0.0.6), with 26 patches. Add this repo to Morphe Manager.

HushTumblr targets Tumblr 46.5.0.109.

## Verify a download

Morphe Manager doesn't check it, so that's up to you. The v0.0.6 bundle's line:

```text
1111111111111111111111111111111111111111111111111111111111111111  patches-0.0.6.mpp
```
"""

DIGEST = "7ed0d301ab75a2fb6c7dd5b0aecb6dd541c7bad97d9b5c70d5dfc778219b8c0d"

FORM = """body:
  - type: input
    attributes:
      label: HushTumblr and Tumblr versions
      placeholder: HushTumblr 0.0.6 on Tumblr 46.4.0.110

  - type: input
    attributes:
      placeholder: APKMirror bundle, 46.4.0.110 (1460400110)
  - type: input
    attributes:
      placeholder: Morphe Manager 1.34.0
"""

INDEX = {
    "created_at": "2026-10-10T03:34:54",
    "description": "HushTumblr v0.0.6: 26 patches for Tumblr 46.4.0.110.",
    "download_url": "https://github.com/SysAdminDoc/HushTumblr/releases/download/v0.0.6/patches-0.0.6.mpp",
    "signature_download_url": "",
    "version": "0.0.6",
}


def catalog(version="v0.0.7", builds=(("46.5.0.109", 1460500109),), count=3):
    targets = [{"version": v, "experimental": False, "versionCodes": {"ARM64_V8A": c}} for v, c in builds]
    patch = {"name": "", "compatibility": [{"packageName": "com.tumblr", "targets": targets}]}
    return {"version": version, "patches": [dict(patch, name=f"Patch {i}") for i in range(count)]}


class ReleaseTextTest(unittest.TestCase):
    def setUp(self):
        self._dir = tempfile.TemporaryDirectory()
        self.root = Path(self._dir.name)
        (self.root / "gradle").mkdir()
        (self.root / ".github/ISSUE_TEMPLATE").mkdir(parents=True)
        self.put("CHANGELOG.md", CHANGELOG)
        self.put("README.md", README)
        self.put(".github/ISSUE_TEMPLATE/bug_report.yml", FORM)
        self.put("gradle/libs.versions.toml", '[versions]\nmanager-floor = "1.34.0"\n')
        self.put("patches-list.json", json.dumps(catalog(), indent=2))
        self.put("patches-bundle.json", json.dumps(INDEX, indent=2) + "\n")

    def tearDown(self):
        self._dir.cleanup()

    def put(self, name, text, newline="\n"):
        (self.root / name).write_bytes(text.replace("\n", newline).encode("utf-8"))

    def text(self, name):
        return (self.root / name).read_bytes().decode("utf-8")

    def run_tool(self, *args):
        """Exit code and what it wrote to stderr."""
        err = io.StringIO()
        with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(err):
            code = release_text.main(["--root", str(self.root), *args])
        return code, err.getvalue()

    def file(self, name, text):
        path = self.root / name
        path.write_text(text, encoding="utf-8")
        return str(path)

    def cut(self):
        code, err = self.run_tool("cut", "--version", "0.0.7", "--date", "2026-10-11")
        self.assertEqual(code, 0, err)

    # --- cut -------------------------------------------------------------------------------------

    def test_cut_dates_the_section_with_tumblr_first_drops_a_leftover_label_and_keeps_the_rest(self):
        self.cut()
        text = self.text("CHANGELOG.md")
        self.assertNotIn("## Unreleased", text)
        self.assertIn(
            "## 0.0.7 (2026-10-11)\n\n"
            "* Hide ads now covers the shopping row.\n"
            "* Download board saves more pins.\n"
            "* **Tooling:** The gate runs the quick checks first.\n\n"
            "## 0.0.6 (2026-10-10)\n", text)
        self.assertTrue(text.startswith("# Changelog\n\nEvery HushTumblr release, newest first.\n\n## 0.0.7"))
        self.assertTrue(text.endswith("* HushTumblr now patches Tumblr 46.4.0.110 only.\n"))

    def test_cut_keeps_crlf_line_ends(self):
        self.put("CHANGELOG.md", CHANGELOG, "\r\n")
        self.cut()
        raw = self.text("CHANGELOG.md")
        self.assertIn("## 0.0.7 (2026-10-11)\r\n\r\n* Hide ads", raw)
        self.assertNotIn("\n", raw.replace("\r\n", ""))

    def test_cut_refuses_scopes_a_release_cannot_carry_and_names_them(self):
        broken = CHANGELOG.replace(
            "* **Tooling:** The gate",
            "* **Source:** Manager shows the icon.\n* **Docs:** The reference docs describe 46.5.0.109.\n* **Tooling:** The gate")
        self.put("CHANGELOG.md", broken)
        code, err = self.run_tool("cut", "--version", "0.0.7")
        self.assertEqual(code, 1)
        self.assertIn("**Source:** Manager shows the icon.", err)
        self.assertIn("**Docs:** The reference docs describe 46.5.0.109.", err)
        self.assertIn("only plain bullets and **Tooling:**", err)
        self.assertEqual(self.text("CHANGELOG.md"), broken)

    def test_cut_refuses_what_manager_would_drop_or_skip(self):
        cases = {
            "a continuation line": CHANGELOG.replace("shopping row.", "shopping row.\n  and the related pins."),
            "an empty bullet": CHANGELOG.replace("* **Tooling:** The gate runs the quick checks first.", "* "),
            "no Tumblr bullet": CHANGELOG.replace("* Hide", "* **Tooling:** Hide").replace(
                "* **Tumblr:** Download", "* **Tooling:** Download"),
            "an em dash": CHANGELOG.replace("more pins.", "more pins \u2014 up to 500."),
            "an empty section": CHANGELOG.split("* **Tooling:**")[0] + "## 0.0.6 (2026-10-10)\n",
        }
        expected = {
            "a continuation line": "isn't a bullet of its own",
            "an empty bullet": "has an empty bullet",
            "no Tumblr bullet": "no bullet about the app",
            "an em dash": "em or en dashes",
            "an empty section": "no bullets",
        }
        for name, text in cases.items():
            with self.subTest(name):
                self.put("CHANGELOG.md", text)
                code, err = self.run_tool("cut", "--version", "0.0.7")
                self.assertEqual(code, 1, name)
                self.assertIn(expected[name], err)
                self.assertEqual(self.text("CHANGELOG.md"), text)

    def test_cut_refuses_a_version_already_there_or_no_unreleased(self):
        code, err = self.run_tool("cut", "--version", "0.0.6")
        self.assertEqual(code, 1)
        self.assertIn("already has a 0.0.6 heading", err)
        self.put("CHANGELOG.md", CHANGELOG.replace("## Unreleased", "## Upcoming"))
        code, err = self.run_tool("cut", "--version", "0.0.7")
        self.assertEqual(code, 1)
        self.assertIn("no ## Unreleased", err)
        code, err = self.run_tool("cut", "--version", "0.7")
        self.assertIn("isn't X.Y.Z", err)

    def test_check_counts_unlabeled_and_app_labeled_bullets_as_app_changes(self):
        # Two bullets about the app, one unlabeled and one still carrying the label, plus one Tooling.
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            self.assertEqual(release_text.main(["--root", str(self.root), "check", "--unreleased"]), 0)
        self.assertIn("3 bullets, 2 Tumblr and 1 Tooling", out.getvalue())

    def test_check_reads_without_writing(self):
        before = self.text("CHANGELOG.md")
        self.assertEqual(self.run_tool("check", "--unreleased")[0], 0)
        self.assertEqual(self.run_tool("check", "--version", "0.0.7")[0], 1)
        self.cut()
        self.assertEqual(self.run_tool("check", "--version", "0.0.7")[0], 0)
        self.assertNotEqual(before, self.text("CHANGELOG.md"))

    # --- notes -----------------------------------------------------------------------------------

    def notes(self, intro="HushTumblr 0.0.7 has 3 patches for Tumblr 46.5.0.109.",
              tail="## Update from 0.0.6\n\nRefresh the source and patch again."):
        out = self.root / "notes.out"
        code, err = self.run_tool("notes", "--version", "0.0.7", "--intro", self.file("intro.txt", intro),
                                  "--tail", self.file("tail.txt", tail), "--out", str(out))
        return code, err, out.read_text(encoding="utf-8") if out.exists() else None

    def test_notes_carry_every_bullet_grouped_by_scope(self):
        self.cut()
        code, err, body = self.notes()
        self.assertEqual(code, 0, err)
        self.assertEqual(body, (
            "HushTumblr 0.0.7 has 3 patches for Tumblr 46.5.0.109.\n\n"
            "## What's new\n\n"
            "- Hide ads now covers the shopping row.\n"
            "- Download board saves more pins.\n\n"
            "## Behind the scenes\n\n"
            "- The gate runs the quick checks first.\n\n"
            "## Update from 0.0.6\n\nRefresh the source and patch again.\n"))

    def test_notes_leave_out_behind_the_scenes_with_no_tooling_bullet(self):
        self.put("CHANGELOG.md", CHANGELOG.replace("* **Tooling:** The gate runs the quick checks first.\n", ""))
        self.cut()
        code, err, body = self.notes()
        self.assertEqual(code, 0, err)
        self.assertNotIn("Behind the scenes", body)
        self.assertEqual(len(re.findall(r"(?m)^- ", body)), 2)

    def test_notes_refuse_an_unreleased_version_an_empty_part_or_a_section_of_their_own(self):
        code, err, body = self.notes()
        self.assertEqual(code, 1)
        self.assertIn("no dated 0.0.7 heading", err)
        self.assertIsNone(body)
        self.cut()
        self.assertIn("can be empty", self.notes(intro="  ")[1])
        self.assertIn("heading of its own", self.notes(tail="## What's new\n\n- a hand-picked subset")[1])
        self.assertIn("em or en dash", self.notes(tail="Patch again \u2013 then install.")[1])

    # --- index -----------------------------------------------------------------------------------

    def index(self, summary="New this time: Hide ads covers the shopping row.", runtime=705, patch=186, first=False,
              sha256=DIGEST):
        return self.run_tool("index", "--version", "0.0.7", "--created", "2026-10-11T04:00:00",
                             "--summary", self.file("summary.txt", summary), "--sha256", sha256,
                             "--runtime", str(runtime), "--patch", str(patch), *(["--first"] if first else []))

    def test_the_first_index_writes_patches_bundle_json(self):
        (self.root / "patches-bundle.json").unlink()
        self.cut()
        code, err = self.index(first=True)
        self.assertEqual(code, 0, err)
        written = self.text("patches-bundle.json")
        self.assertTrue(written.endswith("}\n") and "\r\n" not in written)
        bundle = json.loads(written)
        # The same keys in the same order as every later index, so the next release only updates it.
        self.assertEqual(list(bundle), list(INDEX))
        self.assertEqual(bundle["version"], "0.0.7")
        self.assertEqual(bundle["created_at"], "2026-10-11T04:00:00")
        self.assertEqual(bundle["signature_download_url"], "")
        self.assertEqual(bundle["download_url"],
                         "https://github.com/SysAdminDoc/HushTumblr/releases/download/v0.0.7/patches-0.0.7.mpp")
        self.assertTrue(bundle["description"].startswith(
            "HushTumblr v0.0.7: 3 patches for Tumblr 46.5.0.109, which needs Android 8"))
        self.assertIn("Needs Morphe Manager 1.34.0 or newer", bundle["description"])
        self.assertIn("The latest release is [v0.0.7](https://github.com/SysAdminDoc/HushTumblr/releases/tag/v0.0.7), "
                      "with 3 patches.", self.text("README.md"))

    def test_only_the_first_index_may_be_written_from_nothing(self):
        self.cut()
        before = self.text("patches-bundle.json")
        code, err = self.index(first=True)
        self.assertEqual(code, 1)
        self.assertIn("there is one already", err)
        self.assertEqual(self.text("patches-bundle.json"), before)
        (self.root / "patches-bundle.json").unlink()
        code, err = self.index()
        self.assertEqual(code, 1)
        self.assertIn("patches-bundle.json is missing", err)
        self.assertFalse((self.root / "patches-bundle.json").exists())

    def test_index_points_the_bundle_readme_and_form_at_the_release(self):
        self.cut()
        code, err = self.index()
        self.assertEqual(code, 0, err)
        bundle = json.loads(self.text("patches-bundle.json"))
        self.assertEqual(list(bundle), list(INDEX))
        self.assertEqual(bundle["version"], "0.0.7")
        self.assertEqual(bundle["created_at"], "2026-10-11T04:00:00")
        self.assertEqual(bundle["signature_download_url"], "")
        self.assertEqual(bundle["download_url"],
                         "https://github.com/SysAdminDoc/HushTumblr/releases/download/v0.0.7/patches-0.0.7.mpp")
        description = bundle["description"]
        # What validate-release-facts.ps1 reads out of it.
        self.assertTrue(description.startswith("HushTumblr v0.0.7: 3 patches for Tumblr 46.5.0.109, which needs Android 8"))
        self.assertEqual(set(re.findall(r"(?<![\d.])(\d+) patches\b", description)), {"3"})
        self.assertGreaterEqual(len(re.findall(r"(?<![\d.])3 patches\b", description)), 2)
        self.assertEqual(set(re.findall(r"Tumblr\s+(\d+(?:\.\d+)+)(?!\d)", description)), {"46.5.0.109"})
        self.assertGreaterEqual(description.count("Tumblr 46.5.0.109"), 2)
        self.assertIn("705 runtime tests passed", description)
        self.assertIn("All 186 patch tests passed", description)
        self.assertIn("Needs Morphe Manager 1.34.0 or newer", description)
        readme = self.text("README.md")
        self.assertIn("The latest release is [v0.0.7](https://github.com/SysAdminDoc/HushTumblr/releases/tag/v0.0.7), "
                      "with 3 patches. Add this repo to Morphe Manager.", readme)
        # The checksum example's label, digest and name move together, and nothing else names the old bundle.
        self.assertIn("up to you. The v0.0.7 bundle's line:\n\n```text\n" + DIGEST + "  patches-0.0.7.mpp\n```\n", readme)
        self.assertNotIn("0.0.6", readme)
        self.assertNotIn("1111111111", readme)
        form = self.text(".github/ISSUE_TEMPLATE/bug_report.yml")
        self.assertIn("      placeholder: HushTumblr 0.0.7 on Tumblr 46.5.0.109\n\n  - type: input", form)
        self.assertIn("      placeholder: APKMirror bundle, 46.5.0.109 (1460500109)\n", form)
        self.assertIn("      placeholder: Morphe Manager 1.34.0\n", form)

    def test_index_refuses_and_changes_nothing(self):
        self.cut()
        before = {name: self.text(name) for name in ("patches-bundle.json", "README.md", ".github/ISSUE_TEMPLATE/bug_report.yml")}
        cases = [
            (lambda: self.index(summary="It brings 4 patches."), "says 4 patches"),
            (lambda: self.index(summary="Also tested on Tumblr 46.4.0.110."), "names Tumblr 46.4.0.110"),
            (lambda: self.index(summary="Faster \u2014 and smaller."), "em or en dash"),
            (lambda: self.index(runtime=0), "can't be zero"),
            (lambda: self.index(sha256=DIGEST.upper()), "64 lowercase hex"),
            (lambda: self.index(sha256=DIGEST[:-1]), "64 lowercase hex"),
        ]
        for action, expected in cases:
            with self.subTest(expected):
                code, err = action()
                self.assertEqual(code, 1)
                self.assertIn(expected, err)
        self.put("patches-list.json", json.dumps(catalog(version="v0.0.6")))
        self.assertIn("not v0.0.7", self.index()[1])
        self.put("patches-list.json", json.dumps(catalog(builds=(("46.5.0.109", 1460500109), ("46.4.0.110", 1460400110)))))
        self.assertIn("exactly one Tumblr build", self.index()[1])
        for name, text in before.items():
            self.assertEqual(self.text(name), text, name)

    def test_index_refuses_a_readme_without_the_checksum_example(self):
        self.cut()
        for old, new, expected in (
                ("The v0.0.6 bundle's line:", "The bundle's line:", "README checksum label"),
                ("  patches-0.0.6.mpp", "  patches.mpp", "README checksum line")):
            with self.subTest(expected):
                self.put("README.md", README.replace(old, new))
                before = {name: self.text(name) for name in ("patches-bundle.json", "README.md")}
                code, err = self.index()
                self.assertEqual(code, 1)
                self.assertIn(expected, err)
                for name, text in before.items():
                    self.assertEqual(self.text(name), text, name)

    def test_index_includes_every_released_bullet_in_manager_groups(self):
        self.cut()
        self.put("CHANGELOG.md", self.text("CHANGELOG.md").replace(
            "## 0.0.7", "## Unreleased\n\n* Not released yet.\n\n## 0.0.7", 1))
        code, err = self.index()
        self.assertEqual(code, 0, err)
        description = json.loads(self.text("patches-bundle.json"))["description"]
        self.assertIn("\n\n### What's new\n\n", description)
        groups = description.split("\n\n### ", 1)[1]
        self.assertEqual(groups, "What's new\n\n"
                         "* Hide ads now covers the shopping row.\n"
                         "* Download board saves more pins.\n\n"
                         "### Behind the scenes\n\n"
                         "* **Tooling:** The gate runs the quick checks first.")
        self.assertNotIn("Not released yet.", description)
        self.assertNotIn("Tumblr 46.4.0.110 only.", description)

    def test_index_preserves_historical_facts_as_changelog_not_release_summary(self):
        historical = "Earlier builds had 26 patches for Tumblr 46.4.0.110."
        self.put("CHANGELOG.md", CHANGELOG.replace("Download board saves more pins.", historical))
        self.cut()
        code, err = self.index()
        self.assertEqual(code, 0, err)
        description = json.loads(self.text("patches-bundle.json"))["description"]
        self.assertIn("* " + historical, description)
        summary = description.split("\n\n### ", 1)[0]
        self.assertEqual(set(re.findall(r"(?<![\d.])(\d+) patches\b", summary)), {"3"})
        self.assertEqual(set(re.findall(r"Tumblr\s+(\d+(?:\.\d+)+)(?!\d)", summary)), {"46.5.0.109"})

    def test_index_omits_an_empty_tooling_group(self):
        self.put("CHANGELOG.md", CHANGELOG.replace("* **Tooling:** The gate runs the quick checks first.\n", ""))
        self.cut()
        code, err = self.index()
        self.assertEqual(code, 0, err)
        description = json.loads(self.text("patches-bundle.json"))["description"]
        self.assertIn("### What's new\n\n* Hide ads", description)
        self.assertNotIn("### Behind the scenes", description)

    def test_index_needs_the_released_section(self):
        code, err = self.index()
        self.assertEqual(code, 1)
        self.assertIn("no dated 0.0.7 heading", err)


if __name__ == "__main__":
    unittest.main()
