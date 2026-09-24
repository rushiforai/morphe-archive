package app.yydarlinker.deepseekcaptions;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Small anonymous YouTube cookie refresher used only for source-caption fetches. This mirrors the
 * cookie set Morphe already uses for Timed Text, but keeps it in memory so our translation path
 * does not depend on the age of a setting that may have been captured much earlier.
 */
final class FreshYouTubeCookies {
    private static final List<String> ACCEPTED = Arrays.asList(
            "YSC",
            "VISITOR_INFO1_LIVE",
            "VISITOR_PRIVACY_METADATA",
            "__Secure-ROLLOUT_TOKEN"
    );
    private static final String USER_AGENT =
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 " +
            "(KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36";
    private static final long MAX_AGE_MS = 8L * 60L * 1000L;

    private static volatile String cached = "";
    private static volatile long fetchedAt = 0L;

    private FreshYouTubeCookies() {}

    private static boolean refreshing;
    private static long lastRefreshAttempt;

    /** A signed native caption URL normally works without a separate cookie bootstrap request. */
    static String cached() {
        return System.currentTimeMillis()-fetchedAt<MAX_AGE_MS?cached:"";
    }

    /** Only an actual 401/403 justifies this extra GET. It shares the source request deadline. */
    static String refresh(long deadline,DeepSeekApiClient.RequestControl control) throws Exception {
        long now=System.nanoTime();
        synchronized(FreshYouTubeCookies.class){
            if(refreshing || (lastRefreshAttempt>0 && now-lastRefreshAttempt<java.util.concurrent.TimeUnit.SECONDS.toNanos(30)))return cached;
            refreshing=true;lastRefreshAttempt=now;
        }
        try{
            String refreshed=fetch(Math.min(deadline,now+java.util.concurrent.TimeUnit.SECONDS.toNanos(3)),control);
            if(!refreshed.isEmpty()){cached=refreshed;fetchedAt=System.currentTimeMillis();}
            return cached;
        }finally{synchronized(FreshYouTubeCookies.class){refreshing=false;}}
    }

    static String userAgent() {
        return USER_AGENT;
    }

    private static String fetch(long deadline,DeepSeekApiClient.RequestControl control) throws Exception {
        RawCaptionSource.checkActive(control);
        HttpURLConnection connection = null;
        try {
            URL url=new URL("https://www.youtube.com/sw.js");
            connection=DeepSeekCaptionHook.openWithYouTubeCronet(url);
            if(connection==null)connection=(HttpURLConnection)url.openConnection();
            if(control!=null)control.onConnection(connection);RawCaptionSource.checkActive(control);
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(RawCaptionSource.remaining(deadline));
            connection.setReadTimeout(RawCaptionSource.remaining(deadline));
            connection.setInstanceFollowRedirects(true);
            connection.setUseCaches(false);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Referer", "https://www.youtube.com/");
            connection.setRequestProperty("Accept", "*/*");
            connection.setRequestProperty("Accept-Language", "en-US,en;q=0.9");
            int status;
            try(NetworkDeadline guard=new NetworkDeadline(connection,deadline)){
                status=connection.getResponseCode();
                RawCaptionSource.remaining(deadline);RawCaptionSource.checkActive(control);
            }
            if (status < 200 || status >= 300) return "";

            StringBuilder output = new StringBuilder();
            for (Map.Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
                String name = header.getKey();
                if (name == null || !"set-cookie".equals(name.toLowerCase(Locale.ROOT))) continue;
                List<String> values = header.getValue();
                if (values == null) continue;
                for (String value : values) {
                    if (value == null) continue;
                    String entry = value.split(";", 2)[0].trim();
                    int equals = entry.indexOf('=');
                    if (equals <= 0) continue;
                    String key = entry.substring(0, equals).trim();
                    if (!ACCEPTED.contains(key)) continue;
                    if (output.length() > 0) output.append("; ");
                    output.append(entry);
                }
            }
            return output.toString();
        } catch (Exception ignored) {
            RawCaptionSource.checkActive(control);return "";
        } finally {
            if (connection != null) connection.disconnect();
            if(control!=null)control.onConnection(null);
        }
    }
}
