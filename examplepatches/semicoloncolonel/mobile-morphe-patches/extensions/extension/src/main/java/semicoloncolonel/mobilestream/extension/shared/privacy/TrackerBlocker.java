/*
 * From ajstrick81's morphe-androidtv-patches (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches
 * ALL CREDIT FOR THIS BLOCKLIST GOES TO ajstrick81. Changes: moved to a
 * shared package so every app's analytics patch can use it, and added the
 * tracker hosts that Disney+ and Pluto TV use.
 */

package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Tubi — "Block analytics &amp; tracking" (opt-in) runtime blocklist.
 *
 * One host list, enforced at the three network paths Tubi's analytics use
 * (mapped from the 10.36.5000 Android TV build; SDK class names are not
 * obfuscated, so the same paths exist in 10.28.5000):
 *
 *   openConnection(URL)      — every URL.openConnection() call site in the app
 *                              is rewritten to this. Adjust, Branch, Nielsen,
 *                              Mux, Conviva and Firebase measurement send
 *                              through HttpURLConnection.
 *   install(Builder)         — called at the top of
 *                              OkHttpClient.<init>(Builder), so every OkHttp
 *                              client (built or default-constructed) gets
 *                              {@link BlockInterceptor}. NPAW/Youbora and
 *                              parts of Braze use OkHttp.
 *   blockWebRequest(request) — WebViewClient.shouldInterceptRequest of the
 *                              ott-androidtv.tubitv.com SPA, which posts Tubi's
 *                              own analytics events (advertiser_id, device_id,
 *                              postal_code / lat-long fields) from JS.
 *
 * A blocked request fails the same way an offline network does (IOException,
 * or an empty 204 in the WebView). The SDKs are built to tolerate that; they
 * queue or drop the event and playback is unaffected.
 *
 * Deliberately NOT blocked: crash/performance reporting (Sentry, Crashlytics,
 * Firebase Performance), Statsig (feature flags the app depends on), OneTrust
 * (consent), Facebook's graph API (sign-in), ads/playback/DRM hosts.
 *
 * Everything is decided on-device; nothing is sent anywhere by this class.
 */
@SuppressWarnings("unused")
public final class TrackerBlocker {
    private static final String TAG = "MSP-PRIVACY";

