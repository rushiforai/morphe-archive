package app.template.extension.smartnews;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Locale;

/** Blocks Sentry resources without changing the containing page or other hosts. */
public final class SentryRequestBlocker {
    private static final String TAG = "SmartNewsSentryBlock";
    private static final Map<String, String> RESPONSE_HEADERS = createResponseHeaders();

    private SentryRequestBlocker() {}

    public static boolean isBlocked(String url) {
        return url != null && isBlockedUri(Uri.parse(url.trim()));
    }

    private static boolean isBlockedUri(Uri uri) {
        if (uri == null) return false;
        String scheme = uri.getScheme();
        return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))
                && isBlockedHost(uri.getHost());
    }

    static boolean isBlockedHost(String host) {
        if (host == null) return false;
        String normalized = host.toLowerCase(Locale.ROOT);
        while (normalized.endsWith(".")) {
            normalized = normalized.substring(0, normalized.length() - 1);
        }
        return normalized.equals("sentry.io") || normalized.endsWith(".sentry.io")
                || normalized.equals("sentry-cdn.com")
                || normalized.endsWith(".sentry-cdn.com");
    }

    public static WebResourceResponse responseForRequest(WebResourceRequest request) {
        return request == null ? null : responseForUri(request.getUrl());
    }

    public static WebResourceResponse responseForUrl(String url) {
        return url == null ? null : responseForUri(Uri.parse(url.trim()));
    }

    private static WebResourceResponse responseForUri(Uri uri) {
        if (!isBlockedUri(uri)) return null;
        if (Log.isLoggable(TAG, Log.DEBUG)) {
            Log.d(TAG, "Blocked host: " + uri.getHost());
        }
        return new WebResourceResponse(
                "text/plain", "UTF-8", 204, "No Content", RESPONSE_HEADERS,
                new ByteArrayInputStream(new byte[0]));
    }

    private static Map<String, String> createResponseHeaders() {
        Map<String, String> headers = new HashMap<>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Access-Control-Allow-Methods", "GET, POST, OPTIONS, HEAD");
        headers.put("Access-Control-Allow-Headers", "*");
        return Collections.unmodifiableMap(headers);
    }
}
