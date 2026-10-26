package app.morphe.extension.chmate;
import java.net.URI;
import java.util.HashMap;
import java.util.Map;
/** Parallel scans share one minimum request interval per public index host. */
final class SearchRequestPacing {
    static final String HISSI_INTERVAL_KEY="hissiScanIntervalSeconds";
    static final String KYODEMO_INTERVAL_KEY="kyodemoScanIntervalSeconds";
    static final int MAX_INTERVAL_SECONDS=3600;
    private static final Map<String,Long> LAST=new HashMap<>();
    static String hostKey(String url) {
        String host=URI.create(url).getHost();
        if(host==null)throw new IllegalArgumentException("Search host missing");
        host=host.toLowerCase(java.util.Locale.ROOT);
        if("www.hissi.org".equals(host))return "hissi.org";
        return "www.kyodemo.net".equals(host)?"kyodemo.net":host;
    }
    static int clampSeconds(int seconds) { return Math.max(1,Math.min(MAX_INTERVAL_SECONDS,seconds)); }
    static long intervalMillis(String host) {
        if("hissi.org".equals(host))return clampSeconds(Haiagaru.hissiScanIntervalSeconds())*1000L;
        if("kyodemo.net".equals(host))return clampSeconds(Haiagaru.kyodemoScanIntervalSeconds())*1000L;
        return 10_000L;
    }
    static void await(String url) throws InterruptedException {
        String host=hostKey(url);
        for(;;){
            if(Thread.currentThread().isInterrupted())throw new InterruptedException("停止しました");
            long wait;
            synchronized(LAST){
                long now=android.os.SystemClock.elapsedRealtime();
                Long last=LAST.get(host);
                wait=last==null?0:last+intervalMillis(host)-now;
                if(wait<=0){LAST.put(host,now);return;}
            }
            // Recheck after waking: a delayed worker must not use an expired slot
            // at the same instant as another worker. Cancellation reserves no slot.
            // Also re-read live settings during a long wait.
            Thread.sleep(Math.min(wait,250L));
        }
    }
    private SearchRequestPacing(){}
}
