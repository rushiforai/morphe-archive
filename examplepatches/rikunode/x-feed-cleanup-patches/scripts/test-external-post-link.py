#!/usr/bin/env python3
"""Dependency-light JVM regressions for the external X post routing shim."""
import os
from pathlib import Path
import shutil
import subprocess

repo = Path(__file__).resolve().parents[1]

if os.name == "nt":
    jbr = Path("C:/Program Files/Android/Android Studio/jbr/bin")
    javac = str(jbr / "javac.exe")
    java = str(jbr / "java.exe")
else:
    javac = shutil.which("javac")
    java = shutil.which("java")
assert javac and java, "A JDK is required for the smoke test"

sdk_roots = [
    Path(os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or "/usr/local/lib/android/sdk"),
    Path.home() / "AppData/Local/Android/Sdk",
]
sdk_jars = [platform / "android.jar" for root in sdk_roots if root.is_dir()
            for platform in root.glob("platforms/android-*")
            if (platform / "android.jar").is_file()]
assert sdk_jars, "An Android SDK platform android.jar is required"
sdk_jar = sdk_jars[0]  # Only android.content.Intent is referenced; any platform SDK is sufficient.

out = repo / "build/test-external-post-link"
out.mkdir(parents=True, exist_ok=True)
sources = [
    repo / "extensions/feedcleanup-x/src/main/java/app/xfeedcleanup/extension/x/ExternalPostLink.java",
    repo / "tests/java/app/xfeedcleanup/extension/x/ExternalPostLinkTest.java",
    repo / "tests/java/com/x/navigation/ni.java",
]
subprocess.run(
    [javac, "--release", "8", "-cp", str(sdk_jar),
     "-d", str(out), *map(str, sources)],
    check=True,
)
subprocess.run(
    [java, "-cp", os.pathsep.join([str(out), str(sdk_jar)]),
     "app.xfeedcleanup.extension.x.ExternalPostLinkTest"],
    check=True,
)
