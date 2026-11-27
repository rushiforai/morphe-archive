package dev.brave.extension.media;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;
import android.view.View;
import android.widget.ImageView;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Semaphore;

/**
 * Memory-capped thumbnail loader with LruCache, SSRF-safe fetching, strict-origin Referer,
 * and decoded-pixel budget enforcement for extreme aspect ratios.
 */
public final class ThumbnailLoader {
    private static final String TAG = "Brave_ThumbLoader";
    private static final int MAX_THUMB_BYTES = 2 * 1024 * 1024; // 2 MB download cap
    private static final int MAX_DECODE_DIM = 512;
    private static final long MAX_DECODE_PIXELS = 256L * 256L * 2L; // ~512 KB ARGB_8888 max
    private static final int MAX_CONVERT_RAW_DIM = 16384;
    private static final long MAX_CONVERT_RAW_PIXELS = 64_000_000L;
    private static final int MAX_CONVERT_OUT_DIM = 4096;
    private static final long MAX_CONVERT_OUT_PIXELS = 16_000_000L; // ~64 MB max ARGB_8888

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final ExecutorService THREAD_POOL = NetworkSafety.newBoundedPool(3, 512, "BraveThumbLoader");
    // Limit simultaneous large WebP->PNG transcodes to avoid simultaneous multi-bitmap heap pressure
    private static final Semaphore WEBP_CONVERT_SEMAPHORE = new Semaphore(1);

    private static final LruCache<String, Bitmap> CACHE;

    static {
        int maxMemory = (int) (Runtime.getRuntime().maxMemory() / 1024);
        int cacheSize = Math.max(1024 * 4, maxMemory / 8); // At least 4MB, up to 1/8th max heap
        CACHE = new LruCache<String, Bitmap>(cacheSize) {
            @Override
            protected int sizeOf(String key, Bitmap bitmap) {
                return bitmap.getByteCount() / 1024;
            }
        };
    }

    private ThumbnailLoader() {}

    public static void load(final ImageView imageView, final String url, final String referer) {
        if (imageView == null) return;
        if (url == null || url.trim().isEmpty()) {
            imageView.setVisibility(View.GONE);
            return;
        }

        final String cleanUrl = url.trim();
        imageView.setTag(cleanUrl);

        Bitmap cached = CACHE.get(cleanUrl);
        if (cached != null) {
            imageView.setImageBitmap(cached);
            imageView.setVisibility(View.VISIBLE);
            return;
        }

        imageView.setImageDrawable(null);
        imageView.setVisibility(View.VISIBLE);

        try {
            THREAD_POOL.execute(() -> {
                if (!cleanUrl.equals(imageView.getTag())) return;
                NetworkSafety.SafeConnection sc = null;
                try {
                    sc = NetworkSafety.openSafeConnection(
                            cleanUrl, "GET", NetworkSafety.DEFAULT_USER_AGENT, "", "",
                            referer, referer, null, false, 6000, 6000
                    );
                    if (sc.responseCode >= 200 && sc.responseCode < 300) {
                        byte[] data = NetworkSafety.readBytesBounded(sc.conn.getInputStream(), MAX_THUMB_BYTES);
                        if (data.length > 0) {
                            BitmapFactory.Options opts = new BitmapFactory.Options();
                            opts.inJustDecodeBounds = true;
                            BitmapFactory.decodeByteArray(data, 0, data.length, opts);

                            if (opts.outWidth <= 0 || opts.outHeight <= 0) return;

                            opts.inSampleSize = calculateInSampleSize(opts, 240, 160);
                            opts.inJustDecodeBounds = false;
                            Bitmap bmp = BitmapFactory.decodeByteArray(data, 0, data.length, opts);

                            if (bmp != null) {
                                CACHE.put(cleanUrl, bmp);
                                MAIN_HANDLER.post(() -> {
                                    if (cleanUrl.equals(imageView.getTag())) {
                                        imageView.setImageBitmap(bmp);
                                        imageView.setVisibility(View.VISIBLE);
                                    }
                                });
                            }
                        }
                    }
                } catch (Throwable t) {
                    Log.d(TAG, "Failed loading thumb: " + cleanUrl, t);
                } finally {
                    if (sc != null && sc.conn != null) sc.conn.disconnect();
                }
            });
        } catch (java.util.concurrent.RejectedExecutionException ree) {
            Log.d(TAG, "Thumbnail pool busy, skipping thumb: " + cleanUrl);
        }
    }

