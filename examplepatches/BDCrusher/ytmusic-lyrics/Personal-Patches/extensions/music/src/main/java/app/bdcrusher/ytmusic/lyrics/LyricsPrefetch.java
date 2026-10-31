/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import java.util.Set;
import java.util.concurrent.*;
import java.util.function.Consumer;
import app.morphe.extension.music.patches.lyrics.model.TrackInfo;
/** Background discovery for saved recordings; audio completion is independent of provider success. */
public final class LyricsPrefetch {
 private static final ExecutorService IO=Executors.newFixedThreadPool(2);
 private static final Set<String> active=ConcurrentHashMap.newKeySet();
 private static final ConcurrentHashMap<String,Long> later=new ConcurrentHashMap<>();
 private LyricsPrefetch(){}
 private static boolean installed(Context c){try(var in=c.getAssets().open("bdcrusher-lyrics/providers.json")){return true;}catch(Exception absent){return false;}}
 public static boolean saved(Context c,String id){return new LyricsLibrary(c).get(id)!=null;}
 public static void enqueue(Context context,String id,String title,String artist,int duration,Consumer<Boolean> complete){
  Context c=context.getApplicationContext();if(!id.matches("[A-Za-z0-9_-]{11}")||!installed(c)||!LyricsRetry.active(c)||!app.morphe.extension.music.settings.Settings.LYRICS_ENABLED.get()){complete.accept(saved(c,id));return;}
  if(active.size()>=128||later.getOrDefault(id,0L)>android.os.SystemClock.elapsedRealtime()||!active.add(id)){complete.accept(saved(c,id));return;}
  IO.execute(()->{
   CountDownLatch finished=new CountDownLatch(1);
   try(LyricsCatalog catalog=new LyricsCatalog(c,new TrackInfo(title==null?"":title,artist==null?"":artist,"",duration),id,false,new LyricsCatalog.Sink(){
    public void result(org.json.JSONObject p){}public void notice(String text,boolean done){if(done)finished.countDown();}
   })) {finished.await(90,TimeUnit.SECONDS);}
   catch(InterruptedException cancelled){Thread.currentThread().interrupt();}
   catch(Exception failed){LyricsDiagnostics.record("Playlist-lyrics","recording="+id+" prefetch failed: "+failed.getClass().getSimpleName());}
   finally{active.remove(id);boolean found=saved(c,id);if(!found)later.put(id,android.os.SystemClock.elapsedRealtime()+15*60*1000);if(later.size()>1024)later.clear();complete.accept(found);}
  });
 }
}
