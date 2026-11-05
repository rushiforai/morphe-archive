"""Tests for .github/scripts/generate_release_notes.py (offline; the git tests use a temp repo).

Run with: python -m unittest discover -s .github/scripts/tests -v
"""

import contextlib
import importlib.util
import io
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[3]
SPEC = importlib.util.spec_from_file_location(
    "generate_release_notes", ROOT / ".github/scripts/generate_release_notes.py"
)
notes = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(notes)

REPO = "owner/repo"
DATE = "2026-11-03"


def app(package, name, version, *patches):
    return [(package, name, version, patch) for patch in patches]


def patch_list(version, *entries, universal=()):
    """A patches-list.json dict from (package, app name, target version, patch name) tuples."""
    by_patch = {}
    for package, name, target, patch in [e for group in entries for e in group]:
        by_patch.setdefault(patch, []).append({
            "packageName": package,
            "name": name,
            "targets": [{"version": target, "versionCodes": None, "isExperimental": False}],
        })
    patches = [
        {"name": patch, "default": True, "compatiblePackages": packages, "options": []}
        for patch, packages in sorted(by_patch.items())
    ]
    patches += [{"name": patch, "compatiblePackages": None, "options": []} for patch in universal]
    return {"version": version, "patches": patches}


OLD = patch_list(
    "1.0.0",
    app("com.truecaller", "Truecaller", "26.41.5", "Disable ads", "Hide Premium tab", "Old patch"),
    app("com.scores365", "365Scores", "14.9.8", "Disable ads"),
    app("com.fotmob", "FotMob", "239.1", "Disable ads"),
    app("dev.librepods", "LibrePods", "1.0", "Enable Premium"),
)
NEW = patch_list(
    "1.1.0",
    app("com.truecaller", "Truecaller", "26.42.5",
        "Disable ads", "Hide Premium tab", "Hide Messages tab", "Swap call answer and decline buttons"),
    app("com.scores365", "365Scores", "15.0.0", "Disable ads"),
    app("com.fotmob", "FotMob", "239.1", "Disable ads"),
    app("com.gpsmap.camera", "GPS Map Camera Editor", "1.0.31",
        "Disable ads", "Enable Premium", "Spoof signature"),
)


def render(subjects, old=OLD, new=NEW, dir_index=None):
    return notes.render_notes(old, new, subjects, REPO, "1.1.0", DATE, dir_index or {})


