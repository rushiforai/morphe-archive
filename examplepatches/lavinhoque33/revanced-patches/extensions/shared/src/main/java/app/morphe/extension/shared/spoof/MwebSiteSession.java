/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4764
 * Copyright (C) 2026 lavinhoque33.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.spoof;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.Nullable;
import androidx.webkit.ProfileStore;
import androidx.webkit.WebMessageCompat;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.regex.Pattern;

import app.morphe.extension.shared.patches.PatchStatus;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Creates a signed-out, per-video streaming session without using the default WebView profile. */
public final class MwebSiteSession implements AutoCloseable {
    public static final String ORIGIN = "https://m.youtube.com";
    private static final String WATCH_PATH = "/watch";
    private static final String PROFILE = "rvx-mobile-web-public-playback";
    private static final String MESSAGE_OBJECT = "RvxMwebSession";
    private static final long TIMEOUT_MS = 9_000L;
    private static final int MAX_MESSAGE_SIZE = 128 * 1024;
    private static final int MIN_PROOF_SIZE = 50;
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final Set<String> ORIGINS = Set.of(ORIGIN);
    private static final Set<String> STATIC_HOSTS = Set.of(
            "www.youtube.com", "www.gstatic.com", "www.google.com", "jnn-pa.googleapis.com", "youtubei.googleapis.com");
    private static final String[] BLOCKED_PATHS = {
            "/api/stats/", "/ptracking", "/youtubei/v1/log_event", "/youtubei/v1/feedback",
            "/youtubei/v1/player/ad_break", "/generate_204", "/csi_204", "/pagead/", "/get_midroll_"
    };
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Semaphore PAGE_SLOTS = new Semaphore(2);

