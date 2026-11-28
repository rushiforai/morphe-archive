package app.xposed.extension;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Profile pictures and affiliation badges for the account sheet, from X's image server only.
 * Loaded when the sheet opens, kept in memory, never written to disk.
 */
final class RemoteImages {
    interface Callback {
        /** Main thread; null when the image couldn't be loaded. */
        void onImage(Bitmap bitmap);
    }

    private static final int TIMEOUT_MS = 8000;
    private static final int MAX_BYTES = 1024 * 1024;

    private static final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(8 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getAllocationByteCount();
        }
    };
    /** Callbacks waiting for each URL being loaded. Main thread. */
    private static final Map<String, List<Callback>> pending = new HashMap<>();
    private static final ExecutorService io = Executors.newFixedThreadPool(2, r -> {
        Thread t = new Thread(r, "xposed-images");
        t.setDaemon(true);
        return t;
    });
    private static final Handler main = new Handler(Looper.getMainLooper());

    private RemoteImages() {
    }

    /** The image when it is already loaded, else null. */
    static Bitmap cached(String url) {
        return url != null ? cache.get(url) : null;
    }

    /**
     * Loads [url] (from {@link AccountCard#imageUrl} or {@link AccountCard#avatarUrl}), scaled down
     * to about [sizePx], and calls back on the main thread. Main thread.
     */
    static void load(String url, int sizePx, Callback callback) {
        Bitmap hit = cached(url);
        if (hit != null || url == null) {
            callback.onImage(hit);
            return;
        }
        List<Callback> waiting = pending.get(url);
        if (waiting != null) {
            waiting.add(callback);
            return;
        }
        waiting = new ArrayList<>();
        waiting.add(callback);
        pending.put(url, waiting);
        io.execute(() -> {
            Bitmap bitmap = download(url, sizePx);
            main.post(() -> {
                if (bitmap != null) cache.put(url, bitmap);
                List<Callback> done = pending.remove(url);
                if (done != null) for (Callback c : done) c.onImage(bitmap);
            });
        });
    }

    private static Bitmap download(String url, int sizePx) {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(TIMEOUT_MS);
            c.setReadTimeout(TIMEOUT_MS);
            c.setInstanceFollowRedirects(false);
            if (c.getResponseCode() != HttpURLConnection.HTTP_OK || c.getContentLengthLong() > MAX_BYTES) return null;
            byte[] bytes;
            try (InputStream in = c.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[16 * 1024];
                for (int n; (n = in.read(buffer)) != -1; ) {
                    if (out.size() + n > MAX_BYTES) return null;
                    out.write(buffer, 0, n);
                }
                bytes = out.toByteArray();
            }
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (Math.min(bounds.outWidth, bounds.outHeight) / (options.inSampleSize * 2) >= sizePx) options.inSampleSize *= 2;
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        } catch (Exception e) {
            Log.w(Hooks.TAG, "Couldn't load image: " + e);
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }
}
