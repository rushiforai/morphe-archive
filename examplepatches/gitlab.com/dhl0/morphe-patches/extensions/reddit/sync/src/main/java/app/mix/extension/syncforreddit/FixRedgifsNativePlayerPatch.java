/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.os.Handler;
import android.os.Looper;

import com.android.volley.Response;
import com.android.volley.VolleyError;

import org.json.JSONObject;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.Executors;

import app.mix.extension.shared.fixes.redgifs.RedgifsTokenManager;
import app.mix.extension.shared.requests.Requester;

/**
 * Replaces Sync's native Redgifs playback lookup.
 *
 * <p>Sync's own click-to-play flow does not reuse the app's shared OkHttp client that
 * {@link FixRedgifsApiPatch} patches. Instead it runs a dedicated, hand-written Volley request
 * chain (an OAuth client-credentials request, followed by a since-removed client-IP lookup,
 * followed by the actual gif info request) that calls the same two endpoints Redgifs has
 * removed. That chain fails outright on the very first request, regardless of whether the
 * OkHttp-based Redgifs fix is applied, which is why previews (loaded through Sync's own
 * image proxy) work while tapping a post to play it always shows "Error connecting to Redgifs".
 *
 * <p>This class replaces that entire chain with a single lookup that reuses the already-working
 * {@link RedgifsTokenManager} (the same anonymous temporary-token flow the OkHttp fix uses) and
 * delivers the result back through Sync's own Volley listeners, so no other app code needs to
 * change.
 */
public final class FixRedgifsNativePlayerPatch {
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private FixRedgifsNativePlayerPatch() {
    }

    /**
     * @param url        the original post URL, as passed to Sync's link handler
     * @param forceHd    true if the caller always wants the HD variant
     * @param onSuccess  delivered on the main thread with the resolved, playable video URL
     * @param onError    delivered on the main thread if the id can't be extracted or the
     *                   lookup fails for any reason
     */
    public static void fetchRedgif(String url, boolean forceHd,
                                    Response.Listener<String> onSuccess,
                                    Response.ErrorListener onError) {
        Executors.newSingleThreadExecutor().execute(() -> {
            try {
                final String videoUrl = resolveVideoUrl(url, forceHd);
                MAIN_HANDLER.post(() -> onSuccess.onResponse(videoUrl));
            } catch (Exception ex) {
                MAIN_HANDLER.post(() -> onError.onErrorResponse(new VolleyError(ex)));
            }
        });
    }

    private static String resolveVideoUrl(String url, boolean forceHd) throws Exception {
        String id = FixRedgifsApiPatch.extractGifId(url);
        if (id == null || id.isEmpty()) {
            throw new IllegalArgumentException("Could not extract Redgifs id from " + url);
        }

        String userAgent = FixRedgifsApiPatch.getUserAgent();
        RedgifsTokenManager.RedgifsToken token = RedgifsTokenManager.refreshToken(userAgent);

        HttpURLConnection connection =
                (HttpURLConnection) new URL("https://api.redgifs.com/v2/gifs/" + id).openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Authorization", "Bearer " + token.getAccessToken());
        connection.setRequestProperty("User-Agent", userAgent);
        connection.setUseCaches(false);

        JSONObject urls;
        try {
            urls = Requester.parseJSONObjectAndDisconnect(connection).getJSONObject("gif").getJSONObject("urls");
        } catch (Exception ex) {
            // The cached token may have been rejected (e.g. IP changed); retry once with a
            // forced refresh, mirroring BaseFixRedgifsApiPatch's own retry behavior.
            token = RedgifsTokenManager.refreshToken(userAgent, true);
            connection = (HttpURLConnection) new URL("https://api.redgifs.com/v2/gifs/" + id).openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + token.getAccessToken());
            connection.setRequestProperty("User-Agent", userAgent);
            connection.setUseCaches(false);
            urls = Requester.parseJSONObjectAndDisconnect(connection).getJSONObject("gif").getJSONObject("urls");
        }

        if (forceHd || !urls.has("sd")) {
            return urls.getString("hd");
        }
        return urls.getString("sd");
    }
}
