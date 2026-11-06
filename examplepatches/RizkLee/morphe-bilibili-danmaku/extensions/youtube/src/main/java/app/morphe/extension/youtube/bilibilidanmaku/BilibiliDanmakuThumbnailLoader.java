package app.morphe.extension.youtube.bilibilidanmaku;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.widget.ImageView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Small, bounded public-cover loader. Bilibili account credentials are never attached to image requests. */
final class BilibiliDanmakuThumbnailLoader {
    private static final int MAX_BYTES = 1024 * 1024;
    private static final ExecutorService THREADS = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LruCache<String, Bitmap> CACHE = new LruCache<String, Bitmap>(12 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap value) { return value.getByteCount(); }
    };

    private BilibiliDanmakuThumbnailLoader() { }

    static void load(ImageView view, String rawUrl) {
        String url = BilibiliDanmakuSource.normalizeCover(rawUrl);
        view.setTag(url);
        view.setImageDrawable(null);
        if (url.isEmpty()) return;
        Bitmap cached = CACHE.get(url);
        if (cached != null) { view.setImageBitmap(cached); return; }
        WeakReference<ImageView> target = new WeakReference<>(view);
        THREADS.execute(() -> {
            Bitmap image = download(url);
            if (image == null) return;
            CACHE.put(url, image);
            MAIN.post(() -> {
                ImageView current = target.get();
                if (current != null && url.equals(current.getTag())) current.setImageBitmap(image);
            });
        });
    }

    private static Bitmap download(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(4500);
            connection.setReadTimeout(6500);
            if (connection.getResponseCode() != 200) return null;
            String type = connection.getContentType();
            if (type == null || !type.toLowerCase(java.util.Locale.ROOT).startsWith("image/")) return null;
            if (connection.getContentLength() > MAX_BYTES) return null;
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            try (InputStream in = connection.getInputStream()) {
                byte[] buffer = new byte[8192];
                int total = 0, read;
                while ((read = in.read(buffer)) != -1) {
                    total += read;
                    if (total > MAX_BYTES) return null;
                    output.write(buffer, 0, read);
                }
            }
            byte[] bytes = output.toByteArray();
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (bounds.outWidth / options.inSampleSize > 512 || bounds.outHeight / options.inSampleSize > 512) {
                options.inSampleSize *= 2;
            }
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        } catch (Exception ignored) {
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
