package app.yydarlinker.deepseekcaptions;

import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.util.function.Supplier;

/**
 * One background thread that plans the pages of a caption, and a cache of the plans. Planning needs
 * the measured text, which is slow on the main thread; a plan is only ever published whole.
 */
final class CaptionPageExecutor {
    private static final int CACHED_PLANS = 64;
    private static final int QUEUED_JOBS = 2;

    private final ThreadPoolExecutor worker =
            new ThreadPoolExecutor(
                    1,
                    1,
                    0,
                    TimeUnit.MILLISECONDS,
                    new ArrayBlockingQueue<>(QUEUED_JOBS),
                    task -> {
                        Thread thread = new Thread(task, "CaptionPresentation");
                        thread.setDaemon(true);
                        return thread;
                    });

    /**
     * Speculative planning has its own thread and never shares the main queue: a plan the caller is
     * already holding a caption for must not wait behind work nobody has asked for yet.
     */
    private final ThreadPoolExecutor prefetcher =
            new ThreadPoolExecutor(
                    1,
                    1,
                    0,
                    TimeUnit.MILLISECONDS,
                    new ArrayBlockingQueue<>(QUEUED_JOBS),
                    task -> {
                        Thread thread = new Thread(task, "CaptionPrefetch");
                        thread.setDaemon(true);
                        return thread;
                    });

    /** Least recently used plans. An empty plan marks a layout that could not be planned. */
    private final Map<String, List<CaptionPageLayout.Page>> cache =
            new LinkedHashMap<String, List<CaptionPageLayout.Page>>(CACHED_PLANS, .75f, true) {
                @Override
                protected boolean removeEldestEntry(
                        Map.Entry<String, List<CaptionPageLayout.Page>> eldest) {
                    return size() > CACHED_PLANS;
                }
            };

    private final Set<String> running = new HashSet<>();

    private final Set<String> prefetching = new HashSet<>();

    synchronized List<CaptionPageLayout.Page> get(String key) {
        return cache.get(key);
    }

    synchronized void remove(String key) {
        cache.remove(key);
    }

    /**
     * Plans [key] ahead of the caller that will need it, so the commit that needs this geometry
     * finds a ready plan instead of holding the previous one for the whole planning latency. The
     * result only fills the cache: a prefetch is speculative, so it never publishes a plan, never
     * waits for one the caller needs, and never caches an empty result that would make a real
     * request think this geometry cannot be planned.
     */
    synchronized void prefetch(String key, Supplier<List<CaptionDisplayPage>> plan) {
        if (cache.containsKey(key) || running.contains(key) || !prefetching.add(key)) return;
        try {
            prefetcher.execute(new Prefetch(key, plan));
        } catch (RejectedExecutionException full) {
            prefetching.remove(key);
        }
    }

    private final class Prefetch implements Runnable {
        final String key;
        final Supplier<List<CaptionDisplayPage>> plan;

        Prefetch(String key, Supplier<List<CaptionDisplayPage>> plan) {
            this.key = key;
            this.plan = plan;
        }

        @Override
        public void run() {
            List<CaptionPageLayout.Page> pages = Collections.emptyList();
            try {
                pages = CaptionPageLayout.adapt(plan.get());
            } catch (RuntimeException failed) {
                // Not cached: the request that really needs this geometry plans it again.
            }
            synchronized (CaptionPageExecutor.this) {
                prefetching.remove(key);
                if (!pages.isEmpty() && !cache.containsKey(key)) cache.put(key, pages);
            }
        }
    }

    private final class Job implements Runnable {
        final String key;
        final Supplier<List<CaptionDisplayPage>> plan;
        final Consumer<List<CaptionPageLayout.Page>> ready;

        Job(
                String key,
                Supplier<List<CaptionDisplayPage>> plan,
                Consumer<List<CaptionPageLayout.Page>> ready) {
            this.key = key;
            this.plan = plan;
            this.ready = ready;
        }

        @Override
        public void run() {
            List<CaptionPageLayout.Page> pages = Collections.emptyList();
            try {
                pages = CaptionPageLayout.adapt(plan.get());
            } catch (RuntimeException failed) {
                // The empty plan is remembered, so the same geometry is not planned again and
                // again.
            }
            synchronized (CaptionPageExecutor.this) {
                running.remove(key);
                cache.put(key, pages);
            }
            ready.accept(pages);
        }
    }

    /**
     * Plans [key] unless that is already going on; [ready] gets the plan on the planning thread.
     */
    synchronized void request(
            String key,
            Supplier<List<CaptionDisplayPage>> plan,
            Consumer<List<CaptionPageLayout.Page>> ready) {
        if (!running.add(key)) return;
        Job job = new Job(key, plan, ready);
        try {
            worker.execute(job);
        } catch (RejectedExecutionException full) {
            // A waiting plan has no authority yet: the newest geometry replaces the oldest waiting
            // one, so quick
            // changes of the surface cannot starve the plan that is needed now.
            Runnable dropped = worker.getQueue().poll();
            if (dropped instanceof Job) running.remove(((Job) dropped).key);
            try {
                worker.execute(job);
            } catch (RejectedExecutionException stillFull) {
                running.remove(key);
            }
        }
    }
}
