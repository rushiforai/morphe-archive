package io.github.kirby1997.patches.feeld

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Feeld (co.feeld, React Native + Hermes) ships several third-party tracking
// SDKs. Their endpoint hostnames are supplied from the JS bundle at runtime, so
// there is no URL string constant to null out — instead each SDK is neutralised
// at the point where it would actually put bytes on the wire.
//
// Two transport families are in play:
//   * java.net (HttpURLConnection / HttpsURLConnection) — AppsFlyer and Braze
//     roll their own; killed at each SDK's send/start entry.
//   * okhttp3 (bundled, R8-renamed but package intact) — everything the JS side
//     fetches (Amplitude analytics/experiment, Facebook app-events, etc.) plus
//     any SDK on okhttp; killed by hostname at the shared interceptor chain.
//
// TRANSPORT SPLIT (verified on 9.10.0 via Burp): only traffic on the app's
// bundled okhttp3 hits the interceptor below. SDKs that roll their own
// java.net.HttpURLConnection bypass it entirely and must be killed at their own
// entry point (separate patches further down), exactly like AppsFlyer/Braze.
//
//   okhttp3 (this interceptor):  RN fetch, Amplitude, Facebook app-events (ep2)
//   java.net HttpURLConnection:  Adapty, Sentry, Facebook GraphRequest, ipify
//
// Observed okhttp egress this interceptor covers:
//   flag.lab.eu.amplitude.com, *.amplitude.com  -> Amplitude
//   ep2.facebook.com                             -> Facebook app events (okhttp path)
//   (Braze + AppsFlyer are additionally killed at their SDK entry points above.)
//
// Deliberately NOT touched: SEON (com.seonreactnativemobilewrapper) is an
// anti-fraud device-fingerprint used during login/signup — blocking it can hang
// the auth flow. Leave it be.

// -----------------------------------------------------------------------------
// AppsFlyer — no-op the SDK start entry points on the concrete singleton impl.
// start() is fire-and-forget (void, no awaited result), so returning immediately
// means the SDK is never armed and never phones home / uploads launches.
// -----------------------------------------------------------------------------

object AppsFlyerStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "start",
)

object AppsFlyerStartKeyFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "start",
)

object AppsFlyerStartListenerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
    ),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "start",
)

@Suppress("unused")
val disableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer tracking",
    description = "Stops the AppsFlyer SDK from starting, so it never uploads launches, installs, or attribution events to *.appsflyer.com / appsflyersdk.com.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        runCatching { AppsFlyerStartFingerprint.method.addInstructions(0, "return-void") }
        runCatching { AppsFlyerStartKeyFingerprint.method.addInstructions(0, "return-void") }
        runCatching { AppsFlyerStartListenerFingerprint.method.addInstructions(0, "return-void") }
    }
}

// -----------------------------------------------------------------------------
// Braze — short-circuit the request executor. Braze's HTTP goes through
// com.braze.communication.b.a(target, headers, payload): it opens an
// HttpURLConnection and returns a response wrapper `d`. Returning a synthetic
// "failed" response (code -1, empty headers, null body) — exactly what its own
// catch block produces on a network error — means no connection is ever opened,
// while Braze's dispatch layer handles it as a normal transient failure (data
// stays queued, is never sent, nothing crashes).
// -----------------------------------------------------------------------------

object BrazeRequestExecutorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/braze/communication/d;",
    parameters = listOf(
        "Lcom/braze/requests/util/c;",
        "Ljava/util/HashMap;",
        "Lorg/json/JSONObject;",
    ),
    definingClass = "Lcom/braze/communication/b;",
    name = "a",
)

@Suppress("unused")
val disableBrazePatch = bytecodePatch(
    name = "Disable Braze tracking",
    description = "Short-circuits the Braze network executor so no analytics/session data is ever POSTed to *.braze.eu; Braze treats it as a transient network failure.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        BrazeRequestExecutorFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/braze/communication/d;
                const/4 v1, -0x1
                invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;
                move-result-object v2
                const/4 v3, 0x0
                invoke-direct {v0, v1, v2, v3}, Lcom/braze/communication/d;-><init>(ILjava/util/Map;Lorg/json/JSONObject;)V
                return-object v0
            """,
        )
    }
}

// -----------------------------------------------------------------------------
// okhttp3 host blocklist — the domain-level catch-all. Every okhttp request
// (RN's JS fetch layer and any SDK on the bundled okhttp) funnels through
// RealInterceptorChain.b(Request):Response (proceed, R8-renamed). At the very
// top, before any interceptor runs or a socket is touched, we read the request
// URL and throw IOException for known tracking hosts. Callers see a normal
// network failure; real traffic (api.feeld, streamchat, google sign-in, FB
// login graph, image CDNs) falls through untouched.
// -----------------------------------------------------------------------------

object OkHttpProceedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lokhttp3/Response;",
    parameters = listOf("Lokhttp3/Request;"),
    definingClass = "Lokhttp3/internal/http/RealInterceptorChain;",
    name = "b",
)

@Suppress("unused")
val blockTrackingHostsPatch = bytecodePatch(
    name = "Block tracking hosts (okhttp)",
    description = "Drops any okhttp request to known analytics/tracking hosts (Amplitude, AppsFlyer, Braze, Facebook app-events) with an IOException, before a connection is opened. Covers JS-fetch trackers that bypass the native-SDK kills.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        // p1 = Request. Get its URL as a String, substring-match the blocklist,
        // throw before proceeding if it matches; otherwise fall through to the
        // original method body. v0-v2 are safe (.locals 13).
        OkHttpProceedFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p1}, Lokhttp3/Request;->d()Lokhttp3/HttpUrl;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;
                move-result-object v0

                const-string v1, "braze.eu"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v1
                if-nez v1, :blocked

                const-string v1, "amplitude.com"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v1
                if-nez v1, :blocked

                const-string v1, "appsflyer"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v1
                if-nez v1, :blocked

                const-string v1, "ep2.facebook.com"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v1
                if-nez v1, :blocked

                goto :allow

                :blocked
                new-instance v1, Ljava/io/IOException;
                const-string v2, "blocked tracking host"
                invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                throw v1

                :allow
                nop
            """,
        )
    }
}

