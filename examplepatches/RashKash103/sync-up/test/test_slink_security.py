# /// script
# requires-python = ">=3.9"
# dependencies = []
# ///
"""Run offline /s/ resolver regressions with a JDK, without Android or Gradle.

Usage: uv run test/test_slink_security.py [--java-home /path/to/jdk]
The Android/Morphe stubs below exist only in a temporary test directory and are
never packaged into an extension. Unexpected Android interactions fail the test.
"""

import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


STUBS = {
    "android/content/Context.java": """
package android.content;
public class Context {
    public android.content.pm.PackageManager getPackageManager() { throw new AssertionError(); }
    public String getPackageName() { throw new AssertionError(); }
    public void startActivity(Intent intent) { throw new AssertionError(); }
}
""",
    "android/app/Activity.java": """
package android.app;
public class Activity extends android.content.Context {}
""",
    "android/content/pm/PackageManager.java": """
package android.content.pm;
public class PackageManager {
    public android.content.Intent getLaunchIntentForPackage(String name) { throw new AssertionError(); }
}
""",
    "android/content/Intent.java": """
package android.content;
public class Intent {
    public static final String ACTION_VIEW = "android.intent.action.VIEW";
    public static final int FLAG_ACTIVITY_NEW_TASK = 0x10000000;
    public Intent(Context context, Class<?> type) { throw new AssertionError(); }
    public Intent(String action, android.net.Uri uri) { throw new AssertionError(); }
    public Intent putExtra(String key, String value) { throw new AssertionError(); }
    public Intent setPackage(String name) { throw new AssertionError(); }
    public Intent setFlags(int flags) { throw new AssertionError(); }
}
""",
    "android/net/Uri.java": """
package android.net;
public class Uri {
    public static Uri parse(String value) { throw new AssertionError(); }
}
""",
    "androidx/annotation/NonNull.java": """
package androidx.annotation;
public @interface NonNull {}
""",
    "app/morphe/extension/shared/Logger.java": """
package app.morphe.extension.shared;
public class Logger {
    public interface LogMessage { String buildMessageString(); }
    public static void printDebug(LogMessage message) {}
    public static void printException(LogMessage message, Throwable error) {}
}
""",
    "app/morphe/extension/shared/Utils.java": """
package app.morphe.extension.shared;
public class Utils {
    public static android.content.Context getContext() { throw new AssertionError(); }
    public static void runOnBackgroundThread(Runnable runnable) { throw new AssertionError(); }
}
""",
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--java-home", default=os.environ.get("JAVA_HOME"))
    args = parser.parse_args()

    def tool(name):
        executable = name + (".exe" if os.name == "nt" else "")
        found = str(Path(args.java_home) / "bin" / executable) if args.java_home else shutil.which(executable)
        if not found or not Path(found).is_file():
            parser.error(f"Cannot find {name}; set JAVA_HOME or pass --java-home for a JDK 11+")
        return found

    project = Path(__file__).resolve().parent.parent
    relative_package = Path("app/morphe/extension/shared/fixes/slink")
    production = project / "extensions/shared/library/src/main/java" / relative_package
    tests = project / "test/java" / relative_package
    sources = [production / name for name in (
        "BaseFixSLinksPatch.java", "RedditSLink.java", "ResolveResult.java"
    )] + [tests / name for name in ("RedditSLinkTest.java", "ResolverCredentialBoundaryTest.java")]
    with tempfile.TemporaryDirectory(prefix="sync-up-slink-tests-") as directory:
        temporary = Path(directory)
        classes = temporary / "classes"
        classes.mkdir()
        for name, contents in STUBS.items():
            path = temporary / "stubs" / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(contents, encoding="utf-8")
            sources.append(path)
        subprocess.run([tool("javac"), "--release", "11", "-d", str(classes), *map(str, sources)], check=True)
        for name in ("RedditSLinkTest", "ResolverCredentialBoundaryTest"):
            subprocess.run([tool("java"), "-cp", str(classes),
                            "app.morphe.extension.shared.fixes.slink." + name], check=True)


if __name__ == "__main__":
    main()
