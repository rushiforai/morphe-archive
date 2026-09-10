/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import android.net.Uri;

import androidx.annotation.Nullable;

import org.chromium.net.CronetEngine;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.shared.requests.CronetTransport;
import app.morphe.extension.shared.spoof.requests.StreamingDataRequest;

/**
 * Captures a <em>live player</em> media request at the MediaDataSource construction boundary
 * and reopens its effective byte-addressable method through the recorded Cronet engine.
 *
 * <p>This deliberately has no platform-HTTP fallback.  The old standalone request was the
 * cause of prefix-only authorization: if an app engine or a matching current-video audio
 * request is unavailable, the caller fails closed before uploading any source bytes.
 * Captured headers are used only in-process to reproduce the player request and are never
 * logged, persisted or exposed through an API.
 *
 * <p>This is a transport bridge for ordinary byte-addressable media responses.  A request with
 * a body is intentionally not accepted: that is a SABR/media-fetch request whose response
 * framing cannot be claimed to be an original WebM/Opus file without a verified body hook and
 * reassembler.  Treating it as raw audio would be data corruption.
 */
public final class YandexVotPlayerMediaTransport {
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final int MAX_SNAPSHOTS = 12;
    private static final int MAX_PLAYER_CONTEXTS = 20;
    private static final String AUTHORIZATION_HEADER = "Authorization";
    // The constructor fingerprint is ExoPlayer DataSpec(Uri, long, int, byte[], Map, long,
    // long, String, int, Object); DataSpec.HTTP_METHOD_GET is 1 (POST is 2, HEAD is 3).
    private static final int DATA_SPEC_HTTP_METHOD_GET = 1;
    private static final int DATA_SPEC_HTTP_METHOD_POST = 2;
    private static final Object LOCK = new Object();
    private static final ArrayList<Snapshot> SNAPSHOTS = new ArrayList<>();
    private static final ArrayList<PlayerRequestContext> PLAYER_CONTEXTS = new ArrayList<>();
    private static final AtomicLong ENGINE_HOOKS = new AtomicLong();
    private static final AtomicLong REQUEST_HOOKS = new AtomicLong();
    private static final AtomicLong PLAYER_REQUEST_HOOKS = new AtomicLong();
    private static final AtomicLong PLAYER_CONTEXTS_RETAINED = new AtomicLong();
    private static final AtomicLong DIRECT_STREAM_REQUESTS = new AtomicLong();
    private static final AtomicLong NULL_URI = new AtomicLong();
    private static final AtomicLong INVALID_URI = new AtomicLong();
    private static final AtomicLong PLAYBACK_ROUTE = new AtomicLong();
    private static final AtomicLong OTHER_ROUTE = new AtomicLong();
    private static final AtomicLong METHOD_GET = new AtomicLong();
    private static final AtomicLong METHOD_POST = new AtomicLong();
    private static final AtomicLong METHOD_OTHER = new AtomicLong();
    private static final AtomicLong BODYFUL = new AtomicLong();
    private static final AtomicLong MISSING_ITAG = new AtomicLong();
    private static final AtomicLong RETAINED = new AtomicLong();
    private static volatile boolean engineReady;
    private static volatile long lastBodyfulDiagnosticLogMs;

    private YandexVotPlayerMediaTransport() {
    }

    /** Bytecode injection point: records the app-wide engine used by player networking. */
    @SuppressWarnings("unused")
    public static void setCronetEngine(CronetEngine engine) {
        ENGINE_HOOKS.incrementAndGet();
        engineReady = engine != null;
        CronetTransport.setMainCronetEngine(engine);
    }

    /**
     * Structural request-builder hook. It runs even when stream spoofing is disabled and keeps
     * only the current player request's login context in memory. No URL, video id, or header is
     * logged or persisted.
     */
    @SuppressWarnings({"unused", "rawtypes"})
    public static void recordPlayerRequest(String url, Map headers) {
        PLAYER_REQUEST_HOOKS.incrementAndGet();
        try {
            recordPlayerRequestSafely(url, headers);
        } catch (RuntimeException ignored) {
            // A diagnostic/source-acquisition hook must never interrupt YouTube networking.
        }
    }

