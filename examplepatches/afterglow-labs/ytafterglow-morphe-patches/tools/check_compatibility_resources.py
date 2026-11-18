#!/usr/bin/env python3
"""Exercise the production values merge with patcher 2.1's real Document and type resolver."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
KOTLINC = os.environ.get("KOTLINC", "/mnt/c/Program Files/Android/Android Studio/plugins/Kotlin/kotlinc/bin/kotlinc")
PATCHER = os.environ.get("MORPHE_DESKTOP_JAR", "/mnt/c/Users/Corey/Downloads/morphe-desktop-1.20.0-all.jar")
SOURCE = ROOT / "patches/src/main/kotlin/app/afterglow/patches/compat/morphe/CompatibilityResourceMerge.kt"
TEST = ROOT / "tools/jvm/CompatibilityResourceMergeTest.kt"
VALUES = ROOT / "patches/src/main/resources/compat/morphe/values/compatibility.xml"

with tempfile.TemporaryDirectory(prefix="afterglow-compatibility-resources-") as scratch:
    env = os.environ.copy()
    env["JAVA_HOME"] = str(JDK)
    subprocess.run([KOTLINC, "-jvm-target", "11", "-no-reflect", "-nowarn", "-Xskip-prerelease-check",
                    "-classpath", PATCHER, "-d", scratch, str(SOURCE), str(TEST)], check=True, env=env)
    subprocess.run([str(JDK / "bin/java"), "-cp", scratch + os.pathsep + PATCHER,
                    "app.afterglow.patches.compat.morphe.CompatibilityResourceMergeTestKt",
                    str(VALUES), scratch], check=True)