    /** Blocked if the host equals one of these or is a subdomain of one. */
    private static final String[] BLOCKED_DOMAINS = {
            // Attribution
            "adjust.com", "adjust.io", "adjust.world", "adjust.net.in",
            "branch.io",
            // Marketing / engagement. Some apps also deliver push alerts
            // through Braze; see keepBraze().
            "braze.com", "braze.eu", "appboy.com",
            // Audience and video measurement
            "conviva.com",
            "imrworldwide.com", "nielsen.com",
            "npaw.com", "youbora.com", "gnsnpaw.com",
            "litix.io", // Mux Data
            "nmrodam.com", // Nielsen SDK config
            "datadoghq.com", "datadoghq.eu", // Datadog session monitoring
            // Pluto TV phone (17.2.0)
            "kochava.com", // attribution
            "segment.io", "segment.com", // Segment / Twilio Segment
            "scorecardresearch.com", // comScore
            "demdex.net", "adobedc.net", "omtrdc.net", "adobedtm.com", // Adobe Analytics
            "newrelic.com", "nr-data.net", // New Relic
            "igodigital.com", // Salesforce Marketing Cloud
            // tm.pluto.tv and sparrow.pluto.tv save Continue Watching
            // positions, so they are blocked only in aggressive mode. See
            // blockResumeTracking().
            // Paramount+ phone (17.2.0)
            "tiqcdn.com", // Tealium
            "branch-sf5.cbs.com", // Branch, on Paramount's own link domain
            // HBO Max phone (7.14.0)
            "appsflyer.com", "appsflyersdk.com", // AppsFlyer
            "ingest.sentry.io", "ingest.us.sentry.io", "ingest.de.sentry.io", // Sentry error/session telemetry
            "mediamelon.com", // MediaMelon video analytics
            // Peacock phone (7.10.20)
            "mparticle.com", // mParticle
            // Fox One phone (1.24.0)
            "contentsquare.net", "csqtrk.net", "csq.io", // Contentsquare session replay
            "zqtk.net", // comScore audience segments
            // New York Times (11.98.0) and Washington Post (7.18.1) phone
            "chartbeat.net", "chartbeat.com", // Chartbeat
            "iteratehq.com", "iter.ly", // Iterate in-app surveys
            "permutive.app", "permutive.com", // Permutive audience targeting
            "iterable.com", // Iterable marketing events
            "combine.urbanairship.com", "combine.asnapieu.com", // Airship event upload
            // Wall Street Journal phone (15.12.0)
            "parsely.com", // Parse.ly
            "snplow.net", // Snowplow collector
            "rlcdn.com", // LiveRamp ATS identity
            "liveramp.com", // LiveRamp on-device ATS
            "analytics-tracker.thescore.com",
            "api.eu.amplitude.com",
            // Starz phone (6.11.0)
            "clevertap-prod.com", // CleverTap engagement analytics
            "leanplum.com", // Leanplum engagement analytics
            "ethn.io", // Ethnio research surveys
            // PBS (5.27.0)
            "qoe.pbs.org", // Mux Data beacons on a PBS domain
            // Fox News phone (5.49.2)
            "pyxis.atp.fox", // Fox ad telemetry
            "xid.atp.fox", "idgraph.dt.fox", // Fox ad-ID graph
            "uidapi.com", // Unified ID 2.0
            // MS NOW (14.6.0)
            "api2.amplitude.com", // Amplitude event upload (not the Experiment flag hosts)
            // CNN (26.21.0)
            "zion.api.cnn.io", "collector.cdp.cnn.com", // CNN data collection
            // NFL (61.0.18)
            "prf.hn", // Partnerize purchase attribution
            // DealSeek (1.64.0)
            "analytics.us.tiktok.com", "analytics.tiktok.com", // TikTok Business SDK events
            // JustWatch (26.43.10)
            "sp.justwatch.com", "t.justwatch.com", // JustWatch's own Snowplow event collectors
            "singular.net", // Singular attribution
            // Plex (2026.22.0)
            "analytics.plex.tv", // Plex's own event collector
            "plex.adsmeasurement.com", // Plex ad measurement
            "prodregistryv2.org", // Statsig event logging (not its flag hosts)
            // Fandango at Home (10.24)
            "kochava.kvaedit.site", "kochava.dewrain.life", // Kochava fallback hosts
            "kvaedit.site", "dewrain.life", "dewrain.site", "dewrain.world", // Kochava rotating failover domains
            "vaicore.site", "vaicore.xyz", "vaicore.store", "akisinn.info", "akisinn.site", // Kochava rotating failover domains
            "api.intercom.io", // Intercom in-app messaging/support events
            "crwdcntrl.net", // Lotame audience data
            "ml314.com", // Bombora audience data
            "nice264.com", // NPAW/YOUBORA video analytics
            "cdp.customer.io", // Customer.io event pipeline (not its push)
            // CBS News (5.20)
            "saa.cbsi.com", // CBS's Adobe Analytics
            "data.flurry.com", "cfg.flurry.com", // Flurry
            "siteintercept.qualtrics.com", // Qualtrics survey targeting
            "z.moatads.com", "px.moatads.com", // Moat ad measurement
            "events.brightline.tv", // Brightline ad events
            // Moviebase (7.7.0)
            "api-diagnostics.revenuecat.com", // RevenueCat SDK diagnostics, not purchases
            // NPS (2.15.0)
            "events.mapbox.com", // Mapbox map usage events
            // Google Analytics / Firebase Analytics upload
            "app-measurement.com", "google-analytics.com",
            // Google Ads conversion tracking (not ad serving)
            "googleadservices.com",
            // Meta Pixel and SDK scripts
            "connect.facebook.net",
            // Event analytics seen across the apps (Optimizely's flag CDN is left alone)
            "logx.optimizely.com",
            "analytics-ingress-global.bitmovin.com", // Bitmovin player analytics
            "mixpanel.com",
            "sdk.foursquare.com", // Foursquare Movement SDK (Checkout 51)
            // Yahoo News (100.1.1): Yahoo analytics, AXID sync, server-side GA
            // forwarding, video beacons, and ad measurement. geo.yahoo.com is left
            // alone, because the B-cookie and consent records use it.
            "ups.analytics.yahoo.com", "analytics.query.yahoo.com", "collector.yahoo.net",
            "signal-service.pbs.yahoo.com", "bats.video.yahoo.com", "log.adaptv.advertising.com",
            "metrics.brightcove.com", "tracking.taboola.com", "beacon.taboola.com",
            "adsafeprotected.com", "wvsignal.com",
            // Yahoo Finance (26.22.2): Embrace, the sGTM collector, and ad verification.
            "data.emb-api.com", "config.emb-api.com", "doubleverify.com",
            // NPR (7.10.0), AP News (6.31.2), and NewsBreak (26.44.1)
            "quantserve.com", "quantcount.com", // Quantcast measurement
            "tahoe-analytics.publishers.advertising.a2z.com", // Amazon publisher ad analytics
            "apcdp.apnews.com", // AP News BlueConic customer-data platform
            // SiriusXM (2610.4.0)
            "evergage.com", // Salesforce Personalization (Evergage)
            "zc.adswizz.com", // AdsWizz SDK setup, which turns on its listening measurement
            // Slickdeals (6.36.0)
            "getblueshift.com", // Blueshift marketing
            "cwogzftn.usw.stape.io", // Slickdeals' server-side Tag Manager
            "l7ox5un97g.execute-api.us-west-2.amazonaws.com", // Slickdeals' impression collector
            "prod.cm.publishers.advertising.a2z.com", // Amazon ad metrics
            // Kanopy (6.32.0)
            "sentry-tmp.kanopy.com", // Kanopy's Sentry server, which receives screenshots
    };

