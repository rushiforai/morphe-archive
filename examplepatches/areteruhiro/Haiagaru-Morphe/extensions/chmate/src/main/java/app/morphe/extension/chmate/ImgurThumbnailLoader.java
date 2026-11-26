package app.morphe.extension.chmate;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.widget.ImageView;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.concurrent.*;
import okhttp3.*;

/** Activity-local bounded previews: no login cookies, redirects, disk cache or original videos. */
public final class ImgurThumbnailLoader implements AutoCloseable {
    private final ExecutorService workers = Executors.newFixedThreadPool(2);
    private final ArrayList<Future<?>> tasks = new ArrayList<>();
    private final Object callsLock = new Object();
    private final java.util.HashSet<Call> calls = new java.util.HashSet<>();
    private static final ExecutorService cleanupWorker = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "ImgurPreviewCleanup"); thread.setDaemon(true); return thread;
    });
    private final Handler main = new Handler(Looper.getMainLooper());
    private volatile int generation;
    private volatile boolean closed;
    private final OkHttpClient client = new OkHttpClient.Builder()
            .cookieJar(CookieJar.NO_COOKIES).authenticator(Authenticator.NONE).proxyAuthenticator(Authenticator.NONE)
            .followRedirects(false).followSslRedirects(false)
            .connectTimeout(10, TimeUnit.SECONDS).readTimeout(10, TimeUnit.SECONDS).callTimeout(20, TimeUnit.SECONDS)
            .cache(null).build();
    private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(4 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap value) { return value.getAllocationByteCount(); }
    };

    // Called only on the UI thread. In-flight callbacks from an old page cannot touch the new page.
    void reset() {
        final ArrayList<Call> oldCalls;
        synchronized (callsLock) {
            generation++;
            oldCalls = new ArrayList<>(calls);
            calls.clear();
        }
        final ArrayList<Future<?>> oldTasks = new ArrayList<>(tasks);
        tasks.clear();
        // Call.cancel() may close a TLS socket. Cancel only the previous page's
        // calls, on a worker; cancelAll later could cancel the next page too.
        cleanupWorker.submit(() -> {
            for (Call call : oldCalls) call.cancel();
            for (Future<?> task : oldTasks) task.cancel(true);
            if (workers instanceof ThreadPoolExecutor) ((ThreadPoolExecutor) workers).purge();
        });
    }

    void load(String url, ImageView target) {
        target.setTag(url);
        target.setImageResource(android.R.drawable.ic_menu_gallery);
        target.setContentDescription(url == null ? "サムネイルなし" : "サムネイル取得中");
        if (url == null || closed) return;
        Bitmap cached = cache.get(url);
        if (cached != null) { target.setImageBitmap(cached); target.setContentDescription("投稿サムネイル"); return; }
        final int requestGeneration = generation;
        tasks.add(workers.submit(() -> {
            if (closed || requestGeneration != generation || Thread.currentThread().isInterrupted()) return;
            Bitmap bitmap = null;
            try { bitmap = fetch(url, requestGeneration); } catch (Exception ignored) {}
            final Bitmap preview = bitmap;
            main.post(() -> {
                if (closed || requestGeneration != generation || !url.equals(target.getTag())) return;
                if (preview != null) {
                    cache.put(url, preview); target.setImageBitmap(preview); target.setContentDescription("投稿サムネイル");
                } else {
                    target.setImageResource(android.R.drawable.ic_menu_report_image);
                    target.setContentDescription("サムネイル取得失敗。URLコピーや選択操作は利用できます");
                }
            });
        }));
    }

    /** Compose preview callback, with the same bounded, cookie-free loader. */
    void loadPreview(String url, java.util.function.Consumer<Bitmap> result) {
        if (url == null || closed) { result.accept(null); return; }
        Bitmap cached = cache.get(url);
        if (cached != null) { result.accept(cached); return; }
        final int requestGeneration = generation;
        tasks.add(workers.submit(() -> {
            Bitmap bitmap = null;
            try { bitmap = fetch(url, requestGeneration); } catch (Exception ignored) {}
            final Bitmap preview = bitmap;
            main.post(() -> {
                if (closed || requestGeneration != generation) return;
                if (preview != null) cache.put(url, preview);
                result.accept(preview);
            });
        }));
    }

    private Bitmap fetch(String url, int requestGeneration) throws IOException {
        if (!url.matches("https://i\\.imgur\\.com/[A-Za-z0-9]{1,64}m\\.jpg")) throw new IOException("Invalid preview URL");
        Request request = new Request.Builder().url(url).header("Accept", "image/*").get().build();
        byte[] bytes;
        Call call = client.newCall(request);
        synchronized (callsLock) {
            if (closed || requestGeneration != generation || Thread.currentThread().isInterrupted())
                throw new IOException("Preview cancelled");
            calls.add(call);
        }
        try (Response response = call.execute()) {
            if (!response.isSuccessful() || response.body() == null) throw new IOException("No preview");
            int limit = (int)MobileMediaPolicy.fileLimit(3 * 1024 * 1024);
            if (response.body().contentLength() > limit) throw new IOException("Preview too large");
            try (InputStream input = response.body().byteStream(); ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192]; int count;
                while ((count = input.read(buffer)) != -1) {
                    if (Thread.currentThread().isInterrupted() || output.size() > limit - count) throw new IOException("Preview cancelled or too large");
                    output.write(buffer, 0, count);
                }
                bytes = output.toByteArray();
            }
        } finally { synchronized (callsLock) { calls.remove(call); } }
        AppTrafficUsage.recordFeatureBytes(Haiagaru.applicationContextForExtension(),"imgur_previews",bytes.length);
        BitmapFactory.Options bounds = new BitmapFactory.Options(); bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || bounds.outWidth > 8192 || bounds.outHeight > 8192)
            throw new IOException("Invalid preview dimensions");
        BitmapFactory.Options options = new BitmapFactory.Options(); options.inSampleSize = 1;
        while (Math.max(bounds.outWidth, bounds.outHeight) / options.inSampleSize > 320) options.inSampleSize *= 2;
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (bitmap == null) throw new IOException("Invalid preview image");
        return bitmap;
    }

    @Override public void close() {
        if (closed) return;
        closed = true; reset(); cache.evictAll();
        // Closing an idle TLS connection can send close_notify. Never do that
        // from Activity.onDestroy: Android treats it as main-thread networking.
        cleanupWorker.submit(() -> {
            workers.shutdownNow();
            client.dispatcher().cancelAll();
            client.connectionPool().evictAll();
        });
    }
}
