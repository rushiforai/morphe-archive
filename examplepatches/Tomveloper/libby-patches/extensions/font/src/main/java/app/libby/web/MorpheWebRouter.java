package app.libby.web;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * One interception point for every extension-provided URL.
 *
 * The patched WebViewClient calls {@link #intercept} once. URLs are only treated
 * as ours when their path starts with {@code /morphe/}. The first segment after
 * that prefix selects a registered handler, so adding a new patch means adding a
 * route, not adding another interception check.
 *
 * Handlers run on the WebView's request thread and must not touch UI directly.
 */
public final class MorpheWebRouter {

    private static final String TAG = "MorpheWeb";
    private static final String PREFIX = "/morphe/";
    private static final Map<String, RouteHandler> ROUTES = new ConcurrentHashMap<>();

    private MorpheWebRouter() {
    }

    /**
     * Receives {@code /morphe/<namespace>/<path>} requests. {@code path} has no
     * leading slash. Return {@code null} to produce a local 404.
     */
    public interface RouteHandler {
        WebResourceResponse handle(WebView view, WebResourceRequest request, String path)
                throws Exception;
    }

    /**
     * Registers a handler for one namespace. Registering the same handler again
     * is harmless; a different handler for an existing namespace is ignored.
     */
    public static void register(String namespace, RouteHandler handler) {
        if (namespace == null || namespace.isEmpty() || namespace.indexOf('/') >= 0) {
            throw new IllegalArgumentException("Route namespace must be one path segment");
        }
        if (handler == null) {
            throw new IllegalArgumentException("Route handler must not be null");
        }

        RouteHandler previous = ROUTES.putIfAbsent(namespace, handler);
        if (previous != null && previous != handler) {
            Log.w(TAG, "Route already registered: " + namespace);
        }
    }

    /**
     * Called from the patched shouldInterceptRequest. Returns null for URLs that
     * do not belong to /morphe/, so Libby's own handler still runs.
     */
    public static WebResourceResponse intercept(WebView view, WebResourceRequest request) {
        if (request == null) {
            return null;
        }

        Uri uri = request.getUrl();
        if (uri == null) {
            return null;
        }

        String path = uri.getPath();
        if (path == null || !path.startsWith(PREFIX)) {
            return null;
        }

        String rest = path.substring(PREFIX.length());
        int slash = rest.indexOf('/');
        String namespace = slash < 0 ? rest : rest.substring(0, slash);
        if (namespace.isEmpty()) {
            return text(404, "Not Found");
        }

        RouteHandler handler = ROUTES.get(namespace);
        if (handler == null) {
            return text(404, "Not Found");
        }

        String subPath = slash < 0 ? "" : rest.substring(slash + 1);
        try {
            WebResourceResponse response = handler.handle(view, request, subPath);
            return response != null ? response : text(404, "Not Found");
        } catch (Throwable t) {
            Log.e(TAG, "Route failed: " + namespace + "/" + subPath, t);
            return text(500, "Internal Server Error");
        }
    }

    /**
     * Streams a file without loading it into a byte array. The WebView closes the
     * returned stream when it is done with the response.
     */
    public static WebResourceResponse stream(File file, String mimeType) throws IOException {
        if (file == null || !file.isFile()) {
            return text(404, "Not Found");
        }

        Map<String, String> headers = new HashMap<>();
        headers.put("Cache-Control", "no-store");
        headers.put("Content-Length", Long.toString(file.length()));

        InputStream data = new BufferedInputStream(new FileInputStream(file));
        return new WebResourceResponse(mimeType, null, 200, "OK", headers, data);
    }

    public static WebResourceResponse text(int status, String message) {
        byte[] body = (message != null ? message : "").getBytes(StandardCharsets.UTF_8);
        Map<String, String> headers = new HashMap<>();
        headers.put("Cache-Control", "no-store");
        headers.put("Content-Length", Integer.toString(body.length));

        return new WebResourceResponse(
                "text/plain",
                "utf-8",
                status,
                reason(status),
                headers,
                new ByteArrayInputStream(body));
    }

    private static String reason(int status) {
        switch (status) {
            case 404:
                return "Not Found";
            case 500:
                return "Internal Server Error";
            default:
                return "OK";
        }
    }
}
