import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


class GeneratePatchesReadmeTest(unittest.TestCase):
    def test_renders_null_target_version_as_any_version(self):
        catalogue = {
            "version": "0.2.3",
            "patches": [
                {
                    "name": "Example patch",
                    "description": "Example description.",
                    "compatiblePackages": [
                        {
                            "packageName": "com.mixplorer",
                            "name": "MiXplorer",
                            "targets": [
                                {
                                    "version": None,
                                    "isExperimental": False,
                                },
                            ],
                        },
                    ],
                    "options": [],
                },
            ],
        }
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            catalogue_path = root / "patches-list.json"
            readme_path = root / "README.md"
            catalogue_path.write_text(json.dumps(catalogue), encoding="utf-8")
            readme_path.write_text(
                "<!-- PATCHES_START -->\nold\n<!-- PATCHES_END -->\n",
                encoding="utf-8",
            )
            subprocess.run(
                [
                    sys.executable,
                    str(Path(__file__).with_name("generate_patches_readme.py")),
                    "owner/repo",
                    "main",
                    str(catalogue_path),
                    str(readme_path),
                ],
                check=True,
            )
            generated = readme_path.read_text(encoding="utf-8")

        self.assertIn("**🎯 Supported versions:**", generated)
        self.assertIn("| Any version |", generated)


if __name__ == "__main__":
    unittest.main()