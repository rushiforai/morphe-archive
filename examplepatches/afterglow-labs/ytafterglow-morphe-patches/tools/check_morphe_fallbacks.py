#!/usr/bin/env python3
"""Check temporary adapter scope, share parsing and chooser failure recovery on the JVM."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
ANDROID = Path(os.environ.get("ANDROID_JAR", str(Path.home() / "Android/Sdk/platforms/android-36/android.jar")))
sources = [EXT / "navigation" / (name + ".java") for name in
           ("MorpheFallbackAlbumCovers", "MorpheFallbackNativeShare", "MorpheFallbackShareEntity")]
sources += [EXT / "InstalledTweaks.java", ROOT / "tools/jvm/MorpheFallbackPolicyTest.java"]
sources += [EXT / "settings" / (name + ".java") for name in
            ("AfterglowPrefs", "LiteMode", "Registry", "Descriptor", "Category")]
sources += sorted((EXT / "i18n").glob("*.java"))

# Only Android window/Intent execution and application startup/logging are test
# doubles. Preference defaults/ownership, URL parsing and dispatch policy are real.
STUBS = {
    "android/content/Context.java": """package android.content;
public class Context {
    public static final int MODE_PRIVATE = 0;
    public Intent lastIntent;
    public boolean failStart;
    public SharedPreferences getSharedPreferences(String name, int mode) { return null; }
    public void startActivity(Intent intent) {
        if (failStart) throw new IllegalStateException("test launch failure");
        lastIntent = intent;
    }
}
""",
    "android/app/Activity.java": """package android.app;
public class Activity extends android.content.Context {
    public boolean finishing, destroyed;
    public boolean isFinishing() { return finishing; }
    public boolean isDestroyed() { return destroyed; }
}
""",
    "android/content/Intent.java": """package android.content;
public class Intent {
    public static final String ACTION_SEND = "android.intent.action.SEND";
    public static final String EXTRA_TEXT = "android.intent.extra.TEXT";
    public static final int FLAG_ACTIVITY_NO_USER_ACTION = 0x00040000;
    public static final int FLAG_ACTIVITY_NEW_TASK = 0x10000000;
    public final String action;
    public String type;
    public int flags;
    public Intent target;
    public final java.util.Map<String, String> extras = new java.util.HashMap<>();
    public Intent(String action) { this.action = action; }
    public Intent setType(String value) { type = value; return this; }
    public Intent putExtra(String key, String value) { extras.put(key, value); return this; }
    public Intent addFlags(int value) { flags |= value; return this; }
    public static Intent createChooser(Intent value, CharSequence title) {
        Intent result = new Intent("android.intent.action.CHOOSER"); result.target = value; return result;
    }
}
""",
    "app/afterglow/extension/Afterglow.java": """package app.afterglow.extension;
import android.app.Activity;
import android.content.Context;
public final class Afterglow {
    public static int errors;
    public static Activity activity;
    public static Context application;
    public static final java.util.List<Runnable> pending = new java.util.ArrayList<>();
    public static Activity mainActivity() { return activity; }
    public static Context context() { return application; }
    public static void runOnMainDelayed(Runnable action, long delay) { pending.add(action); }
    public static void error(String where, Throwable error) { errors++; }
}
""",
}

with tempfile.TemporaryDirectory(prefix="afterglow-morphe-adapters-") as out:
    for name, source in STUBS.items():
        path = Path(out) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        sources.append(path)
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-classpath", str(ANDROID),
                    "-d", out] + list(map(str, sources)), check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", out + os.pathsep + str(ANDROID),
                    "app.afterglow.extension.navigation.MorpheFallbackPolicyTest"], check=True)
