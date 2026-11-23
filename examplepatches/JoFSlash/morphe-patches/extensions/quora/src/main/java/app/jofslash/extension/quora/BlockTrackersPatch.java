package app.jofslash.extension.quora;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;

@SuppressWarnings("unused")
public final class BlockTrackersPatch {

    private static final String TAG = "JoFSlashPatches";

    private static final String[] TRACKER_HOSTS = {
            "google-analytics.com",
            "analytics.google.com",
            "googletagmanager.com",
            "connect.facebook.net",
            "bat.bing.com",
            "clarity.ms",
            "static.ads-twitter.com",
            "analytics.twitter.com",
            "quantserve.com",
            "quantcount.com",
            "hotjar.com",
            "hotjar.io",
            "segment.io",
            "segment.com",
            "amplitude.com",
            "mixpanel.com",
            "chartbeat.com",
            "chartbeat.net",
            "newrelic.com",
            "nr-data.net",
            "adsymptotic.com",
            "snap.licdn.com",
            "px.ads.linkedin.com",
            "ct.pinterest.com",
            "analytics.tiktok.com",
            "sc-static.net",
            "tr.snapchat.com",
            "redditstatic.com",
            "pixel.reddit.com",
    };

    /**
     * Injection point: start of QWebViewClient.shouldInterceptRequest.
     *
     * @return An empty response for tracker requests, or null to load the request normally.
     */
    public static WebResourceResponse blockTrackerRequest(WebResourceRequest request) {
        try {
            if (request == null || request.isForMainFrame()) return null;
            if (!isTrackerUrl(request.getUrl())) return null;
            return new WebResourceResponse("text/plain", "utf-8", new ByteArrayInputStream(new byte[0]));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check request", ex);
            return null;
        }
    }

    private static boolean isTrackerUrl(Uri uri) {
        if (uri == null) return false;
        String host = uri.getHost();
        if (host == null) return false;
        host = host.toLowerCase();

        for (String trackerHost : TRACKER_HOSTS) {
            if (host.equals(trackerHost) || host.endsWith("." + trackerHost)) return true;
        }

        // Facebook pixel.
        String path = uri.getPath();
        return (host.equals("facebook.com") || host.endsWith(".facebook.com"))
                && path != null && path.startsWith("/tr");
    }
}
