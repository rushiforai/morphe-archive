#!/usr/bin/env python3
"""Exercise diagnostic gating, redaction, ring limits and real file rotation/clear."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension/diagnostics"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
with tempfile.TemporaryDirectory(prefix="afterglow-log-test-") as out:
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", out,
                    str(EXT / "LogPolicy.java"), str(EXT / "LogStore.java"),
                    str(ROOT / "tools/jvm/DebugLogTest.java")], check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out, "DebugLogTest"], check=True, timeout=60)
