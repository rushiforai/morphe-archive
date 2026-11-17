package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Add fullscreen as an explicit playback choice without changing native enum values. */
public final class FullscreenOptions262 {
 public static final int MENU_ID=0x46f9;
 private static final String SPECIAL="nicoid_fullscreen262";
 private static final String PREF_TAP="videolist_tap";
 private static final String PREF_LINK="intent_type";
 private static final String PREF_RESUME="nicoid_app_resume_playback";
 private static final String FLAG_TAP="nicoid_fullscreen_tap262";
 private static final String FLAG_LINK="nicoid_fullscreen_link262";
 private static final String FLAG_RESUME="nicoid_fullscreen_resume262";
 private static final String HANDOFF="nicoid_fullscreen_handoff208";
 private static final long PENDING_MS=12000L;
 private static long resumeUntil;
 private static WeakReference<Context> labelContext=new WeakReference<>(null);
 private FullscreenOptions262(){}

 private static SharedPreferences prefs(Context c){
  return PreferenceManager.getDefaultSharedPreferences(c);
 }
 public static String label(Context c){
  String mode=prefs(c).getString("app_lang","-1");
  String language="0".equals(mode)?"ja":"1".equals(mode)?"en":
     "2".equals(mode)?"zh":Locale.getDefault().getLanguage();
  return "zh".equals(language)?"全螢幕播放":
         "ja".equals(language)?"全画面再生":"Fullscreen playback";
 }
 private static int normalIndex(CharSequence[] labels,CharSequence[] values){
  if(labels==null||values==null)return -1;
  for(int i=0;i<Math.min(labels.length,values.length);i++){
   String value=String.valueOf(values[i]).toLowerCase(Locale.ROOT);
   String title=String.valueOf(labels[i]).toLowerCase(Locale.ROOT);
   if("normal".equals(value)||"play".equals(value)||"normal".equals(title)
      ||title.contains("通常再生")||title.contains("動画再生")
      ||title.contains("normal playback")||title.contains("play video")
      ||title.contains("一般播放")||title.contains("播放影片"))return i;
  }
  return labels.length>0?0:-1;
 }
 private static void install(PreferenceActivity a,String key,String flag){
  Preference existing=a.findPreference(key);
  if(!(existing instanceof ListPreference))return;
  ListPreference list=(ListPreference)existing;
  CharSequence[] entries=list.getEntries(),values=list.getEntryValues();
  if(entries==null||values==null||entries.length==0||entries.length!=values.length)return;
  if(!SPECIAL.contentEquals(values[values.length-1])){
   CharSequence[] updated=Arrays.copyOf(entries,entries.length+1);
   CharSequence[] codes=Arrays.copyOf(values,values.length+1);
   updated[entries.length]=label(a);codes[values.length]=SPECIAL;
   list.setEntries(updated);list.setEntryValues(codes);
  }
  final CharSequence[] currentLabels=list.getEntries();
  final CharSequence[] currentValues=list.getEntryValues();
  final int regular=normalIndex(currentLabels,currentValues);
  if(regular<0)return;
  final String base=String.valueOf(currentValues[regular]);
  SharedPreferences stored=prefs(a);
  final boolean full=stored.getBoolean(flag,false);
  String existingNative=stored.getString(key,base);
  if(existingNative==null||SPECIAL.equals(existingNative))existingNative=base;
  // A virtual entry can be displayed while retaining the native preference's
  // original storage schema and the working normal-playback route.
  list.setPersistent(false);
  list.setValue(full?SPECIAL:existingNative);
  list.setSummary(full?label(a):list.getEntry());
  list.setOnPreferenceChangeListener((preference,newValue)->{
   String selected=String.valueOf(newValue);
   boolean fullscreen=SPECIAL.equals(selected);
   String nativeValue=fullscreen?base:selected;
   stored.edit().putString(key,nativeValue).putBoolean(flag,fullscreen).apply();
   list.setValue(selected);
   int at=list.findIndexOfValue(selected);
   list.setSummary(at>=0?list.getEntries()[at]:label(a));
   return false;
  });
 }

 /** Install before SettingsCategories241 reparents the original preferences. */
 public static void settings(PreferenceActivity activity){
  if(activity==null)return;
  labelContext=new WeakReference<>(activity);
  install(activity,PREF_TAP,FLAG_TAP);
  install(activity,PREF_LINK,FLAG_LINK);
  install(activity,PREF_RESUME,FLAG_RESUME);
  register(activity);
 }

