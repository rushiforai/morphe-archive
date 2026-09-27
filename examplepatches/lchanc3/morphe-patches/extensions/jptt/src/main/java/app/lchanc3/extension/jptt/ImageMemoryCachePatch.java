package app.lchanc3.extension.jptt;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import com.facebook.imagepipeline.cache.CountingMemoryCache;
import com.facebook.imagepipeline.cache.LruCountingMemoryCache;
import com.facebook.imagepipeline.cache.MemoryCacheParams;
import com.facebook.imagepipeline.core.ImagePipelineFactory;

/**
 * Keeps downloaded images in memory while JPTT is in use, and gives the memory
 * back once it has sat in the background for a while.
 *
 * <p>The cache is Fresco's own cache of encoded images, the files as they were
 * downloaded, which sits in front of the disk cache. Fresco sizes it at 4MB
 * and caches nothing over 512KB, so it holds next to nothing; this sizes it
 * from the settings instead. Its memory is malloc'd, not on the Java heap.
 * The article preload and the GIF player both read through it, so an article's
 * images are fetched once and served from memory from then on.
 *
 * <p>An image on PTT is rarely looked at a second time, so there is little to
 * lose by dropping the cache when JPTT is put away, and a big background
 * process is the first one Android kills, taking the PTT connection with it.
 * Dropping it the moment JPTT leaves the screen would cost a disk read on every
 * return from another app, so it is dropped only after JPTT has stayed in the
 * background for the time the settings say.
 *
 * <p>Fresco has no call left in the APK to empty a cache, nor does JPTT pass it
 * memory warnings. Instead the params it is handed say zero bytes while the
 * cache is released, and are pushed into the cache along with an eviction.
 */
@SuppressWarnings("unused")
public final class ImageMemoryCachePatch {

    /**
     * How often Fresco asks for the params again, so that a changed setting
     * takes hold within a minute. Fresco's own is five minutes.
     */
    private static final long PARAMS_CHECK_INTERVAL_MS = 60 * 1000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Activities between onStart() and onStop(). Main thread only. */
    private static int started;

    /** Whether the cache has been emptied and is to stay empty. */
    private static volatile boolean released;

    private static final Runnable RELEASE = new Runnable() {
        @Override
        public void run() {
            released = true;
            apply();
        }
    };

    /** Called from the patched JpttApplication.onCreate(). */
    public static void install(Application application) {
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityStarted(Activity activity) {
                if (started++ > 0) {
                    return;
                }
                MAIN.removeCallbacks(RELEASE);
                if (released) {
                    released = false;
                    apply();
                }
            }

            @Override
            public void onActivityStopped(Activity activity) {
                if (started == 0 || --started > 0) {
                    return;
                }
                // A rotation stops and starts again at once, which cancels this.
                MAIN.postDelayed(RELEASE, PatchSettings.imageMemoryCacheReleaseMs());
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityResumed(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /**
     * Called from the patched DefaultEncodedMemoryCacheParamsSupplier.get(), in
     * place of Fresco's own sizes.
     */
    public static MemoryCacheParams params() {
        int size = released ? 0 : PatchSettings.imageMemoryCacheBytes();
        // A quarter, so one big GIF cannot push out a whole article.
        return new MemoryCacheParams(size, Integer.MAX_VALUE, size, Integer.MAX_VALUE, size / 4,
                PARAMS_CHECK_INTERVAL_MS);
    }

    /** Hands the cache its params now, rather than at its next check. */
    private static void apply() {
        try {
            CountingMemoryCache cache = ImagePipelineFactory.getInstance().getEncodedCountingMemoryCache();
            if (!(cache instanceof LruCountingMemoryCache)) {
                return;
            }
            LruCountingMemoryCache lru = (LruCountingMemoryCache) cache;
            synchronized (lru) {
                lru.mMemoryCacheParams = params();
                lru.mLastCacheParamsCheck = SystemClock.uptimeMillis();
            }
            // An image someone still holds, such as a GIF being read, stays
            // until it is let go of.
            lru.maybeEvictEntries();
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not resize the image memory cache", ex);
        }
    }

    private ImageMemoryCachePatch() {
    }
}
