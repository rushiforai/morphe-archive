"""Host regression checks for pure-Java rendering helpers; not an Android UI test.
Requires JAVA_HOME and ANDROID_HOME with platforms/android-36/android.jar.
"""
import os
from pathlib import Path
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1]
java = Path(os.environ["JAVA_HOME"]) / "bin"
sdk = Path(os.environ["ANDROID_HOME"]) / "platforms/android-36/android.jar"
extension = root / "extensions/extension/src/main/java/local/privacy"
sources = list((root / "tests/render-work").rglob("*.java"))
sources += [extension / name for name in ("AuthorInfo.java", "HomeFilter.java")]
with tempfile.TemporaryDirectory(prefix="dc-render-check-") as folder:
    subprocess.run([str(java / "javac"), "-cp", str(sdk), "-d", folder,
                    *map(str, sources)], check=True)
    subprocess.run([str(java / "java"), "-cp", folder + os.pathsep + str(sdk),
                    "local.privacy.RenderWorkCheck"], check=True)