    @SuppressWarnings("rawtypes")
    private static void recordPlayerRequestSafely(String url, Map headers) {
        URI uri;
        try {
            uri = new URI(url);
        } catch (URISyntaxException | NullPointerException ignored) {
            return;
        }
        String path = uri.getPath();
        if (path == null || !path.contains("player")
                || path.contains("get_drm_license")
                || path.contains("heartbeat")
                || path.contains("refresh")
                || path.contains("ad_break")) {
            return;
        }
        String videoId = queryParameter(uri.getRawQuery(), "id");
        if (!isVideoId(videoId)) return;

        boolean isInline = "1".equals(queryParameter(uri.getRawQuery(), "inline"));
        Map<String, String> authContext = copyAuthorizationHeader(headers);
        int contexts;
        synchronized (LOCK) {
            for (int i = PLAYER_CONTEXTS.size() - 1; i >= 0; i--) {
                if (videoId.equals(PLAYER_CONTEXTS.get(i).videoId)) {
                    PLAYER_CONTEXTS.remove(i);
                }
            }
            PLAYER_CONTEXTS.add(new PlayerRequestContext(videoId, isInline, authContext));
            while (PLAYER_CONTEXTS.size() > MAX_PLAYER_CONTEXTS) {
                PLAYER_CONTEXTS.remove(0);
            }
            contexts = PLAYER_CONTEXTS.size();
        }
        PLAYER_CONTEXTS_RETAINED.incrementAndGet();
        YandexVotDiagnostics.source("player-context-retained", -1, contexts);
    }

    /** Starts one on-demand, non-SABR player request without touching the spoof cache. */
    static StreamingDataRequest requestDirectStreams(String videoId) {
        PlayerRequestContext context = findPlayerRequestContext(videoId);
        DIRECT_STREAM_REQUESTS.incrementAndGet();
        YandexVotDiagnostics.source(
                context == null ? "direct-request-without-context" : "direct-request-with-context",
                -1,
                playerContextCount());
        return StreamingDataRequest.fetchDirectStreamRequest(
                videoId,
                context != null && context.isInline,
                context == null ? Collections.emptyMap() : context.headers);
    }

    /**
     * Bytecode injection point at the player's MediaDataSource constructor.
     *
     * <p>Only an id/itag-addressable, bodyless GET or POST is retained. A body-carrying SABR
     * POST is not a fallback candidate because its response requires protocol-aware parsing.
     */
    @SuppressWarnings({"unused", "rawtypes"})
    public static void recordPlayerMediaRequest(
            Uri uri,
            int httpMethod,
            byte[] requestBody,
            Map headers,
            String requestVideoId
    ) {
        if (uri == null) {
            REQUEST_HOOKS.incrementAndGet();
            NULL_URI.incrementAndGet();
            return;
        }
        recordPlayerMediaRequest(uri.toString(), httpMethod, requestBody, headers, requestVideoId);
    }

