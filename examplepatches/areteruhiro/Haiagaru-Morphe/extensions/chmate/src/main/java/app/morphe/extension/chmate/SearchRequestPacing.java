package app.morphe.extension.chmate;
import java.net.URI;
import java.util.HashMap;
import java.util.Map;
/** Parallel scans share one minimum request interval per public index host. */
final class SearchRequestPacing {
    private static final Map<String,Long> NEXT=new HashMap<>();
    static void await(String url) throws InterruptedException {
        String host=URI.create(url).getHost();
        if(host==null)throw new IllegalArgumentException("Search host missing");
        host=host.toLowerCase(java.util.Locale.ROOT);
        for(;;){
            if(Thread.currentThread().isInterrupted())throw new InterruptedException("停止しました");
            long wait;
            synchronized(NEXT){
                long now=android.os.SystemClock.elapsedRealtime();
                wait=(NEXT.containsKey(host)?NEXT.get(host):0L)-now;
                if(wait<=0){NEXT.put(host,now+10_000L);return;}
            }
            // Recheck after waking: a delayed worker must not use an expired slot
            // at the same instant as another worker. Cancellation reserves no slot.
            Thread.sleep(wait);
        }
    }
    private SearchRequestPacing(){}
}
