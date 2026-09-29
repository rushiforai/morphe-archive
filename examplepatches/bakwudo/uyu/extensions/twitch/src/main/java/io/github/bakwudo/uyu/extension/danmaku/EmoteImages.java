package io.github.bakwudo.uyu.extension.danmaku;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.SystemClock;
import android.util.LruCache;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * Downloads and caches Twitch emote images. Danmaku comments are redrawn every frame while they
 * move, so an image that finishes loading shows up on the next frame without a callback.
 */
final class EmoteImages {
    /** Images per emote in the v1 CDN: 1.0 is 28 px, 2.0 is 56 px and 3.0 is 112 px. */
    private static final String URL_FORMAT = "https://static-cdn.jtvnw.net/emoticons/v1/%s/%s";
    private static final long RETRY_DELAY_MS = 60_000;

    private static final LruCache<String, Bitmap> cache = new LruCache<>(8 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };
    private static final Set<String> loading = new HashSet<>();
    private static final Map<String, Long> failedAt = new HashMap<>();
    private static final ExecutorService executor = Executors.newFixedThreadPool(2);

    private EmoteImages() {
    }

    /**
     * @param size Height the emote is drawn at, in pixels.
     * @return The image, or null while it is loading or if it failed to load.
     */
    static Bitmap get(String emoteId, float size) {
        String scale = size <= 28 ? "1.0" : size <= 56 ? "2.0" : "3.0";
        String key = emoteId + "/" + scale;

        Bitmap bitmap = cache.get(key);
        if (bitmap != null) return bitmap;

        synchronized (loading) {
            if (loading.contains(key)) return null;
            Long failed = failedAt.get(key);
            if (failed != null && SystemClock.elapsedRealtime() - failed < RETRY_DELAY_MS) return null;
            loading.add(key);
        }
        executor.execute(() -> load(key, String.format(URL_FORMAT, emoteId, scale)));
        return null;
    }

    private static void load(String key, String url) {
        Bitmap bitmap = null;
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(10_000);
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (InputStream in = connection.getInputStream()) {
                    bitmap = BitmapFactory.decodeStream(in);
                }
            }
        } catch (Exception ex) {
            Utils.logError("Failed to load emote " + url, ex);
        } finally {
            if (connection != null) connection.disconnect();
        }

        if (bitmap != null) cache.put(key, bitmap);
        synchronized (loading) {
            loading.remove(key);
            if (bitmap == null) failedAt.put(key, SystemClock.elapsedRealtime());
        }
    }
}
