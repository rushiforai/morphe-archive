/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.LruCache;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.instagram.utils.InstagramLogger;

/**
 * Loads the small preview images shown as the leading badge of the download sheet rows.
 *
 * <p>Tiers, cheapest first: the extension-owned {@link ThumbnailMirror} filled at decode time,
 * Instagram's in-memory bitmap cache (through the patch-emitted {@link #cachedBitmap(String)}
 * bridge), Instagram's own disk cache (through the patch-emitted `igDisk*` bridges), a small
 * extension memory cache, a bounded disk cache under the app cache directory, then a bounded
 * network fetch. Loading always runs on a background executor and results are posted to the main
 * thread. Nothing here throws into the sheet: every tier failure falls through to the next one and
 * a total miss leaves the media icon in place.
 *
 * <p>The verbose miss diagnostics go to logcat under the dedicated {@value #LOG_TAG} tag through
 * {@link #logDiagnostic(String)}: {@code Logger.printDebug} is gated by the Morphe debug setting,
 * so it cannot be used for release-build diagnosis.
 */
public final class ThumbnailLoader {
    public interface Callback {
        void onLoaded(Bitmap bitmap);
    }

    /** Filterable with {@code adb logcat -s PikoIgThumb}. */
    private static final String LOG_TAG = "PikoIgThumb";

    /** Turns the per-item/per-probe diagnostics off without touching the loading logic. */
    static final boolean DIAGNOSTIC_LOGGING = false;

    private static final int MAX_MEMORY_CACHE_KILOBYTES = 8 * 1024;
    private static final int MAX_DISK_CACHE_BYTES = 16 * 1024 * 1024;
    private static final int DISK_CACHE_TARGET_BYTES = 12 * 1024 * 1024;
    private static final int MAX_DISK_ENTRY_BYTES = 4 * 1024 * 1024;
    private static final int MAX_DOWNLOAD_BYTES = 8 * 1024 * 1024;
    private static final int TARGET_SIZE_PX = 256;
    private static final long MIRROR_REFRESH_INTERVAL_MILLIS = 3_000;
    private static final int CONNECT_TIMEOUT_MILLIS = 4_000;
    private static final int READ_TIMEOUT_MILLIS = 5_000;
    private static final int READ_BUFFER_BYTES = 16 * 1024;
    private static final String DISK_CACHE_FOLDER = "piko_download_sheet_thumbnails";
    private static final String DISK_ENTRY_SUFFIX = ".thumb";

    /**
     * Cache and disk lookups. Kept apart from {@link #NETWORK_EXECUTOR} so a stalled connection
     * can never queue the cheap local tiers behind its timeouts.
     */
    private static final ExecutorService LOCAL_EXECUTOR = Executors.newFixedThreadPool(2);
    private static final ExecutorService NETWORK_EXECUTOR = Executors.newFixedThreadPool(4);
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean DISK_CLEANUP_SCHEDULED = new AtomicBoolean(false);
    private static volatile long lastMirrorRefreshMillis;
    private static final LruCache<String, Bitmap> MEMORY_CACHE =
            new LruCache<String, Bitmap>(MAX_MEMORY_CACHE_KILOBYTES) {
                @Override
                protected int sizeOf(String key, Bitmap bitmap) {
                    return bitmap.isRecycled() ? 1 : Math.max(1, bitmap.getByteCount() / 1024);
                }
            };

    private ThumbnailLoader() {
    }

    /** Replaced by the patch with Instagram's own cached-bitmap lookup. */
    static Bitmap cachedBitmap(String url) {
        return null;
    }

    /**
     * Replaced by the patch with the same cache lookup driven by the real `ExtendedImageUrl`
     * object, whose `ImageCacheKey` carries the actual width/height instead of -1 dimensions.
     * The URL string is required: the host cache rejects a null third argument.
     */
    static Bitmap cachedBitmap(Object imageUrl, String url) {
        return null;
    }