    // Adapted from Morphe #4764 and the session/initial-ad fixes in v2.4.0-dev.2.
    // Media requests never reach the WebView network; only the app player downloads media.
    private static final String CAPTURE_SCRIPT = """
            (() => {
                if (window.top !== window) return;
                const video = new URL(location.href).searchParams.get('v');
                const player = () => document.getElementById('movie_player');
                const urlOf = input => new URL(input instanceof Request ? input.url : String(input), location.href);
                const isMedia = url => url.protocol === 'https:' && url.hostname.endsWith('.googlevideo.com')
                    && url.pathname === '/videoplayback';
                const isPlayer = url => url.origin === location.origin && url.pathname === '/youtubei/v1/player';
                let retriedForAd = false;
                let requestedPlay = false;
                let sawRequest = false;
                let signatureTimestamp;
                const send = (url, body) => {
                    try {
                        sawRequest = true;
                        const p = player();
                        const response = p?.getPlayerResponse?.();
                        const playing = p?.getVideoData?.()?.video_id;
                        if ((playing && playing !== video) || response?.videoDetails?.videoId !== video) return;
                        if (p.classList.contains('ad-showing') || p.classList.contains('ad-interrupting')) {
                            if (!retriedForAd) {
                                retriedForAd = true;
                                p.loadVideoById(video);
                            }
                            return;
                        }
                        const stream = response?.streamingData?.serverAbrStreamingUrl;
                        if (!stream || urlOf(stream).searchParams.get('id') !== url.searchParams.get('id')) return;
                        const bytes = body instanceof ArrayBuffer ? new Uint8Array(body)
                            : new Uint8Array(body.buffer, body.byteOffset, body.byteLength);
                        if (!bytes.length || bytes.length > 90 * 1024) return;
                        let binary = '';
                        for (let offset = 0; offset < bytes.length; offset += 32768) {
                            binary += String.fromCharCode.apply(null, bytes.subarray(offset, offset + 32768));
                        }
                        const timestamp = signatureTimestamp || window.ytcfg?.get?.('STS');
                        RvxMwebSession.postMessage(stringify([video, url.href, btoa(binary), timestamp]));
                    } catch (e) { /* A later request can provide the session. */ }
                };
                const stringify = JSON.stringify;
                JSON.stringify = function(value, ...args) {
                    const ctx = value?.context && value.videoId === video && value.playbackContext;
                    const timestamp = ctx?.contentPlaybackContext?.signatureTimestamp;
                    if (Number.isSafeInteger(timestamp) && timestamp > 0) signatureTimestamp = timestamp;
                    if (ctx?.contentPlaybackContext && !ctx.adPlaybackContext) {
                        value = {...value, playbackContext: {...ctx, adPlaybackContext: {pyv: true}}};
                    }
                    return stringify.call(this, value, ...args);
                };
                const originalFetch = window.fetch;
                window.fetch = function(input, init) {
                    const url = urlOf(input);
                    if (isMedia(url)) {
                        if (init?.body) send(url, init.body);
                        else if (input instanceof Request) input.clone().arrayBuffer().then(body => send(url, body));
                        return Promise.reject(new TypeError('Media is handled by the app'));
                    }
                    const result = originalFetch.apply(this, arguments);
                    if (!retriedForAd || !isPlayer(url)) return result;
                    return result.then(response => response.clone().json().then(data => {
                        if (!data.adPlacements && !data.playerAds && !data.adSlots) return response;
                        delete data.adPlacements;
                        delete data.playerAds;
                        delete data.adSlots;
                        const headers = new Headers(response.headers);
                        headers.delete('content-length');
                        return new Response(stringify(data), {status: response.status, headers});
                    }).catch(() => response));
                };
                const open = XMLHttpRequest.prototype.open;
                const xhrSend = XMLHttpRequest.prototype.send;
                XMLHttpRequest.prototype.open = function(method, input) {
                    this.rvxMediaUrl = urlOf(input);
                    return open.apply(this, arguments);
                };
                XMLHttpRequest.prototype.send = function(body) {
                    if (this.rvxMediaUrl && isMedia(this.rvxMediaUrl)) {
                        if (body) send(this.rvxMediaUrl, body);
                        this.abort();
                        return;
                    }
                    return xhrSend.apply(this, arguments);
                };
                setInterval(() => {
                    const p = player();
                    if (!p) return;
                    const status = p.getPlayerResponse?.()?.playabilityStatus?.status;
                    if (status && status !== 'OK') {
                        RvxMwebSession.postMessage(stringify([video]));
                    } else if (!sawRequest && !requestedPlay && p.playVideo) {
                        requestedPlay = true;
                        p.playVideo();
                    }
                }, 1000);
            })();
            """;

    public static boolean isSupported() {
        try {
            return PatchStatus.MobileWebMediaRequest() && WebView.getCurrentWebViewPackage() != null
                    && WebViewFeature.isFeatureSupported(WebViewFeature.MULTI_PROFILE)
                    && WebViewFeature.isFeatureSupported(WebViewFeature.DOCUMENT_START_SCRIPT)
                    && WebViewFeature.isFeatureSupported(WebViewFeature.WEB_MESSAGE_LISTENER)
                    && WebViewFeature.isFeatureSupported(WebViewFeature.SERVICE_WORKER_BLOCK_NETWORK_LOADS);
        } catch (RuntimeException | LinkageError ex) {
            return false;
        }
    }

    public static ClientType selectAvailable(ClientType selected, ClientType defaultClient) {
        return selected == ClientType.MWEB && !isSupported() ? defaultClient : selected;
    }

    private final String videoId;
    private final long deadline = SystemClock.elapsedRealtime() + TIMEOUT_MS;
    private final CompletableFuture<Session> result = new CompletableFuture<>();
    private final Runnable timeout = () -> finish(null);
    @Nullable
    private WebView page;
    private boolean released;

    private MwebSiteSession(String videoId) {
        this.videoId = videoId;
        MAIN.post(this::open);
        MAIN.postDelayed(timeout, TIMEOUT_MS);
    }

