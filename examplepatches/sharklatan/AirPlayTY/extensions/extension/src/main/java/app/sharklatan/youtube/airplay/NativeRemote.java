package app.sharklatan.youtube.airplay;

/** Connects YouTube's existing audio playback state to the current AirPlay route. */
public final class NativeRemote {
    static volatile AirPlayActivity owner;
    static volatile boolean active,audioOnly;
    private static Boolean lastRate;
    static boolean suppressSeek;
    private static long lastSeek=-1,lastSeekClock;
    private static final android.os.Handler seekHandler=new android.os.Handler(android.os.Looper.getMainLooper());
    private static final Runnable sendLatestSeek=()->{
        AirPlayActivity current=owner;
        if(active&&current!=null)current.nativeSeek(lastSeek);
    };
    static synchronized boolean playing(){return lastRate==null||lastRate;}
    public static synchronized void rate(boolean playing){
        AirPlayActivity current=owner;
        android.util.Log.i("YouTubeAirPlay","Hook rate "+playing+" active="+active+" owner="+(current!=null)+" last="+lastRate);
        if(!active||current==null){lastRate=playing;return;}
        if(lastRate!=null&&lastRate==playing)return;lastRate=playing;current.nativeRate(playing);
    }
    static synchronized void clear(){active=false;owner=null;lastRate=null;seekHandler.removeCallbacks(sendLatestSeek);LocalAudio.mute(false);}
    public static synchronized void seek(long milliseconds){
        android.util.Log.i("YouTubeAirPlay","Hook seek "+milliseconds+" ms active="+active);
        if(suppressSeek||!active||owner==null)return;
        long now=android.os.SystemClock.elapsedRealtime();
        /* Dragging the bar emits dozens of positions. The receiver is repositioned by reloading the
         * item, which takes a second, so only the last position of a drag is sent. */
        if(lastSeek==milliseconds&&now-lastSeekClock<250)return;
        lastSeek=milliseconds;lastSeekClock=now;
        seekHandler.removeCallbacks(sendLatestSeek);seekHandler.postDelayed(sendLatestSeek,900);
    }
    public static void video(String id){
        android.util.Log.i("YouTubeAirPlay","Hook video "+id+" active="+active);
        AirPlayActivity current=owner;if(active&&current!=null)current.nativeVideo(id);
    }
}