    /** Replaced by the patch with Instagram's SimpleImageUrl/ImageCacheKey construction. */
    static Object cacheKeyDebug(String url) {
        return null;
    }

    /** Replaced by the patch with the ImageCacheKey of the real image URL object. */
    static Object cacheKeyDebugObject(Object imageUrl) {
        return null;
    }

    /**
     * Replaced by the patch with the identity string of the image URL's {@code ImageCacheKey}
     * (the field its {@code hashCode} reads). This is the key {@link ThumbnailMirror} stores
     * decodes under, so probing every candidate variant finds whichever one the feed displayed.
     */
    static String cacheKeyString(Object imageUrl) {
        return null;
    }

    /** Replaced by the patch with Instagram's disk cache key for the image URL object. */
    static String igDiskKey(Object imageUrl) {
        return null;
    }

    /** Replaced by the patch with every disk cache Instagram's image pipeline can read. */
    static List<Object> igDiskCaches() {
        return null;
    }

    /**
     * Replaced by the patch with a read from one Instagram disk cache entry. A miss returns null;
     * some cache implementations throw on keys that cannot exist in their storage, so callers
     * must catch per cache and try the next one.
     */
    static InputStream igDiskOpen(Object cache, String key, Map<String, String> extras) {
        return null;
    }

    /**
     * Diagnostic line on the dedicated tag. Emitted in release builds on purpose so a device
     * session can explain a cache miss; {@code DIAGNOSTIC_LOGGING} switches it off in one place.
     */
    static void logDiagnostic(String message) {
        if (!DIAGNOSTIC_LOGGING) return;
        try {
            Log.i(LOG_TAG, message);
        } catch (Throwable ignored) {
            // Never let diagnostics break loading.
        }
    }

    public static boolean isDownloadSheetThumbnailsEnabled() {
        return Settings.downloadSheetThumbnails();
    }

    /**
     * Instant lookup of the three in-memory tiers (the decode mirror, Instagram's bitmap cache,
     * then ours). All are plain map lookups, so this is safe on the UI thread and lets the sheet
     * open with the thumbnails of already-viewed images in place; null means [load] has to fetch it.
     */
    public static Bitmap peek(List<String> cacheUrls, String networkUrl) {
        return peek(null, Collections.emptyList(), cacheUrls, networkUrl);
    }

    public static Bitmap peek(
            String requestLabel,
            List<Object> cacheObjects,
            List<String> cacheUrls,
            String networkUrl
    ) {
        refreshMirrorEnabled();

        Bitmap mirrored = findInMirror(requestLabel, cacheObjects);
        if (mirrored != null) {
            logDiagnostic(label(requestLabel) + " peek tier=mirror " + dimensions(mirrored));
            return mirrored;
        }

        Bitmap host = findInHostCache(requestLabel, cacheObjects, cacheUrls);
        if (host != null) {
            logDiagnostic(label(requestLabel) + " peek tier=host " + dimensions(host));
            String memoryKey = networkUrl != null ? networkUrl : firstUrl(cacheUrls);
            if (memoryKey != null) MEMORY_CACHE.put(memoryKey, host);
            return host;
        }

        String memoryKey = networkUrl != null ? networkUrl : firstUrl(cacheUrls);
        Bitmap cached = memoryKey == null ? null : MEMORY_CACHE.get(memoryKey);
        if (cached != null && !cached.isRecycled()) {
            logDiagnostic(label(requestLabel) + " peek tier=memory " + dimensions(cached));
            return cached;
        }
        if (cached != null) MEMORY_CACHE.remove(memoryKey);

        logDiagnostic(label(requestLabel) + " peek tier=miss");
        return null;
    }

    /**
     * Loads one preview. [cacheObjects] are the item's real image URL objects and [cacheUrls] the
     * same variants as URL strings, both best (display) variant first. The object tier runs first
     * because its key carries the real dimensions; the string tier is the fallback. [networkUrl]
     * is the small variant used when nothing is cached. [callback] runs on the main thread and may
     * never run on a total miss.
     */
    public static void load(Context context, List<String> cacheUrls, String networkUrl, Callback callback) {
        load(context, null, Collections.emptyList(), cacheUrls, networkUrl, callback);
    }

