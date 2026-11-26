/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5197
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import android.net.Uri;

import androidx.annotation.Nullable;

import com.google.android.libraries.youtube.media.interfaces.HttpHeader;

import app.morphe.extension.shared.patches.MediaHttpHeader;
import app.morphe.extension.shared.patches.MediaHttpRequest;
import app.morphe.extension.shared.patches.WebMediaRequest;
import app.morphe.extension.shared.spoof.InnerTubeRequestBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/** Narrowly strips known identifying headers, without reading or logging header values. */
final class GhostRequestHeaders {
    private static final String PLAYER = "/youtubei/v1/player";
    private static final String NEXT = "/youtubei/v1/next";
    private static final String WATCH = "/youtubei/v1/get_watch";
    private static final String REEL = "/youtubei/v1/reel/reel_item_watch";

    private GhostRequestHeaders() {}

    static Map<String, String> sanitize(String url, Map<String, String> headers, @Nullable byte[] body) {
        if (url == null || !targetPath(url)) return headers;
        Uri uri = parseTarget(url);
        if (uri == null || !shouldStrip(uri, body)) return headers;
        return strip(headers);
    }

    static MediaHttpRequest sanitizeNative(MediaHttpRequest request) {
        if (!(request instanceof WebMediaRequest bridge)) return request;
        String url = bridge.patch_getUrl();
        if (url == null || !targetPath(url)) return request;
        Uri uri = parseTarget(url);
        if (uri == null || !shouldStrip(uri, bridge.patch_getBody())) return request;

        ArrayList<HttpHeader> headers = bridge.patch_getHeaders();
        if (headers == null) return request;
        ArrayList<HttpHeader> filtered = null;
        for (int i = 0; i < headers.size(); i++) {
            HttpHeader header = headers.get(i);
            if ((Object) header instanceof MediaHttpHeader named && isIdentifying(named.patch_getName())) {
                if (filtered == null) {
                    filtered = new ArrayList<>(headers.size() - 1);
                    filtered.addAll(headers.subList(0, i));
                }
            } else if (filtered != null) {
                filtered.add(header);
            }
        }
        return filtered == null ? request : bridge.patch_withBodyAndHeaders(bridge.patch_getBody(), filtered);
    }

    private static boolean targetPath(String url) {
        return url.contains(PLAYER) || url.contains(NEXT) || url.contains(WATCH) || url.contains(REEL)
                || url.contains("/api/stats/") || url.contains("/ptracking") || url.contains("/initplayback");
    }

    @Nullable
    private static Uri parseTarget(String url) {
        Uri uri = Uri.parse(url);
        String host = uri.getHost();
        if (host == null || !"https".equals(uri.getScheme())) return null;
        return host.equals("youtube.com") || host.endsWith(".youtube.com") || host.endsWith(".googlevideo.com")
                || host.equals("youtubei.googleapis.com") ? uri : null;
    }

    private static boolean shouldStrip(Uri uri, @Nullable byte[] body) {
        String path = uri.getPath();
        if (path == null) return false;

        boolean shortRequest = path.equals(REEL);
        boolean playerRequest = path.equals(PLAYER) || path.equals(WATCH);
        boolean videoRequest = shortRequest || playerRequest || path.equals(NEXT);
        if (!videoRequest && !isPlaybackTrackingPath(path) && !path.equals("/initplayback")) return false;

        String id = queryId(uri);
        if (id == null && videoRequest && body != null && body.length > 0) {
            try {
                String bodyId = InnerTubeRequestBody.readVideoId(body, shortRequest || path.equals(WATCH));
                if (GhostPlayPatch.validVideoId(bodyId)) id = bodyId;
            } catch (IOException | RuntimeException ignored) {
                // An unidentifiable request cannot be attributed to a one-video action.
            }
        }
        return GhostPlayPatch.shouldStripHeaders(id, shortRequest, playerRequest);
    }

    static boolean isPlaybackTrackingPath(String path) {
        return path.equals("/api/stats/watchtime") || path.equals("/api/stats/playback")
                || path.equals("/api/stats/delayplay") || path.equals("/api/stats/atr")
                || path.equals("/api/stats/ptracking") || path.equals("/ptracking");
    }

    @Nullable
    static String queryId(Uri uri) {
        if (!uri.isHierarchical()) return null;
        String id = uri.getQueryParameter("docid");
        if (id == null) id = uri.getQueryParameter("v");
        if (id == null) id = uri.getQueryParameter("video_id");
        if (id == null) id = uri.getQueryParameter("id");
        return GhostPlayPatch.validVideoId(id) ? id : null;
    }

    static Map<String, String> strip(Map<String, String> headers) {
        boolean hasIdentity = false;
        for (String key : headers.keySet()) {
            if (isIdentifying(key)) {
                hasIdentity = true;
                break;
            }
        }
        if (!hasIdentity) return headers;

        Map<String, String> filtered = new LinkedHashMap<>(headers.size());
        for (Map.Entry<String, String> header : headers.entrySet()) {
            if (!isIdentifying(header.getKey())) filtered.put(header.getKey(), header.getValue());
        }
        return filtered;
    }

    private static boolean isIdentifying(@Nullable String name) {
        return "authorization".equalsIgnoreCase(name) || "x-goog-pageid".equalsIgnoreCase(name)
                || "cookie".equalsIgnoreCase(name) || "x-goog-visitor-id".equalsIgnoreCase(name)
                || "x-youtube-identity-token".equalsIgnoreCase(name) || "x-goog-authuser".equalsIgnoreCase(name);
    }
}
