package local.maps.cluster;

/** Shared bounds and decisions, with no Android or navigation data dependencies. */
final class DiagnosticPolicy {
    static final long DAY=86400000L;
    static final int MAX_REPORT=49152, MAX_QUEUE=3;
    static boolean automaticAllowed(boolean informed,boolean enabled,long last,long now) {
        return informed&&enabled&&(last==0 || (now>=last && now-last>=DAY));
    }
    static String metadata(String value,int max) {
        if(value==null)return "unknown";
        String clean=value.replaceAll("[^A-Za-z0-9 ._()/:+\\-]", "").trim();
        // Metadata is never a channel for account IDs, credentials or URLs.
        if(clean.isEmpty()||clean.contains("://")||clean.contains("github_pat_")||clean.contains("ghp_")||clean.matches(".*[0-9]{15,}.*"))return "unknown";
        return clean.substring(0,Math.min(max,clean.length()));
    }
    static boolean issueUrl(String url) {
        return url!=null&&url.matches("https://github\\.com/romanchukg-cloud/google-maps-for-byd/issues/[1-9][0-9]*");
    }
    static boolean retryable(int code) { return code==0 || code==429 || code==503 || code>=500; }
    static long delay(int attempt,long retryAfter) {
        long[] times={10000,30000,120000,600000,3600000};
        return Math.max(times[Math.min(Math.max(0,attempt),times.length-1)],Math.min(DAY,Math.max(0,retryAfter)));
    }
    static int bounded(int n,int min,int max){return Math.max(min,Math.min(max,n));}
}
