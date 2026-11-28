package app.yydarlinker.aicaptions.source;

import app.yydarlinker.aicaptions.CaptionSourceControl;
import app.yydarlinker.aicaptions.NetworkDeadline;
import app.yydarlinker.aicaptions.host.AiCaptionHook;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * The anonymous cookies of YouTube, for the fetches of captions only. They are the set Morphe uses
 * for timed text, kept in memory so that the fetch does not depend on a setting that may have been
 * captured long ago.
 */
final class FreshYouTubeCookies {
    private static final List<String> ACCEPTED =
            Arrays.asList(
                    "YSC",
                    "VISITOR_INFO1_LIVE",
                    "VISITOR_PRIVACY_METADATA",
                    "__Secure-ROLLOUT_TOKEN");
    private static final String USER_AGENT =
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 "
                    + "(KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36";
    private static final long MAX_AGE_MS = 8L * 60L * 1000L;
    private static final long RETRY_AFTER_NS = TimeUnit.SECONDS.toNanos(30);
    private static final long BUDGET_NS = TimeUnit.SECONDS.toNanos(3);

    private static volatile String cached = "";
    private static volatile long fetchedAt;
    private static boolean refreshing;
    private static long lastAttempt;

    private FreshYouTubeCookies() {}

    static String userAgent() {
        return USER_AGENT;
    }

    /** The cookies of the last refresh while they are young. A signed url needs none at first. */
    static String cached() {
        return System.currentTimeMillis() - fetchedAt < MAX_AGE_MS ? cached : "";
    }

    /**
     * Fetches new cookies, after a 401 or 403 only. At most one fetch runs at a time and one is
     * tried every 30 seconds; the fetch shares the deadline of the request that asked.
     */
    static String refresh(long deadline, CaptionSourceControl control) throws Exception {
        long now = System.nanoTime();
        synchronized (FreshYouTubeCookies.class) {
            if (refreshing || (lastAttempt > 0 && now - lastAttempt < RETRY_AFTER_NS))
                return cached;
            refreshing = true;
            lastAttempt = now;
        }
        try {
            String fresh = fetch(Math.min(deadline, now + BUDGET_NS), control);
            if (!fresh.isEmpty()) {
                cached = fresh;
                fetchedAt = System.currentTimeMillis();
            }
            return cached;
        } finally {
            synchronized (FreshYouTubeCookies.class) {
                refreshing = false;
            }
        }
    }

    /** The accepted cookies the site sets, as one Cookie header; empty if it fails. */
    private static String fetch(long deadline, CaptionSourceControl control) throws Exception {
        RawCaptionSource.checkActive(control);
        HttpURLConnection connection = null;
        try {
            URL url = new URL("https://www.youtube.com/sw.js");
            connection = AiCaptionHook.openWithYouTubeCronet(url);
            if (connection == null) connection = (HttpURLConnection) url.openConnection();
            if (control != null) control.onConnection(connection);
            RawCaptionSource.checkActive(control);
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
            try (NetworkDeadline guard = new NetworkDeadline(connection, deadline)) {
                status = connection.getResponseCode();
                RawCaptionSource.remaining(deadline);
                RawCaptionSource.checkActive(control);
            }
            return status >= 200 && status < 300 ? acceptedCookies(connection) : "";
        } catch (Exception failed) {
            RawCaptionSource.checkActive(control);
            return "";
        } finally {
            if (connection != null) connection.disconnect();
            if (control != null) control.onConnection(null);
        }
    }

    private static String acceptedCookies(HttpURLConnection connection) {
        StringBuilder cookies = new StringBuilder();
        for (Map.Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
            if (header.getKey() == null
                    || header.getValue() == null
                    || !header.getKey().toLowerCase(Locale.ROOT).equals("set-cookie")) continue;
            for (String value : header.getValue()) {
                if (value == null) continue;
                String pair = value.split(";", 2)[0].trim();
                int equals = pair.indexOf('=');
                if (equals <= 0 || !ACCEPTED.contains(pair.substring(0, equals).trim())) continue;
                if (cookies.length() > 0) cookies.append("; ");
                cookies.append(pair);
            }
        }
        return cookies.toString();
    }
}
