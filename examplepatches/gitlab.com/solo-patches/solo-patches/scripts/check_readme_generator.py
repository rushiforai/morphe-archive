#!/usr/bin/env python3
"""Check generated README text without touching project release files.

Run: python3 scripts/check_readme_generator.py
"""

import json
import subprocess
import sys
import tempfile
from pathlib import Path


def main():
    generator = Path(__file__).with_name("generate_patches_readme.py")
    description = r"Keep \n and \g<1> literal."
    data = {
        "version": "1.0.0",
        "patches": [{
            "name": "Hide ads",
            "description": description,
            "compatiblePackages": [{
                "packageName": "com.qidian.Int.reader",
                "name": "WebNovel",
                "targets": [
                    {"version": None, "description": "Any version"},
                    {"version": "8.24.2", "description": "Supported"},
                ],
            }],
        }],
    }
    with tempfile.TemporaryDirectory(prefix="webnovel-readme-check-") as directory:
        folder = Path(directory)
        patches = folder / "patches.json"
        readme = folder / "README.md"
        patches.write_text(json.dumps(data), encoding="utf-8")
        readme.write_text("Intro\n<!-- PATCHES_START -->\nstale\n<!-- PATCHES_END -->\nFooter\n", encoding="utf-8")
        result = subprocess.run(
            [sys.executable, str(generator), "example/patches", "main", str(patches), str(readme)],
            capture_output=True, text=True, timeout=10,
        )
        assert result.returncode == 0, result.stderr
        output = readme.read_text(encoding="utf-8")
        assert description in output, "Patch descriptions lost literal backslashes"
        assert "| 8.24.2 |\n| :---: |\n| Supported |" in output, "Version descriptions do not match their columns"
        assert "Any version" not in output, "Untargeted description leaked into the version table"
        assert "https://gitlab.com/example/patches/-/releases/v1.0.0" in output, "Catalog release link does not target GitLab"
        assert "https://github.com/" not in output, "Catalog retained a GitHub release link"
        assert output.startswith("Intro\n<!-- PATCHES_START -->\n"), "README prefix changed"
        assert output.endswith("<!-- PATCHES_END -->\nFooter\n"), "README suffix changed"
    print("PASS: generated README preserves literal descriptions, version columns and surrounding text")


if __name__ == "__main__":
    main()
