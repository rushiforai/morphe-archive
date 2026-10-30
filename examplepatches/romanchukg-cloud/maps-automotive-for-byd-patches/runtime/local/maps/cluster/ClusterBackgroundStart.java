package local.maps.cluster;

import android.content.Context;
import android.content.SharedPreferences;

/** 54F option "Start cluster map without opening Maps" (Tang standard path only).
 * Off: never allows anything, so ClusterHost waits for MapsActivity exactly as before.
 * On: a start without MapsActivity is allowed DELAY_MS after process start. Any failure stops it for the rest
 * of the process. A durable journal stops it after a process died during such a start, until Maps is opened. */
final class ClusterBackgroundStart {
    /** 5 s (owner, 54G; 54F used 15 s and on Tang created the cluster 15.9 s after process start, no failure).
     * It does not meet Android's startup deadlines: content providers are published before Application.onCreate
     * (ClusterHost's 2 s loop starts 3 s after it); service start/bind allow 20 s foreground / 200 s background,
     * broadcasts 10 s / 60 s, a foreground service 10 s to reach startForeground; the creation holds the main thread
     * 0.07-0.43 s (4.2 s once in a cold AVD process; Tang 54F within 0.9 s of the attempt); the cluster window takes
     * no input. MicroG/bootstrap were ready about 3.6 s after process start. The ordinary start already creates the
     * cluster 1.5 s after MapsActivity, during Maps' own UI start-up. */
    static final long DELAY_MS=5000;
    /** A start that stayed up this long no longer counts as dying during the start. */
    static final long HEALTHY_MS=10000;
    static final String KEY="cluster_background_start";
    private final SharedPreferences journal;
    private final long processStart;
    private boolean stopped,pending;
    private long shownAt=-1;
    ClusterBackgroundStart(Context context,long processStart,long now){
        this.processStart=processStart;
        SharedPreferences prefs=null;
        try{prefs=context.getSharedPreferences("local_cluster_background",Context.MODE_PRIVATE);pending=prefs.getBoolean("attempt_pending",false);}
        catch(RuntimeException unavailable){prefs=null;}
        journal=prefs;
        ClusterStats.backgroundOption(option());
        if(journal==null)stopped=true; // no journal, no unguarded background start; ClusterHost still installs
        else if(pending&&option())failed(ClusterStats.Fallback.PREVIOUS_ATTEMPT_DIED,now);
    }
    private static boolean option(){ClusterSettings.State s=ClusterSettings.state();return s!=null&&s.backgroundStart;}
    /** otherPath: DiLink 3 candidate or DiLink 5.1 profile, which keep waiting for MapsActivity. */
    boolean allowed(long now,boolean otherPath){return !stopped&&!otherPath&&option()&&now-processStart>=DELAY_MS;}
    boolean stopped(){return stopped;}
    /** Journaled before the native cluster is created without MapsActivity. */
    void attempt(){pending=true;shownAt=-1;write(true);}
    void shown(boolean created,long now){if(created)shownAt=now;else failed(ClusterStats.Fallback.NO_ACTIVITY,now);}
    /** Called while the cluster stays shown. */
    void alive(long now){if(pending&&shownAt>=0&&now-shownAt>=HEALTHY_MS){pending=false;write(false);}}
    void mainSeen(){if(pending){pending=false;write(false);}}
    /** Stops background start for this process. A death journal stays until MapsActivity is seen. */
    void failed(ClusterStats.Fallback reason,long now){
        if(stopped)return;
        stopped=true;ClusterStats.fallback(reason,now);
        if(reason!=ClusterStats.Fallback.PREVIOUS_ATTEMPT_DIED&&pending){pending=false;write(false);}
    }
    private void write(boolean value){if(journal!=null)try{journal.edit().putBoolean("attempt_pending",value).commit();}catch(RuntimeException ignored){}}
}
