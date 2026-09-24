package app.lchanc3.extension.jptt;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

import com.facebook.datasource.BaseDataSubscriber;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.common.Priority;
import com.facebook.imagepipeline.core.ImagePipeline;
import com.facebook.imagepipeline.request.ImageRequestBuilder;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/**
 * Downloads every image of the article being read into Fresco's cache up front,
 * instead of waiting for each image to be scrolled into view.
 *
 * <p>Fetching runs on background threads with a bounded number of images in
 * flight. Fresco holds a whole encoded image in memory for the duration of its
 * request, so submitting an article's worth at once puts tens of megabytes in
 * flight and can exhaust the heap; a small pool keeps the peak flat while still
 * downloading several images at a time.
 */
@SuppressWarnings("unused")
public final class PreloadArticleImagesPatch {

    /** How many URLs to remember so the same image is not requested twice. */
    private static final int REQUEST_HISTORY_SIZE = 512;

    /** Upper bound on the backlog, in case an article somehow keeps growing. */
    private static final int MAX_QUEUE_SIZE = 512;

    /** Give up on one image rather than wedging the queue behind it. */
    private static final long FETCH_TIMEOUT_SECONDS = 90;

    private static final LinkedHashSet<String> requestedUrls = new LinkedHashSet<>();

    private static final ArrayDeque<String> queue = new ArrayDeque<>();

    /** How many drainers are running, so at most the configured number are started. */
    private static int activeDrainers = 0;

    /**
     * Created on first use and sized from the setting as it was then. Changing
     * the setting therefore takes effect on the next start, not this one.
     */
    private static ExecutorService workerPool;

    /** The callback only releases the latch, so it can run on the calling thread. */
    private static final Executor inlineExecutor = new Executor() {
        @Override
        public void execute(Runnable command) {
            command.run();
        }
    };