    public static void load(
            Context context,
            String requestLabel,
            List<Object> cacheObjects,
            List<String> cacheUrls,
            String networkUrl,
            Callback callback
    ) {
        if (callback == null) return;

        refreshMirrorEnabled();

        long startedMillis = SystemClock.elapsedRealtime();
        Bitmap mirrored = findInMirror(requestLabel, cacheObjects);
        if (mirrored != null) {
            logDiagnostic(label(requestLabel) + " serve tier=mirror elapsedMs=" + elapsed(startedMillis)
                    + " " + dimensions(mirrored));
            MAIN_HANDLER.post(() -> deliver(callback, mirrored));
            return;
        }

        String memoryKey = networkUrl != null ? networkUrl : firstUrl(cacheUrls);
        Bitmap cached = memoryKey == null ? null : MEMORY_CACHE.get(memoryKey);
        if (cached != null && !cached.isRecycled()) {
            logDiagnostic(label(requestLabel) + " serve tier=memory elapsedMs=" + elapsed(startedMillis)
                    + " " + dimensions(cached));
            MAIN_HANDLER.post(() -> deliver(callback, cached));
            return;
        }
        if (cached != null) MEMORY_CACHE.remove(memoryKey);

        Context cacheContext = context == null ? null : context.getApplicationContext();
        LOCAL_EXECUTOR.execute(() -> loadInBackground(
                cacheContext, requestLabel, cacheObjects, cacheUrls, networkUrl, memoryKey, callback, startedMillis));
    }

    private static void loadInBackground(
            Context context,
            String requestLabel,
            List<Object> cacheObjects,
            List<String> cacheUrls,
            String networkUrl,
            String memoryKey,
            Callback callback,
            long startedMillis
    ) {
        try {
            Bitmap bitmap = findInMirror(requestLabel, cacheObjects);
            String tier = "mirror";
            if (bitmap == null) {
                bitmap = findInHostCache(requestLabel, cacheObjects, cacheUrls);
                tier = "host";
            }
            if (bitmap == null) {
                bitmap = findInIgDisk(requestLabel, cacheObjects, startedMillis);
                tier = "igdisk";
            }
            if (bitmap == null) {
                bitmap = findOnDisk(context, memoryKey);
                tier = "disk";
            }
            if (bitmap == null && networkUrl != null) {
                // Free this local thread; the network fetch queues on its own pool.
                NETWORK_EXECUTOR.execute(() -> loadFromNetwork(
                        context, requestLabel, networkUrl, memoryKey, callback, startedMillis));
                return;
            }
            completeLoad(requestLabel, bitmap, tier, memoryKey, callback, startedMillis);
        } catch (Throwable throwable) {
            logDiagnostic(label(requestLabel) + " serve tier=error elapsedMs=" + elapsed(startedMillis)
                    + " exception=" + describeFailure(throwable));
            InstagramLogger.printException(() -> "Download sheet thumbnail load failed", throwable);
        }
    }

    private static void loadFromNetwork(
            Context context,
            String requestLabel,
            String networkUrl,
            String memoryKey,
            Callback callback,
            long startedMillis
    ) {
        try {
            Bitmap bitmap = fetchFromNetwork(requestLabel, context, networkUrl, memoryKey);
            completeLoad(requestLabel, bitmap, "network", memoryKey, callback, startedMillis);
        } catch (Throwable throwable) {
            logDiagnostic(label(requestLabel) + " serve tier=error elapsedMs=" + elapsed(startedMillis)
                    + " exception=" + describeFailure(throwable));
            InstagramLogger.printException(() -> "Download sheet thumbnail load failed", throwable);
        }
    }

