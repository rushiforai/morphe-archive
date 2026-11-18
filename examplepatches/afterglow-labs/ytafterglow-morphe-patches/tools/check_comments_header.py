#!/usr/bin/env python3
"""Verify comments-only ownership and native fallback for the pinned-header policy."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
STUBS = {
    'app/afterglow/extension/Afterglow.java': 'package app.afterglow.extension; public class Afterglow {public static int errors;public static void error(String tag,Throwable e){errors++;}}',
    'app/afterglow/extension/InstalledTweaks.java': 'package app.afterglow.extension; public class InstalledTweaks {public static boolean installed;public static boolean has(String key){if(!key.equals("comments-header"))throw new AssertionError(key);return installed;}}',
    'app/afterglow/extension/settings/AfterglowPrefs.java': 'package app.afterglow.extension.settings; public class AfterglowPrefs {public static int mode,reads;public static boolean fail;public static int getInt(String key){reads++;if(!key.equals("commentsHeaderMode"))throw new AssertionError(key);if(fail)throw new IllegalStateException();return mode;}}',
}
with tempfile.TemporaryDirectory(prefix='afterglow-comments-header-') as directory:
    temp = Path(directory)
    sources = []
    for name, body in STUBS.items():
        path = temp/name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(body)
        sources.append(path)
    classes = temp/'classes'
    classes.mkdir()
    subprocess.run(['javac', '-encoding', 'UTF-8', '-sourcepath', str(EXT), '-d', str(classes),
                    *map(str, sources), str(ROOT/'tools/jvm/CommentsHeaderTest.java')], check=True)
    subprocess.run(['java', '-cp', str(classes), 'app.afterglow.extension.interfaceui.CommentsHeaderTest'], check=True, timeout=30)
