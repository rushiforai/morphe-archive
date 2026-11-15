package e.e.a;
import java.lang.reflect.Field;
import java.util.WeakHashMap;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.SystemClock;

/** Keep a seekable duration even when the legacy Activity changes metadata bundles. */
public final class MediaSeek206 {
 private static final WeakHashMap<Object,Snapshot> LAST=new WeakHashMap<>();
 private static final class Snapshot {String video;long duration;int misses;long lastTrace;}
 private MediaSeek206(){}
 public static synchronized long validDuration(Object state,long duration){
  if(state==null)return duration;
  String video=null;
  try{
   Field field=state.getClass().getDeclaredField("video");
   field.setAccessible(true);
   Object id=field.get(state);
   if(id!=null)video=String.valueOf(id);
  }catch(Exception ignored){}
  Snapshot previous=LAST.get(state);
  if(previous==null){previous=new Snapshot();previous.video=video;LAST.put(state,previous);}
  if(video!=null&&!video.equals(previous.video)){
   previous.video=video;previous.duration=0;previous.misses=0;
  }
  if(duration>0){previous.duration=duration;previous.misses=0;}
  else if(previous.duration>0){
   if(previous.misses++==0)
    ModernDebug.record("MediaSession duration invalid; keeping previous seekable duration");
  }
  long result=duration>0?duration:previous.duration>0?previous.duration:duration;
  long now=SystemClock.uptimeMillis();
  if(now-previous.lastTrace>12000){
   previous.lastTrace=now;
   try{
    Field field=state.getClass().getDeclaredField("session");
    field.setAccessible(true);
    Object session=field.get(state);
    if(session instanceof MediaSession){
     MediaSession media=(MediaSession)session;
     PlaybackState playback=media.getController().getPlaybackState();
     long actions=playback==null?0:playback.getActions();
     int playingState=playback==null?-1:playback.getState();
     ModernDebug.record("MediaSession seek state: active="+media.isActive()+
       " playbackState="+playingState+" seekEnabled="+((actions&PlaybackState.ACTION_SEEK_TO)!=0)+
       " duration="+result+" rawDuration="+duration);
    }
   }catch(Exception e){android.util.Log.w("nicoid-seek","Cannot sample MediaSession",e);}
  }
  return result;
 }
 public static void requested(long position){
  ModernDebug.record("MediaSession onSeekTo "+Math.max(position,0)+"ms");
 }
}
