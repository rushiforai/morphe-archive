"""Exercise ported algorithms and production theme mapping with Android boundaries mocked."""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

import test_linkedin_regressions as regressions

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/extension/src/main/java/app/badfella/extension/linkedin'

BOUNDARIES = {
    'android/os/Build.java': '''package android.os;
public class Build {
 public static class VERSION { public static int SDK_INT = Integer.getInteger("test.sdk", 33); }
 public static class VERSION_CODES { public static final int Q=29, S=31, UPSIDE_DOWN_CAKE=34; }
}''',
    'android/content/res/Resources.java': '''package android.content.res;
public class Resources {
 public static Resources getSystem() { return new Resources(); }
 public int getColor(int id, Theme theme) {
  if(android.os.Build.VERSION.SDK_INT < 31) throw new AssertionError("Unavailable wallpaper resource");
  return 0xFF123456;
 }
 public Configuration getConfiguration() { throw new AssertionError("Unexpected configuration access"); }
 public static class Theme {}
}''',
    'android/content/Context.java': '''package android.content;
public class Context {
 public android.content.res.Resources getResources() { return android.content.res.Resources.getSystem(); }
 public Context createConfigurationContext(android.content.res.Configuration c) { return this; }
}''',
    'android/animation/ValueAnimator.java': '''package android.animation;
public class ValueAnimator {
 public static ValueAnimator last; public long duration; private float value; private AnimatorUpdateListener listener;
 public interface AnimatorUpdateListener { void onAnimationUpdate(ValueAnimator a); }
 public static ValueAnimator ofFloat(float... values) { return last = new ValueAnimator(); }
 public ValueAnimator setDuration(long ms) { duration=ms; return this; }
 public void setInterpolator(android.animation.TimeInterpolator t) {}
 public void addUpdateListener(AnimatorUpdateListener l) { listener=l; }
 public Object getAnimatedValue() { return value; }
 public void start() { frame(0); } public void cancel() {}
 public void frame(float v) { value=v; listener.onAnimationUpdate(this); }
}''',
    'app/badfella/extension/linkedin/Boundary.java': '''package app.badfella.extension.linkedin;
class Settings {
 static int seed=-1; static boolean enabled=true;
 static boolean materialYou() { return enabled; } static int accentColor() { return seed; }
 static boolean pitchBlack() { return false; } static boolean removeGapsAndDividers() { return false; }
 static android.content.Context context() { return null; }
}
class Diagnostics { static void error(String s, Throwable t) {} static void debug(String s) {} }
''',
}


class LinkedInUpstreamTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Reuse the existing JDK/SDK selection; its own regression suite remains unchanged.
        regressions.LinkedInRegressionTests.setUpClass()
        cls.addClassCleanup(regressions.LinkedInRegressionTests.doClassCleanups)
        cls.java, cls.android = regressions.LinkedInRegressionTests.java, regressions.LinkedInRegressionTests.android
        directory = tempfile.TemporaryDirectory(prefix='linkedin-upstream-')
        cls.addClassCleanup(directory.cleanup)
        cls.work = Path(directory.name)
        files = []
        for name, code in BOUNDARIES.items():
            path = cls.work / name; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(code, encoding='utf8'); files.append(path)
        files += [SOURCE / name for name in ('AccentPalette.java','MenuIconIds.java','SlidingPill.java',
                  'MaterialYou.java','ProtoEdit.java','ProtoScanner.java','Reflect.java')]
        files.append(ROOT / 'tests/LinkedInUpstreamCheck.java')
        javac = cls.java.with_name('javac.exe' if os.name == 'nt' else 'javac')
        result = subprocess.run([str(javac), '-cp', str(cls.android), '-d', str(cls.work), *map(str, files)],
                                capture_output=True, text=True)
        if result.returncode: raise RuntimeError(result.stdout + result.stderr)

    def run_check(self, case, sdk=33):
        result = subprocess.run([str(self.java), f'-Dtest.sdk={sdk}', '-cp',
                                str(self.work)+os.pathsep+str(self.android),
                                'app.badfella.extension.linkedin.LinkedInUpstreamCheck',case],
                                capture_output=True, text=True, timeout=30)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)

    def test_custom_accent_android_10(self): self.run_check('palette',29)
    def test_custom_accent_and_wallpaper_android_13(self): self.run_check('palette',33)
    def test_menu_icon_rewriting(self): self.run_check('icons')
    def test_spring_animation_states(self): self.run_check('spring')
