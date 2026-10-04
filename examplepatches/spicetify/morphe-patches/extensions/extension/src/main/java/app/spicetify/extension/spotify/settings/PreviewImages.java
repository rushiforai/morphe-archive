package app.spicetify.extension.spotify.settings;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;
import android.widget.ImageView;
import java.io.IOException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Loads Spicetify Marketplace preview thumbnails into list rows: downloads and decodes off the
 * main thread, downsamples to the row width, and keeps a memory cache so scrolling back to a row
 * doesn't download its preview again.
 */
final class PreviewImages {
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    /** Plenty for a list row, and far below the 100 MB Android refuses to draw. */
    private static final long MAX_DECODED_BYTES = 8 * 1024 * 1024;

    interface Downloader {
        byte[] get(String url) throws IOException;
    }

    static final Downloader HTTP = url -> Marketplace.download(url, MAX_BYTES);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private final Downloader downloader;
    private final Executor executor;
    private final AtomicInteger generation = new AtomicInteger();
    private final LruCache<String, Bitmap> cache =
            new LruCache<String, Bitmap>((int) (Runtime.getRuntime().maxMemory() / 16)) {
                @Override
                protected int sizeOf(String key, Bitmap value) {
                    return value.getByteCount();
                }
            };

    PreviewImages(Downloader downloader, Executor executor) {
        this.downloader = downloader;
        this.executor = executor;
    }

    /**
     * Tags {@code view} with {@code url} and shows what's already known right away: the cached
     * bitmap, or nothing. A null URL just clears the view. Otherwise, on a cache miss, downloads
     * and decodes on the executor and sets the result on the main thread, but only if the view
     * still wants that URL by the time it's ready (list rows are recycled).
     */
    void load(String url, ImageView view, int widthPx) {
        view.setTag(url);
        if (url == null) {
            view.setImageDrawable(null);
            return;
        }
        Bitmap cached = cache.get(url);
        if (cached != null) {
            view.setImageBitmap(cached);
            return;
        }
        view.setImageDrawable(null);
        int queuedIn = generation.get();
        executor.execute(() -> fetch(url, view, widthPx, queuedIn));
    }

    /** Downloads queued before this call return without downloading; for when the Marketplace closes. */
    void cancelQueued() {
        generation.incrementAndGet();
    }

    private void fetch(String url, ImageView view, int widthPx, int queuedIn) {
        try {
            // The Marketplace closed, or the row was recycled for another theme, while this waited.
            if (queuedIn != generation.get() || !url.equals(view.getTag())) return;
            Bitmap bitmap = cache.get(url);
            if (bitmap == null) {
                byte[] bytes = downloader.get(url);
                BitmapFactory.Options bounds = new BitmapFactory.Options();
                bounds.inJustDecodeBounds = true;
                BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight, widthPx);
                if (options.inSampleSize > 0) bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
                if (bitmap == null) {
                    Log.w("Spicetify", "Could not decode preview image: " + url);
                    return;
                }
                cache.put(url, bitmap);
            }
            Bitmap shown = bitmap;
            MAIN.post(() -> {
                if (url.equals(view.getTag())) view.setImageBitmap(shown);
            });
        } catch (Throwable e) {
            // Anything that escapes a pool thread ends Spotify's process.
            Log.w("Spicetify", "Could not load preview image: " + url, e);
        }
    }

    /**
     * The largest power of two that keeps the decoded width at or above {@code targetWidth},
     * raised until the decoded bitmap also fits in 8 MB, so a very tall image stays drawable.
     * Returns 0, meaning don't decode, when a size isn't positive.
     */
    static int sampleSize(int imageWidth, int imageHeight, int targetWidth) {
        if (imageWidth <= 0 || imageHeight <= 0 || targetWidth <= 0) return 0;
        int sampleSize = 1;
        while (imageWidth / (sampleSize * 2) >= targetWidth) {
            sampleSize *= 2;
        }
        while ((long) (imageWidth / sampleSize) * (imageHeight / sampleSize) * 4 > MAX_DECODED_BYTES) {
            sampleSize *= 2;
        }
        return sampleSize;
    }
}
