#!/usr/bin/env python3
"""Smoke tests for our conservative already-patched APK detector."""
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

script = Path(__file__).parent / "check_input_apk.py"
with tempfile.TemporaryDirectory() as dirname:
    base = Path(dirname)
    clean = base / "unmarked.apk"
    patched = base / "hx-marked.apk"
    corrupt = base / "broken.apk"
    for filename, data in [
        (clean, b"original-app-resources"),
        (patched, b"hx_page hx_surface hx_on_surface"),
    ]:
        with zipfile.ZipFile(filename, "w") as z:
            z.writestr("resources.arsc", data)
    corrupt.write_text("not-zip")
    cases = [
        (clean, 0),
        (patched, 1),
        (corrupt, 2),
    ]
    for filename, expected in cases:
        result = subprocess.run(
            [sys.executable, str(script), str(filename)],
            capture_output=True, text=True,
        )
        if result.returncode != expected:
            raise RuntimeError(
                f"{filename.name}: expected {expected}, got {result.returncode}; "
                f"stdout={result.stdout} stderr={result.stderr}"
            )
print("PASS: original-looking, hx-modified and invalid APKs classified")