    /** Caches and delivers a loaded bitmap, or logs the miss; shared by the local and network paths. */
    private static void completeLoad(
            String requestLabel,
            Bitmap bitmap,
            String tier,
            String memoryKey,
            Callback callback,
            long startedMillis
    ) {
        if (bitmap == null || bitmap.isRecycled()) {
            logDiagnostic(label(requestLabel) + " serve tier=none elapsedMs=" + elapsed(startedMillis));
            return;
        }

        if (memoryKey != null) MEMORY_CACHE.put(memoryKey, bitmap);
        logDiagnostic(label(requestLabel) + " serve tier=" + tier
                + " elapsedMs=" + elapsed(startedMillis) + " " + dimensions(bitmap));
        MAIN_HANDLER.post(() -> deliver(callback, bitmap));
    }

    private static void deliver(Callback callback, Bitmap bitmap) {
        try {
            callback.onLoaded(bitmap);
        } catch (Throwable throwable) {
            logDiagnostic("callback failed exception=" + throwable);
            InstagramLogger.printException(() -> "Download sheet thumbnail callback failed", throwable);
        }
    }

    /**
     * Re-reads the download-sheet toggle for the decode mirror, at most once every few seconds so
     * the decode thread never pays a preference read per bitmap. The mirror defaults to on so the
     * first carousel opened after process start already has its pages captured.
     */
    private static void refreshMirrorEnabled() {
        long now = SystemClock.elapsedRealtime();
        if (now - lastMirrorRefreshMillis < MIRROR_REFRESH_INTERVAL_MILLIS) return;
        lastMirrorRefreshMillis = now;
        try {
            ThumbnailMirror.setEnabled(isDownloadSheetThumbnailsEnabled());
        } catch (Throwable ignored) {
            // The mirror keeps its previous state.
        }
    }

    /**
     * Probes the decode mirror with every variant's ImageCacheKey identity string, so it does not
     * matter which variant the feed displayed. Each key is a cheap object walk plus a map lookup.
     */
    private static Bitmap findInMirror(String requestLabel, List<Object> cacheObjects) {
        if (cacheObjects == null || cacheObjects.isEmpty()) return null;
        for (int index = 0; index < cacheObjects.size(); index++) {
            Object imageUrl = cacheObjects.get(index);
            if (imageUrl == null) {
                logDiagnostic(label(requestLabel) + " probe[mirror " + index + "] skipped=no-object");
                continue;
            }

            long startedMillis = SystemClock.elapsedRealtime();
            String key = null;
            Throwable failure = null;
            try {
                key = cacheKeyString(imageUrl);
            } catch (Throwable throwable) {
                failure = throwable;
            }
            Bitmap bitmap = key == null ? null : ThumbnailMirror.get(key);
            logDiagnostic(label(requestLabel) + " probe[mirror " + index + "] " + probeResult(bitmap, failure)
                    + " elapsedMs=" + elapsed(startedMillis) + " key={" + key + "}");
            if (bitmap != null && !bitmap.isRecycled()) return bitmap;
        }
        return null;
    }

