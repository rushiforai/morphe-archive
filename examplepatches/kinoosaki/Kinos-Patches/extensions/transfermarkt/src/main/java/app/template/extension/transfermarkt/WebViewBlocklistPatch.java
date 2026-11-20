package app.template.extension.transfermarkt;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Host blocklists for Transfermarkt's Cordova WebView. The patches call {@link #blockAds} and
 * {@link #blockTelemetry} at the start of the WebView client's shouldInterceptRequest, which runs
 * on the WebView's IO thread, so both only read immutable state and never throw.
 *
 * A blocked request gets an empty 200 script instead of an error: the app's injectCMP, adobeInit
 * and injectSDG loaders only resolve on script.onload, and a failed load leaves
 * AppComponent.ngOnInit waiting forever (the back button stops working).
 *
 * Transfermarkt's own hosts (transfermarkt.*, tmssl.akamaized.net, *.transfermarkt.technology,
 * tmtv.akamaized.net), the Bitmovin player, YouTube, Twitter and the Sourcepoint consent
 * dialog are deliberately not on either list.
 */
@SuppressWarnings("unused")
public final class WebViewBlocklistPatch {
    private static final String TAG = "Morphe-Transfermarkt";

    /** Ad servers: Ströer SDG, Yieldlove, Adscale, Google ad serving, Outbrain, betting odds. */
    private static final Set<String> AD_HOSTS = hostSet(
            "cdn.stroeerdigitalgroup.de",
            "cdn.stroeerdigitalmedia.de",
            "yieldlove.com",
            "adscale.de",
            "doubleclick.net",
            "googlesyndication.com",
            "googletagservices.com",
            "outbrain.com",
            "outbrainimg.com",
            "oddsserve.com"
    );

    /** Trackers: Google Tag Manager / Analytics, Adobe Analytics, m6r, INFOnline (IVW). */
    private static final Set<String> TELEMETRY_HOSTS = hostSet(
            "googletagmanager.com",
            "google-analytics.com",
            "assets.adobedtm.com",
            "omtrdc.net",
            "demdex.net",
            "tracking.m6r.eu",
            "ioam.de",
            "iocnt.net"
    );

    private WebViewBlocklistPatch() {
    }

    /**
     * Injection point: shouldInterceptRequest of the app's WebView clients (Disable ads).
     *
     * @return an empty script for an ad host, otherwise null (the request goes ahead).
     */
    public static WebResourceResponse blockAds(WebResourceRequest request) {
        return block(request, AD_HOSTS);
    }

    /**
     * Injection point: shouldInterceptRequest of the app's WebView clients (Disable telemetry).
     *
     * @return an empty script for a tracker host, otherwise null (the request goes ahead).
     */
    public static WebResourceResponse blockTelemetry(WebResourceRequest request) {
        return block(request, TELEMETRY_HOSTS);
    }

    private static WebResourceResponse block(WebResourceRequest request, Set<String> hosts) {
        try {
            if (request == null) return null;
            Uri url = request.getUrl();
            if (url == null) return null;
            String host = url.getHost();
            if (host == null || host.isEmpty() || !matches(host, hosts)) return null;
            return emptyScript();
        } catch (Throwable t) {
            Log.w(TAG, "blocklist check failed", t);
            return null;
        }
    }

    /**
     * Whether {@code host} is one of {@code hosts} or a subdomain of one: the host and each parent
     * domain are looked up in turn, so "badexample.com" never matches "example.com".
     */
    private static boolean matches(String host, Set<String> hosts) {
        String candidate = host.toLowerCase(Locale.ROOT);
        if (candidate.endsWith(".")) candidate = candidate.substring(0, candidate.length() - 1);
        while (!candidate.isEmpty()) {
            if (hosts.contains(candidate)) return true;
            int dot = candidate.indexOf('.');
            if (dot < 0) return false;
            candidate = candidate.substring(dot + 1);
        }
        return false;
    }

    private static WebResourceResponse emptyScript() {
        Map<String, String> headers = new HashMap<>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Cache-Control", "no-store");
        return new WebResourceResponse(
                "application/javascript",
                "utf-8",
                200,
                "OK",
                headers,
                new ByteArrayInputStream(new byte[0])
        );
    }

    private static Set<String> hostSet(String... hosts) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(hosts)));
    }
}
