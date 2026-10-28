#!/usr/bin/env python3
"""Run the production settings framework on the JVM against real registries of all three apps.

    python3 tests/shared/test_settings.py                      # the stored registries (host suite)
    python3 tests/shared/test_settings.py <patched.apk> ...    # the registries inside patched APKs
    python3 tests/shared/test_settings.py --update <patched.apk> ...   # refresh tests/shared/registry/

Each app's settings patch writes SettingsScreen.json() into Settings.registryJson() as a dex string.
tests/shared/registry/<app>.json holds that string as extracted from an APK patched with every patch
that registers settings (bin/patch <app> -- -e "<each patch not selected by default>", leaving out
Clone app and Change app name); --update rewrites them. The checks compile the real Settings, Registry and Logger against org.json and SharedPreferences
doubles (no Android SDK, APK or device) and cover:

- the JSON as SettingsScreen.json() writes it: unique keys, section order, titles sorted, each child
  right after its parent, choice defaults among the choices, switch defaults, restart flags;
- Registry.parse round trip: every field Java reads equals what Python reads from the same JSON;
- defaults, stored values and wrongly typed stored values for every registered key;
- failing closed: a missing, malformed, partly malformed or empty registry turns every switch off
  and every choice and text to "" (0 as a number), whatever was stored;
- ChatFilter keeps its keyword lists until a Lurk setting changes (Settings.changes()), reads them
  every time from preferences that take no listeners, and survives a vibrator that refuses;
- Logger.d follows Debug logging while i, w and blocked always write;
- Pause Lurk: every switch off from the next start except the ones marked to keep, nothing stored
  changes, unpausing needs a restart, Reset to defaults unpauses;
- the crash guard: three crashes in a row within a minute of starting pause Lurk, a later crash
  doesn't count, a minute of running ends the streak, every crash is passed on;
- the restart bar: offered while a restart-flagged setting or the pause differs from the start;
- Export and Import settings: every setting written with its type, re-importing changes nothing,
  export-change-import restores every value, bad values and unknown keys are listed, not applied;
- the bug report URL: the form's fields, every switch under On or Off, list contents never sent;
- the launcher shortcut: on Android 11+ pushed back over the app's own conversation shortcuts on every start;
  before that added once and refreshed when its label or the versions changed.
"""
import json
import re
import sys
import tempfile
import zipfile
from pathlib import Path

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
from host_java import PACKAGE, run  # noqa: E402
from json_double import JSON_DOUBLE  # noqa: E402

HERE = Path(__file__).resolve().parent
REGISTRIES = HERE / 'registry'
SECTIONS = ['Privacy', 'Interface', 'Playback', 'Chat', 'Premium', 'Advanced']
SETTINGS = PACKAGE + 'settings/'