class RenderNotesTest(unittest.TestCase):
    def test_heading_and_download_link(self):
        text = render([])
        self.assertTrue(text.startswith("## 1.1.0 (2026-11-03)\n"))
        self.assertTrue(text.rstrip().endswith(
            "**Download:** [patches-1.1.0.mpp](https://github.com/owner/repo/releases/download/"
            "v1.1.0/patches-1.1.0.mpp)"
        ))

    def test_new_app_line_lists_version_and_patches(self):
        text = render([])
        self.assertIn(
            "### 🆕 New apps\n- **GPS Map Camera Editor** `1.0.31` - Disable ads, Enable Premium, "
            "Spoof signature", text,
        )

    def test_new_app_commits_are_not_repeated(self):
        text = render(["feat(gpsmapcamera): add GPS Map Camera Editor"])
        self.assertNotIn("Add GPS Map Camera Editor", text)
        self.assertNotIn("### 🔧 Other", text)

    def test_removed_app(self):
        text = render(["fix(librepods): remove LibrePods support"])
        self.assertIn("### 🗑️ Removed apps\n- LibrePods", text)
        self.assertNotIn("Remove LibrePods support", text)

    def test_version_bump_goes_only_into_the_table(self):
        text = render(["fix(365scores): updated to version 15.0.0"])
        self.assertIn("### ⬆️ Updated apps\n| App | From | To |\n|---|---|---|\n"
                      "| 365Scores | `14.9.8` | `15.0.0` |", text)
        self.assertNotIn("### 📱 365Scores", text)
        self.assertNotIn("Updated to version", text)

    def test_added_and_removed_patches(self):
        text = render([])
        self.assertIn(
            "### 📱 Truecaller `26.42.5`\n- New: Hide Messages tab, Swap call answer and decline buttons\n"
            "- Removed: Old patch", text,
        )
        self.assertIn("| Truecaller | `26.41.5` | `26.42.5` |", text)

    def test_commit_highlights_with_issue_links(self):
        text = render([
            "feat(truecaller): patch settings switches for tabs, call log and call screen.",
            "fix(truecaller): call notification buttons cut off (#116)",
            "perf(fotmob): resolve the device font once",
        ])
        self.assertIn("- New: Patch settings switches for tabs, call log and call screen\n", text)
        self.assertIn(
            "- Fixed: Call notification buttons cut off "
            "([#116](https://github.com/owner/repo/issues/116))", text,
        )
        self.assertIn("### 📱 FotMob `239.1`\n- Faster: Resolve the device font once", text)
        # Highlights sit between the added and the removed patches.
        section = text.split("### 📱 Truecaller")[1].split("\n\n")[0]
        self.assertEqual(
            [line.split(":")[0] for line in section.splitlines()[1:]],
            ["- New", "- New", "- Fixed", "- Removed"],
        )

    def test_feat_that_only_adds_listed_patches_is_not_repeated(self):
        text = render(["feat(truecaller): add Swap call answer and decline buttons, updated to version 26.42.5",
                       "feat(truecaller): add Hide Messages tab and a new settings row"])
        self.assertNotIn("Add Swap call answer", text)
        self.assertIn("- New: Add Hide Messages tab and a new settings row", text)

    def test_unmapped_and_scopeless_commits_go_to_other(self):
        text = render(["fix: keep the bundle loadable on Manager 2.0", "feat(deps): bump the patcher"])
        self.assertIn("### 🔧 Other\n- Fixed: Keep the bundle loadable on Manager 2.0\n"
                      "- New: Bump the patcher", text)

    def test_skipped_commit_types(self):
        text = render([
            "docs(truecaller): record the emulator run",
            "chore: Release v1.0.0 [skip ci]",
            "test(fotmob): cover the font hook",
            "ci: pin actions",
            "build(deps): bump gradle",
            "refactor(fotmob): split the patch",
            "Merge pull request #12 from owner/dev",
            "Revert \"feat(fotmob): something\"",
        ])
        self.assertNotIn("record the emulator run", text.lower())
        self.assertNotIn("### 📱 FotMob", text)
        self.assertNotIn("### 🔧 Other", text)
        self.assertNotIn("#12", text)

    def test_scope_mapping_by_directory_name_and_multiple_scopes(self):
        dir_index = {"scores365": {"com.scores365"}, "tc": {"com.truecaller"}}
        text = render(["fix(scores365, fotmob): handle the new consent screen",
                       "fix(tc): keep controls on root installs"], dir_index=dir_index)
        self.assertIn("### 📱 365Scores `15.0.0`\n- Fixed: Handle the new consent screen", text)
        self.assertIn("### 📱 FotMob `239.1`\n- Fixed: Handle the new consent screen", text)
        self.assertIn("- Fixed: Keep controls on root installs", text)

    def test_scope_prefix_must_be_unique(self):
        names = {"a.b": "Brave Browser", "a.c": "Brave Browser (Beta)", "x.y": "GPS Map Camera Editor"}
        self.assertEqual(notes.resolve_scope("gpsmapcamera", names, {}), {"x.y"})
        self.assertEqual(notes.resolve_scope("brave", names, {}), set())
        self.assertEqual(notes.resolve_scope("BraveBrowser", names, {}), {"a.b"})

    def test_duplicate_commits_are_listed_once(self):
        text = render(["fix(fotmob): use the device font", "fix(fotmob): use the device font."])
        self.assertEqual(text.count("Use the device font"), 1)

    def test_universal_patch_changes(self):
        old = patch_list("1", app("p", "P", "1", "A"))
        new = patch_list("2", app("p", "P", "1", "A"), universal=["Remove screenshot restriction"])
        text = notes.render_notes(old, new, [], REPO, "2", DATE, {})
        self.assertIn("### 🆕 New apps\n- **All apps** - Remove screenshot restriction", text)

    def test_nothing_user_facing(self):
        text = render([], old=NEW, new=NEW)
        self.assertIn("No user-facing changes.", text)


class FallbackTest(unittest.TestCase):
    def test_plain_commit_list(self):
        text = notes.render_fallback(
            ["feat(truecaller): add Heval Controls", "fix: crash on start (#9)", "docs: notes"],
            REPO, "1.0.0", DATE,
        )
        self.assertEqual(text, (
            "## 1.0.0 (2026-11-03)\n\n### Changes\n"
            "- New: **truecaller:** Add Heval Controls\n"
            "- Fixed: Crash on start ([#9](https://github.com/owner/repo/issues/9))\n\n"
            "**Download:** [patches-1.0.0.mpp](https://github.com/owner/repo/releases/download/"
            "v1.0.0/patches-1.0.0.mpp)\n"
        ))


