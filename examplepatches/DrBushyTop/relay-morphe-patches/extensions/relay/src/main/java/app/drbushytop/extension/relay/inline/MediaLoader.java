package app.drbushytop.extension.relay.inline;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.LruCache;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/**
 * Downloads and decodes comment pictures off the main thread, and keeps the decoded ones in a
 * memory cache sized to the heap. A picture evicted from the cache is fetched again when it is
 * next drawn.
 *
 * <p>Files come through Relay's own Glide when it can be reached ({@link RelayGlide}), which
 * shares its disk cache with Relay's full screen viewer. Otherwise they are downloaded directly.
 */
final class MediaLoader {
    private static final int MAX_DOWNLOAD_BYTES = 30 * 1024 * 1024;
    // Asking for an image matters: asked for HTML, Reddit redirects its image hosts to the post.
    private static final String ACCEPT = "image/webp,image/apng,image/gif,image/*;q=0.8";

    /**
     * A decoded picture. Comments showing the same picture share it, so its bounds never change
     * after decoding (each span scales the canvas instead), and an animation redraws every view
     * showing it.
     */
    static final class Result {
        final Drawable drawable;
        final int width;
        final int height;
        final int bytes;
        // Main thread only.
        private final Set<MediaSpan> viewers = Collections.newSetFromMap(new WeakHashMap<MediaSpan, Boolean>());

        // A drawable keeps only a weak reference to its callback, so this holds it.
        private final Drawable.Callback callback = new Drawable.Callback() {
            @Override
            public void invalidateDrawable(Drawable who) {
                boolean shown = false;
                for (MediaSpan span : new ArrayList<>(viewers)) {
                    android.widget.TextView view = span.shownIn();
                    if (view != null) {
                        view.invalidate();
                        shown = true;
                    }
                }
                // Scrolled away everywhere: stop until it is drawn again.
                if (!shown && who instanceof Animatable) ((Animatable) who).stop();
            }

            @Override
            public void scheduleDrawable(Drawable who, Runnable what, long when) {
                MAIN.postAtTime(what, who, when);
            }

            @Override
            public void unscheduleDrawable(Drawable who, Runnable what) {
                MAIN.removeCallbacks(what, who);
            }
        };

        Result(Drawable drawable, int width, int height, int bytes) {
            this.drawable = drawable;
            this.width = width;
            this.height = height;
            this.bytes = bytes;
        }

        /** Main thread. {@code span} is drawing this picture now. */
        void drawnBy(MediaSpan span) {
            viewers.add(span);
            if (drawable.getCallback() != callback) drawable.setCallback(callback);
        }
    }

    private static final LruCache<String, Result> CACHE =
            new LruCache<String, Result>((int) Math.min(Integer.MAX_VALUE, Runtime.getRuntime().maxMemory() / 8)) {
                @Override
                protected int sizeOf(String key, Result value) {
                    return value.bytes;
                }

                @Override
                protected void entryRemoved(boolean evicted, String key, Result old, Result replacement) {
                    if (old.drawable instanceof Animatable) ((Animatable) old.drawable).stop();
                }
            };

    private static final int PARALLEL_LOADS = 3;

    // Main thread only.
    private static final Map<String, List<WeakReference<MediaSpan>>> WAITING = new HashMap<>();
    // Newest first: what was drawn last is what is on screen now.
    private static final java.util.ArrayDeque<String> QUEUE = new java.util.ArrayDeque<>();
    private static int running;
    private static final Set<String> FAILED = new HashSet<>();

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService POOL = Executors.newFixedThreadPool(PARALLEL_LOADS, new ThreadFactory() {
        @Override
        public Thread newThread(Runnable runnable) {
            Thread thread = new Thread(runnable, "RelayInlineMedia");
            thread.setDaemon(true);
            thread.setPriority(Thread.MIN_PRIORITY);
            return thread;
        }
    });

    private MediaLoader() {
    }

    static Result cached(String url) {
        return CACHE.get(url);
    }

    static boolean failed(String url) {
        return FAILED.contains(url);
    }

    /**
     * Main thread. Queues {@code url} for the span, once however often it is asked for. Pictures
     * load only when drawn, so only for comments on screen.
     */
    static void request(MediaSpan span, String url) {
        if (CACHE.get(url) != null || FAILED.contains(url)) return;
        List<WeakReference<MediaSpan>> waiting = WAITING.get(url);
        if (waiting == null) {
            waiting = new ArrayList<>();
            WAITING.put(url, waiting);
        }
        boolean known = false;
        for (WeakReference<MediaSpan> reference : waiting) {
            if (reference.get() == span) {
                known = true;
                break;
            }
        }
        if (!known) waiting.add(new WeakReference<>(span));
        if (!STARTED.contains(url)) {
            // Move it to the front: it was just drawn, so it is on screen.
            QUEUE.remove(url);
            QUEUE.addFirst(url);
        }
        pump();
    }

    // Main thread only: loads in flight.
    private static final Set<String> STARTED = new HashSet<>();

    private static boolean anyWanted(List<WeakReference<MediaSpan>> spans) {
        for (WeakReference<MediaSpan> reference : spans) {
            MediaSpan span = reference.get();
            if (span != null && span.wanted()) return true;
        }
        return false;
    }

