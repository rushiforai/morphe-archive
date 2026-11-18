package app.template.extension.extension;
import java.util.Locale;

/** Metrics compare sums of request durations, not elapsed preview time. */
public final class BurstSummary {
    public static final class Metrics {
        public final int hits,misses,matched;public final long actualRequestNanos,withoutCacheNanos,savedNanos;public final boolean complete;
        private Metrics(int h,int m,int matched,long actual,long baseline,long saved,boolean complete){this.hits=h;this.misses=m;this.matched=matched;this.actualRequestNanos=actual;this.withoutCacheNanos=baseline;this.savedNanos=saved;this.complete=complete;}
        public int cachePercent(){long total=(long)hits+misses;return total==0?-1:(int)Math.round(100.0*hits/total);}
        public String headline(){if(!complete)return "Estimate unavailable";return String.format(Locale.ROOT,"~%.2fs",savedNanos/1e9);}
        public String comparison(){if(!complete)return "Not enough timing data for this activity";if(withoutCacheNanos==0)return "Estimated request time without cache: 0.00 s";long percent=Math.min(100,Math.round(100.0*savedNanos/withoutCacheNanos));return String.format(Locale.ROOT,"%.2fs → %.2fs · %d%% faster",withoutCacheNanos/1e9,actualRequestNanos/1e9,percent);}
    }
    public static Metrics calculate(ActivityBurst burst){
        if(burst==null)return null;int hits=0,misses=0,matched=0;long actual=0,baseline=0;
        for(RequestRecord r:burst.requests()){
            long duration=r.endNanos-r.startNanos;actual=safeAdd(actual,duration);
            if(r.cached){hits++;if(r.details!=null&&r.details.sampleNanos>=0){matched++;baseline=safeAdd(baseline,r.details.sampleNanos);}else baseline=safeAdd(baseline,duration);}
            else{misses++;baseline=safeAdd(baseline,duration);}
        }
        long saved=Math.max(0,baseline-actual);return new Metrics(hits,misses,matched,actual,baseline,saved,burst.coverage.requestsComplete&&hits==matched&&baseline>=actual);
    }
    public static String card(ActivityBurst burst){Metrics m=calculate(burst);if(m==null)return "Activity not recorded";return m.headline()+" estimated request time saved\n"+m.comparison()+"\nCache hits: "+m.hits+" · Live requests: "+m.misses;}
    private static long safeAdd(long a,long b){return b>Long.MAX_VALUE-a?Long.MAX_VALUE:a+b;}
    private BurstSummary(){}
}