    /** Package-visible pure entrypoint for request-selection tests. */
    @SuppressWarnings("rawtypes")
    static void recordPlayerMediaRequest(
            String url,
            int httpMethod,
            byte[] requestBody,
            Map headers,
            String requestVideoId
    ) {
        REQUEST_HOOKS.incrementAndGet();
        URI uri;
        try {
            uri = new URI(url);
        } catch (URISyntaxException | NullPointerException ignored) {
            INVALID_URI.incrementAndGet();
            return;
        }
        if (uri.getPath() == null || !uri.getPath().contains("/videoplayback")) {
            OTHER_ROUTE.incrementAndGet();
            return;
        }
        PLAYBACK_ROUTE.incrementAndGet();
        int itag = parsePositiveInt(queryParameter(uri.getRawQuery(), "itag"));
        String replayMethod = replayHttpMethod(httpMethod);
        if (DATA_SPEC_HTTP_METHOD_GET == httpMethod) {
            METHOD_GET.incrementAndGet();
        } else if (DATA_SPEC_HTTP_METHOD_POST == httpMethod) {
            METHOD_POST.incrementAndGet();
        } else {
            METHOD_OTHER.incrementAndGet();
        }
        boolean hasRequestBody = requestBody != null && requestBody.length != 0;
        if (hasRequestBody) BODYFUL.incrementAndGet();
        // Spoof video streams can clear DataSpec.d while leaving its method as POST. Replaying
        // that bodyless POST exactly is safe; transforming it into GET would lose semantics.
        if (replayMethod == null || hasRequestBody) {
            if (itag > 0 && hasRequestBody) {
                long nowMs = System.currentTimeMillis();
                if (nowMs - lastBodyfulDiagnosticLogMs >= 15_000L) {
                    lastBodyfulDiagnosticLogMs = nowMs;
                    YandexVotDiagnostics.transport(
                            "ignored-bodyful-sabr",
                            itag,
                            requestBody.length,
                            snapshotCount());
                }
            }
            return;
        }

        String videoId = firstVideoId(uri.getRawQuery(), requestVideoId);
        // Media URLs normally carry an opaque googlevideo stream id, while DataSpec.key is an
        // implementation detail rather than a guaranteed YouTube video id.  Keep a bodyless
        // candidate even without a video id; selection later requires the cached current-video
        // format to prove it is the same media stream.
        if (itag <= 0) {
            MISSING_ITAG.incrementAndGet();
            return;
        }

        Map<String, String> copiedHeaders = copyHeaders(headers);
        int snapshotCount;
        synchronized (LOCK) {
            // Keep the newest exact request for every video/itag pair.  Player prefetch, ads and
            // next-video requests must not evict the active video's still-valid snapshot.
            for (int i = SNAPSHOTS.size() - 1; i >= 0; i--) {
                Snapshot existing = SNAPSHOTS.get(i);
                if (itag == existing.itag
                        && ((videoId != null && videoId.equals(existing.videoId))
                        || sameMediaStream(existing.url, url))) {
                    SNAPSHOTS.remove(i);
                }
            }
            SNAPSHOTS.add(new Snapshot(videoId, itag, url, httpMethod, copiedHeaders));
            while (SNAPSHOTS.size() > MAX_SNAPSHOTS) {
                SNAPSHOTS.remove(0);
            }
            snapshotCount = SNAPSHOTS.size();
        }
        RETAINED.incrementAndGet();
        YandexVotDiagnostics.transport(
                "retained-" + replayMethod.toLowerCase(java.util.Locale.US),
                itag,
                0,
                snapshotCount);
    }

    /** Returns the newest exact current-video/audio-format request, or null when unavailable. */
    @Nullable
    static Snapshot find(String videoId, int itag) {
        if (videoId == null || videoId.isEmpty() || itag <= 0) return null;
        synchronized (LOCK) {
            for (int i = SNAPSHOTS.size() - 1; i >= 0; i--) {
                Snapshot snapshot = SNAPSHOTS.get(i);
                if (videoId.equals(snapshot.videoId) && itag == snapshot.itag) {
                    return snapshot;
                }
            }
        }
        return null;
    }

    /**
     * Returns a captured request only when it belongs to the cached format of the current
     * video.  This accommodates opaque DataSpec keys without allowing an arbitrary prefetch
     * request to be used as the source track.
     */
    @Nullable
    static Snapshot findForFormat(String videoId, int itag, String formatUrl) {
        Snapshot exactVideoMatch = find(videoId, itag);
        if (exactVideoMatch != null) return exactVideoMatch;
        if (formatUrl == null || formatUrl.isEmpty() || itag <= 0) return null;
        synchronized (LOCK) {
            for (int i = SNAPSHOTS.size() - 1; i >= 0; i--) {
                Snapshot snapshot = SNAPSHOTS.get(i);
                if (snapshot.itag == itag && sameMediaStream(snapshot.url, formatUrl)) {
                    return snapshot;
                }
            }
        }
        return null;
    }

    static YandexVotHttpAudioPartReader.Factory factoryFor(Snapshot snapshot) {
        return (ignoredUrl, start, endInclusive) -> open(snapshot, start, endInclusive);
    }

    static void resetForTests() {
        synchronized (LOCK) {
            SNAPSHOTS.clear();
            PLAYER_CONTEXTS.clear();
        }
        ENGINE_HOOKS.set(0);
        REQUEST_HOOKS.set(0);
        PLAYER_REQUEST_HOOKS.set(0);
        PLAYER_CONTEXTS_RETAINED.set(0);
        DIRECT_STREAM_REQUESTS.set(0);
        NULL_URI.set(0);
        INVALID_URI.set(0);
        PLAYBACK_ROUTE.set(0);
        OTHER_ROUTE.set(0);
        METHOD_GET.set(0);
        METHOD_POST.set(0);
        METHOD_OTHER.set(0);
        BODYFUL.set(0);
        MISSING_ITAG.set(0);
        RETAINED.set(0);
        engineReady = false;
        lastBodyfulDiagnosticLogMs = 0;
    }