    /**
     * Reads Instagram's own disk cache. All cache instances are tried for every variant, until a
     * key resolves; the stored bytes are the downloaded file (JPEG, possibly a partial scan), so
     * the tail is repaired before decoding and every cache failure is contained per attempt.
     */
    private static Bitmap findInIgDisk(String requestLabel, List<Object> cacheObjects, long startedMillis) {
        if (cacheObjects == null || cacheObjects.isEmpty()) return null;

        List<Object> caches = null;
        Throwable cachesFailure = null;
        try {
            caches = igDiskCaches();
        } catch (Throwable throwable) {
            cachesFailure = throwable;
        }
        if (caches == null || caches.isEmpty()) {
            logDiagnostic(label(requestLabel) + " igdisk skipped=no-caches"
                    + (cachesFailure == null ? "" : " failure=" + describeFailure(cachesFailure)));
            return null;
        }

        for (int index = 0; index < cacheObjects.size(); index++) {
            Object imageUrl = cacheObjects.get(index);
            if (imageUrl == null) continue;

            String diskKey = null;
            Throwable keyFailure = null;
            try {
                diskKey = igDiskKey(imageUrl);
            } catch (Throwable throwable) {
                keyFailure = throwable;
            }
            if (diskKey == null) {
                logDiagnostic(label(requestLabel) + " igdisk probe[obj " + index + "] skipped=no-key"
                        + (keyFailure == null ? "" : " failure=" + describeFailure(keyFailure)));
                continue;
            }

            String mirrorKey = null;
            try {
                mirrorKey = cacheKeyString(imageUrl);
            } catch (Throwable ignored) {
                // The disk tier works without a mirror key; only the write-back is skipped.
            }

            for (int cacheIndex = 0; cacheIndex < caches.size(); cacheIndex++) {
                Object cache = caches.get(cacheIndex);
                if (cache == null) continue;

                InputStream input = null;
                try {
                    input = igDiskOpen(cache, diskKey, new HashMap<String, String>());
                    if (input == null) continue;

                    byte[] data = readAtMost(input, MAX_DISK_ENTRY_BYTES);
                    if (data == null) {
                        logDiagnostic(label(requestLabel) + " igdisk oversized diskKey=" + diskKey
                                + " cache=" + cache.getClass().getName());
                        continue;
                    }

                    Bitmap bitmap = decode(ensureJpegEnd(data));
                    if (bitmap == null) continue;

                    if (mirrorKey != null) ThumbnailMirror.put(mirrorKey, bitmap);
                    logDiagnostic(label(requestLabel) + " igdisk hit diskKey=" + diskKey
                            + " cache=" + cache.getClass().getName() + " bytes=" + data.length
                            + " elapsedMs=" + elapsed(startedMillis) + " " + dimensions(bitmap));
                    return bitmap;
                } catch (Throwable throwable) {
                    logDiagnostic(label(requestLabel) + " igdisk miss diskKey=" + diskKey
                            + " cache=" + cache.getClass().getName() + " failure=" + describeFailure(throwable));
                } finally {
                    if (input != null) {
                        try {
                            input.close();
                        } catch (IOException ignored) {
                            // Closing a read-only stream is best effort.
                        }
                    }
                }
            }
        }

        logDiagnostic(label(requestLabel) + " igdisk miss elapsedMs=" + elapsed(startedMillis));
        return null;
    }

    /**
     * Instagram appends FFD9 to partial JPEG scans before writing them to disk; BitmapFactory
     * tolerates the same repair, so mirror it for entries that stop mid-scan.
     */
    private static byte[] ensureJpegEnd(byte[] data) {
        if (data.length < 4) return data;
        if ((data[0] & 0xff) != 0xff || (data[1] & 0xff) != 0xd8) return data;

        int last = data.length - 1;
        if ((data[last] & 0xff) == 0xd9 && (data[last - 1] & 0xff) == 0xff) return data;

        byte[] patched = Arrays.copyOf(data, data.length + 2);
        patched[data.length] = (byte) 0xff;
        patched[data.length + 1] = (byte) 0xd9;
        return patched;
    }

    /**
     * Probes the real image URL objects first (their key has the feed's width/height), then the
     * URL strings as a fallback; the first hit wins. Every candidate is logged with both keys.
     */
    private static Bitmap findInHostCache(
            String requestLabel,
            List<Object> cacheObjects,
            List<String> cacheUrls
    ) {
        Bitmap bitmap = findInHostCacheByObject(requestLabel, cacheObjects, cacheUrls);
        if (bitmap != null) return bitmap;
        return findInHostCacheByString(requestLabel, cacheUrls);
    }

