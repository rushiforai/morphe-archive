package app.revanced.extension.rif;

import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Semaphore;

/**
 * Background loading for inline media (part of "Inline comment images"). rif renders a
 * list's bodies one after another on one thread, so a slow image used to hold back every
 * later comment; now embed() only places what's cached and queues the rest here.
 *
 * A fixed pool of {@link #THREADS} low-priority daemon threads runs tasks at most
 * {@link #PER_HOST} at a time per host. The newest batch goes first (see {@link #batch}):
 * a screen just opened isn't kept waiting behind what's left of the one before. Within a
 * batch it's first in, first out, as rif renders the visible rows first. A task is keyed
 * (the link URL): the same link queued again while in flight (rif sometimes renders a body
 * twice) shares the one task, and moves up to the newer batch.
 */
final class InlineLoader {

    private InlineLoader() {}

    private static final String TAG = "RifInlineImages";
    static final int THREADS = 4;
    private static final int PER_HOST = 2;

    // Big decodes at once (bounds memory: an animated GIF decode holds its whole file).
    static final Semaphore DECODES = new Semaphore(2);

    interface Job {
        /** The result (null = nothing to show). Runs on a loader thread. */
        Object run() throws Exception;
    }

    interface Callback {
        void done(Object result);
    }

    /** One queued or running job and its result. Fields are guarded by LOCK. */
    static final class Task {
        final String key;
        final String host;
        final Job job;
        final long order; // submission order, within a batch
        long batch;
        boolean running;
        boolean done;
        Object result;
        List<Callback> callbacks = new ArrayList<>();

        Task(String key, String host, Job job, long batch, long order) {
            this.key = key;
            this.host = host;
            this.job = job;
            this.batch = batch;
            this.order = order;
        }

        boolean isDone() {
            synchronized (LOCK) {
                return done;
            }
        }

        Object result() {
            synchronized (LOCK) {
                return result;
            }
        }

        /**
         * Runs [cb] with the result once done: on the loader thread that finishes it, or
         * right here if it's already done.
         */
        void whenDone(Callback cb) {
            synchronized (LOCK) {
                if (!done) {
                    callbacks.add(cb);
                    return;
                }
            }
            run(cb, result());
        }
    }

    private static final Object LOCK = new Object();
    private static final List<Task> QUEUE = new ArrayList<>();
    private static final Map<String, Task> IN_FLIGHT = new HashMap<>();
    private static final Map<String, Integer> RUNNING = new HashMap<>();
    private static int started;
    private static long submitted;

    // A batch is one run of rif's body rendering (one list being shown): embed() calls on a
    // thread with no more than BATCH_GAP_MS between them. Per render thread: the batch and
    // the time of its last call. Guarded by BATCHES.
    private static final long BATCH_GAP_MS = 1000;
    private static final Map<Thread, long[]> BATCHES = new java.util.WeakHashMap<>();
    private static long lastBatch;

    /**
     * The batch of the body being rendered on this thread: a new one if the thread hasn't
     * rendered for a while. Called by embed() for every body.
     */
    static long batch() {
        long now = SystemClock.uptimeMillis();
        synchronized (BATCHES) {
            long[] b = BATCHES.get(Thread.currentThread());
            if (b == null || now - b[1] > BATCH_GAP_MS) {
                b = new long[]{++lastBatch, now};
                BATCHES.put(Thread.currentThread(), b);
            }
            b[1] = now;
            return b[0];
        }
    }

    /** Queues [job] under [key] in [batch], or returns the task already in flight for it. */
    static Task submit(String key, String url, long batch, Job job) {
        synchronized (LOCK) {
            Task task = IN_FLIGHT.get(key);
            if (task != null) {
                if (batch > task.batch) task.batch = batch; // wanted again, on a newer screen
                return task;
            }
            task = new Task(key, host(url), job, batch, ++submitted);
            IN_FLIGHT.put(key, task);
            QUEUE.add(task);
            if (started < THREADS) {
                started++;
                Thread t = new Thread(InlineLoader::work, "RifInlineLoader-" + started);
                t.setDaemon(true);
                t.start();
            }
            LOCK.notifyAll();
            return task;
        }
    }