    /**
     * Tracking endpoints on hosts that also serve features the app needs. Meta's Graph API also
     * handles Facebook sign-in and sharing, so only its app-event and attribution paths are
     * blocked. Each entry is {host, path fragment}.
     */
    private static final String[][] BLOCKED_PATHS = {
            {"graph.facebook.com", "/activities"}, // Meta app events
            {"graph.facebook.com", "/aem_conversion_configs"}, // Meta aggregated event measurement
            {"graph.facebook.com", "/custom_audience_third_party_id"}, // Meta ad audiences
            {"graph.facebook.com", "/app_indexing"}, // Meta codeless event setup
            // PostHog event capture and session replay. /flags/ (feature flags) is left alone.
            {"i.posthog.com", "/batch"},
            {"i.posthog.com", "/e/"},
            {"i.posthog.com", "/i/v0/e"},
            {"i.posthog.com", "/s/"},
            {"i.posthog.com", "/capture"},
            // DealSeek's PostHog proxy (1.64.0)
            {"sesame.dealseek.com", "/batch"},
            {"sesame.dealseek.com", "/e/"},
            {"sesame.dealseek.com", "/i/v0/e"},
            {"sesame.dealseek.com", "/s/"},
            {"sesame.dealseek.com", "/capture"},
    };

    /** Tubi's first-party analytics: analytics-ingestion*.tubi.io / *.tubitv.com. */
    private static final String FIRST_PARTY_PREFIX = "analytics-ingestion";
    private static final String[] FIRST_PARTY_DOMAINS = {"tubi.io", "tubitv.com"};

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private static final String[] BRAZE_DOMAINS = {"braze.com", "braze.eu", "appboy.com"};

    private TrackerBlocker() {
    }

    /**
     * Whether Braze is left alone. False here; an app's analytics patch makes
     * it return true when the app delivers its push alerts through Braze.
     */
    public static boolean keepBraze() {
        return false;
    }

    // Hosts that also save watch positions. Blocked only when a patch turns on
    // aggressive blocking, because Continue Watching stops saving.
    private static final String[] RESUME_TRACKING_DOMAINS = {
            "tm.pluto.tv", // Pluto's Tealium config, which turns on Sparrow
            "sparrow.pluto.tv", // Pluto's playback beacons, which save positions
    };

    // Overwritten to return true by a patch's aggressive blocking option.
    public static boolean blockResumeTracking() {
        return false;
    }

    private static boolean isBraze(String host) {
        for (String domain : BRAZE_DOMAINS) {
            if (matches(host, domain)) return true;
        }
        return false;
    }

    public static boolean isBlocked(String host) {
        if (host == null || host.isEmpty()) {
            return false;
        }
        String h = host.toLowerCase();
        if (keepBraze() && isBraze(h)) {
            return false;
        }
        for (String domain : BLOCKED_DOMAINS) {
            if (matches(h, domain)) {
                return true;
            }
        }
        if (blockResumeTracking()) {
            for (String domain : RESUME_TRACKING_DOMAINS) {
                if (matches(h, domain)) {
                    return true;
                }
            }
        }
        if (h.startsWith(FIRST_PARTY_PREFIX)) {
            for (String domain : FIRST_PARTY_DOMAINS) {
                if (matches(h, domain)) {
                    return true;
                }
            }
        }
        return false;
    }

