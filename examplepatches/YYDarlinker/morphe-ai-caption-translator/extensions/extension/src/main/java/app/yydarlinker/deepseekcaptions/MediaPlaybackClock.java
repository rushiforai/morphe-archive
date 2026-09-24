package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.media.session.MediaController;import android.media.session.PlaybackState;import android.os.SystemClock;import java.lang.ref.WeakReference;
/** Read-only, same-Activity media controller. No notification-listener permission or new host hook. */
final class MediaPlaybackClock {
    private static WeakReference<Activity> activity=new WeakReference<>(null);
    private static volatile PlaybackState state;private static volatile long epoch,rawAt;private static String video="";
    static void activity(Activity a){activity=new WeakReference<>(a);state=null;}
    static synchronized void video(String id){String clean=id==null?"":id;if(!clean.equals(video)){video=clean;epoch=SystemClock.elapsedRealtime();rawAt=0;state=null;lastPresentation=0;}}
    static void raw(){rawAt=SystemClock.elapsedRealtime();}
    static void refresh(){try{Activity a=activity.get();MediaController c=a==null?null:a.getMediaController();
        state=c!=null&&a.getPackageName().equals(c.getPackageName())?c.getPlaybackState():null;
    }catch(Throwable ignored){state=null;}}
    static synchronized long position(long raw,long now){PlaybackState s=state;
        long projected=s==null?raw:PlaybackSignalPolicy.position(raw,rawAt,epoch,s.getPosition(),s.getLastPositionUpdateTime(),s.getPlaybackSpeed(),s.getState()==PlaybackState.STATE_PLAYING,s.getState()==PlaybackState.STATE_PAUSED,now);
        lastPresentation=Math.max(lastPresentation,projected);return lastPresentation;
    }
    static boolean available(){return state!=null;}
    private static long lastPresentation;
    static synchronized void seek(long time){lastPresentation=Math.max(0,time);}
}
