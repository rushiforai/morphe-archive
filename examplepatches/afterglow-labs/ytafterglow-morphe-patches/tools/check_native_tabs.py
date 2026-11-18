#!/usr/bin/env python3
"""Run native tab row/identity invariants without an Android device or native classes."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extensions/extension/src/main/java/app/afterglow/extension/navigation"
with tempfile.TemporaryDirectory(prefix="afterglow-native-tabs-") as output:
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", output,
                    str(SOURCE / "NativeTabPolicy.java"), str(SOURCE / "NativeTabProto.java"),
                    str(ROOT / "tools/jvm/NativeTabsTest.java")], check=True)
    subprocess.run(["java", "-cp", output, "NativeTabsTest"], check=True)
