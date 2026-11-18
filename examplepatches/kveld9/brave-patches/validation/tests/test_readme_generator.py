"""
Unit tests for the README patches-section generator.

Focus: the generated table is injected into README.md with re.sub, and the table is
built from patch descriptions. A description containing a backslash must survive
verbatim instead of being parsed as a regex replacement template.
"""

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

GENERATOR = Path(__file__).resolve().parents[2] / ".github/scripts/generate_patches_readme.py"

README = "# Title\n\n<!-- PATCHES_START -->\nstale content\n<!-- PATCHES_END -->\n\nTail line.\n"


def _run(catalog: dict, readme: str = README):
    tmp = Path(tempfile.mkdtemp(prefix="readme_gen_"))
    (tmp / "patches-list.json").write_text(json.dumps(catalog), encoding="utf-8")
    (tmp / "README.md").write_text(readme, encoding="utf-8")
    proc = subprocess.run(
        [sys.executable, str(GENERATOR), "owner/repo", "dev",
         str(tmp / "patches-list.json"), str(tmp / "README.md")],
        capture_output=True, text=True,
    )
    return proc, (tmp / "README.md").read_text(encoding="utf-8")


def _catalog(description: str) -> dict:
    return {
        "version": "9.9.9",
        "patches": [{
            "name": "Probe Patch",
            "description": description,
            "default": False,
            "dependencies": [],
            "compatiblePackages": None,
            "options": [],
        }],
    }


class TestReadmeGenerator(unittest.TestCase):

    def test_description_with_backslashes_survives(self):
        desc = r"Rewrites C:\Users\test\paths and keeps \1 and \g<name> intact."
        proc, readme = _run(_catalog(desc))
        self.assertEqual(proc.returncode, 0, proc.stderr)
        self.assertIn("Probe Patch", readme)
        self.assertIn(desc, readme)

    def test_ordinary_description_is_still_injected(self):
        proc, readme = _run(_catalog("Plain description."))
        self.assertEqual(proc.returncode, 0, proc.stderr)
        self.assertIn("Plain description.", readme)
        self.assertNotIn("stale content", readme)
        self.assertIn("Tail line.", readme)

    def test_missing_end_marker_fails_without_touching_the_file(self):
        readme_without_end = "# Title\n\n<!-- PATCHES_START -->\nstale\n"
        proc, readme = _run(_catalog("Plain."), readme=readme_without_end)
        self.assertEqual(proc.returncode, 1)
        self.assertIn("PATCHES_END", proc.stderr)
        self.assertEqual(readme, readme_without_end)


if __name__ == "__main__":
    unittest.main()