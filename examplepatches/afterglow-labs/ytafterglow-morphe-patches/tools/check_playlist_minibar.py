#!/usr/bin/env python3
"""Verify native passthrough, independent ownership and process-coherent layout changes."""
from itertools import product
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
JAVA = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
with tempfile.TemporaryDirectory() as temporary:
    out = Path(temporary)
    prefs = out / "app/afterglow/extension/settings/AfterglowPrefs.java"
    prefs.parent.mkdir(parents=True)
    prefs.write_text("""package app.afterglow.extension.settings;
import java.util.HashMap;
import java.util.Map;
public final class AfterglowPrefs {
    private static final Map<String, Boolean> VALUES = new HashMap<>();
    public static boolean failReads;
    public static boolean getBool(String key) {
        if (failReads) throw new IllegalStateException("preference storage unavailable");
        return VALUES.getOrDefault(key, false);
    }
    public static void setBool(String key, boolean value) { VALUES.put(key, value); }
}
""")
    afterglow = out / "app/afterglow/extension/Afterglow.java"
    afterglow.write_text("""package app.afterglow.extension;
public final class Afterglow {
    public static int errors;
    public static void error(String where, Throwable error) { errors++; }
}
""")
    sources = [prefs, afterglow, JAVA / "InstalledTweaks.java", JAVA / "settings/LiteMode.java",
               JAVA / "playback/PlaylistMinibar.java", ROOT / "tools/jvm/PlaylistMinibarTest.java"]
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", str(out)]
                   + list(map(str, sources)), check=True)
    for scenario in product((False, True), repeat=4):
        subprocess.run([str(JDK / "bin/java"), "-cp", str(out), "PlaylistMinibarTest"]
                       + [str(value).lower() for value in scenario], check=True, capture_output=True)
    for first_native in (False, True):
        subprocess.run([str(JDK / "bin/java"), "-cp", str(out), "PlaylistMinibarTest",
                        "unavailable", str(first_native).lower()], check=True, capture_output=True)
print("122 playlist minibar checks passed across 18 fresh processes")
