/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.LruCache;

import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Utils;

/**
 * Extension-owned mirror of Instagram's decode results.
 *
 * <p>Instagram's own bitmap cache stores {@code WeakReference}s and is cleaned when the views
 * release the full-size bitmaps, so a carousel page stops being reachable long before the download
 * sheet opens. This class keeps a small RGB_565 copy of every decode (through the patch-emitted
 * {@code ThumbnailMirror.onDecoded} hook) so the sheet can paint the leading badge without
 * touching the network or Instagram's caches.
 *
 * <p>{@link #onDecoded} runs on Instagram's decode executor thread, so it must never throw and
 * stays close to 1ms: the source is only scaled by an integer-ish factor into a 256px long side
 * (a 1080x1440 photo becomes 192x256, roughly 96KB). The {@link LruCache} bound plus a trim
 * callback keep the footprint around 10MB.
 */
public final class ThumbnailMirror {
    private static final int TARGET_LONG_SIDE_PX = 256;

    /** Avatar and emoji decodes are far smaller than a feed preview; skip them. */
    private static final int MIN_SOURCE_SIDE_PX = 320;

    private static final int MAX_CACHE_BYTES = 10 * 1024 * 1024;
    private static final Paint SCALE_PAINT = new Paint(Paint.FILTER_BITMAP_FLAG);
    private static final AtomicBoolean TRIM_CALLBACK_REGISTERED = new AtomicBoolean(false);

    /**
     * Re-read from the download-sheet toggle by {@link ThumbnailLoader}. Volatile because Instagram
     * decodes on its own threads while the sheet toggles the flag on the main thread.
     */
    private static volatile boolean enabled = true;

    private static final LruCache<String, Bitmap> CACHE =
            new LruCache<String, Bitmap>(MAX_CACHE_BYTES) {
                @Override
                protected int sizeOf(String key, Bitmap bitmap) {
                    return bitmap.isRecycled() ? 1 : Math.max(1, bitmap.getAllocationByteCount());
                }
            };

    private static final ComponentCallbacks2 TRIM_CALLBACK =
            new ComponentCallbacks2() {
                @Override
                public void onTrimMemory(int level) {
                    if (level >= TRIM_MEMORY_COMPLETE) {
                        CACHE.evictAll();
                    } else if (level >= TRIM_MEMORY_RUNNING_LOW) {
                        CACHE.trimToSize(MAX_CACHE_BYTES / 4);
                    }
                }

                @Override
                public void onConfigurationChanged(Configuration newConfig) {
                }

                @Override
                public void onLowMemory() {
                    CACHE.evictAll();
                }
            };

    private ThumbnailMirror() {
    }

    static void setEnabled(boolean value) {
        enabled = value;
    }

    /**
     * Called on Instagram's decode executor thread after every successful decode-and-add, through
     * the patch-emitted hook on the image cache facade. [cacheKey] is the {@code ImageCacheKey}
     * identity string the feed itself keyed the decode under, so the sheet can probe the exact
     * variant the feed displayed.
     */
    public static void onDecoded(Bitmap source, String cacheKey, Object postprocessor) {
        try {
            if (!enabled || source == null || cacheKey == null || source.isRecycled()) return;

            int width = source.getWidth();
            int height = source.getHeight();
            if (width <= 0 || height <= 0) return;
            if (Math.min(width, height) < MIN_SOURCE_SIDE_PX) return;
            if (source.getConfig() == Bitmap.Config.HARDWARE) return;

            Bitmap existing = CACHE.get(cacheKey);
            if (existing != null && !existing.isRecycled()) return;

            Bitmap thumbnail = scaleToThumbnail(source, width, height);
            if (thumbnail == null) return;
            CACHE.put(cacheKey, thumbnail);
            registerTrimCallback();

            if (ThumbnailLoader.DIAGNOSTIC_LOGGING) {
                ThumbnailLoader.logDiagnostic("mirror put key=" + cacheKey
                        + " src=" + width + "x" + height
                        + " post=" + (postprocessor == null ? "none" : postprocessor.getClass().getName())
                        + " cachedBytes=" + CACHE.size() + "/" + MAX_CACHE_BYTES);
            }
        } catch (Throwable throwable) {
            // This runs on Instagram's decode path; a mirror failure must never surface there.
            if (ThumbnailLoader.DIAGNOSTIC_LOGGING) {
                ThumbnailLoader.logDiagnostic("mirror error=" + throwable);
            }
        }
    }

    /** Mirrors a bitmap decoded from another tier so the next sheet open is instant. */
    static void put(String cacheKey, Bitmap bitmap) {
        if (cacheKey == null || bitmap == null || bitmap.isRecycled()) return;
        try {
            CACHE.put(cacheKey, bitmap);
            registerTrimCallback();
        } catch (Throwable ignored) {
            // Cache writes are best effort.
        }
    }

    /** UI-thread safe: the LruCache lookup is synchronized internally. */
    static Bitmap get(String cacheKey) {
        if (cacheKey == null) return null;
        try {
            Bitmap bitmap = CACHE.get(cacheKey);
            return bitmap == null || bitmap.isRecycled() ? null : bitmap;
        } catch (Throwable throwable) {
            return null;
        }
    }

    private static Bitmap scaleToThumbnail(Bitmap source, int width, int height) {
        int largestSide = Math.max(width, height);
        int targetWidth = Math.max(1, Math.round(width * (float) TARGET_LONG_SIDE_PX / largestSide));
        int targetHeight = Math.max(1, Math.round(height * (float) TARGET_LONG_SIDE_PX / largestSide));

        Bitmap thumbnail = Bitmap.createBitmap(targetWidth, targetHeight, Bitmap.Config.RGB_565);
        new Canvas(thumbnail)
                .drawBitmap(source, null, new Rect(0, 0, targetWidth, targetHeight), SCALE_PAINT);
        return thumbnail;
    }

    private static void registerTrimCallback() {
        if (!TRIM_CALLBACK_REGISTERED.compareAndSet(false, true)) return;
        try {
            Context context = Utils.getContext();
            if (context == null) {
                TRIM_CALLBACK_REGISTERED.set(false);
                return;
            }
            context.registerComponentCallbacks(TRIM_CALLBACK);
        } catch (Throwable throwable) {
            TRIM_CALLBACK_REGISTERED.set(false);
        }
    }
}
