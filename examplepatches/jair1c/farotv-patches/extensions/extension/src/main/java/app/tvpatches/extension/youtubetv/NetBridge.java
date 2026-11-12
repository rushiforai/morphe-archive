package app.tvpatches.extension.youtubetv;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.net.ssl.HttpsURLConnection;

/**
 * Requests for the page scripts. youtube.com/tv's Content Security Policy blocks requests to
 * other sites, so youtv.request() in runtime.js asks the app ("@req <id> <url>" through the
 * title channel) and the answer goes back with youtv.deliver(id, status, body).
 * Only HTTPS GET requests to the hosts below are made.
 */
final class NetBridge {
    static final String REQUEST_PREFIX = "@req ";

    private static final String[] ALLOWED_HOSTS = {
            "sponsor.ajay.app",                 // SponsorBlock
            "returnyoutubedislikeapi.com",      // Return YouTube Dislike
    };
    private static final int MAX_BODY = 256 * 1024;

    private static final ExecutorService executor = Executors.newFixedThreadPool(2);
    private static final Handler main = new Handler(Looper.getMainLooper());

    private NetBridge() {
    }

    static void handle(String message) {
        String rest = message.substring(REQUEST_PREFIX.length());
        int space = rest.indexOf(' ');
        if (space <= 0) return;
        final String id = rest.substring(0, space);
        final String url = rest.substring(space + 1);
        if (!id.matches("[0-9]+")) return;
        if (!isAllowed(url)) {
            Log.w(TvScripts.TAG, "request blocked: " + url);
            deliver(id, 0, "");
            return;
        }
        executor.execute(() -> {
            int status = 0;
            String body = "";
            try {
                HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
                if (c instanceof HttpsURLConnection) {
                    ((HttpsURLConnection) c).setSSLSocketFactory(GmsCoreSupportPatch.platformSocketFactory());
                }
                c.setConnectTimeout(10000);
                c.setReadTimeout(15000);
                c.setRequestProperty("User-Agent", "FaroTV");
                try {
                    status = c.getResponseCode();
                    InputStream in = status >= 400 ? c.getErrorStream() : c.getInputStream();
                    body = in == null ? "" : read(in);
                } finally {
                    c.disconnect();
                }
            } catch (Throwable t) {
                Log.w(TvScripts.TAG, "request failed: " + url + ": " + t);
            }
            deliver(id, status, body);
        });
    }

    private static boolean isAllowed(String url) {
        try {
            URL parsed = new URL(url);
            if (!"https".equals(parsed.getProtocol())) return false;
            for (String host : ALLOWED_HOSTS) {
                if (host.equals(parsed.getHost())) return true;
            }
        } catch (Exception ignored) {
        }
        return false;
    }

    private static String read(InputStream in) throws Exception {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = input.read(buf)) > 0) {
                out.write(buf, 0, n);
                if (out.size() > MAX_BODY) break;
            }
            return out.toString("UTF-8");
        }
    }

    private static void deliver(String id, int status, String body) {
        final String js = "window.youtv&&youtv.deliver(" + id + "," + status + "," + JSONObject.quote(body) + ");";
        main.post(() -> TvScripts.evaluate(js));
    }
}
