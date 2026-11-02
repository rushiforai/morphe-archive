"""Execute the real refresh loop with deterministic Android/native boundaries."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCES = ROOT / 'extensions/wuplay/src/main/java/nl/johninnl/wuplay'


class WuplayRefreshTests(unittest.TestCase):
    def test_deselection_during_fetch_skips_remaining_native_requests(self):
        stubs = {
            'android/content/SharedPreferences.java': '''package android.content; import java.util.*;
public interface SharedPreferences { Set<String> getStringSet(String k,Set<String> fallback); Editor edit();
interface Editor { Editor putString(String k,String v); Editor putLong(String k,long v); void apply(); } }''',
            'android/content/Context.java': '''package android.content; import android.content.pm.PackageManager;
public class Context { public static final int MODE_PRIVATE=0; public SharedPreferences prefs;
public SharedPreferences getSharedPreferences(String n,int mode){return prefs;}
public PackageManager getPackageManager(){return new PackageManager();} }''',
            'android/content/pm/PackageManager.java': '''package android.content.pm;
public class PackageManager { public static final String FEATURE_LEANBACK="leanback";
public boolean hasSystemFeature(String feature){return true;} }''',
            'android/app/Activity.java': 'package android.app; public class Activity {}',
            'android/app/Application.java': '''package android.app; import android.os.Bundle;
public class Application extends android.content.Context {
public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks callback){}
public interface ActivityLifecycleCallbacks {void onActivityResumed(Activity a);void onActivityPaused(Activity a);
void onActivityCreated(Activity a,Bundle b);void onActivityStarted(Activity a);void onActivityStopped(Activity a);
void onActivitySaveInstanceState(Activity a,Bundle b);void onActivityDestroyed(Activity a);} }''',
            'android/os/Build.java': 'package android.os; public class Build { public static class VERSION {public static final int SDK_INT=36;} }',
            'android/os/Bundle.java': 'package android.os; public class Bundle {}',
            'android/os/Looper.java': 'package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}',
            'android/os/Handler.java': '''package android.os; public class Handler {public Handler(Looper l){}
public void removeCallbacks(Runnable r){} public void postDelayed(Runnable r,long delay){} }''',
            'android/util/Log.java': '''package android.util; public class Log {
public static int i(String t,String m){return 0;} public static int w(String t,String m){return 0;} }''',
            'nl/johninnl/wuplay/NativeCatalogs.java': '''package nl.johninnl.wuplay; import java.util.*;
class NativeCatalogs {static int fetches; static Runnable duringFetch;
static Set<String> home=new HashSet<>(Arrays.asList("a","b"));
NativeCatalogs(android.app.Application app){} static class Definition {final String key;
Definition(String key){this.key=key;}} static class Snapshot {String profileId="default";
List<Definition> definitions=new ArrayList<>();Snapshot(){for(String key:Arrays.asList("a","b"))if(home.contains(key))definitions.add(new Definition(key));}}
Snapshot snapshot(){return new Snapshot();} void requireDefault(String p){}
boolean isHome(String profile,String key){return home.contains(key);}
List<?> fetch(Snapshot s,Definition d){fetches++;duringFetch.run();return Collections.emptyList();} }''',
            'nl/johninnl/wuplay/CatalogPublisher.java': '''package nl.johninnl.wuplay; import java.util.*;
class CatalogPublisher {static int publications;static Set<String> lastDesired;CatalogPublisher(android.content.Context c){}
void removeUnselected(Set<String> desired){lastDesired=new HashSet<>(desired);} void publish(NativeCatalogs.Definition d,List<?> items){publications++;} }''',
            'nl/johninnl/wuplay/RefreshProbe.java': '''package nl.johninnl.wuplay;
import android.app.Application; import android.content.SharedPreferences; import java.util.*;
public class RefreshProbe {static class Prefs implements SharedPreferences,SharedPreferences.Editor {
Set<String> selected=new HashSet<>(Arrays.asList("a","b"));
public Set<String> getStringSet(String k,Set<String> fallback){return selected;}
public Editor edit(){return this;} public Editor putString(String k,String v){return this;}
public Editor putLong(String k,long v){return this;}public void apply(){} }
public static void main(String[] args){ Application app=new Application();Prefs prefs=new Prefs();app.prefs=prefs;
NativeCatalogs.duringFetch=()->prefs.selected=Collections.emptySet();CatalogChannels.refresh(app);
if(NativeCatalogs.fetches!=1)throw new AssertionError("Started "+NativeCatalogs.fetches+" requests after deselection");
if(CatalogPublisher.publications!=0)throw new AssertionError("Published a deselected catalog");
prefs.selected=new HashSet<>(Arrays.asList("a","b"));NativeCatalogs.home=new HashSet<>(Arrays.asList("a"));
NativeCatalogs.fetches=CatalogPublisher.publications=0;NativeCatalogs.duringFetch=()->{};CatalogChannels.refresh(app);
if(NativeCatalogs.fetches!=1||CatalogPublisher.publications!=1||!CatalogPublisher.lastDesired.equals(Set.of("a")))throw new AssertionError("Legacy non-Home selection was published or retained");
NativeCatalogs.home=new HashSet<>(Arrays.asList("a","b"));NativeCatalogs.fetches=CatalogPublisher.publications=0;
NativeCatalogs.duringFetch=()->NativeCatalogs.home.clear();CatalogChannels.refresh(app);
if(NativeCatalogs.fetches!=1||CatalogPublisher.publications!=0||!CatalogPublisher.lastDesired.isEmpty())throw new AssertionError("Home visibility change during fetch was ignored");
} }''',
        }
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)
            for name, source in stubs.items():
                path = out / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(source)
            command = ['javac', '-d', str(out), str(SOURCES / 'CatalogChannels.java')]
            command += [str(path) for path in out.rglob('*.java')]
            subprocess.run(command, check=True, capture_output=True)
            result = subprocess.run(['java', '-cp', str(out), 'nl.johninnl.wuplay.RefreshProbe'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
