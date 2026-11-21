package io.github.jordanwoodson.extension.shared.twitch;

import android.net.Uri;
import android.net.http.SslError;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Twitch's portals: the in-app web pages (Create Clip, Report, Sign up, passkeys and others), each a Capacitor
 * WebView on a page from m.twitch.tv. Two WebViewClients serve them, Capacitor's and the one of Twitch's own
 * portal view. Both report every certificate error to the portal as a failed load, the page's own or any
 * request's it makes, and Create Clip then shows "There was an error, please try again later" and closes.
 */
@SuppressWarnings("unused")
public final class TwitchPortals {
    static final String FIX_KEY = "fix_web_pages";

    private TwitchPortals() { }

    /**
     * Injection point (Fix web page errors), at the start of each portal client's onReceivedSslError: the error
     * for Twitch to handle, or null once Lurk has. A certificate error on a request to another host than the
     * page's (a tracker that an HTTPS-filtering ad blocker, VPN or DNS block page answers with its own
     * certificate) is cancelled here, never proceeded, and Twitch doesn't hear of it: the page carries on
     * without that one request. An error on the page's own host, or while the page's host isn't known yet,
     * goes to Twitch as before. A null error never comes from WebView; it is cancelled the way Twitch's own
     * handling (WebViewClient's) would and goes no further.
     */
    public static SslError sslError(WebView view, SslErrorHandler handler, SslError error) {
        if (error == null) {
            if (handler != null) handler.cancel();
            return null;
        }
        try {
            if (handler == null || !Settings.isEnabled(FIX_KEY)) return error;
            String failed = host(error.getUrl());
            if (failed == null || isPageHost(view, failed)) return error;
            handler.cancel();
            Logger.w("web page: ignored a certificate error (" + error.getPrimaryError() + ") from " + failed +
                    "; the page stays open without that request");
            return null;
        } catch (RuntimeException e) {
            Logger.w("web page: certificate error check failed", e);
            return error;
        }
    }

    /** Whether {@code failed} is the host of the page {@code view} shows or loads; true when that isn't known. */
    static boolean isPageHost(WebView view, String failed) {
        String page = view != null ? host(view.getUrl()) : null;
        String original = view != null ? host(view.getOriginalUrl()) : null;
        if (page == null && original == null) return true;
        return failed.equals(page) || failed.equals(original);
    }

    /**
     * Injection point (Disable analytics, while it is on), at the start of each portal client's
     * shouldInterceptRequest: an empty 204 for a request to a tracking host, which then never leaves the device;
     * null for every other request, which Twitch loads as before.
     */
    public static WebResourceResponse trackerResponse(WebResourceRequest request) {
        try {
            Uri url = request != null ? request.getUrl() : null;
            String host = url != null ? lower(url.getHost()) : null;
            if (host == null || !isTracker(host)) return null;
            Logger.d("analytics: answered a web page's request to " + host + " locally");
            return empty(request);
        } catch (RuntimeException e) {
            Logger.w("web page: tracker check failed", e);
            return null;
        }
    }

    /**
     * The hosts (and their subdomains) the portal pages' own code sends analytics or measurement to, besides
     * Twitch's servers: Sentry (the error reports and sampled traces of every portal, o278969.ingest.us.sentry.io),
     * Sprig (surveys and session replay, which every portal loads where Twitch's experiment turns it on) and the
     * comScore and Nielsen pixels of the mod view's player. The portals' Spade events go to gql.twitch.tv as a
     * GraphQL mutation, which can't be told apart from the page's other GraphQL requests here; spade_url,
     * beacon_url and the amazon_ads_url settings in their bundled settings aren't used to send anything.
     */
    private static final String[] TRACKERS = {
            "sentry.io",
            "sprig.com",
            "scorecardresearch.com",
            "imrworldwide.com",
    };

    /** Whether {@code host} (lower case) is one of {@link #TRACKERS} or a subdomain of one. */
    static boolean isTracker(String host) {
        for (String tracker : TRACKERS) {
            if (host.equals(tracker) || host.endsWith("." + tracker)) return true;
        }
        return false;
    }

    /**
     * An empty 204 that the page's fetch() accepts as well: CORS allows the request's origin with credentials, and
     * a preflight (which WebView also asks about) the method and headers it asks for.
     */
    static WebResourceResponse empty(WebResourceRequest request) {
        Map<String, String> headers = new HashMap<>();
        String origin = null;
        String method = null;
        String requested = null;
        Map<String, String> sent = request.getRequestHeaders();
        if (sent != null) {
            for (Map.Entry<String, String> header : sent.entrySet()) {
                String name = header.getKey();
                if ("origin".equalsIgnoreCase(name)) origin = header.getValue();
                else if ("access-control-request-method".equalsIgnoreCase(name)) method = header.getValue();
                else if ("access-control-request-headers".equalsIgnoreCase(name)) requested = header.getValue();
            }
        }
        headers.put("Access-Control-Allow-Origin", origin != null ? origin : "*");
        if (origin != null) headers.put("Access-Control-Allow-Credentials", "true");
        if (method != null) headers.put("Access-Control-Allow-Methods", method);
        if (requested != null) headers.put("Access-Control-Allow-Headers", requested);
        headers.put("Cache-Control", "no-store");
        return new WebResourceResponse("text/plain", "utf-8", 204, "No Content", headers,
                new ByteArrayInputStream(new byte[0]));
    }

    static String host(String url) {
        if (url == null || url.isEmpty()) return null;
        try {
            return lower(Uri.parse(url).getHost());
        } catch (RuntimeException e) {
            return null;
        }
    }

    private static String lower(String host) {
        return host == null || host.isEmpty() ? null : host.toLowerCase(Locale.ROOT);
    }
}