# Platform boundaries the settings classes touch. Context hands out map-backed preferences per name.
ANDROID = {
    'android/util/Log.java': '''package android.util; public final class Log {
        public static final java.util.List<String> lines=new java.util.ArrayList<>();
        static int add(String level,String t,String m){lines.add(level+"/"+t+": "+m);return 0;}
        public static int d(String t,String m){return add("D",t,m);} public static int i(String t,String m){return add("I",t,m);}
        public static int w(String t,String m){return add("W",t,m);} public static int w(String t,String m,Throwable e){return add("W",t,m);}
        public static int e(String t,String m){return add("E",t,m);} public static int e(String t,String m,Throwable e){return add("E",t,m);} }''',
    'android/os/Bundle.java': 'package android.os; public class Bundle {}',
    'android/os/SystemClock.java': '''package android.os; public class SystemClock {public static long now=100_000;
        public static long uptimeMillis(){return now;} public static long elapsedRealtime(){return now;} }''',
    'android/os/Build.java': '''package android.os; public class Build {
        public static final String MANUFACTURER="Google",MODEL="Pixel Test";
        public static class VERSION {public static int SDK_INT=36; public static final String RELEASE="16";}
        public static class VERSION_CODES {public static final int N_MR1=25,O=26,P=28,Q=29,R=30,S=31,TIRAMISU=33;} }''',
    'android/content/Context.java': '''package android.content; public class Context {
        public static final int MODE_PRIVATE=0; public static final String ACCESSIBILITY_SERVICE="accessibility",AUDIO_SERVICE="audio";
        public static java.util.function.Function<String,SharedPreferences> preferences;
        public static java.util.function.Function<Class<?>,Object> services=c->null;
        public Object getSystemService(String s){return null;} public <T>T getSystemService(Class<T> c){return c.cast(services.apply(c));}
        public Object getContentResolver(){return null;}
        public android.content.res.Resources getResources(){return new android.content.res.Resources();}
        public SharedPreferences getSharedPreferences(String name,int mode){return preferences.apply(name);}
        public Context getApplicationContext(){return this;}
        public String getPackageName(){return "app.test";}
        public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
        public android.content.pm.ApplicationInfo getApplicationInfo(){return new android.content.pm.ApplicationInfo();}
        public void startActivity(Intent intent){} }''',
    'android/content/SharedPreferences.java': '''package android.content; public interface SharedPreferences {
        interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences p,String key);}
        interface Editor {Editor putString(String k,String v);Editor putInt(String k,int v);Editor putLong(String k,long v);
          Editor putBoolean(String k,boolean v);Editor remove(String k);Editor clear();boolean commit();void apply();}
        java.util.Map<String,?> getAll(); String getString(String k,String d); int getInt(String k,int d);
        long getLong(String k,long d); boolean getBoolean(String k,boolean d); boolean contains(String k); Editor edit();
        void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l);
        void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l); }''',
    'android/content/ComponentName.java': 'package android.content; public class ComponentName {}',
    'android/content/Intent.java': '''package android.content; public class Intent {
        public static final String ACTION_VIEW="android.intent.action.VIEW"; public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000;
        public Intent(){} public Intent(String a){} public Intent(Context c,Class<?> t){}
        public Intent addFlags(int f){return this;} public Intent setClassName(Context c,String n){return this;}
        public ComponentName getComponent(){return null;}
        public static Intent makeRestartActivityTask(ComponentName c){return new Intent();} }''',
    'android/content/pm/PackageManager.java': '''package android.content.pm; public class PackageManager {
        public static String versionName="31.7.0";
        public static class NameNotFoundException extends Exception {}
        public android.content.Intent getLaunchIntentForPackage(String p){return null;}
        public PackageInfo getPackageInfo(String p,int flags)throws NameNotFoundException{
          PackageInfo info=new PackageInfo();info.versionName=versionName;return info;} }''',
    'android/content/pm/PackageInfo.java': 'package android.content.pm; public class PackageInfo {public String versionName;}',
    'android/content/pm/ApplicationInfo.java': 'package android.content.pm; public class ApplicationInfo {public int icon;}',
    'android/content/pm/ShortcutInfo.java': '''package android.content.pm; public class ShortcutInfo {
        public String id="";public CharSequence shortLabel,longLabel;public int rank=-1;
        public String getId(){return id;} public CharSequence getShortLabel(){return shortLabel;}
        public CharSequence getLongLabel(){return longLabel;} public int getRank(){return rank;}
        public static class Builder {final ShortcutInfo info=new ShortcutInfo();
          public Builder(android.content.Context c,String id){info.id=id;}
          public Builder setShortLabel(CharSequence s){info.shortLabel=s;return this;}
          public Builder setLongLabel(CharSequence s){info.longLabel=s;return this;}
          public Builder setRank(int r){info.rank=r;return this;}
          public Builder setIcon(android.graphics.drawable.Icon i){return this;} public Builder setIntent(android.content.Intent i){return this;}
          public ShortcutInfo build(){return info;}} }''',
    # Dynamic shortcuts in rank order; pushDynamicShortcut puts one first (replacing its ID) as Android 11+ does.
    'android/content/pm/ShortcutManager.java': '''package android.content.pm; public class ShortcutManager {
        public final java.util.List<ShortcutInfo> dynamic=new java.util.ArrayList<>();
        public int added,updated,pushed;
        public java.util.List<ShortcutInfo> getDynamicShortcuts(){return new java.util.ArrayList<>(dynamic);}
        public boolean addDynamicShortcuts(java.util.List<ShortcutInfo> s){added++;dynamic.addAll(s);return true;}
        public boolean updateShortcuts(java.util.List<ShortcutInfo> s){updated++;
          for(ShortcutInfo n:s)for(int i=0;i<dynamic.size();i++)if(dynamic.get(i).id.equals(n.id))dynamic.set(i,n);return true;}
        public void pushDynamicShortcut(ShortcutInfo s){pushed++;dynamic.removeIf(o->o.id.equals(s.id));dynamic.add(0,s);} }''',
    'android/os/Process.java': '''package android.os; public class Process {
        public static long start=100_000; public static int killed;
        public static long getStartElapsedRealtime(){return start;} public static int myPid(){return 1;}
        public static void killProcess(int pid){killed++;} }''',
    'android/graphics/drawable/Icon.java': '''package android.graphics.drawable; public class Icon {
        public static Icon createWithResource(android.content.Context c,int r){return new Icon();} }''',
    'android/app/Activity.java': '''package android.app; public class Activity extends android.content.ContextWrapper {
        public boolean isInPictureInPictureMode(){return false;} public android.view.Window getWindow(){return null;}
        public boolean isFinishing(){return false;} }''',
    'android/app/Application.java': '''package android.app; public class Application extends android.content.ContextWrapper {
        public interface ActivityLifecycleCallbacks {
          void onActivityCreated(Activity a,android.os.Bundle b); void onActivityStarted(Activity a);
          void onActivityResumed(Activity a); void onActivityPaused(Activity a); void onActivityStopped(Activity a);
          void onActivitySaveInstanceState(Activity a,android.os.Bundle b); void onActivityDestroyed(Activity a);}
        public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks c){} }''',
    # The screen itself is UI; Settings only names its class.
    SETTINGS + 'SettingsActivity.java': '''package io.github.jordanwoodson.extension.shared.settings;
        public class SettingsActivity extends android.app.Activity {}''',
    # Production classes replace the doubles other host tests use.
    SETTINGS + 'Settings.java': None,
    PACKAGE + 'Logger.java': None,
    # Package access for the probe, which lives in the default package.
    SETTINGS + 'Access.java': '''package io.github.jordanwoodson.extension.shared.settings;
        import java.lang.reflect.Field;
        public final class Access {
          public static Object parse(String json){return Registry.parse(json);}
          public static void install(Object registry)throws Exception{
            Field f=Settings.class.getDeclaredField("registry");f.setAccessible(true);f.set(null,registry);}
          public static void context(android.content.Context context)throws Exception{
            Field f=Settings.class.getDeclaredField("context");f.setAccessible(true);f.set(null,context);}
          public static boolean readable(Object r){return ((Registry)r).readable;}
          public static int size(Object r){return ((Registry)r).entries.size();}
          public static String name(Object r){Registry x=(Registry)r;return x.name+"\\u001f"+x.version+"\\u001f"+x.app;}
          public static String dump(Object r){
            StringBuilder out=new StringBuilder();
            for(Registry.Entry e:((Registry)r).entries){
              out.append(String.join("\\u001f",e.key,e.type,e.title,e.summary,e.section,String.valueOf(e.parent),
                e.defaultValue,String.valueOf(e.restart),String.valueOf(e.keepWhenPaused),
                String.join("\\u001e",e.choiceLabels),String.join("\\u001e",e.choiceValues)));
              out.append('\\n');}
            return out.toString();}
          public static String[][] entries(Object r){
            java.util.List<String[]> out=new java.util.ArrayList<>();
            for(Registry.Entry e:((Registry)r).entries)out.add(new String[]{e.key,e.type,e.defaultValue,
              e.choiceValues.length>1?e.choiceValues[e.choiceValues[0].equals(e.defaultValue)?1:0]:"",
              String.valueOf(e.restart),String.valueOf(e.keepWhenPaused)});
            return out.toArray(new String[0][]);}
          public static String getString(String key){return Settings.getString(key);}
          public static void putBoolean(String key,boolean value){Settings.putBoolean(key,value);}
          public static void putString(String key,String value){Settings.putString(key,value);}
          public static java.util.Map<String,String> values(){return Settings.values();}
          public static void putAll(java.util.Map<String,String> values){Settings.putAll(values);}
          public static void reset(){Settings.reset();}
          public static boolean pausedNow(){return Settings.pausedNow();}
          public static boolean pauseRequested(){return Settings.pauseRequested();}
          public static boolean autoPaused(){return Settings.autoPaused();}
          public static void setPaused(boolean paused){Settings.setPaused(paused);}
          public static boolean restartNeeded(){return Settings.restartNeeded();}
          public static boolean stored(String key){return Settings.storedBoolean(Settings.registry().get(key));}
          public static String export(String pkg)throws Exception{return Backup.export(Settings.registry(),Settings.values(),pkg);}
          public static Object[] plan(String text)throws Exception{
            Backup.Plan p=Backup.plan(text,Settings.registry(),Settings.values());
            return new Object[]{p.app,p.changes,p.lines,p.unchanged,p.skipped};}
          public static String report(boolean paused,String appVersion,String device){
            return Report.url(Settings.registry(),Settings.values(),paused,appVersion,device);}
          public static String reportSettings(boolean changedOnly){
            return Report.settings(Settings.registry(),Settings.values(),false,changedOnly);}
          public static void publishShortcut()throws Exception{
            java.lang.reflect.Method m=Settings.class.getDeclaredMethod("publishShortcut");m.setAccessible(true);m.invoke(null);}
          public static String keptWhenPaused(){
            StringBuilder out=new StringBuilder();
            for(Registry.Entry e:Settings.registry().entries)if(e.keepWhenPaused)out.append(e.key).append(',');
            return out.toString();}
        }''',
}