    static int snapshotCount() {
        synchronized (LOCK) {
            return SNAPSHOTS.size();
        }
    }

    static DiagnosticSummary diagnosticSummary() {
        return new DiagnosticSummary(
                ENGINE_HOOKS.get(),
                engineReady,
                REQUEST_HOOKS.get(),
                PLAYER_REQUEST_HOOKS.get(),
                PLAYER_CONTEXTS_RETAINED.get(),
                DIRECT_STREAM_REQUESTS.get(),
                NULL_URI.get(),
                INVALID_URI.get(),
                PLAYBACK_ROUTE.get(),
                OTHER_ROUTE.get(),
                METHOD_GET.get(),
                METHOD_POST.get(),
                METHOD_OTHER.get(),
                BODYFUL.get(),
                MISSING_ITAG.get(),
                RETAINED.get(),
                snapshotCount(),
                playerContextCount());
    }

    static void logDiagnosticSummary() {
        YandexVotDiagnostics.transportSummary(diagnosticSummary());
    }

    private static YandexVotHttpAudioPartReader.Connection open(
            Snapshot snapshot,
            long start,
            long endInclusive
    ) throws IOException {
        String requestMethod = replayHttpMethod(snapshot.httpMethod);
        if (requestMethod == null) {
            throw new IOException("Yandex VoT player request is not a supported bodyless method");
        }
        HttpURLConnection connection = CronetTransport.openConnection(
                new URL(snapshot.url), false, false);
        connection.setRequestMethod(requestMethod);
        for (Map.Entry<String, String> header : snapshot.headers.entrySet()) {
            String name = header.getKey();
            if (isTransferControlledHeader(name)) continue;
            connection.setRequestProperty(name, header.getValue());
        }
        connection.setRequestProperty("Range", "bytes=" + start + "-" + endInclusive);
        connection.setRequestProperty("Accept-Encoding", "identity");
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        return YandexVotHttpAudioPartReader.wrap(connection);
    }

    @Nullable
    static String replayHttpMethod(int dataSpecMethod) {
        return switch (dataSpecMethod) {
            case DATA_SPEC_HTTP_METHOD_GET -> "GET";
            case DATA_SPEC_HTTP_METHOD_POST -> "POST";
            default -> null;
        };
    }

    private static boolean isTransferControlledHeader(String name) {
        return "range".equalsIgnoreCase(name)
                || "accept-encoding".equalsIgnoreCase(name)
                || "content-length".equalsIgnoreCase(name)
                || "host".equalsIgnoreCase(name);
    }

    @Nullable
    private static PlayerRequestContext findPlayerRequestContext(String videoId) {
        if (!isVideoId(videoId)) return null;
        synchronized (LOCK) {
            for (int i = PLAYER_CONTEXTS.size() - 1; i >= 0; i--) {
                PlayerRequestContext context = PLAYER_CONTEXTS.get(i);
                if (videoId.equals(context.videoId)) return context;
            }
        }
        return null;
    }

    private static int playerContextCount() {
        synchronized (LOCK) {
            return PLAYER_CONTEXTS.size();
        }
    }

    @Nullable
    private static String firstVideoId(@Nullable String rawQuery, String requestVideoId) {
        String fromUri = queryParameter(rawQuery, "id");
        if (isVideoId(fromUri)) return fromUri;
        return isVideoId(requestVideoId) ? requestVideoId : null;
    }

    @Nullable
    private static String queryParameter(@Nullable String rawQuery, String name) {
        if (rawQuery == null || rawQuery.isEmpty()) return null;
        String prefix = name + "=";
        for (String entry : rawQuery.split("&")) {
            if (entry.startsWith(prefix)) return entry.substring(prefix.length());
        }
        return null;
    }

