#!/usr/bin/env python3
"""Compile ModeKeeper against Android/Bluetooth simulator (not physical headphones)."""
from pathlib import Path
import subprocess
import tempfile

base = Path(__file__).resolve().parent.parent
src = base / "tests" / "java"
real = base / "overlay/extensions/extension/src/main/java/app/hxreborn/extension/realmelink/ModeKeeper.java"
files = list(src.rglob("*.java")) + [real]
with tempfile.TemporaryDirectory(prefix="rlm-modekeeper-") as folder:
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", folder, *map(str, files)], check=True)
    subprocess.run(["java", "-cp", folder, "fixture.SmokeTest"], check=True)
print("PASS: simulated Java behavior; does not prove device operation.")