    private static Bitmap findInHostCacheByObject(
            String requestLabel,
            List<Object> cacheObjects,
            List<String> cacheUrls
    ) {
        if (cacheObjects == null) return null;
        for (int index = 0; index < cacheObjects.size(); index++) {
            Object imageUrl = cacheObjects.get(index);
            String url = cacheUrls != null && index < cacheUrls.size() ? cacheUrls.get(index) : null;
            if (imageUrl == null || url == null) {
                logDiagnostic(label(requestLabel) + " probe[obj " + index + "] skipped="
                        + (imageUrl == null ? "no-object" : "no-url"));
                continue;
            }

            long startedMillis = SystemClock.elapsedRealtime();
            String keyObject = describeCacheKeyForObject(imageUrl);
            String keyString = describeCacheKeyFor(url);
            Bitmap bitmap = null;
            Throwable failure = null;
            try {
                bitmap = cachedBitmap(imageUrl, url);
            } catch (Throwable throwable) {
                failure = throwable;
            }
            logDiagnostic(label(requestLabel) + " probe[obj " + index + "] " + probeResult(bitmap, failure)
                    + " elapsedMs=" + elapsed(startedMillis)
                    + " keyObject={" + keyObject + "}"
                    + " keyString={" + keyString + "}"
                    + " url=" + url);

            if (bitmap != null && !bitmap.isRecycled()) return scaleToTarget(bitmap);
        }
        return null;
    }

    private static Bitmap findInHostCacheByString(String requestLabel, List<String> cacheUrls) {
        if (cacheUrls == null) return null;
        for (int index = 0; index < cacheUrls.size(); index++) {
            String url = cacheUrls.get(index);
            if (url == null) continue;

            long startedMillis = SystemClock.elapsedRealtime();
            String keyDescription = describeCacheKeyFor(url);
            Bitmap bitmap = null;
            Throwable failure = null;
            try {
                bitmap = cachedBitmap(url);
            } catch (Throwable throwable) {
                failure = throwable;
            }
            logDiagnostic(label(requestLabel) + " probe[str " + index + "] " + probeResult(bitmap, failure)
                    + " elapsedMs=" + elapsed(startedMillis)
                    + " keyString={" + keyDescription + "}"
                    + " url=" + url);

            if (bitmap != null && !bitmap.isRecycled()) return scaleToTarget(bitmap);
        }
        return null;
    }

    private static String probeResult(Bitmap bitmap, Throwable failure) {
        if (failure != null) return "exception=" + describeFailure(failure);
        if (bitmap == null) return "bitmap=null";
        if (bitmap.isRecycled()) return "bitmap=recycled";
        return "bitmap=" + dimensions(bitmap);
    }

    /** Full exception message plus the throw site, so a device miss fits in one log line. */
    private static String describeFailure(Throwable failure) {
        StringBuilder builder = new StringBuilder(256);
        builder.append(failure.getClass().getName());
        String message = failure.getMessage();
        if (message != null) builder.append(": ").append(message);
        StackTraceElement[] stackTrace = failure.getStackTrace();
        if (stackTrace.length > 0) {
            StackTraceElement frame = stackTrace[0];
            builder.append(" at ").append(frame.getClassName()).append('.').append(frame.getMethodName());
            if (frame.getFileName() != null) {
                builder.append('(').append(frame.getFileName()).append(':').append(frame.getLineNumber()).append(')');
            }
        }
        return builder.toString();
    }

    /** Dumps the ImageCacheKey Instagram derives from the URL, to compare against the feed's key. */
    private static String describeCacheKeyFor(String url) {
        if (!DIAGNOSTIC_LOGGING) return "off";
        try {
            return describeCacheKey(cacheKeyDebug(url));
        } catch (Throwable throwable) {
            return "key-exception=" + throwable;
        }
    }

    /** Dumps the ImageCacheKey Instagram derives from the real image URL object. */
    private static String describeCacheKeyForObject(Object imageUrl) {
        if (!DIAGNOSTIC_LOGGING) return "off";
        try {
            return describeCacheKey(cacheKeyDebugObject(imageUrl));
        } catch (Throwable throwable) {
            return "key-exception=" + throwable;
        }
    }

