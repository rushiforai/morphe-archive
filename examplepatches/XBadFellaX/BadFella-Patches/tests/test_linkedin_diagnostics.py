"""Execute privacy, capture lifecycle and scrolling-cache checks on production Java."""
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest

import test_linkedin_regressions as regressions

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extensions/extension/src/main/java/app/badfella/extension/linkedin"

STUBS = {
 "android/content/Context.java": '''package android.content; public class Context {
 public static java.io.File files;
 public Context getApplicationContext(){return this;}
 public java.io.File getFilesDir(){return files;}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public String getPackageName(){return "com.linkedin.android";}
 }''',
 "android/content/SharedPreferences.java": '''package android.content; public interface SharedPreferences {
 java.util.Map<String,?> getAll(); }''',
 "android/content/pm/PackageInfo.java": '''package android.content.pm; public class PackageInfo {
 public String versionName="4.1.1271"; public long getLongVersionCode(){return 217900;} }''',
 "android/content/pm/PackageManager.java": '''package android.content.pm; public class PackageManager {
 public PackageInfo getPackageInfo(String p,int flags){return new PackageInfo();} }''',
 "android/os/Build.java": '''package android.os; public class Build {
 public static String MANUFACTURER="test",MODEL="test-phone";
 public static String[] SUPPORTED_ABIS={"arm64-v8a"};
 public static class VERSION {public static int SDK_INT=29; public static String RELEASE="10";}}
 ''',
 "android/os/Bundle.java": "package android.os; public class Bundle {}",
 "android/os/Looper.java": "package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}",
 "android/os/Handler.java": '''package android.os; public class Handler {
 public static java.util.List<Runnable> tasks=new java.util.ArrayList<>(); public Handler(Looper l){}
 public boolean postDelayed(Runnable r,long delay){if(delay!=20000)throw new AssertionError(); tasks.add(r);return true;}
 public void removeCallbacks(Runnable r){tasks.remove(r);}
 public static void finish(){for(Runnable r:new java.util.ArrayList<>(tasks))r.run();}}
 ''',
 "android/os/HandlerThread.java": '''package android.os; public class HandlerThread {
 public static int quit; public HandlerThread(String n){} public void start(){}
 public Looper getLooper(){return new Looper();} public boolean quitSafely(){quit++;return true;}}
 ''',
 "android/os/SystemClock.java": "package android.os; public class SystemClock {public static long now; public static long elapsedRealtime(){return now;}}",
 "android/app/Application.java": '''package android.app; public class Application extends android.content.Context {
 public ActivityLifecycleCallbacks callbacks;
 public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks c){callbacks=c;}
 public void unregisterActivityLifecycleCallbacks(ActivityLifecycleCallbacks c){if(callbacks!=c)throw new AssertionError();callbacks=null;}
 public interface ActivityLifecycleCallbacks {
 void onActivityCreated(Activity a,android.os.Bundle b);void onActivityStarted(Activity a);void onActivityResumed(Activity a);
 void onActivityPaused(Activity a);void onActivityStopped(Activity a);void onActivitySaveInstanceState(Activity a,android.os.Bundle b);void onActivityDestroyed(Activity a);}}
 ''',
 "android/app/Activity.java": '''package android.app; public class Activity extends android.content.Context {
 public final android.view.Window window=new android.view.Window();
 public android.view.Window getWindow(){return window;}
 public android.view.WindowManager getWindowManager(){return new android.view.WindowManager();}}
 ''',
 "android/view/WindowManager.java": '''package android.view; public class WindowManager {
 public Display getDefaultDisplay(){return new Display();} public static class Display {public float getRefreshRate(){return 90;}}}
 ''',
 "android/view/Window.java": '''package android.view; public class Window {
 public interface OnFrameMetricsAvailableListener {void onFrameMetricsAvailable(Window w,FrameMetrics m,int dropped);}
 public OnFrameMetricsAvailableListener listener; public int removed;
 public void addOnFrameMetricsAvailableListener(OnFrameMetricsAvailableListener l,android.os.Handler h){listener=l;}
 public void removeOnFrameMetricsAvailableListener(OnFrameMetricsAvailableListener l){if(listener!=l)throw new AssertionError();listener=null;removed++;}}
 ''',
 "android/view/FrameMetrics.java": '''package android.view; public class FrameMetrics {
 public static final int TOTAL_DURATION=0,DEADLINE=1,FIRST_DRAW_FRAME=2;
 private final long[] values; public FrameMetrics(long duration,long deadline,long first){values=new long[]{duration,deadline,first};}
 public long getMetric(int key){return values[key];}}
 ''',
}

class LinkedInDiagnosticsTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  regressions.LinkedInRegressionTests.setUpClass()
  cls.addClassCleanup(regressions.LinkedInRegressionTests.doClassCleanups)
  cls.java,cls.android=regressions.LinkedInRegressionTests.java,regressions.LinkedInRegressionTests.android
  directory=tempfile.TemporaryDirectory(prefix="linkedin-diagnostics-");cls.addClassCleanup(directory.cleanup)
  cls.work=Path(directory.name)
  stubs=dict(STUBS)
  methods=set(re.findall(r"Settings\.(\w+)\(", (SOURCE/"SduiComponentFilter.java").read_text()))-{"debug","debugLog","mutedWords"}
  stubs["app/badfella/extension/linkedin/Boundaries.java"]='''package app.badfella.extension.linkedin;
class Settings {
 static final String DEBUG_LOGGING="debug_logging",MUTED_WORDS="muted_words",DOWNLOAD_FOLDER="download_folder";
 static boolean enabled=true; static java.util.Map<String,Object> values=new java.util.HashMap<>();
 static boolean debug(){return enabled;} static void debugLog(String s){Diagnostics.debug(s);}
 static String patchesVersion(){return "1.5.0-dev.2";} static String mutedWords(){return "";}
 static android.content.SharedPreferences prefs(){return () -> values;}
'''+"".join(" static boolean "+name+"(){return false;}\n" for name in sorted(methods))+'''}
class SettingsActivity extends android.app.Activity {static Object[][] patches(){return new Object[][]{{"Hide ads",true}};}}
class SduiMediaDownload {static String resumedScreen(){return "";} static void offer(ProtoScanner s,String n,boolean b){}}
class MoreMenu {static final String MORE_SCREEN="more";static void capture(byte[] b){}static boolean hideItem(String s){return false;}}
class CopyPostText {static void onComponent(Object o,String n){}}
class ViewerChrome {static Object rewrite(Object o,String n,String s,byte[] b){return o;}}
class PostMenu {static Object inject(Object o,byte[] b){return o;}static void remember(byte[] b){}}
class ShortLinkResolver {static final String PREFIX="https://lnkd.in/";}
class OpenLinksDirectlyPatch {static void prefetchShortLinks(String s){}}
'''
  paths=[]
  for name,code in stubs.items():
   path=cls.work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding="utf8");paths.append(path)
  paths += [SOURCE/name for name in ("Diagnostics.java","PerformanceCapture.java","SduiComponentFilter.java","Proto.java","ProtoEdit.java","ProtoScanner.java")]
  paths.append(ROOT/"tests/LinkedInDiagnosticsCheck.java")
  javac=cls.java.with_name("javac.exe" if os.name=="nt" else "javac")
  result=subprocess.run([str(javac),"-cp",str(cls.android),"-d",str(cls.work),*map(str,paths)],capture_output=True,text=True)
  if result.returncode:raise RuntimeError(result.stdout+result.stderr)

 def check(self,case):
  result=subprocess.run([str(self.java),"-cp",str(self.work)+os.pathsep+str(self.android),"app.badfella.extension.linkedin.LinkedInDiagnosticsCheck",case,str(self.work)],capture_output=True,text=True,timeout=30)
  self.assertEqual(result.returncode,0,result.stdout+result.stderr)

 def test_account_content_and_custom_preferences_never_enter_report(self):self.check("privacy")
 def test_capture_lifecycle_refresh_budget_and_disabled_state(self):self.check("capture")
 def test_component_cache_reuses_storage_without_stale_values(self):self.check("memo")
