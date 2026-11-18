#!/usr/bin/env python3
"""Verify reversible chip-row spacing through native animation and reuse."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
with tempfile.TemporaryDirectory() as out:
    subprocess.run([str(JDK / "bin/javac"), "-d", out,
                    str(ROOT / "extensions/extension/src/main/java/app/afterglow/extension/navigation/SubbarMargin.java"),
                    str(ROOT / "extensions/extension/src/main/java/app/afterglow/extension/navigation/SubbarAnimation.java"),
                    str(ROOT / "tools/jvm/SubbarMarginTest.java")], check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out,
                    "app.afterglow.extension.navigation.SubbarMarginTest"], check=True)
