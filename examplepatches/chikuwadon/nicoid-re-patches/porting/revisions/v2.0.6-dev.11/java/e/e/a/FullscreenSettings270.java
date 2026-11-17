package e.e.a;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Reconcile playback options only, after the native general settings have
 * installed their ListPreferences. Never add/remove/reparent a Preference.
 *
 * Earlier SettingsTools and Dev111 installers can run in different posted
 * callbacks. Both hooks call this class; a bounded retry handles late native
 * creation of nicoid_app_resume_playback without changing default values.
 */
public final class FullscreenSettings270 {
 private static final String TAG="nicoid-playback-settings";
 private static final String SPECIAL="nicoid_fullscreen262";
 private static final String RESUME="nicoid_app_resume_playback";
 private static final String[] ORDER_KEYS={
   "videolist_tap",
   "intent_type",
   "nicoid_external_link_back",
   "app_switch_playback",
   "back_playback"
 };
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<PreferenceActivity,Boolean> PENDING=new WeakHashMap<>();
 private static final WeakHashMap<PreferenceActivity,SharedPreferences.OnSharedPreferenceChangeListener>
   LANGUAGE=new WeakHashMap<>();

 private FullscreenSettings270(){}

 private static void keys(PreferenceGroup group,String parent,List<String> into){
  if(group==null)return;
  for(int i=0;i<group.getPreferenceCount();i++){
   Preference p=group.getPreference(i);
   String id=p.getKey();
   String path=parent+"/"+(id==null?"@"+System.identityHashCode(p):id);
   into.add(path);
   if(p instanceof PreferenceGroup)keys((PreferenceGroup)p,path,into);
  }
 }

 private static int count(CharSequence[] values,String key){
  if(values==null)return 0;
  int n=0;
  for(CharSequence value:values)if(key.contentEquals(value))n++;
  return n;
 }

 private static boolean patched(PreferenceActivity activity){
  Preference p=activity.findPreference(RESUME);
  if(!(p instanceof ListPreference))return false;
  ListPreference list=(ListPreference)p;
  CharSequence[] entries=list.getEntries(),values=list.getEntryValues();
  if(entries==null||values==null||entries.length!=values.length)return false;
  if(count(values,SPECIAL)!=1)return false;
  int index=list.findIndexOfValue(SPECIAL);
  if(index<0||index>=entries.length)return false;
  String title=String.valueOf(entries[index]);
  return "全画面再生に戻る".equals(title)||
         "返回全螢幕播放".equals(title)||
         "Return to fullscreen playback".equals(title);
 }

 private static boolean applyNow(PreferenceActivity activity){
  if(activity.isFinishing()||activity.isDestroyed())return true;
  PreferenceGroup root=activity.getPreferenceScreen();
  if(root==null)return false;
  List<String> before=new ArrayList<>();
  keys(root,"",before);
  // This is safe to repeat: the helper strips only its OWN virtual option,
  // rebuilds it once and restores the real native storage/selection listener.
  FullscreenOptions265.settings(activity);
  for(String key:ORDER_KEYS){
   Preference p=activity.findPreference(key);
   if(!(p instanceof ListPreference))continue;
   ListPreference list=(ListPreference)p;
   CharSequence[] labels=list.getEntries(),values=list.getEntryValues();
   if(labels==null||values==null||labels.length!=values.length)continue;
   CharSequence[] nextLabels=labels.clone(),nextValues=values.clone();
   if(PlaybackChoiceOrder270.reorder(nextLabels,nextValues)){
    list.setEntries(nextLabels);
    list.setEntryValues(nextValues);
   }
  }
  List<String> after=new ArrayList<>();
  keys(root,"",after);
  if(!before.equals(after)){
   // Do not attempt to "repair" a different preference tree by deleting or
   // reordering anything. The guard reports the unexpected change instead.
   Log.e(TAG,"Playback options reconciliation changed preference tree: "+before+" -> "+after);
  }
  for(String key:new String[]{"videolist_tap","intent_type"}){
   Preference p=activity.findPreference(key);
   if(p instanceof ListPreference){
    ListPreference list=(ListPreference)p;
    if(count(list.getEntryValues(),SPECIAL)!=1)
     Log.e(TAG,"Fullscreen value missing/duplicated for "+key);
   }
  }
  return patched(activity);
 }

 private static void registerLocale(PreferenceActivity activity){
  synchronized(LANGUAGE){
   if(LANGUAGE.containsKey(activity))return;
   WeakReference<PreferenceActivity> weak=new WeakReference<>(activity);
   SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{
    if(!"app_lang".equals(key))return;
    MAIN.post(()->{
     PreferenceActivity a=weak.get();
     if(a!=null&&!a.isFinishing()&&!a.isDestroyed())reconcile(a);
    });
   };
   PreferenceManager.getDefaultSharedPreferences(activity)
       .registerOnSharedPreferenceChangeListener(listener);
   LANGUAGE.put(activity,listener);
  }
 }

 public static void reconcile(PreferenceActivity activity){
  if(activity==null)return;
  if(Looper.myLooper()!=Looper.getMainLooper()){
   WeakReference<PreferenceActivity> target=new WeakReference<>(activity);
   MAIN.post(()->{
    PreferenceActivity a=target.get();
    if(a!=null)reconcile(a);
   });
   return;
  }
  registerLocale(activity);
  if(applyNow(activity))return;
  synchronized(PENDING){
   if(PENDING.containsKey(activity))return;
   PENDING.put(activity,Boolean.TRUE);
  }
  WeakReference<PreferenceActivity> weak=new WeakReference<>(activity);
  MAIN.postDelayed(new Runnable(){
   int attempts;
   @Override public void run(){
    PreferenceActivity a=weak.get();
    if(a==null||a.isFinishing()||a.isDestroyed()||applyNow(a)||++attempts>=12){
     if(a!=null){
      synchronized(PENDING){PENDING.remove(a);}
      if(attempts>=12)Log.w(TAG,"Resume choice not installed after setting retries");
     }
     return;
    }
    MAIN.postDelayed(this,attempts<4?80L:250L);
   }
  },32L);
 }
}
