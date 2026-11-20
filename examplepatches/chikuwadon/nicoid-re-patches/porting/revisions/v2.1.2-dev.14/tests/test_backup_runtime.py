#!/usr/bin/env python3
"""Exercise real backup logic against deterministic Android and JSON boundary doubles."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess, os

HERE=Path(__file__).resolve().parent.parent
ROOT=HERE.parents[2]
JAR=Path("/tmp/nicoid-v2-jars/json.jar")
if not JAR.is_file():
    raise RuntimeError("JSON runtime jar missing; run after NicoLive contract tests")
sources={
"android/content/SharedPreferences.java":"""package android.content;
import java.util.*;
public interface SharedPreferences {
 Map<String,?> getAll();
 Editor edit();
 interface Editor {
  Editor clear();Editor putString(String k,String v);Editor putBoolean(String k,boolean v);
  Editor putInt(String k,int v);Editor putLong(String k,long v);Editor putFloat(String k,float v);
  Editor putStringSet(String k,Set<String> v);boolean commit();
 }
}
""",
"android/content/Context.java":"""package android.content;
import java.util.*;
public class Context {
 public static final int MODE_PRIVATE=0;
 private final Map<String,SharedPreferences> prefs=new HashMap<>();
 public SharedPreferences getSharedPreferences(String name,int mode){
  if(!prefs.containsKey(name))prefs.put(name,new e.e.a.BackupRuntimeTest.Prefs());
  return prefs.get(name);
 }
}
""",
"android/util/Log.java":"""package android.util;
public class Log {
 public static int w(String a,String b,Throwable e){return 0;}
 public static int e(String a,String b){return 0;}
}
""",
"e/e/a/LocalPlaylists.java":"""package e.e.a;
import java.util.concurrent.*;
public class LocalPlaylists {
 private static final ExecutorService WRITES=Executors.newSingleThreadExecutor();
 public static ExecutorService queue(){return WRITES;}
}
""",
"e/e/a/LocalPlaylistData.java":"""package e.e.a;
import org.json.*;
public class LocalPlaylistData {
 public LocalPlaylistData(String raw)throws JSONException {
  JSONObject data=new JSONObject(raw);
  data.getJSONArray("folders");data.getJSONArray("videos");data.getJSONArray("groups");
 }
}
""",
"e/e/a/SettingsBackup.java":"""package e.e.a;
import android.content.SharedPreferences;
import java.util.*;
class SettingsBackup {
 static final Map<String,String> TYPES=SettingsBackupData.TYPES;
 static boolean failNext=false;
 static boolean apply(SharedPreferences prefs,Map<String,Object> values){
  SharedPreferences.Editor editor=prefs.edit();
  for(Map.Entry<String,Object> item:values.entrySet()){
   String k=item.getKey();Object v=item.getValue();
   if(v instanceof String)editor.putString(k,(String)v);
   else if(v instanceof Boolean)editor.putBoolean(k,(Boolean)v);
   else if(v instanceof Integer)editor.putInt(k,(Integer)v);
   else if(v instanceof Long)editor.putLong(k,(Long)v);
   else if(v instanceof Float)editor.putFloat(k,(Float)v);
   else if(v instanceof Set){@SuppressWarnings("unchecked")Set<String> set=(Set<String>)v;editor.putStringSet(k,set);}
   else throw new IllegalArgumentException("Type "+k);
  }
  if(failNext){failNext=false;return false;}
  return editor.commit();
 }
}
""",
"e/e/a/BackupRuntimeTest.java":"""package e.e.a;
import android.content.*;
import org.json.*;
import java.util.*;
public class BackupRuntimeTest {
 public static final class Prefs implements SharedPreferences {
  final Map<String,Object> data=new LinkedHashMap<>();
  public Map<String,?> getAll(){return new LinkedHashMap<>(data);}
  public Editor edit(){return new Editor(){
   final Map<String,Object> delta=new LinkedHashMap<>();boolean clear;
   public Editor clear(){clear=true;return this;}
   public Editor putString(String k,String v){delta.put(k,v);return this;}
   public Editor putBoolean(String k,boolean v){delta.put(k,v);return this;}
   public Editor putInt(String k,int v){delta.put(k,v);return this;}
   public Editor putLong(String k,long v){delta.put(k,v);return this;}
   public Editor putFloat(String k,float v){delta.put(k,v);return this;}
   public Editor putStringSet(String k,Set<String> v){delta.put(k,new HashSet<>(v));return this;}
   public boolean commit(){if(clear)data.clear();data.putAll(delta);return true;}
  };}
 }
 static void require(boolean yes,String message){if(!yes)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
  Context source=new Context();Prefs prefs=new Prefs();
  String folder="b02ca773-ff41-4ded-b483-5a33c3d955c9";
  String playlist="{\\"folders\\":[{\\"id\\":\\""+folder+"\\",\\"name\\":\\"playlist\\"}],\\"videos\\":[],\\"groups\\":[]}";
  prefs.data.put(PlaylistBackup213.PLAYLISTS,playlist);
  prefs.data.put("nicoid_local_playlist_sort_"+folder,3);
  prefs.data.put("save_playback_position",true);
  prefs.data.put("ranking_presets_v190","[]");
  prefs.data.put("saveNGList","[]");
  prefs.data.put("save_cookie","private");
  Prefs titles=(Prefs)source.getSharedPreferences(PlaylistBackup213.TITLES,0);
  titles.data.put("sm111","Renamed title");
  SettingsBackup.TYPES.put(PlaylistBackup213.PLAYLISTS,"string");
  SettingsBackup.TYPES.put(PlaylistBackup213.TITLES,"string");
  Map<String,?> captured=PlaylistBackup213.snapshot(source,prefs);
  JSONObject encoded=new JSONObject((String)captured.get(PlaylistBackup213.TITLES));
  require("Renamed title".equals(encoded.getString("sm111")),"Private title export");
  JSONObject document=SettingsBackupData.encode(captured);
  JSONObject items=document.getJSONObject("settings");
  require(items.has("save_playback_position"),"Saved playback preference omitted");
  require(items.has("nicoid_local_playlist_sort_"+folder),"Sort preference omitted");
  require(items.has("ranking_presets_v190"),"Ranking preset omitted");
  require(items.has("saveNGList"),"Local NG rule preference omitted");
  require(!items.has("save_cookie"),"Authentication data leaked");

  Context destination=new Context();Prefs restored=new Prefs();
  restored.data.put(PlaylistBackup213.PLAYLISTS,"{\\"folders\\":[],\\"videos\\":[],\\"groups\\":[]}");
  restored.data.put("nicoid_local_playlist_sort_"+folder,1);
  Prefs targetTitles=(Prefs)destination.getSharedPreferences(PlaylistBackup213.TITLES,0);
  targetTitles.data.put("sm999","Old title");
  SettingsBackup.TYPES.clear();
  SettingsBackup.TYPES.put(PlaylistBackup213.PLAYLISTS,"string");
  SettingsBackup.TYPES.put(PlaylistBackup213.TITLES,"string");
  PlaylistBackup213.prepareImport(document);
  Map<String,Object> decoded=SettingsBackupData.decode(document);
  require(decoded.size()==items.length(),"Decoding skipped a known setting");
  require(PlaylistBackup213.restore(destination,restored,decoded),"Fresh-device restore failed");
  require(playlist.equals(restored.data.get(PlaylistBackup213.PLAYLISTS)),"Playlist restore mismatch");
  require(Integer.valueOf(3).equals(restored.data.get("nicoid_local_playlist_sort_"+folder)),"Sort mode restore mismatch");
  require(Boolean.TRUE.equals(restored.data.get("save_playback_position")),"Playback option restore mismatch");
  require("Renamed title".equals(targetTitles.data.get("sm111")),"Edited title restore mismatch");
  require(!targetTitles.data.containsKey("sm999"),"New backup should replace stale title overrides");
  require(!restored.data.containsKey(PlaylistBackup213.TITLES),"Private titles must never be stored in normal preferences");

  Map<String,Object> legacy=new HashMap<>();
  legacy.put("save_playback_position",false);
  require(PlaylistBackup213.restore(destination,restored,legacy),"Legacy settings-only import");
  require("Renamed title".equals(targetTitles.data.get("sm111")),"Legacy import deleted title edits");
  require(playlist.equals(restored.data.get(PlaylistBackup213.PLAYLISTS)),"Legacy import deleted playlist");
  require(!Boolean.TRUE.equals(restored.data.get("save_playback_position")),"Legacy import preference ignored");

  Map<String,Object> broken=new HashMap<>(decoded);
  broken.put(PlaylistBackup213.TITLES,"{bad json");
  require(!PlaylistBackup213.restore(destination,restored,broken),"Corrupt title map accepted");
  require("Renamed title".equals(targetTitles.data.get("sm111")),"Corrupt import modified originals");

  SettingsBackup.failNext=true;
  targetTitles.data.put("smOther","Preserve on rollback");
  require(!PlaylistBackup213.restore(destination,restored,decoded),"Failed settings commit unexpectedly succeeded");
  require("Preserve on rollback".equals(targetTitles.data.get("smOther")),"Failed restore did not roll back titles");
  require("Renamed title".equals(targetTitles.data.get("sm111")),"Failed restore lost existing title");
  LocalPlaylists.queue().shutdown();
  System.out.println("PASS: actual JSON export/import, custom titles, playlist sort, security, old files, corruption and rollback");
 }
}
"""
}
with TemporaryDirectory(prefix="backup-runtime-") as tmp:
    root=Path(tmp);classes=root/"classes";classes.mkdir()
    for name,source in sources.items():
        p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source)
    java=[str(x) for x in root.rglob("*.java")]
    java += [str(HERE/"PlaylistBackup213.java"),
             str(ROOT/"extensions/extension/src/main/java/e/e/a/SettingsBackupData.java")]
    subprocess.run(["javac","--release","8","-encoding","UTF-8","-cp",str(JAR),"-d",str(classes),*java],check=True)
    subprocess.run(["java","-cp",os.pathsep.join([str(classes),str(JAR)]),"e.e.a.BackupRuntimeTest"],check=True)
