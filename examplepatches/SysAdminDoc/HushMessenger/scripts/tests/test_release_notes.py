import importlib.util
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).parents[1] / "release_notes.py"
spec = importlib.util.spec_from_file_location("release_notes", SCRIPT)
notes = importlib.util.module_from_spec(spec)
spec.loader.exec_module(notes)

REPO = Path(__file__).parents[2]
TARGET = "585.0.0.53.94"
PAGE = "https://www.apkmirror.com/apk/facebook-2/messenger/facebook-messenger-585-0-0-53-94-release/"
WALKED = ["chat", "inbox", "settings-controls", "settings-app", "message-log", "auto-reply",
          "settings", "story-settings", "contact-settings"]


class ReleaseNotes(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        # v0.27.0's real section, the one whose body had to be rewritten by hand.
        self.section = notes.read_section((REPO / "CHANGELOG.md").read_text(encoding="utf-8"), "0.27.0")
        self.write_changelog(self.section)
        self.write_index("0.27.0")
        (self.root / "patches-list.json").write_text(
            json.dumps({"version": "0.27.0", "patches": [{"name": f"p{n}"} for n in range(66)]}), encoding="utf-8")
        self.readme = (
            "# HushMessenger\n\n2. Open the link with Morphe Manager (2.2.0 or newer) installed.\n\n"
            "Morphe Desktop 1.19.1 or newer can load the same source too.\n\n"
            f"| Field | Value |\n| --- | --- |\n| Version | `{TARGET}` |\n| APKMirror download | [{TARGET}]({PAGE}) |\n"
        )
        (self.root / "README.md").write_text(self.readme, encoding="utf-8")
        profiles = self.root / "scripts/profiles"
        profiles.mkdir(parents=True)
        # Two records with the same hooks are one family, whatever their version code says.
        (profiles / "347015062.txt").write_text("# recorded\nversion 585\ncode 347015062\nhook A\n", encoding="utf-8")
        (profiles / "347015064.txt").write_text("version 585\ncode 347015064\nsha256 ab\nhook A\n", encoding="utf-8")
        (profiles / "347014974.txt").write_text("version 585\ncode 347014974\nhook B\n", encoding="utf-8")
        self.walk = self.root / "walk-receipt.json"
        self.write_walk()

    def write_changelog(self, section):
        (self.root / "CHANGELOG.md").write_text(
            "# Changelog\n\n## Unreleased\n\n### New\n\n- Not out yet.\n\n## 0.27.0 (2026-10-27)\n"
            + section + "## 0.26.0 (2026-10-22)\n\n### New\n\n- Older.\n", encoding="utf-8")

    def write_index(self, version):
        (self.root / "patches-bundle.json").write_text(json.dumps({
            "version": version,
            "description": "HushMessenger for Messenger 585.0.0.53.94.\n66 patches.\n\n### New\n\n- Log out.",
        }), encoding="utf-8")

    def write_walk(self, **change):
        receipt = {"result": "PASS", "crashes": 0, "emulator": False, "device": "SM-S908U1", "sdk": 36,
                   "steps": [{"id": step, "opened": True} for step in WALKED]} | change
        # walk-receipt.ps1 writes it through Set-Content -Encoding utf8, which leads with a BOM.
        self.walk.write_bytes(b"\xef\xbb\xbf" + json.dumps(receipt).encode("utf-8"))

    def build(self):
        return notes.build_notes(self.root, "0.27.0", self.walk)

    def refuses(self, expected):
        with self.assertRaises(notes.NotesError) as raised:
            self.build()
        self.assertIn(expected, str(raised.exception))

    def test_the_body_carries_every_bullet_once_under_v027s_layout(self):
        body = self.build()
        lines = body.split("\n")
        bullets = [line for line in self.section.split("\n") if line.startswith("- ")]
        self.assertEqual(28, len(bullets))
        for bullet in bullets:
            self.assertEqual(1, lines.count(bullet), bullet[:60])
        self.assertEqual("HushMessenger for Messenger 585.0.0.53.94. 66 patches.", lines[0])
        headings = ["### New in this release", "### Fixes and changes", "### Behind the scenes",
                    "### Reports this release changed something for", "### How to update", "### What was checked"]
        self.assertEqual(headings, [line for line in lines if line.startswith("### ")])
        at = {heading: lines.index(heading) for heading in headings}
        # New, then Changed and fixed, then Checks, each under its own heading.
        self.assertLess(at["### New in this release"], lines.index(bullets[0]))
        self.assertLess(lines.index(bullets[0]), at["### Fixes and changes"])
        changed = next(line for line in bullets if line.startswith("- HushMessenger now targets Messenger 584.1"))
        self.assertLess(at["### Fixes and changes"], lines.index(changed))
        self.assertLess(lines.index(changed), at["### Behind the scenes"])
        check = next(line for line in bullets if line.startswith("- The install check now names"))
        self.assertLess(at["### Behind the scenes"], lines.index(check))
        self.assertLess(lines.index(check), at["### Reports this release changed something for"])
        self.assertIn("#88, #89, #91, #93, #94, #98, #99, #100, #102, #103, #106 and #107.", lines)
        self.assertIn(f"1. Update Messenger to {TARGET} first. Any build on [APKMirror's {TARGET} page]({PAGE}) works, "
                      "and a `nodpi` one keeps the icons sharp.", lines)
        self.assertIn("2. In Morphe Manager (2.2.0 or newer), open **Sources** and refresh HushMessenger. "
                      "The card should say **66 patches**.", lines)
        self.assertIn("`patches-0.27.0.mpp` below is the same bundle for Morphe Desktop 1.19.1 or newer", body)
        self.assertIn(f"- The full test suite, plus a patch run against all 3 Messenger {TARGET} builds on file.", lines)
        self.assertIn("- Morphe Desktop patched and rebuilt one APK from each of the 2 build families.", lines)
        self.assertIn("- An APK patched from this exact bundle was installed on a Galaxy S22 Ultra, signed in to Messenger. "
                      "A chat, the inbox, both HushMessenger settings tabs, the message log, auto reply, Messenger's own "
                      "settings, story settings and contact settings all opened, with no crashes.", lines)
        self.assertTrue(body.endswith("crashes.\n"))
        self.assertNotIn("\r", body)

    def test_an_emulator_walk_and_a_release_without_reports_read_right(self):
        self.write_walk(emulator=True, device="sdk_gphone64_x86_64", sdk=32,
                        steps=[{"id": "chat", "opened": True}, {"id": "settings-app", "opened": True},
                               {"id": "inbox", "opened": False}])
        self.write_changelog("\n### Changed and fixed\n\n- Something small changed.\n\n")
        body = self.build()
        self.assertIn("installed on an emulator on Android API 32, signed in to Messenger. "
                      "A chat and the HushMessenger App tab all opened, with no crashes.", body)
        self.assertNotIn("Reports this release", body)
        self.assertNotIn("New in this release", body)
        for record in ("347015064.txt", "347014974.txt"):
            (self.root / "scripts/profiles" / record).unlink()
        body = self.build()
        self.assertIn(f"- The full test suite, plus a patch run against the one Messenger {TARGET} build on file.", body)
        self.assertIn("- Morphe Desktop patched and rebuilt one APK from the one build family.", body)

    def test_a_section_the_notes_cant_carry_word_for_word_is_refused(self):
        for name, section, expected in (
            ("unknown group", "\n### Fixed\n\n- A fix.\n\n", "the ### Fixed group isn't one the notes know"),
            ("bullet before a group", "\n- Loose.\n\n### New\n\n- A thing.\n\n", "text outside a bullet"),
            ("wrapped bullet", "\n### New\n\n- A thing that\n  wraps.\n\n", "text outside a bullet"),
            ("no bullets", "\n### New\n\n", "the section has no bullets"),
            ("empty section", "\n\n", "has no section for 0.27.0"),
            ("em dash", "\n### New\n\n- A thing — with a dash.\n\n", "as a dash"),
            ("spaced hyphen", "\n### New\n\n- A thing - with a dash.\n\n", "as a dash"),
            ("en dash", "\n### New\n\n- Builds 3–5 changed.\n\n", "as a dash"),
            ("spaced double hyphen", "\n### New\n\n- A thing -- with a dash.\n\n", "as a dash"),
            ("same bullet twice", "\n### New\n\n- Twice.\n\n### Checks\n\n- Twice.\n\n", "exactly once"),
        ):
            with self.subTest(name):
                self.write_changelog(section)
                self.refuses(expected)

    def test_facts_from_another_release_or_a_failed_walk_are_refused(self):
        self.write_index("0.26.0")
        self.refuses("patches-bundle.json is at 0.26.0, not 0.27.0")
        self.write_index("0.27.0")
        (self.root / "README.md").write_text(self.readme.replace(f"[{TARGET}]", "[584.1.0.61.98]"), encoding="utf-8")
        self.refuses("APKMirror download names 584.1.0.61.98, not 585.0.0.53.94")
        (self.root / "README.md").write_text(self.readme.replace("Morphe Manager (2.2.0 or newer)", "Morphe Manager"),
                                             encoding="utf-8")
        self.refuses("which Morphe Manager version is needed")
        (self.root / "README.md").write_text(self.readme.replace("Morphe Desktop 1.19.1 or newer", "Morphe Desktop"),
                                             encoding="utf-8")
        self.refuses("which Morphe Desktop version is needed")
        # The right version in the link text, but the link still goes to 584.1's page.
        (self.root / "README.md").write_text(self.readme.replace("585-0-0-53-94-release", "584-1-0-61-98-release"),
                                             encoding="utf-8")
        self.refuses("links another release's page")
        (self.root / "README.md").write_text(self.readme, encoding="utf-8")
        (self.root / "patches-list.json").write_text(json.dumps({"version": "0.26.0", "patches": []}), encoding="utf-8")
        self.refuses("patches-list.json is at 0.26.0, not 0.27.0")
        (self.root / "patches-list.json").write_text(json.dumps({"version": "0.27.0", "patches": []}), encoding="utf-8")
        for record in (self.root / "scripts/profiles").glob("*.txt"):
            record.unlink()
        self.refuses("scripts/profiles has no records")
        for change in ({"result": "PARTIAL"}, {"crashes": 1}, {"steps": [{"id": "chat", "opened": False}]}):
            with self.subTest(change):
                self.write_walk(**change)
                with self.assertRaises(notes.NotesError):
                    self.build()

    def test_the_command_writes_the_body_or_exits_nonzero_without_one(self):
        out = self.root / "notes.md"
        command = [sys.executable, "-I", str(SCRIPT), "--root", str(self.root), "--version", "0.27.0",
                   "--walk", str(self.walk), "--out", str(out)]
        result = subprocess.run(command, capture_output=True, text=True, timeout=60, check=False)
        self.assertEqual(0, result.returncode, result.stderr)
        self.assertEqual(self.build().encode("utf-8"), out.read_bytes())
        out.unlink()
        self.write_walk(crashes=2)
        result = subprocess.run(command, capture_output=True, text=True, timeout=60, check=False)
        self.assertEqual(1, result.returncode)
        self.assertIn("release notes: the walk receipt", result.stderr)
        self.assertFalse(out.exists())


if __name__ == "__main__":
    unittest.main()
