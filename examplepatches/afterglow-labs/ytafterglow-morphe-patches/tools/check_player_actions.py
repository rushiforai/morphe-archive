#!/usr/bin/env python3
"""Check fullscreen action independence and overflow descendant exclusions."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
ANDROID = Path(os.environ.get("ANDROID_JAR", str(Path.home() / "Android/Sdk/platforms/android-36/android.jar")))
sources = [EXT / "Afterglow.java", EXT / "InstalledTweaks.java", ROOT / "tools/jvm/PlayerActionButtonsFilterTest.java"]
sources += sorted((EXT / "settings").glob("*.java")) + sorted((EXT / "i18n").glob("*.java"))
sources += sorted((EXT / "litho").rglob("*.java"))
with tempfile.TemporaryDirectory() as out:
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-nowarn", "-classpath", str(ANDROID), "-sourcepath", str(EXT.parents[2]), "-d", out]
                   + list(map(str, sources)), check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out + os.pathsep + str(ANDROID),
                    "app.afterglow.extension.litho.PlayerActionButtonsFilterTest"], check=True)
