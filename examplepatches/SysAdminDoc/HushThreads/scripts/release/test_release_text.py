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

Changes in the source build, then released versions.

## Unreleased

* **Threads:** Hide the Instagram button is new (#7).
* **Docs:** The README says which connections honor user certificates.
* **Tooling:** The fixture tests run as their own task.

## 0.0.12 (2026-10-07)

* **Threads:** First.
"""
README = """<a href="x"><img src="https://img.shields.io/badge/version-0.0.12-000000" alt="Version 0.0.12"></a>

The latest release is [v0.0.12](https://github.com/Owner/HushThreads/releases/tag/v0.0.12), with 17 patches.

HushThreads v0.0.12 works with all three builds below.

HushThreads v0.0.12 has 17 patches. All but three are selected.
"""
USER_AGENT = 'headers.put("User-Agent", "HushThreads/0.0.12");\nassert(wire.contains("HushThreads/0.0.12\\r\\n"));\n'
TOML = 'morphe-patcher = "1.15.1"\nmanager-floor = "1.34.0"\n'
FORM = "      placeholder: Version 0.0.12 for Threads 450.0.0.51.78\n      placeholder: Morphe Manager 1.34.0\n"


def catalog(*builds: str, version: str = "v0.0.13", count: int = 2) -> str:
    codes = {"450.0.0.51.78": 512008342, "449.0.0.54.82": 511908382}
    patch = {
        "name": "A",
        "compatiblePackages": {"com.instagram.barcelona": list(builds)},
        "compatibility": [{"packageName": "com.instagram.barcelona",
                           "targets": [{"version": b, "versionCodes": {"ARM64_V8A": codes[b]}} for b in builds]}],
    }
    return json.dumps({"version": version, "patches": [dict(patch, name=f"P{i}") for i in range(count)]})


def results(cases: int, skipped: int = 0) -> str:
    body = "".join(f'<testcase name="t{i}" classname="C"/>' for i in range(cases))
    return f'<?xml version="1.0"?><testsuite name="C" tests="{cases}" skipped="{skipped}" failures="0" errors="0">{body}</testsuite>'


class ReleaseTextTest(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.root = Path(self.folder.name)
        self.write("CHANGELOG.md", CHANGELOG)
        self.write("README.md", README)
        self.write("gradle.properties", "kotlin.code.style = official\nversion = 0.0.12\n")
        self.write("gradle/libs.versions.toml", TOML)
        self.write(release_text.USER_AGENT_TEST, USER_AGENT)
        self.write("patches-list.json", catalog("450.0.0.51.78"))
        self.write("patches-bundle.json", json.dumps({
            "created_at": "2026-10-08T22:37:14", "description": "old",
            "download_url": "https://github.com/Owner/HushThreads/releases/download/v0.0.12/patches-0.0.12.mpp",
            "signature_download_url": "", "version": "0.0.12"}, indent=2) + "\n")
        self.write(".github/ISSUE_TEMPLATE/bug_report.yml", FORM)
        self.write("extensions/threads/build/test-results/testDebugUnitTest/TEST-a.xml", results(3))
        self.write("extensions/threads/build/test-results/testDebugUnitTest/TEST-b.xml", results(2))
        self.write("patches/build/test-results/test/TEST-c.xml", results(4))
        self.write("patches/build/test-results/fixtureTest/TEST-d.xml", results(1))
        self.saved = release_text.ROOT
        release_text.ROOT = self.root

    def tearDown(self):
        release_text.ROOT = self.saved
        self.folder.cleanup()

    def write(self, name: str, text: str) -> None:
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8", newline="\n")

    def read(self, name: str) -> str:
        return (self.root / name).read_text(encoding="utf-8")

    def run_command(self, command, **values):
        with contextlib.redirect_stdout(io.StringIO()) as printed:
            command(argparse.Namespace(**values))
        return printed.getvalue()

    def refused(self, command, needle: str, **values) -> None:
        with self.assertRaises(SystemExit) as caught:
            self.run_command(command, **values)
        self.assertIn(needle, str(caught.exception))

    def test_cut_dates_unreleased_and_moves_every_version_string(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        changelog = self.read("CHANGELOG.md")
        self.assertIn("released versions.\n\n## 0.0.13 (2026-10-09)\n\n* **Threads:** Hide the Instagram", changelog)
        self.assertNotIn("## Unreleased", changelog)
        self.assertEqual(changelog.count("## 0.0.12 (2026-10-07)"), 1)
        self.assertIn("version = 0.0.13\n", self.read("gradle.properties"))
        readme = self.read("README.md")
        self.assertIn("badge/version-0.0.13-000000", readme)
        self.assertIn('alt="Version 0.0.13"', readme)
        # The latest-release line moves with the patch count, after the patch list is generated.
        self.assertIn("The latest release is [v0.0.12]", readme)
        self.assertEqual(self.read(release_text.USER_AGENT_TEST).count("HushThreads/0.0.13"), 2)

    def test_cut_refuses_what_manager_would_misread_and_writes_nothing(self):
        for bad, needle in (("* **Threads:** Hide the Instagram", "- **Threads:** Hide the Instagram"),
                            ("* **Threads:** Hide the Instagram", "* **Feed:** Hide the Instagram"),
                            ("* **Threads:** Hide the Instagram", "* **Tooling:** Hide the Instagram"),
                            ("is new (#7).", "is new\n  (#7)."),
                            ("is new (#7).", "is new \u2014 (#7).")):
            self.write("CHANGELOG.md", CHANGELOG.replace(bad, needle))
            with self.assertRaises(SystemExit):
                self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
            self.assertIn("version = 0.0.12\n", self.read("gradle.properties"))
            self.assertIn("badge/version-0.0.12-", self.read("README.md"))
        self.write("CHANGELOG.md", CHANGELOG)
        self.refused(release_text.cut, "moves forward", version="0.0.12", date=None)
        self.refused(release_text.cut, "moves forward", version="0.0.11", date=None)
        self.refused(release_text.cut, "isn't a YYYY-MM-DD", version="0.0.13", date="2026-13-40")
        self.write(release_text.USER_AGENT_TEST, "no version here\n")
        self.refused(release_text.cut, "User-Agent", version="0.0.13", date=None)
        self.assertEqual(self.read("CHANGELOG.md"), CHANGELOG)

    def test_readme_names_the_release_and_its_count_and_lists_what_is_left(self):
        printed = self.run_command(release_text.readme, version="0.0.13")
        readme = self.read("README.md")
        self.assertIn("The latest release is [v0.0.13](https://github.com/Owner/HushThreads/releases/tag/v0.0.13), "
                      "with 2 patches.", readme)
        self.assertIn("HushThreads v0.0.13 has 2 patches. All but three", readme)
        self.assertIn("still name 0.0.12", printed)
        self.assertIn("works with all three builds below", printed)
        self.write("patches-list.json", catalog("450.0.0.51.78", version="v0.0.12"))
        self.refused(release_text.readme, "generatePatchesList", version="0.0.13")

    def test_notes_carry_every_bullet_by_scope_with_counts_from_the_results(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("intro.md", "HushThreads v0.0.13 has 2 patches.\n")
        self.write("update.md", "1. You need [Morphe Manager](https://x) 1.34.0 or newer.\n")
        out = self.root / "notes.md"
        self.run_command(release_text.notes, version="0.0.13", intro=str(self.root / "intro.md"),
                         update=str(self.root / "update.md"), out=str(out))
        notes = out.read_text(encoding="utf-8")
        self.assertTrue(notes.startswith("HushThreads v0.0.13 has 2 patches.\n\n## Threads\n\n- Hide the Instagram"))
        self.assertIn("## Docs\n\n- The README says which connections", notes)
        self.assertIn("## Tooling\n\n- The fixture tests run as their own task.\n\n## Update\n\n1. You need", notes)
        self.assertNotIn("**Threads:**", notes)
        self.assertLess(notes.index("## Threads"), notes.index("## Docs"))
        self.assertLess(notes.index("## Docs"), notes.index("## Tooling"))
        self.assertIn("5 runtime tests and 5 patch tests passed locally", notes)
        self.assertIn("All 2 patches applied without forcing to Threads 450.0.0.51.78, and the release receipt "
                      "records the run.", notes)

    def test_notes_refuse_a_stale_floor_a_skipped_run_and_an_uncut_version(self):
        self.write("intro.md", "Intro.\n")
        self.write("update.md", "Use Morphe Manager 1.29.0 or newer.\n")
        values = dict(version="0.0.13", intro=str(self.root / "intro.md"), update=str(self.root / "update.md"),
                      out=str(self.root / "notes.md"))
        self.refused(release_text.notes, "prepare", **values)
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.refused(release_text.notes, "1.29.0", **values)
        self.write("update.md", "Use Morphe Manager 1.34.0 or newer.\n")
        self.write("patches/build/test-results/fixtureTest/TEST-d.xml", results(1, skipped=1))
        self.refused(release_text.notes, "skipped", **values)
        self.assertFalse((self.root / "notes.md").exists())

    def test_index_points_the_bundle_and_bug_form_at_the_release(self):
        self.write("summary.txt", "One patch is new.\n")
        self.run_command(release_text.index, version="0.0.13", created="2026-10-09T17:03:42",
                         summary=str(self.root / "summary.txt"))
        bundle = json.loads(self.read("patches-bundle.json"))
        self.assertEqual(list(bundle), ["created_at", "description", "download_url", "signature_download_url", "version"])
        self.assertEqual(bundle["version"], "0.0.13")
        self.assertEqual(bundle["created_at"], "2026-10-09T17:03:42")
        self.assertEqual(bundle["download_url"],
                         "https://github.com/Owner/HushThreads/releases/download/v0.0.13/patches-0.0.13.mpp")
        description = bundle["description"]
        self.assertTrue(description.startswith("HushThreads v0.0.13 has 2 patches for Threads 450.0.0.51.78 "
                                               "(com.instagram.barcelona).\n\nOne patch is new.\n\nValidation: "))
        self.assertIn("5 runtime tests passed locally. All 5 patch tests passed too", description)
        self.assertIn("Needs Morphe Manager 1.34.0 or newer. Patch the arm64-v8a bundle of Threads 450.0.0.51.78 "
                      "(version code 512008342).", description)
        self.assertIn("placeholder: Version 0.0.13 for Threads 450.0.0.51.78\n", self.read(".github/ISSUE_TEMPLATE/bug_report.yml"))

    def test_index_names_the_newest_build_after_every_threads(self):
        self.write("patches-list.json", catalog("449.0.0.54.82", "450.0.0.51.78"))
        self.write("summary.txt", "x.\n")
        self.run_command(release_text.index, version="0.0.13", created="2026-10-09T17:03:42",
                         summary=str(self.root / "summary.txt"))
        description = json.loads(self.read("patches-bundle.json"))["description"]
        self.assertIn("for Threads 450.0.0.51.78 (com.instagram.barcelona), and builds 449.0.0.54.82 work too.", description)
        self.assertIn("applied to Threads 450.0.0.51.78 and 449.0.0.54.82 without forcing, and the release receipt "
                      "records both runs.", description)
        self.assertNotRegex(description, r"Threads 449")

    def test_index_refuses_a_zoned_time_and_a_stale_catalog(self):
        self.write("summary.txt", "x.\n")
        self.refused(release_text.index, "yyyy-MM-ddTHH:mm:ss", version="0.0.13", created="2026-10-09T17:03:42Z",
                     summary=str(self.root / "summary.txt"))
        self.refused(release_text.index, "not v0.0.14", version="0.0.14", created="2026-10-09T17:03:42",
                     summary=str(self.root / "summary.txt"))
        self.assertEqual(json.loads(self.read("patches-bundle.json"))["version"], "0.0.12")

    def test_description_moves_the_version_count_and_build(self):
        self.write("current.txt", "HushThreads v0.0.12: ads out of Threads, 17 patches for Threads 449.0.0.54.82.\n")
        out = self.root / "description.txt"
        self.run_command(release_text.description, version="0.0.13", current=str(self.root / "current.txt"), out=str(out))
        self.assertEqual(out.read_text(encoding="utf-8"),
                         "HushThreads v0.0.13: ads out of Threads, 2 patches for Threads 450.0.0.51.78.\n")
        self.write("current.txt", "A patch bundle for Threads.\n")
        self.refused(release_text.description, "in this shape", version="0.0.13",
                     current=str(self.root / "current.txt"), out=str(out))


if __name__ == "__main__":
    unittest.main()