PROBE = r'''
import android.content.Context;
import android.content.SharedPreferences;
import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Access;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class SettingsProbe {
  /** SharedPreferences as Android implements it for the parts Settings uses: typed reads cast. */
  static class Preferences implements SharedPreferences {
    final Map<String,Object> values=new HashMap<>();
    final List<OnSharedPreferenceChangeListener> listeners=new ArrayList<>();
    int reads;
    public Map<String,?> getAll(){return new HashMap<>(values);}
    public String getString(String k,String d){reads++;Object v=values.get(k);return v==null?d:(String)v;}
    public int getInt(String k,int d){reads++;Object v=values.get(k);return v==null?d:(Integer)v;}
    public long getLong(String k,long d){reads++;Object v=values.get(k);return v==null?d:(Long)v;}
    public boolean getBoolean(String k,boolean d){reads++;Object v=values.get(k);return v==null?d:(Boolean)v;}
    public boolean contains(String k){return values.containsKey(k);}
    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listeners.add(l);}
    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listeners.remove(l);}
    public Editor edit(){
      Map<String,Object> pending=new HashMap<>();Set<String> removed=new HashSet<>();boolean[] clear={false};
      return new Editor(){
        public Editor putString(String k,String v){pending.put(k,v);return this;}
        public Editor putInt(String k,int v){pending.put(k,v);return this;}
        public Editor putLong(String k,long v){pending.put(k,v);return this;}
        public Editor putBoolean(String k,boolean v){pending.put(k,v);return this;}
        public Editor remove(String k){removed.add(k);return this;}
        public Editor clear(){clear[0]=true;return this;}
        public boolean commit(){
          Set<String> changed=new HashSet<>();
          if(clear[0]){changed.addAll(values.keySet());values.clear();}
          for(String k:removed){if(values.remove(k)!=null)changed.add(k);}
          for(Map.Entry<String,Object> e:pending.entrySet()){values.put(e.getKey(),e.getValue());changed.add(e.getKey());}
          for(String k:changed)for(OnSharedPreferenceChangeListener l:new ArrayList<>(listeners))l.onSharedPreferenceChanged(Preferences.this,k);
          return true;}
        public void apply(){commit();}
      };}
  }

  static final Map<String,Preferences> FILES=new HashMap<>();
  static int checks;
  static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
  static Preferences prefs(){return FILES.computeIfAbsent("lurk_settings",n->new Preferences());}
  static String read(String path)throws Exception{return new String(Files.readAllBytes(Paths.get(path)),StandardCharsets.UTF_8);}
  static Object install(String json)throws Exception{Object r=Access.parse(json);Access.install(r);return r;}

  public static void main(String[] args)throws Exception{
    Context.preferences=name->FILES.computeIfAbsent(name,n->new Preferences());
    String[] a=args[0].split("\\|");
    switch(a[0]){
      case "registry":registry(a[1],a[2]);break;
      case "defaults":Access.context(new Context());defaults(read(a[1]));break;
      case "stored":Access.context(new Context());stored(read(a[1]));break;
      case "nocontext":nocontext(read(a[1]));break;
      case "empty":Access.context(new Context());empty(a.length>1?read(a[1]):null);break;
      case "chatfilter":Access.context(new Context());chatFilter();break;
      case "logger":logger();break;
      case "pause":Access.context(new Context());pause(read(a[1]));break;
      case "crash":crash();break;
      case "restart":Access.context(new Context());restart(read(a[1]));break;
      case "backup":Access.context(new Context());backup(read(a[1]));break;
      case "report":Access.context(new Context());report(read(a[1]));break;
      case "shortcut":shortcut();break;
      default:throw new AssertionError(args[0]);
    }
    System.out.println("PASS settings "+a[0]+(a.length>1?" "+Paths.get(a[1]).getFileName():"")+": "+checks+" checks");
  }

  /** Registry.parse reads the JSON the patches wrote; Python compares every field with its own reading. */
  static void registry(String fixture,String dump)throws Exception{
    Object r=Access.parse(read(fixture));
    check(Access.readable(r),"registry unreadable");
    check(Access.size(r)>0,"registry empty");
    Files.write(Paths.get(dump),(Access.name(r)+"\n"+Access.dump(r)).getBytes(StandardCharsets.UTF_8));
  }

  /** With nothing stored, every registered key reads as its patch-time default. */
  static void defaults(String json)throws Exception{
    Object r=install(json);
    for(String[] e:Access.entries(r)){
      String key=e[0],type=e[1],def=e[2];
      check(Settings.isRegistered(key),key+" not registered");
      if(type.equals("switch")){
        check(def.equals("true")||def.equals("false"),key+": switch default "+def);
        check(Settings.isEnabled(key)==Boolean.parseBoolean(def),key+": default not read");
        check(Settings.getText(key).equals(def),key+": a switch's text is its default");
      }else{
        check(!Settings.isEnabled(key),key+": a "+type+" is not a switch");
        check(Access.getString(key).equals(def),key+": default "+def+" read as "+Access.getString(key));
        check(Settings.getText(key).equals(def),key+": text");
        int number;try{number=Integer.parseInt(def);}catch(NumberFormatException x){number=0;}
        check(Settings.getInt(key)==number,key+": number");
      }
    }
    unknownIsOff();
  }

  /** Values changed on the screen win over defaults; a value stored with the wrong type falls back. */
  static void stored(String json)throws Exception{
    Object r=install(json);
    Preferences p=prefs();
    for(String[] e:Access.entries(r)){
      String key=e[0],type=e[1],def=e[2],other=e[3];
      if(type.equals("switch")){
        boolean flipped=!Boolean.parseBoolean(def);
        p.edit().putBoolean(key,flipped).apply();
        check(Settings.isEnabled(key)==flipped,key+": stored switch not read");
        p.edit().putString(key,"oops").apply();
        check(Settings.isEnabled(key)==Boolean.parseBoolean(def),key+": wrongly typed switch didn't fall back");
      }else if(type.equals("choice")){
        check(!other.isEmpty(),key+": a choice needs two values");
        p.edit().putString(key,other).apply();
        check(Access.getString(key).equals(other),key+": stored choice not read");
        int number;try{number=Integer.parseInt(other);}catch(NumberFormatException x){number=0;}
        check(Settings.getInt(key)==number,key+": stored choice as a number");
        p.edit().putBoolean(key,true).apply();
        check(Access.getString(key).equals(def),key+": wrongly typed choice didn't fall back");
      }else{
        p.edit().putString(key,"a, b").apply();
        check(Settings.getText(key).equals("a, b"),key+": stored text not read");
      }
    }
    // Values stored for keys this registry doesn't have stay unread.
    p.edit().putBoolean("lurk_test_unregistered",true).putString("lurk_test_choice","5").apply();
    unknownIsOff();
  }

  /** Before the app has a Context (content providers, probes) the defaults apply. */
  static void nocontext(String json)throws Exception{
    Object r=install(json);
    for(String[] e:Access.entries(r)){
      if(e[1].equals("switch"))check(Settings.isEnabled(e[0])==Boolean.parseBoolean(e[2]),e[0]+": default without context");
      else check(Access.getString(e[0]).equals(e[2]),e[0]+": default without context");
    }
    unknownIsOff();
  }

  /** Any registry that can't be read in full is empty and turns everything off, whatever was stored. */
  static void empty(String valid)throws Exception{
    List<String> broken=new ArrayList<>(Arrays.asList(null,"","{","[]","{\"settings\":[]}","{\"settings\":{}}",
      "{\"name\":\"Lurk\",\"settings\":[{\"key\":\"a\"}]}"));
    if(valid!=null){
      // One damaged entry spoils the whole registry: all or nothing.
      broken.add(valid.replaceFirst("\"type\":\"switch\"","\"tipe\":\"switch\""));
      broken.add(valid.substring(0,valid.length()/2));
    }
    Set<String> keys=new TreeSet<>(Arrays.asList("lurk_test_on","block_ads","disable_analytics","sleep_timer","video_quality"));
    if(valid!=null)for(String[] e:Access.entries(Access.parse(valid)))keys.add(e[0]);
    Preferences p=prefs();
    for(String key:keys)p.edit().putBoolean(key,true).apply();
    for(String json:broken){
      Object r=install(json);
      check(!Access.readable(r),"readable: "+json);
      check(Access.size(r)==0,"entries survived: "+json);
      for(String key:keys){
        check(!Settings.isRegistered(key),key+" registered in a broken registry");
        check(!Settings.isEnabled(key),key+" on in a broken registry");
      }
      for(String key:keys)p.edit().putString(key,"5").apply();
      for(String key:keys){
        check(Access.getString(key).isEmpty(),key+": stored choice read from a broken registry");
        check(Settings.getInt(key)==0,key+": number from a broken registry");
        check(Settings.getText(key).isEmpty(),key+": text from a broken registry");
      }
      for(String key:keys)p.edit().putBoolean(key,true).apply();
    }
  }

  static String entry(String key,String type,String def,String parent){
    return "{\"key\":\""+key+"\",\"type\":\""+type+"\",\"title\":\""+key+"\",\"summary\":\"\",\"section\":\"Chat\","
      +"\"default\":\""+def+"\",\"parent\":"+(parent==null?"null":"\""+parent+"\"")+",\"restart\":false}";
  }

  /** Chat keyword lists are read once and kept until a Lurk setting changes; vibrating can't crash. */
  static void chatFilter()throws Exception{
    install("{\"name\":\"Lurk\",\"version\":\"1\",\"app\":\"Test\",\"settings\":["+String.join(",",
      entry("chat_keywords","switch","true",null),entry("chat_highlight_mentions","switch","true","chat_keywords"),
      entry("chat_highlight_words","text","","chat_keywords"),entry("chat_blocked_words","text","","chat_keywords"),
      entry("chat_blocked_users","text","","chat_keywords"),entry("lurk_test_other","switch","false",null))+"]}");
    Preferences p=prefs();
    check(Settings.changes()>=0,"preferences with listeners are watched");
    ChatFilter.Lists first=ChatFilter.lists("me","");
    p.reads=0;
    for(int i=0;i<100;i++)check(ChatFilter.lists("me","")==first,"lists rebuilt without a change");
    check(p.reads==0,"cached lists still read preferences "+p.reads+" times");
    p.edit().putString("chat_highlight_words","lurk").apply();
    ChatFilter.Lists changed=ChatFilter.lists("me","");
    check(changed!=first,"a changed highlight word kept the old lists");
    check(ChatFilter.classify("x","we lurk here",changed)==ChatFilter.HIGHLIGHT,"new word not highlighted");
    check(ChatFilter.classify("x","hi @me",changed)==ChatFilter.HIGHLIGHT,"mention not highlighted");
    p.edit().putBoolean("lurk_test_other",true).apply();
    ChatFilter.Lists unrelated=ChatFilter.lists("me","");
    check(ChatFilter.classify("x","we lurk here",unrelated)==ChatFilter.HIGHLIGHT,"unrelated change lost the word");
    p.reads=0;
    check(ChatFilter.lists("me","")==unrelated&&p.reads==0,"lists not cached after an unrelated change");
    check(ChatFilter.lists("you","").self.equals("you"),"another account kept the old lists");
    p.edit().putBoolean("chat_highlight_mentions",false).apply();
    check(ChatFilter.classify("x","hi @you",ChatFilter.lists("you",""))==ChatFilter.NONE,"mentions switched off still highlight");
    // Preferences that take no listeners (probe doubles) are read for every message.
    Preferences deaf=new Preferences(){
      @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){throw new UnsupportedOperationException();}};
    Context.preferences=name->deaf;
    Access.context(new Context());
    check(Settings.changes()==-1,"unwatchable preferences reported as watched");
    deaf.values.put("chat_highlight_words","quiet");
    check(ChatFilter.classify("x","be quiet",ChatFilter.lists("me",""))==ChatFilter.HIGHLIGHT,"unwatched change missed");
    deaf.values.put("chat_highlight_words","loud");
    check(ChatFilter.classify("x","be quiet",ChatFilter.lists("me",""))==ChatFilter.NONE,"unwatched change missed twice");
    // An app without the VIBRATE permission: the highlight stays, the vibration is skipped.
    int[] attempts={0};
    android.os.Vibrator vibrator=new android.os.Vibrator(){
      @Override public boolean hasVibrator(){return true;}
      @Override public void vibrate(android.os.VibrationEffect e){attempts[0]++;throw new SecurityException("Requires VIBRATE permission");}};
    android.os.VibratorManager manager=new android.os.VibratorManager(){@Override public android.os.Vibrator getDefaultVibrator(){return vibrator;}};
    Context.services=type->type==android.os.VibratorManager.class?manager:null;
    ChatFilter.vibrate(new Context(),"message-1");
    check(attempts[0]==1,"vibrate was not attempted");
  }

  /** Logger.d follows the Debug logging switch; i, w and blocked always write; reading the switch can't recurse. */
  static void logger()throws Exception{
    List<String> lines=android.util.Log.lines;
    // No context and no registry: reading the switch logs on the way (no context, no registry) without recursing.
    Access.context(null);Access.install(null);Logger.refresh();
    Logger.d("before anything");
    check(!lines.contains("D/lurk: before anything"),"d wrote before the switch could be read");
    check(lines.contains("W/lurk: settings: no registry, every patch is off"),"a missing registry isn't reported: "+lines);
    Access.context(new Context());
    install("{\"name\":\"Lurk\",\"version\":\"1\",\"app\":\"Test\",\"settings\":["+entry("debug_logging","switch","false",null)+"]}");
    Logger.refresh();
    Settings.changes();
    Logger.d("off");Logger.i("info");Logger.w("warn");Logger.w("warn2",new RuntimeException());Logger.blocked("tracker");
    check(!lines.contains("D/lurk: off"),"d wrote while Debug logging is off");
    check(lines.containsAll(Arrays.asList("I/lurk: info","W/lurk: warn","W/lurk: warn2","I/lurk: blocked: tracker")),"always-on lines missing: "+lines);
    Access.putBoolean("debug_logging",true);
    Logger.d("on");
    check(lines.contains("D/lurk: on"),"d didn't write after Debug logging was turned on");
    prefs().edit().putBoolean("debug_logging",false).apply();
    Logger.d("off again");
    check(!lines.contains("D/lurk: off again"),"d kept writing after a change seen by the listener");
    // A registry that can't be read turns Debug logging off with everything else.
    prefs().edit().putBoolean("debug_logging",true).apply();
    install("{\"settings\":[{\"key\":\"debug_logging\"}]}");Logger.refresh();
    Logger.d("broken");
    check(!lines.contains("D/lurk: broken"),"d wrote with an unreadable registry");
  }

  static Preferences state(){return FILES.computeIfAbsent("lurk_state",n->new Preferences());}
  static String registry(String... entries){
    return "{\"name\":\"Lurk\",\"version\":\"1.12.0\",\"app\":\"Test\",\"settings\":["+String.join(",",entries)+"]}";
  }

  /** Pause Lurk: every switch off from the next start except the kept ones; nothing stored changes. */
  static void pause(String json)throws Exception{
    Object r=install(json);
    Preferences p=prefs();
    String kept=Access.keptWhenPaused();
    // Store the opposite of every default, so the paused reading can't be a default by accident.
    Map<String,Boolean> stored=new HashMap<>();
    for(String[] e:Access.entries(r))if(e[1].equals("switch")){boolean v=!Boolean.parseBoolean(e[2]);p.values.put(e[0],v);stored.put(e[0],v);}
    for(String[] e:Access.entries(r))if(e[1].equals("choice")&&!e[3].isEmpty())p.values.put(e[0],e[3]);
    state().values.put("paused",true);
    check(Access.pausedNow()&&Access.pauseRequested()&&!Access.autoPaused(),"paused state not read");
    for(String[] e:Access.entries(r)){
      if(e[1].equals("switch")){
        boolean keep=kept.contains(e[0]+",");
        check(Settings.isEnabled(e[0])==(keep&&stored.get(e[0])),e[0]+": paused reading "+Settings.isEnabled(e[0])+" keep="+keep);
        check(Access.stored(e[0])==stored.get(e[0]),e[0]+": pausing changed the stored value");
      }else if(e[1].equals("choice")&&!e[3].isEmpty()){
        check(Access.getString(e[0]).equals(e[3]),e[0]+": a choice changed while paused");
      }
    }
    // Unpausing applies from the next start: this process stays paused and needs a restart.
    Access.setPaused(false);
    check(Access.pausedNow()&&!Access.pauseRequested(),"unpausing applied at once");
    check(Access.restartNeeded(),"no restart offered after unpausing");
    for(String[] e:Access.entries(r))if(e[1].equals("switch")&&!kept.contains(e[0]+","))check(!Settings.isEnabled(e[0]),e[0]+" on before the restart");
    // Reset forgets the pause too.
    Access.setPaused(true);Access.reset();
    check(!Access.pauseRequested(),"reset kept the pause");
    check(p.values.isEmpty(),"reset kept settings: "+p.values);
  }

  /** Three crashes in a row within a minute of starting pause Lurk; later ones and a minute of running don't count. */
  static void crash()throws Exception{
    Context context=new Context();
    install(registry(entry("block_ads","switch","true",null)));
    List<Throwable> passedOn=new ArrayList<>();
    Thread.setDefaultUncaughtExceptionHandler((t,e)->passedOn.add(e));
    android.os.Process.start=100_000;android.os.SystemClock.now=105_000;
    Settings.init(context);
    Thread.UncaughtExceptionHandler guard=Thread.getDefaultUncaughtExceptionHandler();
    check(guard!=null&&!guard.getClass().getName().startsWith("SettingsProbe"),"no crash guard installed");
    Settings.init(context);
    check(Thread.getDefaultUncaughtExceptionHandler()==guard,"a second init wrapped the guard again");
    Preferences s=state();
    RuntimeException boom=new RuntimeException("boom");
    guard.uncaughtException(Thread.currentThread(),boom);
    check(passedOn.size()==1&&passedOn.get(0)==boom,"the crash wasn't passed on");
    check(s.getInt("crash_streak",0)==1&&!Access.pauseRequested(),"first early crash: "+s.values);
    guard.uncaughtException(Thread.currentThread(),boom);
    check(s.getInt("crash_streak",0)==2&&!Access.pauseRequested(),"second early crash: "+s.values);
    // A crash after the first minute doesn't count, and doesn't end the streak either.
    android.os.SystemClock.now=100_000+60_000;
    guard.uncaughtException(Thread.currentThread(),boom);
    check(s.getInt("crash_streak",0)==2,"a late crash counted");
    android.os.SystemClock.now=110_000;
    guard.uncaughtException(Thread.currentThread(),boom);
    check(Access.pauseRequested()&&Access.autoPaused(),"three early crashes didn't pause: "+s.values);
    check(s.getInt("crash_streak",0)==0,"the streak survived the pause");
    check(passedOn.size()==4,"crashes weren't all passed on");
    check(android.util.Log.lines.stream().anyMatch(l->l.startsWith("W/lurk: Lurk paused itself")),"auto-pause not logged");
    // Turning Pause Lurk off forgets that Lurk paused itself.
    Access.setPaused(false);
    check(!Access.autoPaused()&&!Access.pauseRequested(),"unpausing kept the auto-pause");
    // A run that lasts a minute ends the streak (the main-thread callback init scheduled).
    s.edit().putInt("crash_streak",2).apply();
    android.os.Handler.advance(60_000);
    check(s.getInt("crash_streak",-1)==0,"a minute of running didn't end the streak");
    check(android.os.Process.killed==0,"the guard killed the process itself despite a previous handler");
  }

  /** The restart bar: a restart-flagged setting or Pause Lurk differs from what the process started with. */
  static void restart(String json)throws Exception{
    Object r=install(json);
    String flagged=null,plain=null;
    for(String[] e:Access.entries(r)){
      if(!e[1].equals("switch"))continue;
      boolean restart=Boolean.parseBoolean(e[4]);
      if(restart&&flagged==null)flagged=e[0];
      if(!restart&&plain==null)plain=e[0];
    }
    check(!Access.restartNeeded(),"restart offered before any change");
    if(plain!=null){Access.putBoolean(plain,!Access.stored(plain));check(!Access.restartNeeded(),plain+" isn't read at startup");}
    if(flagged!=null){
      boolean was=Access.stored(flagged);
      Access.putBoolean(flagged,!was);check(Access.restartNeeded(),flagged+" changed without a restart offered");
      Access.putBoolean(flagged,was);check(!Access.restartNeeded(),flagged+" changed back, restart still offered");
    }
    Access.setPaused(true);check(Access.restartNeeded(),"pausing needs a restart");
    Access.setPaused(false);check(!Access.restartNeeded(),"unpausing again still offers a restart");
  }

  /** Export writes every setting; importing the same file changes nothing; changes, bad values and unknown keys are listed. */
  @SuppressWarnings("unchecked")
  static void backup(String json)throws Exception{
    Object r=install(json);
    Map<String,String> before=Access.values();
    String file=Access.export("app.test");
    org.json.JSONObject root=new org.json.JSONObject(file);
    check(root.getInt("lurk")==1&&root.getString("app").length()>0&&root.getString("package").equals("app.test"),"export header: "+file);
    org.json.JSONObject settings=root.getJSONObject("settings");
    check(settings.length()==Access.size(r),"export left settings out");
    for(String[] e:Access.entries(r)){
      Object v=settings.get(e[0]);
      check(e[1].equals("switch")?v instanceof Boolean:v instanceof String,e[0]+": exported as "+v.getClass().getSimpleName());
    }
    Object[] same=(Object[])Access.plan(file);
    check(((Map<String,String>)same[1]).isEmpty()&&(Integer)same[3]==Access.size(r)&&((List<String>)same[4]).isEmpty(),"re-importing an export changes something");
    // Change everything that can change, then import the export: every value comes back.
    Map<String,String> other=new LinkedHashMap<>();
    for(String[] e:Access.entries(r)){
      if(e[1].equals("switch"))other.put(e[0],String.valueOf(!Boolean.parseBoolean(before.get(e[0]))));
      else if(e[1].equals("choice")&&!e[3].isEmpty())other.put(e[0],before.get(e[0]).equals(e[3])?e[2]:e[3]);
      else if(e[1].equals("text"))other.put(e[0],"lurk test");
    }
    Access.putAll(other);
    check(!Access.values().equals(before),"putAll changed nothing");
    Object[] back=(Object[])Access.plan(file);
    Map<String,String> changes=(Map<String,String>)back[1];
    check(changes.size()==other.size(),"import would change "+changes.size()+" of "+other.size());
    check(((List<String>)back[2]).size()==changes.size(),"a change has no line");
    Access.putAll(changes);
    check(Access.values().equals(before),"export, change, import didn't restore every value");
    // Values a setting can't take and keys this build doesn't have are left out, and say so.
    String firstSwitch=null,firstChoice=null;
    for(String[] e:Access.entries(r)){if(firstSwitch==null&&e[1].equals("switch"))firstSwitch=e[0];if(firstChoice==null&&e[1].equals("choice"))firstChoice=e[0];}
    settings.put(firstSwitch,"maybe");
    if(firstChoice!=null)settings.put(firstChoice,"no such choice");
    settings.put("lurk_test_unknown",true);
    Object[] odd=(Object[])Access.plan(root.toString());
    List<String> skipped=(List<String>)odd[4];
    check(skipped.contains("lurk_test_unknown"),"unknown key not listed: "+skipped);
    check(skipped.size()==(firstChoice==null?2:3),"bad values not listed: "+skipped);
    check(((Map<String,String>)odd[1]).isEmpty(),"bad values would change something");
    // Strings for switches and numbers for choices are what people type when editing a file.
    settings=new org.json.JSONObject().put(firstSwitch,String.valueOf(!Boolean.parseBoolean(before.get(firstSwitch))).toUpperCase());
    Object[] typed=(Object[])Access.plan(new org.json.JSONObject().put("lurk",1).put("settings",settings).toString());
    check(((Map<String,String>)typed[1]).size()==1,"\"TRUE\"/\"FALSE\" for a switch not taken");
    for(String bad:new String[]{"","[]","{}","{\"lurk\":2,\"settings\":{}}","{\"lurk\":1}","not json"}){
      try{Access.plan(bad);check(false,"not a settings file, but read: "+bad);}catch(org.json.JSONException expected){checks++;}
    }
  }

  /** The bug report URL: the form, the app, versions, device and every switch, never what was typed into a list. */
  static void report(String json)throws Exception{
    Object r=install(json);
    String text=null;
    for(String[] e:Access.entries(r))if(e[1].equals("text")){text=e[0];Access.putString(e[0],"secretword, other");}
    String url=Access.report(false,"31.7.0","Android 16 (API 36), Google Pixel Test");
    check(url.startsWith("https://github.com/jordanwoodson/lurk-morphe-patches/issues/new?template=bug_report.yml&"),"form URL: "+url);
    check(url.length()<=7000,"report URL too long: "+url.length());
    Map<String,String> query=new HashMap<>();
    for(String part:url.substring(url.indexOf('?')+1).split("&")){
      String[] kv=part.split("=",2);
      check(!kv[1].contains("+")&&!kv[1].contains(" "),"unencoded "+kv[0]);
      query.put(kv[0],java.net.URLDecoder.decode(kv[1],"UTF-8"));
    }
    String app=new org.json.JSONObject(json).getString("app");
    check(query.get("app").equals(app),"app field: "+query.get("app"));
    String lurk=new org.json.JSONObject(json).optString("version");
    check(query.get("versions").startsWith(app+" 31.7.0, Lurk v"+lurk),"versions field: "+query.get("versions"));
    check(query.get("device").equals("Android 16 (API 36), Google Pixel Test"),"device field");
    String patches=query.get("patches");
    for(String[] e:Access.entries(r)){
      if(!e[1].equals("switch"))continue;
      String list=Access.stored(e[0])?"- On: ":"- Off: ";
      String line=patches.substring(patches.indexOf(list));
      line=line.substring(0,line.indexOf('\n'));
      check((", "+line.substring(list.length())+",").contains(", "+e[0]+","),e[0]+" not listed under "+list.trim());
    }
    check(!url.contains("secretword")&&!patches.contains("secretword"),"a list's words went into the report");
    if(text!=null)check(patches.contains("Lists filled in: ")&&patches.contains(text),"filled-in list not named");
    check(patches.contains("- Pause Lurk: off"),"pause state missing");
    check(Access.reportSettings(true).startsWith("Patches selected"),"changed-only variant");
  }

  /**
   * The launcher shortcut. Android 11+: pushed to the top on every start, over the app's own conversation shortcuts.
   * Older: added once, updated when its label or the app/Lurk version changed.
   */
  static void shortcut()throws Exception{
    android.content.pm.ShortcutManager pushing=new android.content.pm.ShortcutManager();
    Context.services=type->type==android.content.pm.ShortcutManager.class?pushing:null;
    Access.context(new Context());
    install(registry(entry("block_ads","switch","true",null)));
    android.os.Build.VERSION.SDK_INT=36;
    Access.publishShortcut();
    for(int i=0;i<5;i++){
      android.content.pm.ShortcutInfo whisper=new android.content.pm.ShortcutInfo.Builder(new Context(),"whisper_"+i).build();
      pushing.pushDynamicShortcut(whisper);
    }
    check(!pushing.dynamic.get(0).getId().equals("lurk_settings"),"the conversation shortcuts are on top");
    Access.publishShortcut();
    check(pushing.pushed==7&&pushing.added==0&&pushing.updated==0,"Android 11+: pushed on every start");
    check(pushing.dynamic.get(0).getId().equals("lurk_settings")&&pushing.dynamic.get(0).getRank()==0,"pushed back on top");
    check(pushing.dynamic.stream().filter(s->s.getId().equals("lurk_settings")).count()==1,"one Lurk shortcut");
    check(pushing.dynamic.get(0).getShortLabel().toString().equals("Lurk")&&pushing.dynamic.get(0).getLongLabel().toString().equals("Lurk settings"),"pushed labels");

    android.os.Build.VERSION.SDK_INT=29;
    android.content.pm.ShortcutManager manager=new android.content.pm.ShortcutManager();
    Context.services=type->type==android.content.pm.ShortcutManager.class?manager:null;
    Access.publishShortcut();
    check(manager.added==1&&manager.updated==0,"first start: added "+manager.added+" updated "+manager.updated);
    check(manager.dynamic.get(0).getShortLabel().toString().equals("Lurk")&&manager.dynamic.get(0).getLongLabel().toString().equals("Lurk settings"),"labels");
    Access.publishShortcut();
    check(manager.added==1&&manager.updated==0,"an unchanged shortcut was published again");
    manager.dynamic.get(0).longLabel="Lurk settings (old)";
    Access.publishShortcut();
    check(manager.updated==1&&manager.dynamic.get(0).getLongLabel().toString().equals("Lurk settings"),"an old label wasn't refreshed");
    android.content.pm.PackageManager.versionName="31.8.0";
    Access.publishShortcut();
    check(manager.updated==2,"an app update didn't refresh the shortcut");
    Access.publishShortcut();
    check(manager.added==1&&manager.updated==2,"refreshed again without a change");
    check(manager.pushed==0,"pushed before Android 11");
    android.os.Build.VERSION.SDK_INT=36;
  }

  static void unknownIsOff(){
    for(String key:new String[]{"lurk_test_unregistered","lurk_test_choice",""}){
      check(!Settings.isRegistered(key),key+" registered");
      check(!Settings.isEnabled(key),key+" on without registration");
      check(Access.getString(key).isEmpty()&&Settings.getText(key).isEmpty(),key+" has a value without registration");
      check(Settings.getInt(key)==0,key+" has a number without registration");
    }
  }
}
'''


