#!/usr/bin/env python3
"""Exercise mini-player mode ownership, defaults and live preference reads on the JVM."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
ANDROID = Path(os.environ.get("ANDROID_JAR", str(Path.home() / "Android/Sdk/platforms/android-36/android.jar")))
sources = [EXT / "playback/MiniPlayerPlayback.java", EXT / "InstalledTweaks.java",
           ROOT / "tools/jvm/MiniPlayerPlaybackTest.java"]
sources += [EXT / "settings" / (name + ".java") for name in
            ("AfterglowPrefs", "LiteMode", "Registry", "Descriptor", "Category")]
sources += sorted((EXT / "i18n").glob("*.java"))

with tempfile.TemporaryDirectory(prefix="afterglow-miniplayer-") as out:
    # Only Android application startup/logging is replaced. The preference registry,
    # effective Lite Mode values and installed-tweak ownership are production code.
    stub = Path(out) / "Afterglow.java"
    stub.write_text("""package app.afterglow.extension;
import android.content.Context;
public final class Afterglow {
    public static int errors;
    public static Context context() { return null; }
    public static void error(String where, Throwable error) { errors++; }
}
""", encoding="utf-8")
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-classpath", str(ANDROID),
                    "-d", out] + list(map(str, sources)) + [str(stub)], check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out + os.pathsep + str(ANDROID),
                    "MiniPlayerPlaybackTest"], check=True)
