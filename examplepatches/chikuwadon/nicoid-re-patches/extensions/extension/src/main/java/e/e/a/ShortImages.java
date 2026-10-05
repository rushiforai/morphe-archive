package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.*;
import java.lang.ref.WeakReference;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;

/** Main-thread subscriptions share one bounded, cancellable fetch for each thumbnail URL. */
final class ShortImages {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor WORKERS = new ThreadPoolExecutor(3, 3, 30, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());
    private static final Map<String, Job> jobs = new HashMap<>();
    private static final LruCache<String, Bitmap> memory = new LruCache<String, Bitmap>(12 * 1024 * 1024) {
        protected int sizeOf(String key, Bitmap bitmap) { return bitmap.getByteCount(); }
    };
    private static ImageDiskCache disk;
    private static final WeakHashMap<ImageView, Binding> bindings = new WeakHashMap<>();
    private static final class Binding {
        final String url; final WeakReference<TextView> placeholder;
        Binding(String url, TextView placeholder) { this.url = url; this.placeholder = new WeakReference<>(placeholder); }
    }
    static void resume(Activity activity) {
        for (Map.Entry<ImageView, Binding> entry : new ArrayList<>(bindings.entrySet())) {
            ImageView view = entry.getKey(); Binding binding = entry.getValue(); TextView placeholder = binding.placeholder.get();
            if (view != null && placeholder != null && owner(view.getContext()) == activity && view.isAttachedToWindow() && binding.url.equals(view.getTag())) load(binding.url, view, placeholder);
        }
    }
    static void load(String url, ImageView target, TextView placeholder) {
        if (url == null || !url.startsWith("https://")) return;
        target.setTag(url); bindings.put(target, new Binding(url, placeholder));
        Bitmap cached = memory.get(url);
        if (cached != null) { target.setImageBitmap(cached); placeholder.setVisibility(View.GONE); return; }
        if (disk == null) disk = new ImageDiskCache(target.getContext().getApplicationContext().getCacheDir());
        Job job = jobs.get(url); boolean start = job == null;
        if (start) { job = new Job(url, disk); jobs.put(url, job); }
        for (Subscription existing : job.subscribers) if (existing.target.get() == target) return;
        Subscription subscriber = new Subscription(target, placeholder, job);
        job.subscribers.add(subscriber); target.addOnAttachStateChangeListener(subscriber);
        if (start) { Job next = job; next.task.start(WORKERS, next::run); }
    }
    static void cancel(Activity activity) {
        for (Job job : new ArrayList<>(jobs.values())) {
            for (Subscription subscriber : new ArrayList<>(job.subscribers)) {
                ImageView target = subscriber.target.get();
                if (target == null || owner(target.getContext()) == activity) remove(job, subscriber);
            }
        }
    }
    private static Activity owner(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity)context;
            Context next = ((ContextWrapper)context).getBaseContext(); if (next == context) break; context = next;
        }
        return null;
    }
    private static void remove(Job job, Subscription subscriber) {
        job.subscribers.remove(subscriber); ImageView target = subscriber.target.get();
        if (target != null) target.removeOnAttachStateChangeListener(subscriber);
        if (job.subscribers.isEmpty() && jobs.get(job.url) == job) {
            jobs.remove(job.url); job.task.cancel(); WORKERS.purge();
        }
    }
    private static final class Subscription implements View.OnAttachStateChangeListener {
        final WeakReference<ImageView> target; final WeakReference<TextView> placeholder; final Job job;
        Subscription(ImageView target, TextView placeholder, Job job) { this.target = new WeakReference<>(target); this.placeholder = new WeakReference<>(placeholder); this.job = job; }
        public void onViewAttachedToWindow(View view) { }
        public void onViewDetachedFromWindow(View view) { remove(job, this); }
    }
    private static final class Job {
        final String url; final ImageDiskCache disk; final NetworkTask task = new NetworkTask();
        final ArrayList<Subscription> subscribers = new ArrayList<>();
        Job(String url, ImageDiskCache disk) { this.url = url; this.disk = disk; }
        void run() {
            Bitmap bitmap = null;
            try {
                byte[] encoded = null; try { encoded = disk.get(url); } catch (IOException ignored) { }
                if (encoded != null) { bitmap = decode(encoded); if (bitmap == null) try { disk.remove(url); } catch (IOException ignored) { } }
                if (bitmap == null && !task.cancelled()) {
                    encoded = fetch();
                    if (encoded != null && !task.cancelled()) { bitmap = decode(encoded); if (bitmap != null) try { disk.put(url, encoded); } catch (IOException ignored) { } }
                }
                if (bitmap != null && !task.cancelled()) memory.put(url, bitmap);
            } catch (Exception ignored) { }
            final Bitmap result = bitmap;
            MAIN.post(() -> {
                if (jobs.get(url) != this) return; jobs.remove(url);
                for (Subscription subscriber : subscribers) {
                    ImageView target = subscriber.target.get(); TextView placeholder = subscriber.placeholder.get();
                    if (target != null) {
                        target.removeOnAttachStateChangeListener(subscriber);
                        if (!task.cancelled() && result != null && url.equals(target.getTag())) {
                            target.setImageBitmap(result); if (placeholder != null) placeholder.setVisibility(View.GONE);
                        }
                    }
                }
                subscribers.clear();
            });
        }
        private byte[] fetch() throws IOException {
            HttpURLConnection c = (HttpURLConnection)new URL(url).openConnection();
            if (!task.bind(c)) return null;
            try {
                c.setConnectTimeout(6000); c.setReadTimeout(6000); c.setRequestProperty("User-Agent", "nicoid Re/1.0");
                if (c.getContentLength() > 8 * 1024 * 1024) return null;
                try (InputStream in = c.getInputStream(); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                    byte[] buffer = new byte[8192];
                    for (int n; (n = in.read(buffer)) != -1;) {
                        if (task.cancelled() || bytes.size() + n > 8 * 1024 * 1024) return null;
                        bytes.write(buffer, 0, n);
                    }
                    return bytes.toByteArray();
                }
            } finally { task.release(c); c.disconnect(); }
        }
    }
    private static Bitmap decode(byte[] bytes) {
        BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (options.outWidth <= 0 || options.outHeight <= 0) return null;
        int sample = 1; while ((options.outWidth / sample > 900 || options.outHeight / sample > 1600) && sample < 64) sample *= 2;
        options.inJustDecodeBounds = false; options.inSampleSize = sample;
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        if (bitmap != null && bitmap.getByteCount() > 8 * 1024 * 1024) { bitmap.recycle(); return null; }
        return bitmap;
    }
}
