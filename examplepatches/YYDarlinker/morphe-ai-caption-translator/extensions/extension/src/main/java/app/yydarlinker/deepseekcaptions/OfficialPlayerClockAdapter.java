package app.yydarlinker.deepseekcaptions;

import android.media.session.PlaybackState;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Read-only adapter for the public Morphe/YouTube player time surface. */
final class OfficialPlayerClockAdapter {
  static final class Sample {
    final boolean available;
    final String videoId,reason,stateName;
    final long position,readElapsed;
    final float speed;
    final int state;
    Sample(boolean available,String videoId,long position,float speed,int state,String stateName,String reason,long readElapsed){
      this.available=available;this.videoId=videoId;this.position=position;this.speed=speed;this.state=state;this.stateName=stateName;this.reason=reason;this.readElapsed=readElapsed;
    }
    static Sample unavailable(String reason,long at){return new Sample(false,"",-1,0,PlaybackState.STATE_NONE,"",reason,at);}
  }
  private static final String VIDEO_INFORMATION="app.morphe.extension.youtube.patches.VideoInformation";
  private static final String VIDEO_STATE="app.morphe.extension.youtube.shared.VideoState";
  private static volatile boolean resolved;
  private static Method getVideoTime,getVideoId,getPlaybackSpeed,getCurrent;
  private OfficialPlayerClockAdapter(){}

  static Sample read(String expectedVideo){
    long at=android.os.SystemClock.elapsedRealtime();resolve();
    if(getVideoTime==null)return Sample.unavailable("binding_missing",at);
    try {
      Object rawId=getVideoId==null?null:getVideoId.invoke(null);
      String id=rawId==null?"":String.valueOf(rawId);
      if(expectedVideo==null||expectedVideo.isEmpty()||id.isEmpty()||!expectedVideo.equals(id))
        return Sample.unavailable("owner_mismatch",at);
      Object value=getVideoTime.invoke(null);if(!(value instanceof Number))return Sample.unavailable("invalid_time",at);
      long position=((Number)value).longValue();if(position<0)return Sample.unavailable("negative_time",at);
      float speed=1f;if(getPlaybackSpeed!=null){Object v=getPlaybackSpeed.invoke(null);if(v instanceof Number)speed=((Number)v).floatValue();}
      String name="";int state=PlaybackState.STATE_PLAYING;
      if(getCurrent!=null){Object current=getCurrent.invoke(null);if(current!=null){name=String.valueOf(current);state=mapState(name);}}
      if(!Float.isFinite(speed)||speed<=0||speed>4)return Sample.unavailable("invalid_speed",at);
      return new Sample(true,id,position,speed,state,name,"",at);
    } catch(Throwable failure){return Sample.unavailable("getter_failed",at);}
  }

  static void resetForTests(){resolved=false;getVideoTime=null;getVideoId=null;getPlaybackSpeed=null;getCurrent=null;}
  private static int mapState(String value){
    String name=value==null?"":value.toUpperCase(java.util.Locale.ROOT);
    if(name.contains("PAUSED"))return PlaybackState.STATE_PAUSED;
    if(name.contains("BUFFER"))return PlaybackState.STATE_BUFFERING;
    if(name.contains("ENDED"))return PlaybackState.STATE_STOPPED;
    if(name.contains("NEW")||name.contains("ERROR"))return PlaybackState.STATE_NONE;
    return PlaybackState.STATE_PLAYING;
  }
  private static void resolve(){
    if(resolved)return;synchronized(OfficialPlayerClockAdapter.class){if(resolved)return;resolved=true;
      try {
        Class<?> information=Class.forName(VIDEO_INFORMATION);
        getVideoTime=publicStatic(information,"getVideoTime");
        getVideoId=publicStatic(information,"getVideoId");
        getPlaybackSpeed=publicStatic(information,"getPlaybackSpeed");
      } catch(Throwable ignored) {}
      try { getCurrent=publicStatic(Class.forName(VIDEO_STATE),"getCurrent"); } catch(Throwable ignored) {}
    }
  }
  private static Method publicStatic(Class<?> type,String name){
    try { Method method=type.getMethod(name);return Modifier.isStatic(method.getModifiers())?method:null; }
    catch(Throwable ignored){return null;}
  }
}