    @Nullable
    public static MwebSiteSession start(String videoId) {
        return VIDEO_ID.matcher(videoId).matches() && PAGE_SLOTS.tryAcquire() ? new MwebSiteSession(videoId) : null;
    }

    @Nullable
    public Session await() {
        try {
            return result.get(Math.max(0, deadline - SystemClock.elapsedRealtime()), TimeUnit.MILLISECONDS);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        } catch (ExecutionException | TimeoutException ignored) {
            // Fall through to the next native client. No URLs, cookies or session data are logged.
        }
        return null;
    }

    @Override
    public void close() {
        if (!result.isDone()) MAIN.post(() -> finish(null));
    }

    @SuppressLint("SetJavaScriptEnabled")
    private void open() {
        try {
            if (released || !isSupported()) {
                finish(null);
                return;
            }
            WebView view = new WebView(Utils.getContext());
            page = view;
            // The profile is created for this feature alone. Never use the default CookieManager.
            WebViewCompat.setProfile(view, PROFILE);
            var profile = ProfileStore.getInstance().getOrCreateProfile(PROFILE);
            profile.getCookieManager().setAcceptThirdPartyCookies(view, false);
            profile.getCookieManager().setCookie(ORIGIN, "SOCS=CAI; Secure; Path=/");
            profile.getServiceWorkerController().getServiceWorkerWebSettings().setBlockNetworkLoads(true);

            WebSettings settings = view.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setMediaPlaybackRequiresUserGesture(false);
            settings.setAllowFileAccess(false);
            settings.setAllowContentAccess(false);
            settings.setGeolocationEnabled(false);
            settings.setLoadsImagesAutomatically(false);
            settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
            settings.setUserAgentString(ClientType.MWEB.getUserAgent());

            view.setWebViewClient(new PageClient());
            WebViewCompat.addWebMessageListener(view, MESSAGE_OBJECT, ORIGINS, (v, message, origin, main, reply) -> {
                if (main && isSiteOrigin(origin) && message.getType() == WebMessageCompat.TYPE_STRING) {
                    onMessage(message.getData());
                }
            });
            WebViewCompat.addDocumentStartJavaScript(view, CAPTURE_SCRIPT, ORIGINS);
            view.setVisibility(View.INVISIBLE);
            view.setRendererPriorityPolicy(WebView.RENDERER_PRIORITY_IMPORTANT, false);
            Activity activity = Utils.getActivity();
            if (activity != null && !activity.isDestroyed()
                    && activity.getWindow().getDecorView() instanceof ViewGroup decor) {
                decor.addView(view, new ViewGroup.LayoutParams(1, 1));
            }
            view.loadUrl(ORIGIN + WATCH_PATH + "?v=" + videoId);
        } catch (RuntimeException | LinkageError ex) {
            Logger.printDebug(() -> "Mobile Web: website page unavailable for " + videoId);
            finish(null);
        }
    }

    private void onMessage(@Nullable String message) {
        if (released || message == null || message.length() > MAX_MESSAGE_SIZE) return;
        try {
            JSONArray fields = new JSONArray(message);
            if (!videoId.equals(fields.optString(0))) return;
            if (fields.length() == 1) {
                finish(null);
            } else if (fields.length() == 4) {
                byte[] body = Base64.decode(fields.getString(2), Base64.DEFAULT);
                Session session = Session.parse(fields.getString(1), body, fields.optInt(3));
                if (session != null) {
                    finish(session);
                } else {
                    Logger.printDebug(() -> "Mobile Web: invalid website session for " + videoId);
                }
            }
        } catch (IOException | JSONException | IllegalArgumentException ignored) {
            Logger.printDebug(() -> "Mobile Web: invalid website session for " + videoId);
        }
    }

    private void finish(@Nullable Session session) {
        if (released) return;
        released = true;
        MAIN.removeCallbacks(timeout);
        try {
            if (page != null) {
                if (page.getParent() instanceof ViewGroup parent) parent.removeView(page);
                page.destroy();
                page = null;
            }
        } finally {
            PAGE_SLOTS.release();
            result.complete(session);
        }
    }

