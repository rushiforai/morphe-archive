package app.spicetify.extension.spotify.settings;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;
import android.widget.ImageView;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.function.BiConsumer;

/** Loads server artwork off the main thread into a small memory cache. */
final class ArtworkLoader {
    private static final String TAG = "SpicetifyArtwork";
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(
            (int) Math.min(Integer.MAX_VALUE, Runtime.getRuntime().maxMemory() / 16)) {
        @Override protected int sizeOf(String key, Bitmap value) { return value.getByteCount(); }
    };
    private static final LruCache<String, Integer> tones = new LruCache<>(256);
    private static final ExecutorService pool = Executors.newFixedThreadPool(3, runnable -> {
        Thread thread = new Thread(runnable, "spicetify-artwork");
        thread.setDaemon(true);
        return thread;
    });
    private static final Handler main = new Handler(Looper.getMainLooper());
    /** The pending load for each image view, touched only on the main thread. */
    private static final Map<ImageView, Future<?>> pending = new WeakHashMap<>();

    private ArtworkLoader() {}

    /**
     * Shows {@code placeholder} centred until {@code url} loads, then the image cropped to fill.
     * A new request for the same view cancels the previous one, so recycled rows never wait on stale loads.
     */
    static void into(ImageView view, String url, int size, Drawable placeholder) {
        Future<?> previous = pending.remove(view);
        if (previous != null) previous.cancel(true);
        view.setTag(url);
        view.setScaleType(ImageView.ScaleType.CENTER);
        view.setImageDrawable(placeholder);
        if (url == null || url.isEmpty()) return;
        Future<?> load = load(url, size, false, (bitmap, tone) -> {
            pending.remove(view);
            if (!url.equals(view.getTag())) return;
            view.setScaleType(ImageView.ScaleType.CENTER_CROP);
            view.setImageBitmap(bitmap);
        });
        if (load != null) pending.put(view, load);
    }

    /**
     * Calls {@code loaded} on the main thread with the image and, when asked, a dark muted tone of it;
     * never called when the image cannot be loaded. Returns the background load, or null when cached.
     */
    static Future<?> load(String url, int size, boolean withTone, BiConsumer<Bitmap, Integer> loaded) {
        String key = url + "@" + size;
        Bitmap cached = cache.get(key);
        Integer cachedTone = tones.get(key);
        if (cached != null && (!withTone || cachedTone != null)) {
            loaded.accept(cached, cachedTone);
            return null;
        }
        return pool.submit(() -> {
            Bitmap bitmap = cached != null ? cached : fetch(url, size);
            if (bitmap == null || Thread.currentThread().isInterrupted()) return;
            cache.put(key, bitmap);
            Integer tone = null;
            if (withTone) {
                tone = tone(bitmap);
                tones.put(key, tone);
            }
            Integer result = tone;
            main.post(() -> loaded.accept(bitmap, result));
        });
    }

    private static Bitmap fetch(String url, int size) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(15_000);
            if (connection.getResponseCode() != 200) return null;
            byte[] data;
            try (InputStream in = connection.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) {
                    if (Thread.currentThread().isInterrupted()) return null;
                    out.write(buffer, 0, read);
                    if (out.size() > MAX_BYTES) throw new IOException("Artwork is larger than " + MAX_BYTES + " bytes");
                }
                data = out.toByteArray();
            }
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (Math.min(bounds.outWidth, bounds.outHeight) / (options.inSampleSize * 2) >= size) options.inSampleSize *= 2;
            return BitmapFactory.decodeByteArray(data, 0, data.length, options);
        } catch (IOException | RuntimeException error) {
            if (!Thread.currentThread().isInterrupted()) Log.w(TAG, "Could not load artwork " + url, error);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /** A dark, muted tone of the image's average colour, for the header gradient behind it. */
    static int tone(Bitmap bitmap) {
        Bitmap small = Bitmap.createScaledBitmap(bitmap, 16, 16, true);
        long red = 0, green = 0, blue = 0;
        for (int y = 0; y < 16; y++) {
            for (int x = 0; x < 16; x++) {
                int pixel = small.getPixel(x, y);
                red += Color.red(pixel);
                green += Color.green(pixel);
                blue += Color.blue(pixel);
            }
        }
        float[] hsv = new float[3];
        Color.RGBToHSV((int) (red / 256), (int) (green / 256), (int) (blue / 256), hsv);
        hsv[1] = Math.min(hsv[1], 0.6f);
        hsv[2] = Math.min(Math.max(hsv[2], 0.25f), 0.45f);
        return Color.HSVToColor(hsv);
    }
}
