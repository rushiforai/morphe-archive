"""Run production Java against synthetic payloads and a failing localhost PDF endpoint."""
import os
import re
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/extension/src/main/java/app/badfella/extension/linkedin'

# Only Android boundary calls are mocked; parsing, downloads, scheduling and cleanup are production code.
STUBS = {
    'android/content/Context.java': '''package android.content;
public class Context {
 protected final java.io.File cache;
 public Context(java.io.File cache) { this.cache = cache; }
 public Context getApplicationContext() { return this; }
 public java.io.File getCacheDir() { return cache; }
 public ContentResolver getContentResolver() { throw new AssertionError("Unexpected MediaStore write"); }
}''',
    'android/app/Activity.java': '''package android.app;
public class Activity extends android.content.Context {
 public Activity(java.io.File cache) { super(cache); }
}''',
    'android/os/Looper.java': '''package android.os;
public class Looper { public static Looper getMainLooper() { return new Looper(); } }''',
    'android/os/Handler.java': '''package android.os;
public class Handler {
 public Handler(Looper looper) {}
 public boolean post(Runnable task) { task.run(); return true; }
}''',
    'app/badfella/extension/linkedin/Boundaries.java': '''package app.badfella.extension.linkedin;
class Settings {
 static boolean postMenu() { return true; }
 static boolean downloadMedia() { return true; }
 static String downloadFolder() { return ""; }
 static void debugLog(String value) {}
}
class Downloads { static void toast(android.content.Context c, String s) {} }
class Diagnostics { static volatile int errors; static void error(String s, Throwable t) { errors++; } }
class I18n { static String f(String s, Object... args) { return String.format(s, args); } }
class SduiMediaDownload { static void offerDocument(DocumentPdf.Doc doc) {} }
''',
}


class LinkedInRegressionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        java_home = os.environ.get('JAVA_HOME')
        cls.java = Path(java_home) / 'bin/java' if java_home else Path(shutil.which('java') or '')
        if os.name == 'nt' and not java_home:
            cls.java = Path('C:/Program Files/Android/Android Studio/jbr/bin/java.exe')
        elif os.name == 'nt':
            cls.java = cls.java.with_suffix('.exe')
        javac = cls.java.with_name('javac.exe' if os.name == 'nt' else 'javac')
        sdk = Path(os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT') or
                   str(Path.home() / 'AppData/Local/Android/Sdk'))
        jars = [p for p in (sdk / 'platforms').glob('android-*/android.jar')
                if re.match(r'android-\d+', p.parent.name)]
        if not cls.java.is_file() or not javac.is_file() or not jars:
            raise RuntimeError('Java JDK and Android SDK platform are required for LinkedIn regression checks')
        cls.android = max(jars, key=lambda p: int(re.match(r'android-(\d+)', p.parent.name)[1]))
        cls.directory = tempfile.TemporaryDirectory(prefix='linkedin-regressions-')
        cls.addClassCleanup(cls.directory.cleanup)
        cls.work = Path(cls.directory.name)
        files = []
        for name, code in STUBS.items():
            path = cls.work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding='utf8')
            files.append(path)
        files += [SOURCE / n for n in ('DocumentPdf.java', 'PostCommentary.java', 'ProtoEdit.java', 'ProtoScanner.java')]
        files.append(ROOT / 'tests/LinkedInRegressionCheck.java')
        result = subprocess.run([str(javac), '-cp', str(cls.android), '-d', str(cls.work), *map(str, files)],
                                capture_output=True, text=True)
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)

    def check_java(self, case):
        result = subprocess.run([str(self.java), '-cp', str(self.work) + os.pathsep + str(self.android),
                                 'app.badfella.extension.linkedin.LinkedInRegressionCheck', case],
                                capture_output=True, text=True, timeout=30)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_copy_post_text_without_tracking_metadata(self):
        self.check_java('copy')
        self.assertIn('post.text = PostCommentary.text(payload);', (SOURCE / 'PostMenu.java').read_text())

    def test_premium_hook_is_accessible_from_linkedin_navigation(self):
        with tempfile.TemporaryDirectory(prefix='linkedin-premium-access-') as directory:
            work = Path(directory)
            boundaries = work / 'Boundaries.java'
            boundaries.write_text('''package app.badfella.extension.linkedin;
class Settings {
 static boolean hidePremium() { return true; }
 static void debugLog(String message) {}
}
class Diagnostics { static void error(String message, Throwable failure) {} }
class SduiMediaDownload { static String resumedScreen() { return ""; } }
''', encoding='utf-8')
            caller = work / 'NavigationCaller.java'
            caller.write_text('''package com.linkedin.android.infra.navigation;
public class NavigationCaller {
 public boolean blocks(android.os.Bundle arguments) {
  return app.badfella.extension.linkedin.PremiumTakeover.blocksNavigation(arguments);
 }
}
''', encoding='utf-8')
            javac = self.java.with_name('javac.exe' if os.name == 'nt' else 'javac')
            result = subprocess.run(
                [str(javac), '-cp', str(self.android), '-d', str(work),
                 str(SOURCE / 'PremiumTakeover.java'), str(boundaries), str(caller)],
                capture_output=True, text=True, timeout=30)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_first_failed_slice_is_removed(self):
        self.check_java('1')

    def test_later_failed_slice_removes_previous_and_current_files(self):
        self.check_java('2')