    /** Tasks waiting for a thread. */
    static int queued() {
        synchronized (LOCK) {
            return QUEUE.size();
        }
    }

    /**
     * True if every task in [tasks] is done, running, or about to run: a loader thread and
     * its host's slot are free for it, counting the queued tasks that go before it.
     */
    static boolean allStarting(List<Task> tasks) {
        synchronized (LOCK) {
            int free = started;
            Map<String, Integer> hosts = new HashMap<>(RUNNING);
            for (Integer n : RUNNING.values()) free -= n;
            List<Task> order = new ArrayList<>(QUEUE);
            Collections.sort(order, (a, b) -> a.batch != b.batch
                    ? Long.compare(b.batch, a.batch) : Long.compare(a.order, b.order));
            List<Task> starting = new ArrayList<>();
            for (Task t : order) {
                if (free <= 0) break;
                Integer n = hosts.get(t.host);
                if (n != null && n >= PER_HOST) continue;
                hosts.put(t.host, n == null ? 1 : n + 1);
                free--;
                starting.add(t);
            }
            for (Task t : tasks) {
                if (!t.done && !t.running && !starting.contains(t)) return false;
            }
            return true;
        }
    }

    /** Waits until every task in [tasks] is done or [deadline] (uptime ms) passes. */
    static void await(List<Task> tasks, long deadline) {
        synchronized (LOCK) {
            while (true) {
                boolean all = true;
                for (Task t : tasks) all &= t.done;
                long left = deadline - SystemClock.uptimeMillis();
                if (all || left <= 0) return;
                try {
                    LOCK.wait(left);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return;
                }
            }
        }
    }

    private static void work() {
        Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
        while (true) {
            Task task;
            synchronized (LOCK) {
                while ((task = next()) == null) {
                    try {
                        LOCK.wait();
                    } catch (InterruptedException ignored) {
                    }
                }
                Integer n = RUNNING.get(task.host);
                RUNNING.put(task.host, n == null ? 1 : n + 1);
                task.running = true;
            }
            Object result = null;
            try {
                result = task.job.run();
            } catch (Throwable t) {
                Log.w(TAG, "inline media load failed: " + task.key + " (" + t + ")");
            }
            List<Callback> callbacks;
            synchronized (LOCK) {
                Integer n = RUNNING.get(task.host);
                if (n == null || n <= 1) RUNNING.remove(task.host);
                else RUNNING.put(task.host, n - 1);
                IN_FLIGHT.remove(task.key);
                task.result = result;
                task.done = true;
                callbacks = task.callbacks;
                task.callbacks = null;
                LOCK.notifyAll();
            }
            for (Callback cb : callbacks) run(cb, result);
        }
    }

    /**
     * The queued task to run next (removed from the queue): of those whose host is under its
     * limit, the newest batch's first.
     */
    private static Task next() {
        Task best = null;
        for (Task t : QUEUE) {
            Integer n = RUNNING.get(t.host);
            if (n != null && n >= PER_HOST) continue;
            if (best == null || t.batch > best.batch || (t.batch == best.batch && t.order < best.order)) {
                best = t;
            }
        }
        if (best != null) QUEUE.remove(best);
        return best;
    }

    private static void run(Callback cb, Object result) {
        try {
            cb.done(result);
        } catch (Throwable t) {
            Log.w(TAG, "inline media callback failed", t);
        }
    }

    private static String host(String url) {
        if (url == null) return "";
        int s = url.indexOf("://");
        int from = s < 0 ? 0 : s + 3;
        int end = from;
        while (end < url.length() && "/?#:".indexOf(url.charAt(end)) < 0) end++;
        return url.substring(from, end).toLowerCase(Locale.US);
    }
}