@unittest.skipUnless(shutil.which("git"), "git is required")
class GitIntegrationTest(unittest.TestCase):
    """End-to-end runs of main() against a temporary repository."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        self.git("init", "-q")
        (self.root / "patches-list.json").write_text(json.dumps(OLD), encoding="utf-8")
        self.commit("chore: Release v1.0.0 [skip ci]")
        self.first = self.git("rev-parse", "HEAD").strip()
        self.commit("feat(truecaller): add Heval Controls (#7)")
        self.commit("docs: notes")

    def tearDown(self):
        self.tmp.cleanup()

    def git(self, *args):
        return subprocess.run(
            ["git", "-c", "user.name=t", "-c", "user.email=t@t", "-c", "commit.gpgsign=false", *args],
            cwd=self.root, check=True, capture_output=True, text=True,
        ).stdout

    def commit(self, message):
        self.git("add", "-A")
        self.git("commit", "-q", "--allow-empty", "-m", message)

    def run_main(self, *args):
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = notes.main(["--repo", REPO, "--version", "1.1.0", "--date", DATE,
                               "--repo-root", str(self.root), *args])
        self.assertEqual(code, 0)
        return out.getvalue()

    def test_previous_list_from_the_previous_tag_ref(self):
        new_list = self.root / "new.json"
        new_list.write_text(json.dumps(NEW), encoding="utf-8")
        text = self.run_main("--previous-tag", self.first, "--new-list", str(new_list))
        self.assertIn("### 📱 Truecaller `26.42.5`", text)
        self.assertIn("- New: Add Heval Controls ([#7](https://github.com/owner/repo/issues/7))", text)
        self.assertIn("| 365Scores | `14.9.8` | `15.0.0` |", text)
        self.assertIn("### 🗑️ Removed apps\n- LibrePods", text)

    def test_first_release_falls_back_to_the_commit_list(self):
        text = self.run_main()
        self.assertIn("### Changes\n- New: **truecaller:** Add Heval Controls", text)
        self.assertNotIn("Release v1.0.0", text)

    def test_unreadable_new_list_falls_back(self):
        broken = self.root / "broken.json"
        broken.write_text("{not json", encoding="utf-8")
        text = self.run_main("--previous-tag", self.first, "--new-list", str(broken))
        self.assertIn("### Changes\n- New: **truecaller:** Add Heval Controls", text)

    def test_bad_previous_ref_still_writes_notes(self):
        text = self.run_main("--previous-tag", "v0-missing")
        self.assertTrue(text.startswith("## 1.1.0 (2026-11-03)\n"))
        self.assertIn("**Download:**", text)

    def test_build_uses_an_existing_list_for_the_version(self):
        (self.root / "patches-list.json").write_text(json.dumps(NEW), encoding="utf-8")
        calls = []
        result = notes.build_new_list(self.root, "1.1.0", runner=lambda *a, **k: calls.append(a))
        self.assertEqual(result, NEW)
        self.assertEqual(calls, [])

    def test_build_runs_gradle_restores_the_list_and_drops_other_bundles(self):
        libs = self.root / "patches" / "build" / "libs"

        def fake_gradle(command, cwd, stdout, stderr):
            self.assertIn("generatePatchesList", command)
            self.assertIn("-Pversion=1.1.0", command)
            (Path(cwd) / "patches-list.json").write_text(json.dumps(NEW), encoding="utf-8")
            libs.mkdir(parents=True, exist_ok=True)
            (libs / "patches-1.1.0.mpp").write_bytes(b"new")
            (libs / "patches-1.0.0.mpp").write_bytes(b"stale")
            return subprocess.CompletedProcess(command, 0)

        result = notes.build_new_list(self.root, "1.1.0", runner=fake_gradle)
        self.assertEqual(result, NEW)
        self.assertEqual(json.loads((self.root / "patches-list.json").read_text(encoding="utf-8")), OLD)
        self.assertEqual(sorted(p.name for p in libs.glob("*.mpp")), ["patches-1.1.0.mpp"])

    def test_failed_build_gives_none(self):
        result = notes.build_new_list(
            self.root, "1.1.0", runner=lambda command, **k: subprocess.CompletedProcess(command, 1)
        )
        self.assertIsNone(result)
        self.assertEqual(json.loads((self.root / "patches-list.json").read_text(encoding="utf-8")), OLD)


class RealSourcesTest(unittest.TestCase):
    def test_patch_directories_map_to_packages(self):
        index = notes.scan_patch_dirs(ROOT)
        if not index:
            self.skipTest("patch sources not present")
        self.assertIn("com.truecaller", index.get("truecaller", set()))
        self.assertIn("scores365", index)


class ReleasercTest(unittest.TestCase):
    def test_exec_generates_the_notes(self):
        config = json.loads((ROOT / ".releaserc").read_text(encoding="utf-8"))
        names = [p if isinstance(p, str) else p[0] for p in config["plugins"]]
        self.assertNotIn("@semantic-release/release-notes-generator", names)
        exec_config = config["plugins"][names.index("@semantic-release/exec")][1]
        command = exec_config["generateNotesCmd"]
        self.assertIn(".github/scripts/generate_release_notes.py --build", command)
        self.assertIn("${nextRelease.version}", command)
        self.assertIn("${lastRelease.gitTag}", command)
        # The notes come from generateNotes, which runs before the changelog/git prepare steps.
        self.assertLess(names.index("@MorpheApp/changelog"), names.index("@semantic-release/git"))


if __name__ == "__main__":
    unittest.main()