// -----------------------------------------------------------------------------
// Adapty (subscription SDK) — java.net, bypasses okhttp. Heavy device
// fingerprinting (advertising_id, android_id, app_set_id, model, locale, tz).
// Every Adapty request builds its connection in DefaultConnectionCreator
// .createUrlConnection(Request):HttpURLConnection. BaseHttpClient.newCall wraps
// that call in a .catchall, so throwing IOException here is handled as a normal
// network failure (graceful error Response, no crash) and nothing leaves the
// device — this also kills the api.ipify.org public-IP lookup Adapty performs.
// TRADE-OFF: Adapty also syncs subscription entitlements; a paying Majestic user
// may lose premium/restore. A non-paying user loses only tracking.
// -----------------------------------------------------------------------------

object AdaptyCreateConnectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/net/HttpURLConnection;",
    parameters = listOf("Lcom/adapty/internal/data/cloud/Request;"),
    definingClass = "Lcom/adapty/internal/data/cloud/DefaultConnectionCreator;",
    name = "createUrlConnection",
)

@Suppress("unused")
val disableAdaptyPatch = bytecodePatch(
    name = "Disable Adapty tracking",
    description = "Stops the Adapty subscription SDK from opening any connection (it uses java.net, bypassing the okhttp block), killing its device-fingerprinting analytics and the ipify IP lookup. Adapty treats it as a network failure. May affect subscription entitlement sync for paying users.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        AdaptyCreateConnectionFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                const-string v1, "blocked tracking host"
                invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                throw v0
            """,
        )
    }
}

// -----------------------------------------------------------------------------
// Sentry (crash reporting + Session Replay) — java.net, bypasses okhttp. Every
// envelope send funnels through the HttpConnection io.sentry.transport.n.h(s2):B.
// Return the SUCCESS TransportResult singleton (B.e()) without touching the
// network: Sentry marks the envelope as delivered and drops it from its queue,
// so nothing is uploaded and no retry storm occurs. h() creates its connection
// before its own try-blocks, so returning early (rather than throwing) is the
// crash-safe choice.
// -----------------------------------------------------------------------------

object SentryTransportSendFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lio/sentry/transport/B;",
    parameters = listOf("Lio/sentry/s2;"),
    definingClass = "Lio/sentry/transport/n;",
    name = "h",
)

@Suppress("unused")
val disableSentryPatch = bytecodePatch(
    name = "Disable Sentry telemetry",
    description = "Short-circuits the Sentry HTTP transport so no crash reports, performance traces, or Session Replay recordings are uploaded to *.ingest.sentry.io. Returns Sentry's own SUCCESS result so the event is silently dropped with no retries.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        SentryTransportSendFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lio/sentry/transport/B;->e()Lio/sentry/transport/B;
                move-result-object v0
                return-object v0
            """,
        )
    }
}

// -----------------------------------------------------------------------------
// Facebook (GraphRequest app-events + gatekeeper) — java.net, bypasses okhttp.
// Facebook's GraphRequest runtime Q$c builds its HttpURLConnection in the private
// g(URL):HttpURLConnection; its sole caller N(V):HttpURLConnection wraps the call
// in .catch Ljava/io/IOException;, so throwing here is caught and the request
// fails gracefully — no /activities app-events and no /mobile_sdk_gk reach
// graph.facebook.com. g() is .locals 1, so use the no-arg IOException ctor.
// TRADE-OFF: "Continue with Facebook" login also uses GraphRequest, so blocking
// this breaks FB login (fine when logging in via email/phone).
// -----------------------------------------------------------------------------

object FacebookOpenConnectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Ljava/net/HttpURLConnection;",
    parameters = listOf("Ljava/net/URL;"),
    definingClass = "Lcom/facebook/Q\$c;",
    name = "g",
)

@Suppress("unused")
val disableFacebookPatch = bytecodePatch(
    name = "Disable Facebook tracking",
    description = "Stops Facebook's GraphRequest transport from opening any connection (it uses java.net, bypassing the okhttp block), killing app-events (/activities) and gatekeeper (/mobile_sdk_gk) calls to graph.facebook.com. Also breaks 'Continue with Facebook' login.",
) {
    compatibleWith(Constants.FEELD)

    execute {
        FacebookOpenConnectionFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                invoke-direct {v0}, Ljava/io/IOException;-><init>()V
                throw v0
            """,
        )
    }
}
