#!/usr/bin/env python3
"""Exercise user lock requests while native fullscreen completes asynchronously."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
sources = [ROOT / "extensions/extension/src/main/java/app/afterglow/extension/playback/OverlayLockRequest.java",
           ROOT / "tools/jvm/OverlayLockRequestTest.java"]
with tempfile.TemporaryDirectory() as out:
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", out] + list(map(str, sources)), check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out, "OverlayLockRequestTest"], check=True)
