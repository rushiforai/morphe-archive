package io.github.sabopura.morphe.extension.twitch.danmaku;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.util.LruCache;

import io.github.sabopura.morphe.extension.twitch.chat.PublicApi;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/** Memory-only loader for Twitch emote images from Twitch's own emote CDN. */
final class EmoteCache {
    private static final String TAG = "TwitchDanmaku";
    private static final int MAX_DOWNLOAD_BYTES = 512 * 1024;
    private static final int CACHE_BYTES = 8 * 1024 * 1024;
    private static final long RETRY_AFTER_MS = 5L * 60L * 1000L;
    /** The overlay asks on every frame; a full download queue is asked again after this. */
    private static final long QUEUE_FULL_RETRY_MS = 2_000L;
    private static final EmoteCache INSTANCE = new EmoteCache();

    private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(CACHE_BYTES) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value == null ? 0 : value.getAllocationByteCount();
        }
    };
    private final Set<String> loading = Collections.synchronizedSet(new HashSet<>());
    private final Map<String, Long> failedUntil = new ConcurrentHashMap<>();

    private EmoteCache() {
    }

    static EmoteCache getInstance() {
        return INSTANCE;
    }

    /** Emote ids are digits or "emotesv2_" hex; anything else is never requested. */
    static boolean isValidId(String id) {
        if (id == null || id.isEmpty() || id.length() > 64) return false;
        for (int index = 0; index < id.length(); index++) {
            char value = id.charAt(index);
            if (!(value >= '0' && value <= '9') && !(value >= 'a' && value <= 'z')
                    && !(value >= 'A' && value <= 'Z') && value != '_') {
                return false;
            }
        }
        return true;
    }

    /** Returns the cached bitmap, or null and starts loading it ({@code onReady} on success). */
    Bitmap get(String id, Runnable onReady) {
        if (!isValidId(id)) return null;
        Bitmap bitmap = cache.get(id);
        if (bitmap != null && !bitmap.isRecycled()) return bitmap;
        Long retryAt = failedUntil.get(id);
        if (retryAt != null && retryAt > System.currentTimeMillis() || !loading.add(id)) return null;
        if (!PublicApi.submit(() -> load(id, onReady))) {
            failedUntil.put(id, System.currentTimeMillis() + QUEUE_FULL_RETRY_MS);
            loading.remove(id);
        }
        return null;
    }

    private void load(String id, Runnable onReady) {
        try {
            cache.put(id, decode(PublicApi.fetch(
                    "https://static-cdn.jtvnw.net/emoticons/v2/" + id + "/default/dark/2.0", "image/*", MAX_DOWNLOAD_BYTES)));
            failedUntil.remove(id);
            if (onReady != null) onReady.run();
        } catch (Throwable throwable) {
            failedUntil.put(id, System.currentTimeMillis() + RETRY_AFTER_MS);
            Log.d(TAG, "Emote unavailable: " + throwable.getClass().getSimpleName());
        } finally {
            loading.remove(id);
        }
    }

    /** Animated emotes are GIFs; the first frame is used. */
    private static Bitmap decode(byte[] bytes) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0
                || bounds.outWidth > 512 || bounds.outHeight > 512) {
            throw new IOException("Invalid emote dimensions");
        }
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        if (bitmap == null) throw new IOException("Undecodable emote");
        return bitmap;
    }
}