 /** Preserve all previously stored IDs, visibility flags and custom ordering. */
 private static void register(Context context){
  LinkedHashMap<Integer,String> labels=MenuOptions119.LABELS;
  if(labels==null)return;
  String text=label(context);
  Integer key=MENU_ID;
  if(labels.containsKey(key)){labels.put(key,text);return;}
  LinkedHashMap<Integer,String> rebuilt=new LinkedHashMap<>();
  boolean inserted=false;
  for(Map.Entry<Integer,String> entry:labels.entrySet()){
   rebuilt.put(entry.getKey(),entry.getValue());
   if(entry.getKey()==6){rebuilt.put(key,text);inserted=true;}
  }
  if(!inserted)rebuilt.put(key,text);
  labels.clear();labels.putAll(rebuilt);
 }
 /** Called before MenuEditor120 normalizes the saved action order. */
 public static void prepareEditorOrder(ArrayList<Integer> order){
  Context context=labelContext.get();
  if(context!=null)register(context);
  if(order==null||order.contains(MENU_ID))return;
  int index=order.indexOf(9);
  if(index>=0)order.add(index,MENU_ID);
  // For a fresh install the label map's default order is authoritative.
 }

 /** A menu action overrides the default tap behavior only for the next launch. */
 public static synchronized void armMenu(){
  resumeUntil=0L;
  PlaybackChoice266.armFullscreen(SystemClock.uptimeMillis());
 }
 public static synchronized void armNormal(){
  resumeUntil=0L;
  PlaybackChoice266.armNormal(SystemClock.uptimeMillis());
 }
 public static synchronized void cancelMenuChoice(){
  PlaybackChoice266.cancel();
 }
 public static synchronized void armResume(Object service){
  if(service instanceof Context&&prefs((Context)service).getBoolean(FLAG_RESUME,false))
   resumeUntil=SystemClock.uptimeMillis()+PENDING_MS;
 }
 private static synchronized boolean consumeResume(){
  long now=SystemClock.uptimeMillis();
  boolean armed=resumeUntil!=0L&&now<=resumeUntil;
  resumeUntil=0L;
  return armed;
 }

 /** Add to the existing action list before its original visibility/sort pass. */
 public static void add(Menu menu,List<ListActions.Action> actions,Activity activity,Object row){
  if(menu==null||actions==null||activity==null)return;
  register(activity);
  int normalAt=-1;
  for(int i=0;i<actions.size();i++){
   ListActions.Action item=actions.get(i);
   if(item.id==5&&item.enabled&&item.run!=null){normalAt=i;break;}
  }
  if(normalAt<0)return;
  ListActions.Action normal=actions.get(normalAt);
  // Do not let the fullscreen action call the newly wrapped normal callback.
  final Runnable nativeRun=normal.run;
  if(!actions.stream().anyMatch(action->action.id==MENU_ID)){
   MenuItem full=menu.add(0,MENU_ID,0,label(activity));
   actions.add(new ListActions.Action(full,()->{
    armMenu();
    try{nativeRun.run();}catch(RuntimeException e){cancelMenuChoice();throw e;}
   }));
  }
  MenuItem normalItem=menu.findItem(normal.id);
  if(normalItem==null)normalItem=menu.add(0,normal.id,0,normal.title);
  actions.set(normalAt,new ListActions.Action(normalItem,()->{
   armNormal();
   try{nativeRun.run();}catch(RuntimeException e){cancelMenuChoice();throw e;}
  }));
 }

 /** Called during VideoActivity.onCreate, before the native orientation override. */
 public static void onVideoCreated(Activity activity){
  if(activity==null||activity.getIntent()==null)return;
  Intent intent=activity.getIntent();
  if(intent.getBooleanExtra("nicoid_continue_mini203",false))return;
  SharedPreferences saved=prefs(activity);
  int menuChoice=PlaybackChoice266.consume(SystemClock.uptimeMillis());
  if(menuChoice==PlaybackChoice266.NORMAL)return;
  boolean selected=menuChoice==PlaybackChoice266.FULLSCREEN;
  if(!selected)selected=consumeResume();
  if(!selected){
   boolean external=false;
   try{external=ExternalBack218.isExternalVideo(activity);}
   catch(RuntimeException ignored){}
   selected=saved.getBoolean(external?FLAG_LINK:FLAG_TAP,false);
  }
  if(!selected)return;
  intent.putExtra("isFullScreen",true)
        .putExtra("isLandscape",true)
        .putExtra(HANDOFF,true);
 }
}