    private static void pump() {
        while (running < PARALLEL_LOADS && !QUEUE.isEmpty()) {
            final String url = QUEUE.pollFirst();
            List<WeakReference<MediaSpan>> spans = WAITING.get(url);
            if (spans == null || !anyWanted(spans)) {
                // Scrolled past before its turn came. Drawing it again asks again.
                WAITING.remove(url);
                continue;
            }
            running++;
            STARTED.add(url);
            final Context context = InlineMediaSettings.application();
            POOL.execute(new Runnable() {
                @Override
                public void run() {
                    Result loaded = null;
                    try {
                        loaded = load(context, url);
                    } catch (Throwable t) {
                        Log.w(InlineCommentMedia.TAG, "Could not load " + url, t);
                    }
                    final Result result = loaded;
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            running--;
                            STARTED.remove(url);
                            if (result != null) CACHE.put(url, result);
                            else FAILED.add(url);
                            List<WeakReference<MediaSpan>> done = WAITING.remove(url);
                            if (done != null) {
                                for (WeakReference<MediaSpan> reference : done) {
                                    MediaSpan span = reference.get();
                                    if (span != null) span.onLoaded(url, result);
                                }
                            }
                            pump();
                        }
                    });
                }
            });
        }
    }

    private static Result load(Context context, String url) throws Exception {
        java.io.File file = null;
        try {
            file = RelayGlide.download(context, url);
        } catch (Throwable t) {
            Log.w(InlineCommentMedia.TAG, "Glide could not fetch " + url + ", downloading directly", t);
        }
        if (file != null) return decode(file);
        return decode(download(url));
    }

    private static byte[] download(String address) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        try {
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Accept", ACCEPT);
            int status = connection.getResponseCode();
            if (status / 100 != 2) throw new IOException("HTTP " + status);
            String type = connection.getContentType();
            if (type != null && !type.startsWith("image/")) throw new IOException("Not an image: " + type);

            InputStream input = connection.getInputStream();
            try {
                ByteArrayOutputStream output = new ByteArrayOutputStream(
                        Math.max(16 * 1024, Math.min(connection.getContentLength(), MAX_DOWNLOAD_BYTES)));
                byte[] buffer = new byte[16 * 1024];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                    if (output.size() > MAX_DOWNLOAD_BYTES) throw new IOException("Too large");
                }
                return output.toByteArray();
            } finally {
                input.close();
            }
        } finally {
            connection.disconnect();
        }
    }

    /** Largest size a picture is ever drawn at; nothing is decoded bigger. */
    private static int[] maxDrawnSize() {
        DisplayMetrics metrics = Resources.getSystem().getDisplayMetrics();
        int width = Math.min(metrics.widthPixels, metrics.heightPixels);
        int height = (int) (Math.max(metrics.widthPixels, metrics.heightPixels) * 0.6f);
        return new int[]{width, height};
    }

    private static int[] fit(int width, int height, int[] max) {
        float scale = Math.min(1f, Math.min((float) max[0] / width, (float) max[1] / height));
        return new int[]{Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale))};
    }

    private static Result decode(java.io.File file) throws IOException {
        if (file.length() > MAX_DOWNLOAD_BYTES) throw new IOException("Too large");
        java.io.FileInputStream input = new java.io.FileInputStream(file);
        try {
            byte[] bytes = new byte[(int) file.length()];
            int offset = 0;
            while (offset < bytes.length) {
                int read = input.read(bytes, offset, bytes.length - offset);
                if (read < 0) break;
                offset += read;
            }
            return decode(bytes);
        } finally {
            input.close();
        }
    }

    private static Result decode(byte[] bytes) throws IOException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) return Api28.decode(bytes, maxDrawnSize());

        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) throw new IOException("Undecodable");
        int[] target = fit(bounds.outWidth, bounds.outHeight, maxDrawnSize());
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = 1;
        while (bounds.outWidth / (options.inSampleSize * 2) >= target[0]) options.inSampleSize *= 2;
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (bitmap == null) throw new IOException("Undecodable");
        BitmapDrawable drawable = new BitmapDrawable(Resources.getSystem(), bitmap);
        drawable.setBounds(0, 0, bitmap.getWidth(), bitmap.getHeight());
        return new Result(drawable, bounds.outWidth, bounds.outHeight, bitmap.getByteCount());
    }

    @TargetApi(Build.VERSION_CODES.P)
    private static final class Api28 {
        static Result decode(byte[] bytes, final int[] max) throws IOException {
            final int[] natural = new int[2];
            final int[] target = new int[2];
            Drawable drawable = ImageDecoder.decodeDrawable(
                    ImageDecoder.createSource(ByteBuffer.wrap(bytes)),
                    new ImageDecoder.OnHeaderDecodedListener() {
                        @Override
                        public void onHeaderDecoded(ImageDecoder decoder, ImageDecoder.ImageInfo info,
                                                    ImageDecoder.Source source) {
                            natural[0] = info.getSize().getWidth();
                            natural[1] = info.getSize().getHeight();
                            int[] fitted = fit(natural[0], natural[1], max);
                            target[0] = fitted[0];
                            target[1] = fitted[1];
                            if (fitted[0] < natural[0]) decoder.setTargetSize(fitted[0], fitted[1]);
                            // A hardware bitmap cannot be drawn on a software canvas.
                            decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                        }
                    });
            drawable.setBounds(0, 0, target[0], target[1]);
            int estimate = target[0] * target[1] * 4;
            if (drawable instanceof Animatable) estimate *= 2;
            return new Result(drawable, natural[0], natural[1], estimate);
        }
    }
}
