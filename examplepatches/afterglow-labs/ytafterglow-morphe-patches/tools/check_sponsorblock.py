#!/usr/bin/env python3
"""Compile and exercise SponsorBlock network/session/marker policy without Android or Gradle."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
names = ("SponsorCategory", "SponsorSegment", "SponsorSession", "SponsorClient", "SponsorMarkerLayout")
sources = [EXT / "sponsorblock" / (name + ".java") for name in names]
sources += [EXT / "settings/ThemeJson.java", ROOT / "tools/jvm/SponsorBlockTest.java"]
with tempfile.TemporaryDirectory() as out:
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", out] + list(map(str, sources)), check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out, "SponsorBlockTest"], check=True)
