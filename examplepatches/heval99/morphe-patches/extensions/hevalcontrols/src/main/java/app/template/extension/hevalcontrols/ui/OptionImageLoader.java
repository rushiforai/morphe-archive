package app.template.extension.hevalcontrols.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.util.LruCache;
import android.view.View;
import android.widget.ImageView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Loads the option images of a list picker ({@code HevalSettings.optionImageUrl}): the row shows its
 * text icon at once and the image replaces it once loaded; any failure keeps the text icon, silently.
 *
 * <p>Downloads run on a small pool (3 background threads, newest request first, so the rows on screen
 * load before the ones scrolled past), over https only, with 5 s timeouts and at most
 * {@value #MAX_DOWNLOAD_BYTES} bytes per image. The image is decoded with {@code inSampleSize} and
 * scaled to fit the icon box, then kept in a {@value #MEMORY_CACHE_BYTES}-byte memory cache and as a
 * PNG in {@code getCacheDir()/heval_icons/<sha1(url)>.png} (at most {@value #DISK_CACHE_BYTES} bytes,
 * oldest written first out; a file older than 30 days is fetched again, and kept if that fails).
 * A URL that failed is not retried until the next picker opens. Main-thread API; never throws.
 */
final class OptionImageLoader {
    static final int MAX_DOWNLOAD_BYTES = 256 * 1024;
    static final int MEMORY_CACHE_BYTES = 4 * 1024 * 1024;
    static final long DISK_CACHE_BYTES = 5L * 1024 * 1024;
    static final String DISK_DIR = "heval_icons";
    private static final long DISK_MAX_AGE_MS = 30L * 24 * 60 * 60 * 1000;
    private static final int TIMEOUT_MS = 5000;
    private static final int THREADS = 3;
    private static final String USER_AGENT = "Mozilla/5.0 (Linux; Android " + Build.VERSION.RELEASE
            + ") AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LruCache<String, Bitmap> memory = new LruCache<String, Bitmap>(MEMORY_CACHE_BYTES) {
        @Override
        protected int sizeOf(String url, Bitmap bitmap) {
            return bitmap.getByteCount();
        }
    };
    /** Rows waiting for a URL that is being loaded. Main thread only. */
    private static final Map<String, List<Target>> waiting = new HashMap<>();
    /** URLs that failed since the last {@link #retryFailed}. Main thread only. */
    private static final Set<String> failed = new HashSet<>();
    private static final Object diskLock = new Object();
    private static ThreadPoolExecutor pool;

    /**
     * Binds {@code image} to {@code url} (null clears it): shows the cached image at once, else hides
     * the image, keeps {@code fallback} (the text icon) visible and loads it in the background. The
     * image fits a {@code sizePx} square. The image view's tag is the URL it shows, so a recycled row
     * never receives the image of the option it showed before.
     */
    static void bind(ImageView image, View fallback, String url, int sizePx) {
        try {
            image.setTag(url);
            Bitmap cached = url == null ? null : memory.get(url);
            if (cached != null) {
                show(image, fallback, cached);
                return;
            }
            hide(image, fallback);
            if (url == null || failed.contains(url)) return;
            Target target = new Target(image, fallback);
            List<Target> targets = waiting.get(url);
            if (targets != null) {
                targets.add(target);
                return;
            }
            targets = new ArrayList<>();
            targets.add(target);
            waiting.put(url, targets);
            executor().execute(new Load(image.getContext().getApplicationContext(), url, sizePx));
        } catch (Throwable ignored) {
            // Images are cosmetic: the text icon stays.
            if (url != null) waiting.remove(url);
        }
    }

    /** Lets the URLs that failed be tried again (a new picker, maybe back online). Main thread. */
    static void retryFailed() {
        failed.clear();
    }

    private static void show(ImageView image, View fallback, Bitmap bitmap) {
        image.setImageBitmap(bitmap);
        image.setVisibility(View.VISIBLE);
        // Invisible, not gone: the column keeps its size.
        fallback.setVisibility(View.INVISIBLE);
    }

    private static void hide(ImageView image, View fallback) {
        image.setImageDrawable(null);
        image.setVisibility(View.GONE);
        fallback.setVisibility(View.VISIBLE);
    }

    /** On the main thread: caches the result and hands it to every row still showing {@code url}. */
    private static void deliver(String url, Bitmap bitmap) {
        try {
            List<Target> targets = waiting.remove(url);
            if (bitmap == null) {
                failed.add(url);
                return;
            }
            memory.put(url, bitmap);
            if (targets == null) return;
            for (Target target : targets) {
                ImageView image = target.image.get();
                View fallback = target.fallback.get();
                if (image != null && fallback != null && url.equals(image.getTag())) show(image, fallback, bitmap);
            }
        } catch (Throwable ignored) {
            // The text icon stays.
        }
    }

    private static synchronized ThreadPoolExecutor executor() {
        if (pool == null) {
            // Newest first: offer() puts a request at the head the workers take from.
            LinkedBlockingDeque<Runnable> newestFirst = new LinkedBlockingDeque<Runnable>() {
                @Override
                public boolean offer(Runnable task) {
                    return offerFirst(task);
                }
            };
            final AtomicInteger count = new AtomicInteger();
            pool = new ThreadPoolExecutor(THREADS, THREADS, 30, TimeUnit.SECONDS, newestFirst, new ThreadFactory() {
                @Override
                public Thread newThread(final Runnable task) {
                    Thread thread = new Thread(new Runnable() {
                        @Override
                        public void run() {
                            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
                            task.run();
                        }
                    }, "HevalIcons-" + count.incrementAndGet());
                    thread.setDaemon(true);
                    return thread;
                }
            });
            pool.allowCoreThreadTimeOut(true);
        }
        return pool;
    }

    private static final class Target {
        final WeakReference<ImageView> image;
        final WeakReference<View> fallback;

        Target(ImageView image, View fallback) {
            this.image = new WeakReference<>(image);
            this.fallback = new WeakReference<>(fallback);
        }
    }

    private static final class Load implements Runnable {
        private final Context context;
        private final String url;
        private final int size;

        Load(Context context, String url, int size) {
            this.context = context;
            this.url = url;
            this.size = Math.max(1, size);
        }

        @Override
        public void run() {
            Bitmap bitmap = null;
            try {
                bitmap = load();
            } catch (Throwable ignored) {
                // Offline, a bad image, a full disk: the text icon stays.
            }
            final Bitmap result = bitmap;
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    deliver(url, result);
                }
            });
        }

        private Bitmap load() throws Exception {
            File dir = new File(context.getCacheDir(), DISK_DIR);
            File file = new File(dir, sha1(url) + ".png");
            Bitmap stale = null;
            if (file.isFile()) {
                Bitmap cached = BitmapFactory.decodeFile(file.getPath());
                if (cached != null) {
                    if (System.currentTimeMillis() - file.lastModified() < DISK_MAX_AGE_MS) return cached;
                    stale = cached;
                }
            }
            byte[] bytes = download(url);
            Bitmap bitmap = bytes == null ? null : decode(bytes, size);
            if (bitmap == null) return stale;
            save(dir, file, bitmap);
            return bitmap;
        }
    }

    /** The body of a 200 answer over https, or null (other status, too big, not https after redirects). */
    private static byte[] download(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setInstanceFollowRedirects(true);
            connection.setUseCaches(false);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Accept", "image/*");
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) return null;
            if (!"https".equalsIgnoreCase(connection.getURL().getProtocol())) return null;
            int declared = connection.getContentLength();
            if (declared > MAX_DOWNLOAD_BYTES) return null;
            InputStream in = connection.getInputStream();
            try {
                byte[] buffer = new byte[declared > 0 ? declared : 16 * 1024];
                int length = 0;
                while (true) {
                    if (length == buffer.length) {
                        if (length > MAX_DOWNLOAD_BYTES) return null;
                        buffer = Arrays.copyOf(buffer, Math.min(buffer.length * 2, MAX_DOWNLOAD_BYTES + 1));
                    }
                    int read = in.read(buffer, length, buffer.length - length);
                    if (read < 0) break;
                    length += read;
                }
                return length > MAX_DOWNLOAD_BYTES ? null : Arrays.copyOf(buffer, length);
            } finally {
                in.close();
            }
        } finally {
            connection.disconnect();
        }
    }

    /** Decodes {@code bytes} sampled down near {@code size}, then scaled to fit a {@code size} square. */
    static Bitmap decode(byte[] bytes, int size) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        int width = bounds.outWidth, height = bounds.outHeight;
        if (width <= 0 || height <= 0) return null;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(width, height, size);
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (bitmap == null) return null;
        int longest = Math.max(bitmap.getWidth(), bitmap.getHeight());
        if (longest <= size) return bitmap;
        float scale = size / (float) longest;
        Bitmap scaled = Bitmap.createScaledBitmap(bitmap,
                Math.max(1, Math.round(bitmap.getWidth() * scale)), Math.max(1, Math.round(bitmap.getHeight() * scale)), true);
        if (scaled != bitmap) bitmap.recycle();
        return scaled;
    }

    /** The largest power of two that keeps the longer side at least {@code size}. */
    static int sampleSize(int width, int height, int size) {
        int longest = Math.max(width, height);
        int sample = 1;
        while (longest / (sample * 2) >= size) sample *= 2;
        return sample;
    }

    private static void save(File dir, File file, Bitmap bitmap) {
        synchronized (diskLock) {
            File temp = new File(dir, file.getName() + ".tmp");
            try {
                if (!dir.isDirectory() && !dir.mkdirs()) return;
                OutputStream out = new FileOutputStream(temp);
                try {
                    if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)) return;
                } finally {
                    out.close();
                }
                if (!temp.renameTo(file)) return;
                trim(dir);
            } catch (Throwable ignored) {
                // Not cached on disk this time.
            } finally {
                if (temp.exists()) temp.delete();
            }
        }
    }

    /** Deletes the oldest files until the directory fits {@link #DISK_CACHE_BYTES}. Under diskLock. */
    private static void trim(File dir) {
        File[] files = dir.listFiles();
        if (files == null) return;
        long total = 0;
        for (File file : files) total += file.length();
        if (total <= DISK_CACHE_BYTES) return;
        final long[] modified = new long[files.length];
        Integer[] order = new Integer[files.length];
        for (int i = 0; i < files.length; i++) {
            modified[i] = files[i].lastModified();
            order[i] = i;
        }
        Arrays.sort(order, new Comparator<Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                return Long.compare(modified[a], modified[b]);
            }
        });
        for (Integer i : order) {
            if (total <= DISK_CACHE_BYTES) break;
            long length = files[i].length();
            if (files[i].delete()) total -= length;
        }
    }

    private static String sha1(String text) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-1").digest(text.getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder(digest.length * 2);
        for (byte b : digest) {
            hex.append(Character.forDigit((b >> 4) & 0xF, 16)).append(Character.forDigit(b & 0xF, 16));
        }
        return hex.toString();
    }

    private OptionImageLoader() { }
}
