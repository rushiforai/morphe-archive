#!/usr/bin/env python3
"""Portable rendering checks; fixtures require no decoded APKs or dependencies."""

import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


GENERATOR = Path(__file__).with_name("generate_patches_readme.py")
CATEGORIES = (
    "Recommended sets",
    "Image quality",
    "Tracking & audio",
    "Startup & permissions",
    "App & device identity",
    "Advanced XR compatibility",
    "Experiments",
)


def compatible_package(label="Steam Link", code=5002363):
    return {
        "packageName": "com.valvesoftware.steamlinkvr",
        "name": label,
        "targets": [{
            "version": "2.0.23",
            "versionCodes": {"ARM64_V8A": code},
            "description": "Exact supported build",
        }],
    }


def patch(name, category=None, compatibility=True):
    entry = {"name": name, "description": "First line\nSecond line"}
    if category is not None:
        entry["category"] = category
    if compatibility:
        entry["compatiblePackages"] = [compatible_package()]
    return entry


class GeneratePatchesReadmeTest(unittest.TestCase):
    def render(self, patches):
        with tempfile.TemporaryDirectory(prefix="patch-category-docs-") as directory:
            root = Path(directory)
            catalog = root / "patches.json"
            document = root / "reference.md"
            catalog.write_text(json.dumps({"version": "v1.2.3", "patches": patches}), encoding="utf-8")
            document.write_text(
                "Before\n<!-- PATCHES_START EXPANDED -->\nOld content\n<!-- PATCHES_END -->\nAfter\n",
                encoding="utf-8",
            )
            command = [sys.executable, str(GENERATOR), "owner/repo", "main", str(catalog), str(document)]
            subprocess.run(command, check=True, capture_output=True, env=self.subprocess_env())
            first = document.read_bytes()
            subprocess.run(command, check=True, capture_output=True, env=self.subprocess_env())
            self.assertEqual(first, document.read_bytes(), "Rendering must be repeatable")
            text = document.read_text(encoding="utf-8")
            self.assertTrue(text.startswith("Before\n"))
            self.assertTrue(text.endswith("After\n"))
            self.assertNotIn("Old content", text)
            return text

    @staticmethod
    def subprocess_env():
        # Emoji output must work under the Windows subprocess pipe encoding.
        return {**os.environ, "PYTHONIOENCODING": "utf-8"}

    def test_category_order_rows_and_metadata(self):
        entries = [patch(f"Patch {index}", category) for index, category in reversed(list(enumerate(CATEGORIES)))]
        detailed = patch("Alpha image", "Image quality")
        detailed["options"] = [{"title": "Quality level"}, {"key": "fallbackOption"}]
        entries += [patch("Zulu image", "Image quality"), detailed]
        text = self.render(entries)
        positions = [text.index(f"#### {category}\n") for category in CATEGORIES]
        self.assertEqual(positions, sorted(positions))
        self.assertLess(text.index("[Alpha image](#alpha-image)"), text.index("[Patch 1](#patch-1)"))
        self.assertLess(text.index("[Patch 1](#patch-1)"), text.index("[Zulu image](#zulu-image)"))
        for entry in entries:
            self.assertEqual(text.count(f"[{entry['name']}](#"), 1)
        self.assertIn("2.0.23 (5002363)", text)
        self.assertIn("Exact supported build", text)
        self.assertIn("First line<br>Second line | 5002363 |", text)
        self.assertIn("• Quality level<br>• fallbackOption", text)
        self.assertIn("9 patches total", text)

    def test_legacy_catalog_retains_plain_table(self):
        text = self.render([patch("Zulu"), patch("Alpha")])
        self.assertNotIn("#### ", text)
        self.assertEqual(text.count("| 💊&nbsp;Patch |"), 1)
        self.assertLess(text.index("[Alpha](#alpha)"), text.index("[Zulu](#zulu)"))
        self.assertIn("2 patches total", text)

    def test_categories_stay_inside_compatibility_and_universal_groups(self):
        scoped = patch("Scoped", "Recommended sets")
        scoped["compatiblePackages"].append(compatible_package("Legacy Steam Link", 5001812))
        universal = patch("Universal feature", "App & device identity", compatibility=False)
        text = self.render([scoped, universal, universal])
        self.assertEqual(text.count("#### Recommended sets\n"), 2)
        self.assertEqual(text.count("[Scoped](#scoped)"), 2)
        self.assertEqual(text.count("[Universal feature](#universal-feature)"), 1)
        self.assertIn("5001812, 5002363", text)
        self.assertIn("🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch", text)
        universal_section = text.split("🌐 Universal", 1)[1]
        self.assertIn("#### App & device identity", universal_section)
        self.assertNotIn("[Scoped]", universal_section)
        self.assertIn("3 patches total", text)

    def test_mixed_catalog_retains_uncategorized_rows(self):
        text = self.render([patch("Old patch"), patch("New patch", "Image quality")])
        self.assertLess(text.index("#### Image quality"), text.index("#### Uncategorized"))
        self.assertEqual(text.count("[Old patch](#old-patch)"), 1)
        self.assertEqual(text.count("[New patch](#new-patch)"), 1)


if __name__ == "__main__":
    unittest.main()