    private static boolean isVideoId(@Nullable String value) {
        if (value == null || value.length() != 11) return false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!(c >= 'a' && c <= 'z')
                    && !(c >= 'A' && c <= 'Z')
                    && !(c >= '0' && c <= '9')
                    && c != '-' && c != '_') {
                return false;
            }
        }
        return true;
    }

    /**
     * Compares only immutable media identity shared by player response and DataSpec URI.  The
     * signature and transient request parameters may differ, so string equality is too strict.
     */
    private static boolean sameMediaStream(String firstUrl, String secondUrl) {
        try {
            URI first = new URI(firstUrl);
            URI second = new URI(secondUrl);
            if (!same(first.getPath(), second.getPath())) {
                return false;
            }
            String firstItag = queryParameter(first.getRawQuery(), "itag");
            String secondItag = queryParameter(second.getRawQuery(), "itag");
            if (!same(firstItag, secondItag)) return false;
            String firstMediaId = queryParameter(first.getRawQuery(), "id");
            String secondMediaId = queryParameter(second.getRawQuery(), "id");
            if (firstMediaId == null || firstMediaId.isEmpty() || !same(firstMediaId, secondMediaId)) {
                return false;
            }
            // A video may expose alternate audio tracks with the same itag.  Require every
            // identity-bearing value that both URLs disclose to agree before falling back from
            // the explicit current-video id match.
            return sameWhenBothPresent(first.getRawQuery(), second.getRawQuery(), "clen")
                    && sameWhenBothPresent(first.getRawQuery(), second.getRawQuery(), "audio_track")
                    && sameWhenBothPresent(first.getRawQuery(), second.getRawQuery(), "lmt")
                    && sameWhenBothPresent(first.getRawQuery(), second.getRawQuery(), "xtags");
        } catch (URISyntaxException | NullPointerException ignored) {
            return false;
        }
    }

    private static boolean same(@Nullable String first, @Nullable String second) {
        return first != null && first.equals(second);
    }

    private static boolean sameWhenBothPresent(
            @Nullable String firstQuery,
            @Nullable String secondQuery,
            String parameter
    ) {
        String first = queryParameter(firstQuery, parameter);
        String second = queryParameter(secondQuery, parameter);
        return first == null || second == null || first.equals(second);
    }

    @SuppressWarnings("rawtypes")
    private static Map<String, String> copyHeaders(Map headers) {
        LinkedHashMap<String, String> copy = new LinkedHashMap<>();
        if (headers == null) return copy;
        for (Object rawEntry : headers.entrySet()) {
            if (!(rawEntry instanceof Map.Entry)) continue;
            Map.Entry entry = (Map.Entry) rawEntry;
            if (!(entry.getKey() instanceof String) || !(entry.getValue() instanceof String)) {
                continue;
            }
            copy.put((String) entry.getKey(), (String) entry.getValue());
        }
        return copy;
    }

    @SuppressWarnings("rawtypes")
    private static Map<String, String> copyAuthorizationHeader(Map headers) {
        if (headers == null) return Collections.emptyMap();
        for (Object rawEntry : headers.entrySet()) {
            if (!(rawEntry instanceof Map.Entry)) continue;
            Map.Entry entry = (Map.Entry) rawEntry;
            if (entry.getKey() instanceof String name
                    && entry.getValue() instanceof String value
                    && AUTHORIZATION_HEADER.equalsIgnoreCase(name)) {
                return Collections.singletonMap(AUTHORIZATION_HEADER, value);
            }
        }
        return Collections.emptyMap();
    }

    private static int parsePositiveInt(@Nullable String value) {
        if (value == null || value.isEmpty()) return -1;
        try {
            int parsed = Integer.parseInt(value);
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    static final class Snapshot {
        @Nullable
        final String videoId;
        final int itag;
        final String url;
        final int httpMethod;
        final Map<String, String> headers;

        Snapshot(@Nullable String videoId, int itag, String url, int httpMethod,
                 Map<String, String> headers) {
            this.videoId = videoId;
            this.itag = itag;
            this.url = url;
            this.httpMethod = httpMethod;
            this.headers = headers;
        }
    }

    private static final class PlayerRequestContext {
        final String videoId;
        final boolean isInline;
        final Map<String, String> headers;

        PlayerRequestContext(String videoId, boolean isInline, Map<String, String> headers) {
            this.videoId = videoId;
            this.isInline = isInline;
            this.headers = headers;
        }
    }

    static record DiagnosticSummary(
            long engineHooks,
            boolean engineReady,
            long requestHooks,
            long playerRequestHooks,
            long playerContextsRetained,
            long directStreamRequests,
            long nullUri,
            long invalidUri,
            long playbackRoute,
            long otherRoute,
            long methodGet,
            long methodPost,
            long methodOther,
            long bodyful,
            long missingItag,
            long retained,
            int snapshots,
            int playerContexts
    ) {
    }
}