    private static String describeCacheKey(Object key) {
        if (key == null) return "null";

        StringBuilder builder = new StringBuilder(192);
        builder.append(key.getClass().getSimpleName());
        try {
            for (Class<?> type = key.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    Object value;
                    try {
                        value = field.get(key);
                    } catch (Throwable throwable) {
                        value = "<" + throwable.getClass().getSimpleName() + ">";
                    }
                    builder.append(' ')
                            .append(type.getSimpleName()).append('.')
                            .append(field.getName()).append('=')
                            .append(value);
                }
            }
        } catch (Throwable throwable) {
            builder.append(" fields-exception=").append(throwable);
        }
        try {
            builder.append(" toString=").append(key);
        } catch (Throwable throwable) {
            builder.append(" toString-exception=").append(throwable);
        }
        return builder.toString();
    }

    private static Bitmap findOnDisk(Context context, String key) {
        if (context == null || key == null) return null;
        File file = diskEntry(context, key);
        if (file == null || !file.isFile()) return null;

        try (FileInputStream input = new FileInputStream(file)) {
            byte[] data = readAtMost(input, MAX_DISK_ENTRY_BYTES);
            Bitmap bitmap = data == null ? null : decode(data);
            if (bitmap != null) return bitmap;
            if (!file.delete()) {
                Logger.printDebug(() -> "Could not delete undecodable thumbnail " + file.getName());
            }
        } catch (IOException | RuntimeException ignored) {
            // A broken disk entry falls through to the network tier.
        }
        return null;
    }

    private static Bitmap fetchFromNetwork(
            String requestLabel,
            Context context,
            String networkUrl,
            String memoryKey
    ) {
        if (networkUrl == null) {
            logDiagnostic(label(requestLabel) + " network skipped=no-url");
            return null;
        }

        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(networkUrl).openConnection();
            connection.setConnectTimeout(CONNECT_TIMEOUT_MILLIS);
            connection.setReadTimeout(READ_TIMEOUT_MILLIS);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Accept", "image/*");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0");

            int responseCode = connection.getResponseCode();
            if (responseCode < HttpURLConnection.HTTP_OK || responseCode >= HttpURLConnection.HTTP_MULT_CHOICE) {
                logDiagnostic(label(requestLabel) + " network http=" + responseCode + " url=" + networkUrl);
                return null;
            }
            int contentLength = connection.getContentLength();
            if (contentLength > MAX_DOWNLOAD_BYTES) {
                logDiagnostic(label(requestLabel) + " network too-large bytes=" + contentLength
                        + " url=" + networkUrl);
                return null;
            }

            try (InputStream input = connection.getInputStream()) {
                byte[] data = readAtMost(input, MAX_DOWNLOAD_BYTES);
                if (data == null) {
                    logDiagnostic(label(requestLabel) + " network oversized-stream url=" + networkUrl);
                    return null;
                }
                Bitmap bitmap = decode(data);
                if (bitmap == null) {
                    logDiagnostic(label(requestLabel) + " network decode-failed bytes=" + data.length
                            + " url=" + networkUrl);
                    return null;
                }

                if (context != null && memoryKey != null && data.length <= MAX_DISK_ENTRY_BYTES) {
                    writeDiskEntry(context, memoryKey, data);
                }
                logDiagnostic(label(requestLabel) + " network ok http=" + responseCode
                        + " bytes=" + data.length + " " + dimensions(bitmap) + " url=" + networkUrl);
                return bitmap;
            }
        } catch (IOException | RuntimeException exception) {
            logDiagnostic(label(requestLabel) + " network error=" + exception + " url=" + networkUrl);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static byte[] readAtMost(InputStream input, int maxBytes) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(READ_BUFFER_BYTES);
        byte[] buffer = new byte[READ_BUFFER_BYTES];
        int total = 0;
        int read;
        while ((read = input.read(buffer)) != -1) {
            if (total > maxBytes - read) return null;
            output.write(buffer, 0, read);
            total += read;
        }
        return output.toByteArray();
    }

    private static Bitmap decode(byte[] data) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;

        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight);
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length, options);
        return bitmap == null ? null : scaleToTarget(bitmap);
    }

    private static Bitmap scaleToTarget(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        int largest = Math.max(width, height);
        if (width <= 0 || height <= 0 || largest <= TARGET_SIZE_PX) return bitmap;

        float scale = (float) TARGET_SIZE_PX / largest;
        return Bitmap.createScaledBitmap(
                bitmap,
                Math.max(1, Math.round(width * scale)),
                Math.max(1, Math.round(height * scale)),
                true);
    }

    private static int sampleSize(int width, int height) {
        int sample = 1;
        while (width / sample > TARGET_SIZE_PX && height / sample > TARGET_SIZE_PX) {
            sample *= 2;
        }
        return sample;
    }

    private static void writeDiskEntry(Context context, String key, byte[] data) {
        File directory = diskCacheDirectory(context);
        File file = diskEntry(context, key);
        if (directory == null || file == null) return;
        if (!directory.isDirectory() && !directory.mkdirs()) return;
        ensureDiskCleanup(directory);

        File temporary = new File(directory, file.getName() + ".tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(data);
        } catch (IOException exception) {
            if (!temporary.delete()) {
                Logger.printDebug(() -> "Could not delete temporary thumbnail " + temporary.getName());
            }
            return;
        }
        if (!temporary.renameTo(file) && !temporary.delete()) {
            Logger.printDebug(() -> "Could not store thumbnail " + file.getName());
        }
    }

    private static File diskCacheDirectory(Context context) {
        File root = context.getCacheDir();
        return root == null ? null : new File(root, DISK_CACHE_FOLDER);
    }

    private static File diskEntry(Context context, String key) {
        File directory = diskCacheDirectory(context);
        if (directory == null) return null;
        return new File(directory, sha256(key) + DISK_ENTRY_SUFFIX);
    }

    /** One cleanup per process is enough: the disk tier only ever grows by bounded entries. */
    private static void ensureDiskCleanup(File directory) {
        if (!DISK_CLEANUP_SCHEDULED.compareAndSet(false, true)) return;
        try {
            LOCAL_EXECUTOR.execute(() -> cleanupDiskCache(directory));
        } catch (RuntimeException ignored) {
            DISK_CLEANUP_SCHEDULED.set(false);
        }
    }

    private static void cleanupDiskCache(File directory) {
        try {
            File[] files = directory.listFiles();
            if (files == null) return;

            long total = 0;
            for (File file : files) {
                if (file.isFile()) total += file.length();
            }
            if (total <= MAX_DISK_CACHE_BYTES) return;

            Arrays.sort(files, Comparator.comparingLong(File::lastModified));
            for (File file : files) {
                if (total <= DISK_CACHE_TARGET_BYTES) break;
                long length = file.length();
                if (file.delete()) total -= length;
            }
        } catch (RuntimeException ignored) {
            // Cache cleanup is best effort.
        }
    }

    private static String sha256(String value) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(value.getBytes("UTF-8"));
            StringBuilder builder = new StringBuilder(hash.length * 2);
            for (byte b : hash) {
                int unsigned = b & 0xff;
                builder.append(Character.forDigit(unsigned >>> 4, 16));
                builder.append(Character.forDigit(unsigned & 0x0f, 16));
            }
            return builder.toString();
        } catch (Exception exception) {
            return Integer.toHexString(value.hashCode());
        }
    }

    private static String firstUrl(List<String> urls) {
        if (urls == null) return null;
        for (String url : urls) {
            if (url != null && !url.isEmpty()) return url;
        }
        return null;
    }

    private static String label(String requestLabel) {
        return requestLabel == null || requestLabel.isEmpty() ? "item[?]" : requestLabel;
    }

    private static long elapsed(long startedMillis) {
        return SystemClock.elapsedRealtime() - startedMillis;
    }

    private static String dimensions(Bitmap bitmap) {
        return bitmap.getWidth() + "x" + bitmap.getHeight() + "px";
    }

    private static String describe(String url) {
        if (url == null) return "<none>";
        return url.length() <= 120 ? url : url.substring(0, 117) + "...";
    }
}
