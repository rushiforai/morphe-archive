package e.e.a;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;

/** Shared storage checks and the delivery credential used by cached HLS requests. */
public final class CacheSupport {
    private CacheSupport() { }

    public static String cookieFor(String url, String legacyCookie) {
        try {
            String token = (String) Class.forName("e.e.a.ModernPlayback")
                .getField("domandCookie").get(null);
            return mergeCookie(url, legacyCookie, token);
        } catch (ReflectiveOperationException ex) {
            return legacyCookie;
        }
    }

    static String mergeCookie(String url, String legacyCookie, String deliveryCookie) {
        try {
            String host = new URL(url).getHost();
            if (!(host.equals("domand.nicovideo.jp") || host.endsWith(".domand.nicovideo.jp")))
                return legacyCookie;
        } catch (Exception ex) { return legacyCookie; }
        if (deliveryCookie == null || !deliveryCookie.startsWith("domand_bid=")) return legacyCookie;
        String token = deliveryCookie.split(";", 2)[0];
        StringBuilder result = new StringBuilder();
        if (legacyCookie != null) for (String item : legacyCookie.split(";")) {
            item = item.trim();
            if (item.isEmpty() || item.startsWith("domand_bid=")) continue;
            if (result.length() > 0) result.append("; ");
            result.append(item);
        }
        if (result.length() > 0) result.append("; ");
        return result.append(token).toString();
    }

    public static void beforeRequest(HttpURLConnection connection) {
        connection.setRequestProperty("Origin", "https://www.nicovideo.jp");
    }

    public static void http(HttpURLConnection connection, int status) {
        // Never include query strings, cookies or response bodies in shared debug logs.
        record("Cache HTTP " + status + (connection.getURL().getPath().endsWith(".m3u8")
            ? " playlist" : " segment"));
    }

    public static void failed(Throwable error) {
        record("Cache failed: " + error.getClass().getSimpleName());
    }

    private static void record(String message) {
        try {
            Class.forName("e.e.a.ModernDebug").getMethod("record", String.class).invoke(null, message);
        } catch (ReflectiveOperationException ignored) { }
    }

    public static boolean needsMigration(File history) {
        // The original Android 11 prompt mistakes our current app-specific directory
        // for a legacy directory. Keep migration available for actual legacy data.
        if (history.getAbsolutePath().contains("/Android/data/com.sauzask.nicoid.hls/files/"))
            return false;
        return history.exists();
    }
}
