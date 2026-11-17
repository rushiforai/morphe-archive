package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;

/** Completes native fullscreen controls in both video menus and preferences. */
public final class FullscreenOptions265 {
 private static final int FULL=FullscreenOptions262.MENU_ID;
 private static final String SELECTED="nicoid_fullscreen262";
 private FullscreenOptions265(){}

 private static SharedPreferences prefs(Context c){
  return PreferenceManager.getDefaultSharedPreferences(c);
 }
 /** Preserve the existing preference's native value and listener.
  * The extra option is virtual so legacy "normal" playback handoff remains valid.
  */
 public static void settings(PreferenceActivity activity){
  if(activity==null)return;
  for(String key:new String[]{"videolist_tap","intent_type"}){
   Preference p=activity.findPreference(key);
   if(!(p instanceof ListPreference))continue;
   ListPreference pref=(ListPreference)p;
   CharSequence[] names=pref.getEntries(),values=pref.getEntryValues();
   if(names==null||values==null||names.length!=values.length)continue;
   ArrayList<CharSequence> titles=new ArrayList<>();
   ArrayList<CharSequence> codes=new ArrayList<>();
   for(int i=0;i<values.length;i++)
    if(!SELECTED.equals(String.valueOf(values[i]))){
     titles.add(names[i]);codes.add(values[i]);
    }
   pref.setEntries(titles.toArray(new CharSequence[0]));
   pref.setEntryValues(codes.toArray(new CharSequence[0]));
  }
  FullscreenOptions262.settingsCore(activity);
  moveAfterInformation(activity,"videolist_tap");
  moveAfterInformation(activity,"intent_type");
  AppResume253.refresh(activity);
 }

 private static void moveAfterInformation(PreferenceActivity a,String key){
  Preference found=a.findPreference(key);
  if(!(found instanceof ListPreference))return;
  ListPreference list=(ListPreference)found;
  CharSequence[] entries=list.getEntries(),values=list.getEntryValues();
  if(entries==null||values==null||entries.length!=values.length)return;
  int full=-1,after=-1;
  for(int i=0;i<values.length;i++){
   String value=String.valueOf(values[i]).toLowerCase(Locale.ROOT);
   String title=String.valueOf(entries[i]).toLowerCase(Locale.ROOT);
   if(SELECTED.equals(value))full=i;
   if(title.contains("動画情報")||title.contains("video information")||
     title.contains("video info")||title.contains("影片資訊")||
     title.contains("影片信息")||"info".equals(value)||
     "detail".equals(value))after=i;
  }
  if(full<0)return;
  ArrayList<CharSequence> labels=new ArrayList<>();
  ArrayList<CharSequence> codes=new ArrayList<>();
  for(int i=0;i<entries.length;i++){
   if(i==full)continue;
   labels.add(entries[i]);codes.add(values[i]);
  }
  int at=after<0?labels.size():Math.min(labels.size(),after+(full<after?0:1));
  labels.add(at,FullscreenOptions262.label(a));
  codes.add(at,SELECTED);
  list.setEntries(labels.toArray(new CharSequence[0]));
  list.setEntryValues(codes.toArray(new CharSequence[0]));
 }

 /** Both long-press and triangle menus are assembled by ListActions.extra.
  * Inserting only in MenuOptions119.finish misses these actual UI paths.
  */
 public static void attach(Menu menu,List<ListActions.Action> actions,
                           Activity host,Object row){
  if(menu==null||actions==null||host==null)return;
  boolean fullVisible=prefs(host).getBoolean("video_menu_visible_"+FULL,true);
  boolean has=false;
  ListActions.Action normal=null;
  for(ListActions.Action action:actions){
   if(action.id==FULL)has=true;
   if(normal==null && action.enabled && action.run!=null &&
     (action.id==5 || "動画再生".equals(action.title) ||
      "Play video".equalsIgnoreCase(action.title) ||
      "Video playback".equalsIgnoreCase(action.title)))normal=action;
  }
  if(!has&&normal==null)return;
  // Capture the unwrapped native callback for both explicit choices.
  final Runnable nativeRun=normal==null?null:normal.run;
  if(normal!=null){
   MenuItem item=menu.findItem(normal.id);
   if(item==null)item=menu.add(0,normal.id,0,normal.title);
   final Runnable explicitNormal=()->{
    FullscreenOptions262.armNormal();
    try{nativeRun.run();}
    catch(RuntimeException failure){
     FullscreenOptions262.cancelMenuChoice();
     throw failure;
    }
   };
   actions.set(actions.indexOf(normal),new ListActions.Action(item,explicitNormal));
   // PopupMenu also uses MenuItem callbacks if the full action is hidden.
   item.setOnMenuItemClickListener(clicked->{explicitNormal.run();return true;});
  }
  if(!fullVisible)return;
  if(!has&&nativeRun!=null){
   MenuItem full=menu.add(0,FULL,0,FullscreenOptions262.label(host));
   actions.add(new ListActions.Action(full,()->{
    FullscreenOptions262.armMenu();
    try{nativeRun.run();}
    catch(RuntimeException failure){
     FullscreenOptions262.cancelMenuChoice();
     throw failure;
    }
   }));
  }
  registerLabel(host);
  List<ListActions.Action> initial=new ArrayList<>(actions);
  SharedPreferences preferences=prefs(host);
  boolean customized=preferences.contains("video_menu_order_v1");
  if(customized){
   final List<Integer> userOrder=MenuEditor120.order(host);
   Collections.sort(actions,(a,b)->{
    int ia=userOrder.indexOf(a.id),ib=userOrder.indexOf(b.id);
    if(ia<0)ia=Integer.MAX_VALUE;
    if(ib<0)ib=Integer.MAX_VALUE;
    return Integer.compare(ia,ib);
   });
  }else{
   ListActions.Action full=null;
   for(ListActions.Action a:actions)if(a.id==FULL){full=a;break;}
   if(full!=null){
    actions.remove(full);
    int at=-1;
    for(int i=0;i<actions.size();i++)
     if(actions.get(i).id==6){at=i+1;break;}
    if(at<0){
     for(int i=0;i<actions.size();i++)
      if(actions.get(i).id==5){at=i+1;break;}
    }
    actions.add(at<0?0:at,full);
   }
  }
  // The PopupMenu uses Menu while the held AlertDialog uses ACTIONS. Keep both
  // synchronized, preserving the native runnables and enabled states.
  menu.clear();
  for(int i=0;i<actions.size();i++){
   ListActions.Action action=actions.get(i);
   MenuItem item=menu.add(0,action.id,i,action.title);
   item.setEnabled(action.enabled);
   final Runnable work=action.run;
   item.setOnMenuItemClickListener(clicked->{
    if(action.enabled&&work!=null)work.run();
    return true;
   });
  }
 }

 private static void registerLabel(Context c){
  LinkedHashMap<Integer,String> labels=MenuOptions119.LABELS;
  if(labels==null)return;
  if(labels.containsKey(FULL)){
   labels.put(FULL,FullscreenOptions262.label(c));return;
  }
  LinkedHashMap<Integer,String> ordered=new LinkedHashMap<>();
  boolean added=false;
  for(Map.Entry<Integer,String> item:labels.entrySet()){
   ordered.put(item.getKey(),item.getValue());
   if(item.getKey()==6){
    ordered.put(FULL,FullscreenOptions262.label(c));added=true;
   }
  }
  if(!added)ordered.put(FULL,FullscreenOptions262.label(c));
  labels.clear();labels.putAll(ordered);
 }
}