    /** isBlocked(host), plus the path-level rules for shared hosts. */
    public static boolean isBlocked(String host, String path) {
        if (isBlocked(host)) {
            return true;
        }
        if (host == null || path == null) {
            return false;
        }
        String h = host.toLowerCase();
        for (String[] rule : BLOCKED_PATHS) {
            if (matches(h, rule[0]) && path.contains(rule[1])) {
                return true;
            }
        }
        return false;
    }

    private static boolean matches(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    /**
     * Replaces InetAddress.getAllByName(String) in apps that rename OkHttp
     * (Pluto TV): OkHttp's default DNS calls it for every request, so a
     * blocked host fails before any connection is made.
     */
    public static java.net.InetAddress[] lookup(String host) throws java.net.UnknownHostException {
        if (isBlocked(host)) {
            logBlocked("dns", host);
            throw new java.net.UnknownHostException("Blocked by Morphe privacy patch: " + host);
        }
        return java.net.InetAddress.getAllByName(host);
    }

    private static void logBlocked(String layer, String host) {
        if (logged.add(layer + ":" + host)) {
            Log.i(TAG, "blocked " + layer + " -> " + host);
        }
    }

    /** Replaces URL.openConnection() at every app call site. */
    public static URLConnection openConnection(URL url) throws IOException {
        String host = url.getHost();
        if (isBlocked(host, url.getPath())) {
            logBlocked("urlconnection", host);
            throw new IOException("Blocked by Morphe privacy patch: " + host);
        }
        return url.openConnection();
    }

    /** A closed local port: a request sent here fails the way an offline one does. */
    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    /**
     * Called with the URL of each JavaScript request, so trackers that run in a React Native
     * app's JavaScript are blocked too. Two native paths carry those requests: React Native's
     * NetworkingModule (fetch and XMLHttpRequest) and Expo's expo/fetch. A blocked URL is swapped
     * for {@link #BLOCKED_URL}, so JavaScript gets its usual network error.
     */
    public static String filterJsRequestUrl(String url) {
        try {
            if (url != null && isBlockedJsRequest(new URL(url))) {
                return BLOCKED_URL;
            }
        } catch (Throwable ignored) {
            // Not an http(s) URL (blob:, data:): React Native handles those itself.
        }
        return url;
    }

    /** {@link #filterJsRequestUrl(String)} for expo/fetch, which passes a java.net.URL. */
    public static URL filterJsRequestUrl(URL url) {
        try {
            if (url != null && isBlockedJsRequest(url)) {
                return new URL(BLOCKED_URL);
            }
        } catch (Throwable ignored) {
            // Leave the request as it is.
        }
        return url;
    }

    private static boolean isBlockedJsRequest(URL url) {
        String host = url.getHost();
        if (!isBlocked(host, url.getPath())) {
            return false;
        }
        logBlocked("javascript", host);
        return true;
    }

    /** Called with the Builder at the start of OkHttpClient.<init>(Builder). */
    public static void install(OkHttpClient.Builder builder) {
        try {
            for (Interceptor interceptor : builder.interceptors()) {
                if (interceptor instanceof BlockInterceptor) {
                    return; // newBuilder() copies of a client we already covered
                }
            }
            builder.interceptors().add(0, new BlockInterceptor());
        } catch (Throwable t) {
            Log.w(TAG, "install failed: " + t);
        }
    }

    /** Returns an empty response for blocked WebView requests, or null to pass through. */
    public static WebResourceResponse blockWebRequest(WebResourceRequest request) {
        try {
            if (request == null || request.getUrl() == null) {
                return null;
            }
            String host = request.getUrl().getHost();
            if (!isBlocked(host, request.getUrl().getPath())) {
                return null;
            }
            logBlocked("webview", host);
            return new WebResourceResponse("text/plain", "utf-8", 204, "No Content",
                    Collections.emptyMap(), new ByteArrayInputStream(new byte[0]));
        } catch (Throwable t) {
            return null;
        }
    }

    public static final class BlockInterceptor implements Interceptor {
        @Override
        public Response intercept(Interceptor.Chain chain) throws IOException {
            Request request = chain.request();
            String host = request.url().host();
            if (isBlocked(host, pathOf(request))) {
                logBlocked("okhttp", host);
                throw new IOException("Blocked by Morphe privacy patch: " + host);
            }
            return chain.proceed(request);
        }

        // The OkHttp probes cover url() and host() but not encodedPath(), so a
        // renamed path accessor falls back to host-only matching.
        private static String pathOf(Request request) {
            try {
                return request.url().encodedPath();
            } catch (Throwable t) {
                return null;
            }
        }
    }
}
