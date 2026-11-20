package e.e.a;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Back up playlist contents, per-folder settings and video-title edits. */
public final class PlaylistBackup213 {
 public static final String PLAYLISTS="nicoid_local_playlists_v1";
 public static final String TITLES="nicoid_video_title_overrides";
 private static final int MAX_PLAYLIST=12*1024*1024,MAX_TITLES=4*1024*1024,MAX_ENTRIES=50000;
 private static final Map<String,String> EXTRAS=new HashMap<>();
 static{
  for(String k:new String[]{"save_playback_position","material_you_mode","comment_bold","comment_hide","comment_limit_extended","player_isloop","continuous_play"})EXTRAS.put(k,"boolean");
  for(String k:new String[]{"legacy_comment_limit","comment_shadow_dp","continuous_play_mode"})EXTRAS.put(k,"int");
  for(String k:new String[]{"comment_size_level","ranking_genres_v190","ranking_presets_v190","nicoid_local_playlist_last_folder_v1","nicoid_local_playlist_last_group_v1","list_gestures_map","saveNGList"})EXTRAS.put(k,"string");
 }
 private PlaylistBackup213(){}
 private static String extra(String key){
  String found=EXTRAS.get(key);if(found!=null)return found;
  if(key.matches("nicoid_local_playlist_sort_[0-9a-fA-F-]{36}"))return "int";
  if(key.matches("history_sort_v2_[0-9]{1,3}"))return "int";
  if(key.matches("creator_shorts_play_[A-Za-z0-9_-]{1,100}"))return "int";
  if(key.matches("series_(continuous|shuffle)_[A-Za-z0-9_-]{1,100}"))return "boolean";
  return null;
 }
 @SuppressWarnings("unchecked")
 private static Map<String,String> types()throws IOException{
  try{Field field=Class.forName("e.e.a.SettingsBackup").getDeclaredField("TYPES");field.setAccessible(true);return (Map<String,String>)field.get(null);}
  catch(ReflectiveOperationException|ClassCastException ex){throw new IOException("Setting registry unavailable",ex);}
 }
 private static String valueType(Object v){
  return v instanceof Boolean?"boolean":v instanceof Integer?"int":v instanceof Long?"long":v instanceof Float?"float":v instanceof Set?"set":v instanceof String?"string":"unknown";
 }
 private static void register(Map<String,?> values)throws IOException{
  Map<String,String> t=types();
  for(Map.Entry<String,?> e:values.entrySet()){
   String expected=extra(e.getKey());if(expected==null)continue;
   if(!expected.equals(valueType(e.getValue())))throw new IOException("Unsupported setting type: "+e.getKey());
   t.put(e.getKey(),expected);
  }
 }
 public static void prepareImport(JSONObject document)throws IOException{
  try{
   if(!"nicoid-re-settings".equals(document.optString("format"))||document.optInt("version")!=1)throw new IOException("Unsupported backup format");
   JSONObject entries=document.getJSONObject("settings");Map<String,String> t=types();
   Iterator<String> keys=entries.keys();
   while(keys.hasNext()){String key=keys.next(),expected=extra(key);if(expected!=null)t.put(key,expected);}
  }catch(JSONException ex){throw new IOException("Malformed backup",ex);}
 }
 private static JSONObject parseTitles(String json)throws IOException{
  if(json==null||json.length()>MAX_TITLES)throw new IOException("Oversized custom title data");
  try{
   JSONObject result=new JSONObject(json);int count=0;Iterator<String> keys=result.keys();
   while(keys.hasNext()){
    String key=keys.next();if(++count>MAX_ENTRIES||key.isEmpty()||key.length()>256)throw new IOException("Invalid video id");
    Object title=result.get(key);
    if(!(title instanceof String)||((String)title).length()>16384)throw new IOException("Invalid custom title");
   }return result;
  }catch(JSONException ex){throw new IOException("Malformed title map",ex);}
 }
 private static Map<String,String> titleMap(String raw)throws IOException{
  JSONObject json=parseTitles(raw);Map<String,String> out=new LinkedHashMap<>();Iterator<String> names=json.keys();
  try{while(names.hasNext()){String key=names.next();out.put(key,json.getString(key));}}
  catch(JSONException ex){throw new IOException("Invalid title entry",ex);}
  return out;
 }
 private static String currentTitles(Context c)throws IOException{
  JSONObject json=new JSONObject();
  try{
   for(Map.Entry<String,?> e:c.getSharedPreferences(TITLES,Context.MODE_PRIVATE).getAll().entrySet()){
    if(!(e.getValue() instanceof String))throw new IOException("Invalid stored custom title");
    json.put(e.getKey(),e.getValue());
   }
   String encoded=json.toString();parseTitles(encoded);return encoded;
  }catch(JSONException ex){throw new IOException("Unable to export custom titles",ex);}
 }
 public static void validate(Map<?,?> values)throws IOException{
  Object local=values.get(PLAYLISTS);
  if(local!=null){
   if(!(local instanceof String)||((String)local).isEmpty()||((String)local).length()>MAX_PLAYLIST)throw new IOException("Invalid playlist data");
   try{Class.forName("e.e.a.LocalPlaylistData").getConstructor(String.class).newInstance((String)local);}
   catch(ReflectiveOperationException ex){throw new IOException("Invalid playlist structure",ex);}
  }
  Object titles=values.get(TITLES);
  if(titles!=null){if(!(titles instanceof String))throw new IOException("Invalid title type");parseTitles((String)titles);}
  for(Map.Entry<?,?> e:values.entrySet()){
   if(!(e.getKey() instanceof String))continue;String key=(String)e.getKey();
   if(key.startsWith("nicoid_local_playlist_sort_")&&extra(key)!=null&&(!(e.getValue() instanceof Integer)||(Integer)e.getValue()<0||(Integer)e.getValue()>3))throw new IOException("Invalid playlist sort");
   if(key.startsWith("creator_shorts_play_")&&extra(key)!=null&&(!(e.getValue() instanceof Integer)||(Integer)e.getValue()<0||(Integer)e.getValue()>2))throw new IOException("Invalid Shorts mode");
  }
 }
 private static void implicitSorts(Map<String,Object> v)throws IOException{
  if(!(v.get(PLAYLISTS) instanceof String))return;
  try{
   JSONArray folders=new JSONObject((String)v.get(PLAYLISTS)).optJSONArray("folders");
   if(folders==null)return;
   for(int i=0;i<folders.length();i++){
    JSONObject folder=folders.optJSONObject(i);if(folder==null)continue;
    String key="nicoid_local_playlist_sort_"+folder.optString("id");
    if(extra(key)!=null&&!v.containsKey(key))v.put(key,Integer.valueOf(0));
   }
  }catch(JSONException ex){throw new IOException("Invalid playlist sort defaults",ex);}
 }
 private static <T> T behindWrites(Callable<T> task)throws Exception{
  Field field=Class.forName("e.e.a.LocalPlaylists").getDeclaredField("WRITES");field.setAccessible(true);
  ExecutorService exec=(ExecutorService)field.get(null);
  if(exec==null)throw new IOException("Playlist writer unavailable");
  try{return exec.submit(task).get();}
  catch(ExecutionException ex){throw new IOException("Playlist storage operation failed",ex.getCause());}
 }
 public static Map<String,?> snapshot(Context c,SharedPreferences prefs)throws Exception{
  return behindWrites(()->{
   Map<String,Object> all=new LinkedHashMap<>(prefs.getAll());
   all.put(TITLES,currentTitles(c));
   validate(all);implicitSorts(all);register(all);return all;
  });
 }
 private static boolean writeTitles(SharedPreferences p,Map<String,String> titles){
  SharedPreferences.Editor e=p.edit().clear();
  for(Map.Entry<String,String> t:titles.entrySet())e.putString(t.getKey(),t.getValue());
  return e.commit();
 }
 private static boolean rollback(SharedPreferences p,Map<String,?> before){
  SharedPreferences.Editor e=p.edit().clear();
  for(Map.Entry<String,?> item:before.entrySet()){
   Object val=item.getValue();String key=item.getKey();
   if(val instanceof String)e.putString(key,(String)val);
   else if(val instanceof Boolean)e.putBoolean(key,(Boolean)val);
   else if(val instanceof Integer)e.putInt(key,(Integer)val);
   else if(val instanceof Long)e.putLong(key,(Long)val);
   else if(val instanceof Float)e.putFloat(key,(Float)val);
   else if(val instanceof Set){@SuppressWarnings("unchecked")Set<String> strings=(Set<String>)val;e.putStringSet(key,strings);}
   else return false;
  }return e.commit();
 }
 private static boolean apply(SharedPreferences prefs,Map<String,Object> values)throws Exception{
  Method method=Class.forName("e.e.a.SettingsBackup").getDeclaredMethod("apply",SharedPreferences.class,Map.class);
  method.setAccessible(true);return Boolean.TRUE.equals(method.invoke(null,prefs,values));
 }
 public static boolean restore(Context c,SharedPreferences prefs,Map<String,Object> values){
  try{
   validate(values);
   return behindWrites(()->{
    Map<String,Object> ordinary=new LinkedHashMap<>(values);ordinary.remove(TITLES);
    if(!values.containsKey(TITLES))return apply(prefs,ordinary);
    Map<String,String> chosen=titleMap((String)values.get(TITLES));
    SharedPreferences titlePrefs=c.getSharedPreferences(TITLES,Context.MODE_PRIVATE);
    Map<String,?> before=new LinkedHashMap<>(titlePrefs.getAll());
    if(!writeTitles(titlePrefs,chosen)){if(!rollback(titlePrefs,before))Log.e("nicoid-backup","Custom title rollback failed");return false;}
    try{if(apply(prefs,ordinary))return true;}catch(Exception ex){Log.w("nicoid-backup","Unable to restore settings",ex);}
    if(!rollback(titlePrefs,before))Log.e("nicoid-backup","Custom title rollback failed");
    return false;
   });
  }catch(InterruptedException ex){Thread.currentThread().interrupt();return false;}
  catch(Exception ex){Log.w("nicoid-backup","Unable to import backup",ex);return false;}
 }
}