def registry_from_apk(apk):
    """The registry JSON the settings patch put into Settings.registryJson(), from the APK's dex files."""
    with zipfile.ZipFile(apk) as archive:
        for name in sorted(n for n in archive.namelist() if re.fullmatch(r'classes\d*\.dex', n)):
            data = archive.read(name)
            start = data.find(b'{"name":"Lurk","version":')
            if start < 0:
                continue
            raw = data[start:data.index(b'\0', start)].replace(b'\xc0\x80', b'\0')
            # Dex strings are MUTF-8: characters outside the BMP are two encoded surrogates.
            return raw.decode('utf-8', 'surrogatepass').encode('utf-16', 'surrogatepass').decode('utf-16')
    raise SystemExit(f'{apk}: no Lurk settings registry in the dex files')


def check_layout(app, root):
    """The order and shape SettingsScreen.json() promises."""
    assert root['name'] == 'Lurk' and isinstance(root['version'], str), app
    assert root['app'] and isinstance(root['settings'], list) and root['settings'], f'{app}: no settings'
    entries = root['settings']
    keys = [entry['key'] for entry in entries]
    assert len(keys) == len(set(keys)), f'{app}: duplicate keys {sorted(k for k in keys if keys.count(k) > 1)}'
    by_key = {entry['key']: entry for entry in entries}
    top = []
    for index, entry in enumerate(entries):
        key = entry['key']
        assert re.fullmatch(r'[a-z0-9_]+', key), f'{app}: key {key!r}'
        assert entry['type'] in ('switch', 'choice', 'text'), f'{app} {key}: type'
        assert entry['title'].strip() and isinstance(entry['summary'], str), f'{app} {key}: title or summary'
        assert entry['section'] in SECTIONS, f'{app} {key}: unknown section {entry["section"]}'
        assert isinstance(entry['restart'], bool), f'{app} {key}: restart flag'
        assert isinstance(entry['default'], str), f'{app} {key}: default'
        if entry['type'] == 'switch':
            assert entry['default'] in ('true', 'false'), f'{app} {key}: switch default'
        else:
            assert 'keep' not in entry, f'{app} {key}: only a switch can be kept on while paused'
        assert entry.get('keep', False) in (True, False), f'{app} {key}: keep flag'
        if entry['type'] == 'choice':
            values = [value for _, value in entry['choices']]
            assert len(values) >= 2 and len(set(values)) == len(values), f'{app} {key}: choices'
            assert entry['default'] in values, f'{app} {key}: default {entry["default"]} is not a choice'
        else:
            assert 'choices' not in entry, f'{app} {key}: choices on a {entry["type"]}'
        parent = entry['parent']
        if parent is None:
            top.append(entry)
            continue
        assert parent in by_key, f'{app} {key}: parent {parent} is not registered'
        assert by_key[parent]['parent'] is None, f'{app} {key}: parent {parent} has a parent itself'
        assert by_key[parent]['type'] != 'text', f'{app} {key}: parent {parent} is a text'
        assert by_key[parent]['section'] == entry['section'], f'{app} {key}: not in its parent\'s section'
        # Only the parent and its other children come before it, back to the parent.
        between = entries[keys.index(parent) + 1:index]
        assert all(other['parent'] == parent for other in between), f'{app} {key}: not right after {parent}'
    order = [(SECTIONS.index(entry['section']), entry['title']) for entry in top]
    assert order == sorted(order), f'{app}: top-level entries not in section, then title order'


