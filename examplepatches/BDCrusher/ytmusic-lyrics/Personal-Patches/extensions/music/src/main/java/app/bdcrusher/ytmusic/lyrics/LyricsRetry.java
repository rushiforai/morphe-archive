/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

/** Bounded transient retries; never retry denial, not-found, invalid data or TLS failures. */
final class LyricsRetry {
    private LyricsRetry(){}
    static long jitter(long minimum){return minimum+java.util.concurrent.ThreadLocalRandom.current().nextLong(1,Math.max(2,Math.min(251,minimum/10+1)));}
    static long delay(Exception failure,int completedAttempts){
        if(completedAttempts>=9)return -1;
        long[] delays={750,1500,3000,6000,10000,30000,120000,300000};
        long delay=delays[Math.max(0,completedAttempts-1)];
        if(failure instanceof LyricsNetwork.HttpFailure http){
            if(http.status!=408&&http.status!=429&&http.status!=500&&http.status!=502&&http.status!=503&&http.status!=504)return -1;
            return Math.max(delay,http.retryAfterMs);
        }
        if(failure instanceof java.io.IOException&&!(failure instanceof javax.net.ssl.SSLException)
                &&!(failure instanceof java.net.ProtocolException)&&!(failure instanceof LyricsNetwork.PayloadLimit))return delay;
        return -1;
    }
    static boolean active(android.content.Context context){
        android.app.Activity activity=app.morphe.extension.shared.Utils.getActivity();
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!activity.hasWindowFocus())return false;
        try{android.net.ConnectivityManager manager=(android.net.ConnectivityManager)context.getSystemService(android.content.Context.CONNECTIVITY_SERVICE);
            android.net.NetworkCapabilities capabilities=manager.getNetworkCapabilities(manager.getActiveNetwork());
            return capabilities!=null&&capabilities.hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_INTERNET)&&capabilities.hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_VALIDATED);
        }catch(Exception ignored){return true;}
    }
}
