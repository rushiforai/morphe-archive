#!/usr/bin/env python3
"""Verify the pinned iOS catalog and run the real theme engine on the JVM (no emulator)."""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"


def main():
    subprocess.run([sys.executable, "-B", "-I", str(ROOT / "tools/generate_theme_catalog.py"), "--check"], check=True)
    jdk = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
    android = Path(os.environ.get("ANDROID_JAR", str(Path.home() / "Android/Sdk/platforms/android-36/android.jar")))
    for tool in (jdk / "bin/java", jdk / "bin/javac", android):
        if not tool.exists():
            raise SystemExit(f"Missing {tool}; set JDK and ANDROID_JAR (theme tests are required, not skipped)")
    sources = [EXT / "Afterglow.java", EXT / "InstalledTweaks.java"]
    sources += sorted((EXT / "settings").glob("*.java"))
    sources += sorted((EXT / "i18n").glob("*.java"))
    sources += [ROOT / "tools/jvm/ThemeEngineTest.java"]
    with tempfile.TemporaryDirectory(prefix="afterglow-theme-test-") as directory:
        subprocess.run([str(jdk / "bin/javac"), "-encoding", "UTF-8", "-classpath", str(android), "-sourcepath", str(EXT.parents[2]), "-d", directory]
                       + [str(p) for p in sources], check=True)
        subprocess.run([str(jdk / "bin/java"), "-cp", directory + os.pathsep + str(android),
                        "app.afterglow.extension.settings.ThemeEngineTest"], check=True, timeout=60)


if __name__ == "__main__":
    main()
