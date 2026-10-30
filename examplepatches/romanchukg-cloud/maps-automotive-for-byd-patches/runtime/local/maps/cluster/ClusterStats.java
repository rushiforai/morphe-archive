package local.maps.cluster;

import android.util.Log;

/** 54F diagnostics only: counts cluster (re)connections; ClusterHost never reads it back.
 * Numbers, fixed enums and times since process start only: no display names, places or account data.
 * Launch attempts are counted on the standard (Tang) path; DiLink 3 and 5.1 appear only as close reasons. */
final class ClusterStats {
    static final String TAG="MapsClusterStats";
    static final long LOG_INTERVAL_MS=30000, NO_ACTIVITY_MS=15000;
    enum Close {
        OFF("off"),NO_DISPLAY("no_display"),THEME("theme"),RELAUNCH("relaunch"),ERROR("error"),PROFILE51("profile51"),DILINK3("dilink3"),BACKGROUND("background"),OTHER("other");
        final String key;
        Close(String key){this.key=key;}
    }
    /** Why "Start cluster map without opening Maps" stopped for this process. */
    enum Fallback {
        CREATE_FAILED("create_failed"),PRESENTATION_FAILED("presentation_failed"),NO_ACTIVITY("no_activity"),UNEXPECTED_CLOSE("unexpected_close"),PREVIOUS_ATTEMPT_DIED("previous_attempt_died");
        final String key;
        Fallback(String key){this.key=key;}
    }
    private static long processStart=-1,lastLog=-1,pendingAttempt=-1,mainAt=-1,firstClusterAt=-1;
    private static int attempts,created,unexpected,noActivity,displaysAdded,displaysRemoved,backgroundAttempts;
    private static boolean backgroundOption,firstWithoutMain;
    private static Fallback fallback;
    private static final int[] closes=new int[Close.values().length];
    private static boolean dirty;
    private ClusterStats(){}
    static synchronized void start(long processStartElapsed){processStart=processStartElapsed;}
    /** A new Presentation with the embedded native cluster is about to be created. */
    static synchronized void attempt(long now,boolean withoutMain){expire(now);attempts++;if(withoutMain)backgroundAttempts++;pendingAttempt=now;changed(now);}
    /** The native cluster Activity was created (any path); withoutMain: MapsActivity was not seen yet. */
    static synchronized void created(long now,boolean withoutMain){created++;pendingAttempt=-1;if(firstClusterAt<0){firstClusterAt=now;firstWithoutMain=withoutMain;}changed(now);}
    static synchronized void backgroundOption(boolean on){backgroundOption=on;}
    /** Background start stopped for this process: logged at once. */
    static synchronized void fallback(Fallback reason,long now){if(reason==null||fallback!=null)return;fallback=reason;dirty=true;emit(now,"background_fallback");}
    /** The native cluster Activity was destroyed while the host was not closing it: logged at once. */
    static synchronized void unexpected(long now){unexpected++;dirty=true;emit(now,"unexpected_close");}
    static synchronized void closed(Close reason,long now){if(reason==null)return;closes[reason.ordinal()]++;changed(now);}
    static synchronized void display(boolean added,long now){if(added)displaysAdded++;else displaysRemoved++;changed(now);}
    static synchronized void main(long now){if(mainAt<0){mainAt=now;changed(now);}}
    /** Periodic: counts launches that produced no Activity within NO_ACTIVITY_MS and flushes a pending line. */
    static synchronized void tick(long now){
        expire(now);
        if(dirty&&due(now))emit(now,"changed");
    }
    /** reconcile() runs before tick() in the same loop, so a relaunch must count the attempt it replaces. */
    private static void expire(long now){if(pendingAttempt>=0&&now-pendingAttempt>=NO_ACTIVITY_MS){noActivity++;pendingAttempt=-1;dirty=true;}}
    static synchronized String snapshot(long now){
        StringBuilder close=new StringBuilder();
        for(Close reason:Close.values())close.append(close.length()==0?"":",").append(reason.key).append(':').append(closes[reason.ordinal()]);
        return "up_s="+(processStart<0?-1:Math.max(0,now-processStart)/1000)+" attempts="+attempts+" ok="+created+" unexpected="+unexpected
            +" no_activity_15s="+noActivity+" close="+close+" display=+"+displaysAdded+"/-"+displaysRemoved
            +" main_seen="+(mainAt<0?0:1)+" main_ms="+since(mainAt)+" first_cluster_ms="+since(firstClusterAt)
            +" first_cluster_without_main="+(firstWithoutMain?1:0)+" bg_option="+(backgroundOption?1:0)+" bg_attempts="+backgroundAttempts
            +" bg_fallback="+(fallback==null?"none":fallback.key);
    }
    private static long since(long at){return at<0||processStart<0?-1:Math.max(0,at-processStart);}
    private static boolean due(long now){return lastLog<0||now-lastLog>=LOG_INTERVAL_MS;}
    private static void changed(long now){dirty=true;if(due(now))emit(now,"changed");}
    private static void emit(long now,String event){
        dirty=false;lastLog=now;
        try{Log.i(TAG,"event="+event+" "+snapshot(now));}catch(RuntimeException ignored){/* Diagnostics must not affect the cluster. */}
    }
}