    private static boolean isSiteOrigin(Uri uri) {
        return "https".equals(uri.getScheme()) && "m.youtube.com".equals(uri.getHost()) && uri.getPort() == -1;
    }

    static boolean isMediaUrl(Uri uri) {
        String host = uri.getHost();
        return "https".equals(uri.getScheme()) && uri.getPort() == -1 && host != null
                && host.endsWith(".googlevideo.com") && "/videoplayback".equals(uri.getPath());
    }

    private boolean validNavigation(Uri uri) {
        return isSiteOrigin(uri) && WATCH_PATH.equals(uri.getPath()) && videoId.equals(uri.getQueryParameter("v"));
    }

    private final class PageClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            return request.isForMainFrame() && !validNavigation(request.getUrl());
        }

        @Nullable
        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            Uri uri = request.getUrl();
            if (request.isForMainFrame() ? validNavigation(uri) : allowedSubresource(uri)) return null;
            return new WebResourceResponse("text/plain", "utf-8", 204, "No Content",
                    Map.of("Access-Control-Allow-Origin", ORIGIN), new ByteArrayInputStream(new byte[0]));
        }

        @Override
        public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
            if (request.isForMainFrame()) finish(null);
        }

        @Override
        public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse response) {
            if (request.isForMainFrame()) finish(null);
        }

        @Override
        public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
            finish(null);
            return true;
        }
    }

    private static boolean allowedSubresource(Uri uri) {
        String host = uri.getHost();
        if (!"https".equals(uri.getScheme()) || uri.getPort() != -1 || host == null
                || (!isSiteOrigin(uri) && !STATIC_HOSTS.contains(host))) {
            return false;
        }
        String path = uri.getPath();
        if (path == null) return false;
        for (String blocked : BLOCKED_PATHS) {
            if (path.contains(blocked)) return false;
        }
        return true;
    }

    public record Session(String serverAbrStreamingUrl, String streamId, byte[] clientInfo, byte[] poToken,
                          @Nullable byte[] ustreamerConfig, int signatureTimestamp) {
        public String visitorData() throws IOException {
            byte[] value = SabrRequestBody.readMessageField(clientInfo, SabrRequestBody.CLIENT_INFO_VISITOR_DATA_FIELD);
            return value == null ? "" : new String(value, StandardCharsets.UTF_8);
        }

        @Override
        public String toString() {
            return "Mobile Web session";
        }

        @Nullable
        static Session parse(String url, byte[] body, int signatureTimestamp) throws IOException {
            Uri uri = Uri.parse(url);
            if (!isMediaUrl(uri) || !ClientType.MWEB.clientName.equals(uri.getQueryParameter("c"))
                    || !"1".equals(uri.getQueryParameter("sabr"))) return null;
            String id = uri.getQueryParameter("id");
            byte[] context = SabrRequestBody.readMessageField(body, SabrRequestBody.REQUEST_STREAMER_CONTEXT_FIELD);
            if (id == null || id.isEmpty() || context == null) return null;
            byte[] client = SabrRequestBody.readMessageField(context, SabrRequestBody.STREAMER_CONTEXT_CLIENT_INFO_FIELD);
            byte[] proof = SabrRequestBody.readMessageField(context, SabrRequestBody.STREAMER_CONTEXT_PO_TOKEN_FIELD);
            if (client == null || proof == null || proof.length < MIN_PROOF_SIZE) return null;

            StringJoiner query = new StringJoiner("&");
            for (String param : uri.getEncodedQuery().split("&")) {
                if (!param.startsWith("rn=")) query.add(param);
            }
            return new Session(uri.buildUpon().encodedQuery(query.toString()).build().toString(), id, client, proof,
                    SabrRequestBody.readMessageField(body, SabrRequestBody.REQUEST_USTREAMER_CONFIG_FIELD),
                    signatureTimestamp);
        }
    }
}