    private static synchronized ExecutorService workerPool() {
        if (workerPool == null) {
            workerPool = Executors.newFixedThreadPool(PatchSettings.preloadConcurrency(), new ThreadFactory() {
                @Override
                public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "jptt-preload");
                    thread.setPriority(Thread.MIN_PRIORITY);
                    thread.setDaemon(true);
                    return thread;
                }
            });
        }
        return workerPool;
    }

    /** Starts drainers until the configured number are busy with the backlog. */
    private static void startDrainers() {
        int toStart;
        synchronized (requestedUrls) {
            toStart = Math.min(PatchSettings.preloadConcurrency(), queue.size()) - activeDrainers;
            if (toStart <= 0) {
                return;
            }
            activeDrainers += toStart;
        }
        for (int i = 0; i < toStart; i++) {
            workerPool().execute(drainQueue);
        }
    }

    /**
     * Called from the patched ArticleFragment with the result of getAllPicUrl().
     * Returns immediately; the downloading happens on the worker thread.
     */
    public static void preload(ArrayList<String> urls) {
        try {
            int maxImagesPerArticle = PatchSettings.preloadLimit();
            if (urls == null || urls.isEmpty() || maxImagesPerArticle <= 0) {
                return;
            }

            Context context = JpttContext.get();
            if (context == null || !isImageDownloadAllowed(context)) {
                return;
            }

            int limit = Math.min(urls.size(), maxImagesPerArticle);
            boolean queued = false;

            for (int i = 0; i < limit; i++) {
                String url = urls.get(i);
                if (url == null || url.isEmpty()) {
                    continue;
                }
                if (enqueue(url)) {
                    queued = true;
                }
            }

            if (queued) {
                startDrainers();
            }
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not queue article images", ex);
        }
    }

    /** @return true if this URL was added, false if it is known or the queue is full. */
    private static boolean enqueue(String url) {
        synchronized (requestedUrls) {
            if (!requestedUrls.add(url)) {
                return false;
            }
            if (requestedUrls.size() > REQUEST_HISTORY_SIZE) {
                Iterator<String> oldest = requestedUrls.iterator();
                oldest.next();
                oldest.remove();
            }
            if (queue.size() >= MAX_QUEUE_SIZE) {
                return false;
            }
            queue.add(url);
            return true;
        }
    }

    /**
     * Takes the next URL, or retires this drainer when the backlog is empty.
     * Both happen under the same lock, so a drainer can never retire while a
     * [startDrainers] running in parallel still counts it as busy.
     *
     * @return null once there is nothing left, meaning the caller must stop.
     */
    private static String nextUrlOrRetire() {
        synchronized (requestedUrls) {
            String url = queue.poll();
            if (url == null) {
                activeDrainers--;
            }
            return url;
        }
    }

    private static void forgetUrl(String url) {
        synchronized (requestedUrls) {
            requestedUrls.remove(url);
        }
    }

    private static final Runnable drainQueue = new Runnable() {
        @Override
        public void run() {
            boolean retired = false;
            try {
                while (true) {
                    String url = nextUrlOrRetire();
                    if (url == null) {
                        retired = true;
                        return;
                    }
                    try {
                        fetchAndWait(url);
                    } catch (Throwable ex) {
                        // Including OutOfMemoryError: drop this image, keep the app alive.
                        forgetUrl(url);
                        Log.e(JpttContext.LOG_TAG, "Could not preload " + url, ex);
                    }
                }
            } finally {
                if (!retired) {
                    synchronized (requestedUrls) {
                        activeDrainers--;
                    }
                }
            }
        }
    };

    /**
     * Fetches one image and blocks this drainer until it is done, so each
     * drainer only ever holds one image in memory.
     */
    private static void fetchAndWait(final String url) throws InterruptedException {
        ImagePipeline pipeline = Fresco.getImagePipeline();

        // Low priority, so an image the user is actually looking at is fetched
        // first. The encoded image is what Fresco keeps on disk, so this is also
        // what makes scrolling back to an image instant.
        DataSource dataSource = pipeline.fetchEncodedImage(
                ImageRequestBuilder.newBuilderWithSource(Uri.parse(url))
                        .setRequestPriority(Priority.LOW)
                        .build(),
                null);

        final CountDownLatch done = new CountDownLatch(1);

        dataSource.subscribe(new BaseDataSubscriber() {
            @Override
            protected void onNewResultImpl(DataSource dataSource) {
                if (dataSource.isFinished()) {
                    done.countDown();
                }
                // Fresco has cached the image and closes the data source for us.
            }

            @Override
            protected void onFailureImpl(DataSource dataSource) {
                // Allow a later attempt; the image may just have timed out.
                forgetUrl(url);
                done.countDown();
            }

            @Override
            public void onCancellation(DataSource dataSource) {
                // Release the drainer now instead of after FETCH_TIMEOUT_SECONDS.
                forgetUrl(url);
                done.countDown();
            }

            @Override
            public void onProgressUpdate(DataSource dataSource) {
                // Must be declared here: BaseDataSubscriber in the APK has no
                // implementation to inherit, so leaving this out means an
                // AbstractMethodError on Fresco's network thread, which no
                // catch in this class can see and which takes the app down.
            }
        }, inlineExecutor);

        if (!done.await(FETCH_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
            dataSource.close();
            forgetUrl(url);
        }
    }

    /**
     * Mirrors SettingsActivity.getAutoLoadPictures() so preloading obeys the
     * app's own image loading settings.
     */
    private static boolean isImageDownloadAllowed(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(
                context.getPackageName() + "_preferences", Context.MODE_PRIVATE);

        if (!preferences.getBoolean("auto_load_pictures", true)) {
            return false;
        }
        if (!preferences.getBoolean("auto_load_pictures_only_on_wifi", true)) {
            return true;
        }
        return isOnWifi(context);
    }

    private static boolean isOnWifi(Context context) {
        ConnectivityManager manager =
                (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (manager == null) {
            return false;
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Network network = manager.getActiveNetwork();
            if (network == null) {
                return false;
            }
            NetworkCapabilities capabilities = manager.getNetworkCapabilities(network);
            return capabilities != null
                    && capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI);
        }

        NetworkInfo info = manager.getActiveNetworkInfo();
        return info != null && info.isConnected()
                && info.getType() == ConnectivityManager.TYPE_WIFI;
    }

    private PreloadArticleImagesPatch() {
    }
}
