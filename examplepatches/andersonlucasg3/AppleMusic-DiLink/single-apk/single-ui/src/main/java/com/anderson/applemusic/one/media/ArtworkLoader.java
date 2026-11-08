package com.anderson.applemusic.one.media;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;
import android.widget.ImageView;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Cover loader with no third-party code: {@link HttpURLConnection} for http(s) artwork,
 * a {@link ContentResolver} for the engine's {@code content://} icons and
 * {@link LruCache} for memory. All decoding happens off the main thread.
 */
public final class ArtworkLoader {

    private static final String TAG = "AppleMusicOne";
    private static final int CACHE_BYTES = 24 * 1024 * 1024;

    public interface Callback {
        void onArtwork(String uri, Bitmap bitmap);
    }

    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newFixedThreadPool(3);
    private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(CACHE_BYTES) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };

    public ArtworkLoader(Context context) {
        this.context = context.getApplicationContext();
    }

    /**
     * Loads {@code uri} into {@code target}; a recycled/reused target is protected by the
     * view tag, so a late decode never paints the wrong card.
     */
    public void load(final String uri, final ImageView target) {
        if (uri == null || uri.length() == 0) {
            target.setImageDrawable(null);
            target.setTag(null);
            return;
        }
        target.setTag(uri);
        Bitmap cached = cache.get(uri);
        if (cached != null) {
            target.setImageBitmap(cached);
            return;
        }
        target.setImageDrawable(null);
        executor.execute(new Runnable() {
            @Override
            public void run() {
                Bitmap bitmap = fetch(uri);
                if (bitmap == null) return;
                cache.put(uri, bitmap);
                main.post(new Runnable() {
                    @Override
                    public void run() {
                        if (uri.equals(target.getTag())) target.setImageBitmap(bitmap);
                    }
                });
            }
        });
    }

    private Bitmap fetch(String uri) {
        InputStream input = null;
        try {
            if (uri.startsWith("content:")) {
                input = context.getContentResolver().openInputStream(Uri.parse(uri));
            } else if (uri.startsWith("file:")) {
                input = new FileInputStream(new File(Uri.parse(uri).getPath()));
            } else {
                HttpURLConnection connection = (HttpURLConnection) new URL(uri).openConnection();
                connection.setConnectTimeout(10000);
                connection.setReadTimeout(15000);
                connection.setRequestProperty("User-Agent", "AppleMusicOne/1.0 (Android)");
                int code = connection.getResponseCode();
                if (code != HttpURLConnection.HTTP_OK) {
                    Log.w(TAG, "artwork HTTP " + code + " for " + uri);
                    connection.disconnect();
                    return null;
                }
                input = connection.getInputStream();
            }
            if (input == null) return null;
            byte[] bytes = readAll(input);
            return decode(bytes);
        } catch (Throwable t) {
            Log.w(TAG, "cannot load artwork " + uri + ": " + t);
            return null;
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (Throwable ignored) {
                    // Stream already closed.
                }
            }
        }
    }

    private static Bitmap decode(byte[] bytes) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        int sample = 1;
        int largest = Math.max(bounds.outWidth, bounds.outHeight);
        while (largest / (sample * 2) >= 512) sample *= 2;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sample;
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
    }

    private static byte[] readAll(InputStream input) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = input.read(buffer)) > 0) output.write(buffer, 0, read);
        return output.toByteArray();
    }

    public void shutdown() {
        executor.shutdownNow();
        cache.evictAll();
    }
}
