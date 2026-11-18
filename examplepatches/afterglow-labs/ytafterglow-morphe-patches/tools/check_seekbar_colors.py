#!/usr/bin/env python3
"""Exercise the real seekbar color adapter policy and theme palette without a device."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
EXT=ROOT/"extensions/extension/src/main/java/app/afterglow/extension"
ANDROID=Path(os.environ.get("ANDROID_JAR",str(Path.home()/"Android/Sdk/platforms/android-36/android.jar")))
sources=[EXT/"Afterglow.java",EXT/"InstalledTweaks.java",EXT/"theme/SeekBarColorPolicy.java",ROOT/"tools/jvm/SeekBarColorsTest.java"]
sources+=sorted((EXT/"settings").glob("*.java"))+sorted((EXT/"i18n").glob("*.java"))
with tempfile.TemporaryDirectory(prefix="afterglow-seek-colors-") as temporary:
    subprocess.run(["javac","-encoding","UTF-8","-classpath",str(ANDROID),"-sourcepath",str(EXT.parents[2]),"-d",temporary]+list(map(str,sources)),check=True)
    subprocess.run(["java","-cp",temporary+os.pathsep+str(ANDROID),"SeekBarColorsTest"],check=True,timeout=60)