def compare_dump(app, root, dump):
    lines = Path(dump).read_text(encoding='utf-8').split('\n')
    assert lines[0] == '\x1f'.join([root['name'], root['version'], root['app']]), f'{app}: header {lines[0]!r}'
    expected = []
    for entry in root['settings']:
        choices = entry.get('choices', [])
        expected.append('\x1f'.join([
            entry['key'], entry['type'], entry['title'], entry['summary'], entry['section'],
            'null' if entry['parent'] is None else entry['parent'],
            entry['default'], str(entry['restart']).lower(), str(entry.get('keep', False)).lower(),
            '\x1e'.join(label for label, _ in choices),
            '\x1e'.join(value for _, value in choices)]))
    actual = [line for line in lines[1:] if line]
    for want, got in zip(expected, actual):
        assert want == got, f'{app}: Java read\n  {got!r}\nPython read\n  {want!r}'
    assert len(expected) == len(actual), f'{app}: Java read {len(actual)} entries, the JSON has {len(expected)}'


def main(argv):
    if argv[:1] == ['--update']:
        REGISTRIES.mkdir(exist_ok=True)
        for apk in argv[1:]:
            text = registry_from_apk(apk)
            root = json.loads(text)
            check_layout(root['app'], root)
            target = REGISTRIES / f'{root["app"].lower()}.json'
            target.write_text(text + '\n', encoding='utf-8')
            print(f'wrote {target.relative_to(HERE.parents[1])} ({len(root["settings"])} settings)')
        return
    sources = {}
    if argv:
        for apk in argv:
            text = registry_from_apk(apk)
            sources[json.loads(text)['app'].lower()] = text
    else:
        for path in sorted(REGISTRIES.glob('*.json')):
            sources[path.stem] = path.read_text(encoding='utf-8').strip()
        assert set(sources) == {'twitch', 'kick', 'rumble'}, f'stored registries: {sorted(sources)}'
    with tempfile.TemporaryDirectory(prefix='lurk-settings-') as scratch:
        scenarios, roots = [], {}
        for app, text in sources.items():
            root = json.loads(text)
            check_layout(app, root)
            roots[app] = root
            fixture = Path(scratch) / f'{app}.json'
            fixture.write_text(text, encoding='utf-8')
            scenarios += [f'registry|{fixture}|{Path(scratch) / (app + ".dump")}', f'defaults|{fixture}',
                          f'stored|{fixture}', f'nocontext|{fixture}', f'empty|{fixture}', f'pause|{fixture}',
                          f'restart|{fixture}', f'backup|{fixture}', f'report|{fixture}']
        scenarios += ['empty', 'chatfilter', 'logger', 'crash', 'shortcut']
        run('SettingsProbe', ['settings/Settings.java', 'settings/Registry.java', 'settings/ResumedActivityTracker.java',
                              'settings/Backup.java', 'settings/Report.java', 'Logger.java', 'ChatFilter.java'],
            PROBE, scenarios, extra=JSON_DOUBLE | ANDROID)
        for app, root in roots.items():
            compare_dump(app, root, Path(scratch) / f'{app}.dump')
            print(f'PASS {app}: {len(root["settings"])} settings, layout and Java/Python reading agree')


if __name__ == '__main__':
    main(sys.argv[1:])
