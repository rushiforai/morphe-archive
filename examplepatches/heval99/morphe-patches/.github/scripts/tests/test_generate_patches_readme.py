"""Run generate_patches_readme.py against a small offline patches list.

Run with: python -m unittest discover -s .github/scripts/tests -v
No network is used; the icon check relies on the committed assets/icons directory.
"""

import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[3]
SCRIPT = ROOT / ".github/scripts/generate_patches_readme.py"
WITH_ICON = "com.shazam.android"
WITHOUT_ICON = "com.example.noicon"


def patch(name, pkg, label, color):
    return {
        "name": name,
        "description": f"{name} for {label}.",
        "default": True,
        "compatiblePackages": [{
            "packageName": pkg,
            "name": label,
            "appIconColor": color,
            "apkFileType": "APK",
            "targets": [{"version": "1.0.0", "isExperimental": False}],
        }],
    }


class GeneratePatchesReadmeTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not (ROOT / "assets/icons" / f"{WITH_ICON}.png").is_file():
            raise unittest.SkipTest(f"assets/icons/{WITH_ICON}.png is missing")
        if (ROOT / "assets/icons" / f"{WITHOUT_ICON}.png").exists():
            raise AssertionError(f"{WITHOUT_ICON} must not have an icon")
        data = {"version": "1.2.3", "patches": [
            patch("Disable ads", WITH_ICON, "Shazam", "#0088FF"),
            patch("Disable ads", WITHOUT_ICON, "No Icon", "#123456"),
        ]}
        # Run from a temp dir so the icon lookup is proven to be relative to the repo, not the CWD.
        with tempfile.TemporaryDirectory(prefix="heval-readme-") as tmp:
            directory = Path(tmp)
            (directory / "patches-list.json").write_text(json.dumps(data), encoding="utf-8")
            readme = directory / "README.md"
            readme.write_text("intro\n<!-- PATCHES_START -->\nold\n<!-- PATCHES_END -->\nend\n", encoding="utf-8")
            result = subprocess.run(
                [sys.executable, "-I", str(SCRIPT), "audit/repo", "dev", "patches-list.json", "README.md"],
                cwd=directory, capture_output=True, text=True, encoding="utf-8", timeout=60,
            )
            if result.returncode != 0:
                raise AssertionError(result.stdout + result.stderr)
            cls.lines = readme.read_text(encoding="utf-8").splitlines()

    def line(self, prefix, needle):
        return next(l for l in self.lines if l.startswith(prefix) and needle in l)

    def test_app_with_icon_uses_it_in_the_overview(self):
        row = self.line("| ", "**Shazam**")
        self.assertTrue(row.startswith(
            f'| <img src="assets/icons/{WITH_ICON}.png" width="20" height="20" alt=""> | **Shazam** |'), row)
        self.assertNotIn("img.shields.io", row)

    def test_app_without_icon_keeps_the_swatch(self):
        row = self.line("| ", "**No Icon**")
        self.assertTrue(row.startswith(
            '| <img src="https://img.shields.io/badge/-%20-123456?style=flat-square" height="14" alt=""> '
            "| **No Icon** |"), row)
        self.assertNotIn("assets/icons", row)

    def test_details_summary_shows_the_icon(self):
        summary = self.line("<summary>", "Shazam")
        self.assertTrue(summary.startswith(
            f'<summary><img src="assets/icons/{WITH_ICON}.png" width="16" height="16" alt=""> <b>Shazam</b>'),
            summary)

    def test_details_summary_without_icon_is_unchanged(self):
        summary = self.line("<summary>", "No Icon")
        self.assertTrue(summary.startswith("<summary><b>No Icon</b> &nbsp;·&nbsp; 1 patch &nbsp;·&nbsp;"), summary)


if __name__ == "__main__":
    unittest.main()
