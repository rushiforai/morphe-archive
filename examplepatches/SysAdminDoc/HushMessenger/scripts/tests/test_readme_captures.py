import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "readme_captures", Path(__file__).parents[1] / "readme_captures.py"
)
captures = importlib.util.module_from_spec(spec)
spec.loader.exec_module(captures)

REPO = Path(__file__).parents[2]
CONTROLS = (
    "public class SettingsActivity {\n"
    "    static final String[][] CONTROLS = {\n"
    '        {"people", "Hide People You May Know", "Hides suggested people.", "inbox"},\n'
    '        {"inbox_ads", "Hide inbox ads", "Hides \\"sponsored\\" chats.", "inbox"},\n'
    "    };\n"
    '    void source() { openPage("https://github.com/SysAdminDoc/HushMessenger#credits"); }\n'
    "}\n"
)
README = (
    "# HushMessenger\n\n## Settings\n\n"
    '<img src="assets/settings-dark.png" alt="Controls tab">\n\n## Credits\n\nThanks.\n'
)


class ReadmeCaptures(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.write(captures.SETTINGS, CONTROLS)
        self.write("README.md", README)
        (self.root / "assets").mkdir()
        self.renders = self.root / "renders"
        self.renders.mkdir()
        for render in captures.CAPTURES.values():
            (self.renders / render).write_bytes(render.encode("utf-8"))
        captures.export(self.root, self.renders)

    def write(self, path, text):
        target = self.root / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8", newline="\n")

    def refused(self, message):
        with self.assertRaisesRegex(ValueError, message):
            captures.check(self.root)

    def test_fresh_captures_pass_and_record_the_catalog_and_every_image(self):
        self.assertEqual("README captures match 2 controls", captures.check(self.root))
        receipt = json.loads((self.root / captures.RECEIPT).read_text(encoding="utf-8"))
        self.assertEqual(2, receipt["controls"])
        self.assertEqual(set(captures.CAPTURES), set(receipt["images"]))
        self.assertEqual(
            (self.renders / "settings-controls-dark.png").read_bytes(),
            (self.root / "assets/settings-dark.png").read_bytes(),
        )

    def test_a_retired_renamed_or_added_control_makes_the_captures_stale(self):
        for changed in (
            CONTROLS.replace('        {"inbox_ads", "Hide inbox ads", "Hides \\"sponsored\\" chats.", "inbox"},\n', ""),
            CONTROLS.replace("Hide inbox ads", "Hide sponsored chats"),
            CONTROLS.replace('"inbox"},\n    };', '"inbox"},\n        {"stories", "Hide stories", "Hides them.", "inbox"},\n    };'),
        ):
            with self.subTest(changed=changed):
                self.assertNotEqual(CONTROLS, changed)
                self.write(captures.SETTINGS, changed)
                self.refused("older catalog")
        self.write(captures.SETTINGS, CONTROLS)
        captures.check(self.root)

    def test_an_edited_missing_or_unlisted_image_fails(self):
        (self.root / "assets/settings-app-light.png").write_bytes(b"edited")
        self.refused("settings-app-light.png differs")
        captures.export(self.root, self.renders)
        (self.root / "assets/settings-light.png").unlink()
        self.refused("settings-light.png differs")
        captures.export(self.root, self.renders)
        self.write("README.md", README + '<img src="assets/settings-search.png" alt="Search">\n')
        self.refused("doesn't cover")

    def test_a_missing_or_partial_receipt_fails(self):
        receipt = json.loads((self.root / captures.RECEIPT).read_text(encoding="utf-8"))
        del receipt["images"]["assets/settings-app-dark.png"]
        self.write(captures.RECEIPT, json.dumps(receipt))
        self.refused("four captures")
        (self.root / captures.RECEIPT).unlink()
        self.refused("missing")

    def test_an_app_link_to_a_removed_readme_heading_fails(self):
        self.write("README.md", README.replace("## Credits", "## Research and credits"))
        self.refused("README#credits")
        self.write("README.md", README.replace("## Credits", "## Credits ##"))
        captures.check(self.root)

    def test_headings_slug_as_github_does(self):
        self.assertEqual(
            {"hushmessenger", "if-something-doesnt-work", "verify-a-download", "chat-heads-and-bubbles"},
            captures.readme_anchors(
                "# HushMessenger\n### If something doesn't work\n## Verify a download\n## Chat heads and bubbles\n"
            ),
        )

    def test_the_committed_captures_match_this_checkout(self):
        self.assertIn("README captures match", captures.check(REPO))


if __name__ == "__main__":
    unittest.main()
