package e.e.a;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.*;
import java.util.Map;
import java.util.concurrent.*;

/** Atomic settings and user-owned playlist/title backup bridge. */
public final class PlaylistBackup213 {
 public static final String PLAYLISTS="nicoid_local_playlists_v1";
 public static final String TITLES="nicoid_video_title_overrides";
 private PlaylistBackup213(){}
 public static void validate(Map<?,?> values)throws IOException {
  Object playlist=values.get(PLAYLISTS);
  if(playlist!=null) {
   if(!(playlist instanceof String)||((String)playlist).isEmpty()||((String)playlist).length()>12*1024*1024)
    throw new IOException("Invalid playlist snapshot");
   try {Class.forName("e.e.a.LocalPlaylistData").getConstructor(String.class).newInstance((String)playlist);}
   catch(ReflectiveOperationException ex){throw new IOException("Invalid playlist identities",ex);}
  }
  Object titles=values.get(TITLES);
  if(titles!=null&&(!(titles instanceof String)||((String)titles).length()>4*1024*1024))
   throw new IOException("Invalid custom title snapshot");
 }
 private static <T> T queued(Callable<T> task)throws Exception {
  Field field=Class.forName("e.e.a.LocalPlaylists").getDeclaredField("WRITES");
  field.setAccessible(true);
  ExecutorService executor=(ExecutorService)field.get(null);
  if(executor==null)throw new IOException("Playlist storage unavailable");
  try{return executor.submit(task).get();}
  catch(ExecutionException ex){throw new IOException("Playlist operation failed",ex.getCause());}
 }
 public static Map<String,?> snapshot(SharedPreferences prefs)throws Exception {
  return queued(()->{Map<String,?> values=prefs.getAll();validate(values);return values;});
 }
 private static Boolean originalApply(SharedPreferences prefs,Map<String,Object> values)throws Exception {
  Method method=Class.forName("e.e.a.SettingsBackup").getDeclaredMethod("apply",SharedPreferences.class,Map.class);
  method.setAccessible(true);
  return Boolean.TRUE.equals(method.invoke(null,prefs,values));
 }
 public static boolean restore(SharedPreferences prefs,Map<String,Object> values){
  try{validate(values);return queued(()->originalApply(prefs,values));}
  catch(InterruptedException ex){Thread.currentThread().interrupt();return false;}
  catch(Exception ex){Log.w("nicoid-backup","Settings or playlist import failed",ex);return false;}
 }
}