    /**
     * Converts raw image bytes into a bounded Bitmap and streams PNG encoding directly to outFile
     * (without buffering an entire PNG copy in heap) under a single-conversion semaphore.
     * Returns true iff outFile exists and is non-empty.
     */
    public static boolean convertWebpBytesToPngFile(byte[] rawBytes, File outFile) {
        if (rawBytes == null || rawBytes.length == 0 || outFile == null) return false;
        boolean acquired = false;
        try {
            WEBP_CONVERT_SEMAPHORE.acquire();
            acquired = true;
            Bitmap bmp = decodeBoundedForConversion(rawBytes);
            if (bmp == null) {
                if (outFile.exists()) outFile.delete();
                return false;
            }
            boolean compressed;
            try (OutputStream os = new BufferedOutputStream(new FileOutputStream(outFile), 32 * 1024)) {
                compressed = bmp.compress(Bitmap.CompressFormat.PNG, 100, os);
                os.flush();
            } finally {
                bmp.recycle();
            }
            if (!compressed || outFile.length() <= 0) {
                if (outFile.exists()) outFile.delete();
                return false;
            }
            return true;
        } catch (Throwable t) {
            if (outFile.exists()) outFile.delete();
            Log.w(TAG, "convertWebpBytesToPngFile failed: " + t.getMessage());
            return false;
        } finally {
            if (acquired) {
                WEBP_CONVERT_SEMAPHORE.release();
            }
        }
    }

    /**
     * Decodes raw image bytes into a Bitmap while enforcing strict raw/output dimension and
     * pixel-count budgets to prevent memory exhaustion on decompression bombs (e.g. WebP->PNG).
     * Returns null if image dimensions are invalid or exceed the hard conversion budget.
     */
    public static Bitmap decodeBoundedForConversion(byte[] data) {
        if (data == null || data.length == 0) return null;
        try {
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, opts);
            int w = opts.outWidth;
            int h = opts.outHeight;
            if (w <= 0 || h <= 0) return null;
            if (w > MAX_CONVERT_RAW_DIM || h > MAX_CONVERT_RAW_DIM || ((long) w * (long) h) > MAX_CONVERT_RAW_PIXELS) {
                Log.w(TAG, "Rejected oversized image for conversion: " + w + "x" + h);
                return null;
            }
            int sample = 1;
            while ((w / sample) > MAX_CONVERT_OUT_DIM
                    || (h / sample) > MAX_CONVERT_OUT_DIM
                    || ((long) (w / sample) * (long) (h / sample)) > MAX_CONVERT_OUT_PIXELS) {
                sample *= 2;
            }
            opts.inSampleSize = Math.max(1, sample);
            opts.inJustDecodeBounds = false;
            return BitmapFactory.decodeByteArray(data, 0, data.length, opts);
        } catch (Throwable t) {
            Log.w(TAG, "decodeBoundedForConversion failed: " + t.getMessage());
            return null;
        }
    }

    /**
     * Computes power-of-2 inSampleSize satisfying target dimensions AND hard decoded dimension
     * and pixel-count budgets so extreme aspect-ratio images (e.g. 40,000x100) cannot OOM.
     */
    private static int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        final int height = options.outHeight;
        final int width = options.outWidth;
        int inSampleSize = 1;

        if (height > reqHeight || width > reqWidth) {
            final int halfHeight = height / 2;
            final int halfWidth = width / 2;
            while ((halfHeight / inSampleSize) >= reqHeight && (halfWidth / inSampleSize) >= reqWidth) {
                inSampleSize *= 2;
            }
        }

        // Enforce decoded dimension & total pixel budget for extreme aspect ratios
        while ((width / inSampleSize) > MAX_DECODE_DIM
                || (height / inSampleSize) > MAX_DECODE_DIM
                || ((long) (width / inSampleSize) * (long) (height / inSampleSize)) > MAX_DECODE_PIXELS) {
            inSampleSize *= 2;
        }

        return Math.max(1, inSampleSize);
    }
}
