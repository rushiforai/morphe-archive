package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Account lookups: memory and disk cache, then the X-Posed community cache in batches,
 * then X's own "About this account" query for the misses. Fresh X results are
 * contributed back to the community cache.
 */
final class Lookup {
    interface Listener {
        /** Called on the main thread when a handle's info changes. */
        void onAccountUpdated(String handle);
    }

    // Matches the extension and the community cache, which expire observations after 60 days.
    private static final long FRESH_MS = TimeUnit.DAYS.toMillis(60);
    private static final long EMPTY_FRESH_MS = TimeUnit.HOURS.toMillis(12);
    /** A handle is not looked up again sooner than this, whatever the outcome. */
    private static final long RETRY_MS = TimeUnit.MINUTES.toMillis(5);
    private static final int MEMORY_LIMIT = 5000;
    private static final int DISK_LIMIT = 20000;
    private static final long WRITE_DELAY_MS = 3000;

    private static final long CLOUD_BATCH_DELAY_MS = 200;
    private static final long X_INTERVAL_MS = 350;
    private static final int X_MAX_CONCURRENT = 2;
    private static final long X_TIMEOUT_MS = 30_000;

    private static final ScheduledExecutorService worker = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread t = new Thread(r, "xposed-lookup");
        t.setDaemon(true);
        return t;
    });
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static final Map<String, AccountInfo> memory = new LinkedHashMap<String, AccountInfo>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, AccountInfo> eldest) {
            return size() > MEMORY_LIMIT;
        }
    };
    /** Last lookup attempt per handle. Guarded by memory. */
    private static final Map<String, Long> attempts = new HashMap<>();

    // Worker thread only.
    private static final Set<String> cloudQueue = new LinkedHashSet<>();
    private static final Set<String> xQueue = new LinkedHashSet<>();
    private static boolean cloudFlushScheduled;
    private static boolean xPumpScheduled;
    private static int xActive;
    private static long xBackoffUntil;
    private static int xFailures;
    private static long lastXStart;
    private static final Map<String, String> pendingWrites = new HashMap<>();
    private static boolean writeScheduled;

    private static final List<Listener> listeners = new CopyOnWriteArrayList<>();
    private static volatile SharedPreferences prefs;
    private static volatile boolean diskLoaded;

    private Lookup() {
    }

    static void addListener(Listener l) {
        listeners.add(l);
    }

    static void removeListener(Listener l) {
        listeners.remove(l);
    }

    static void init(Context context) {
        if (prefs != null) return;
        synchronized (Lookup.class) {
            if (prefs != null) return;
            prefs = context.getApplicationContext().getSharedPreferences("xposed_accounts", Context.MODE_PRIVATE);
            worker.execute(Lookup::loadDisk);
        }
    }

    /** Cached info for a handle, scheduling a lookup when missing or stale. Never blocks. */
    static AccountInfo get(String handle) {
        AccountInfo info;
        synchronized (memory) {
            info = memory.get(handle);
        }
        long now = System.currentTimeMillis();
        if (info == null || isStale(info, now)) request(handle, now, false);
        return info;
    }

    /** Re-fetches from X, skipping the caches. */
    static void refresh(String handle) {
        request(handle, System.currentTimeMillis(), true);
    }

    private static boolean isStale(AccountInfo info, long now) {
        // Entries cached before user ids were stored are refreshed once, so engagement filtering can match them.
        if (!info.isEmpty() && info.userId == 0) return true;
        return now - info.observedAt > (info.isEmpty() ? EMPTY_FRESH_MS : FRESH_MS);
    }

    private static void request(String handle, long now, boolean force) {
        synchronized (memory) {
            Long last = attempts.get(handle);
            if (!force && last != null && now - last < RETRY_MS) return;
            if (attempts.size() > MEMORY_LIMIT) attempts.clear();
            attempts.put(handle, now);
        }
        worker.execute(() -> {
            if (force) {
                xQueue.add(handle);
                pumpX();
                return;
            }
            cloudQueue.add(handle);
            if (!diskLoaded) return; // loadDisk() flushes once done
            if (cloudQueue.size() >= CloudCache.BATCH_SIZE) {
                flushCloud();
            } else if (!cloudFlushScheduled) {
                cloudFlushScheduled = true;
                worker.schedule(Lookup::flushCloud, CLOUD_BATCH_DELAY_MS, TimeUnit.MILLISECONDS);
            }
        });
    }

    private static void loadDisk() {
        Map<String, AccountInfo> loaded = new LinkedHashMap<>();
        try {
            long now = System.currentTimeMillis();
            Map<String, ?> all = prefs.getAll();
            List<String> expired = new ArrayList<>();
            for (Map.Entry<String, ?> e : all.entrySet()) {
                AccountInfo info = e.getValue() instanceof String ? AccountInfo.fromJson((String) e.getValue()) : null;
                if (info == null || isStale(info, now)) {
                    expired.add(e.getKey());
                } else if (loaded.size() < MEMORY_LIMIT) {
                    loaded.put(e.getKey(), info);
                    Users.put(info.userId, e.getKey());
                }
            }
            if (!expired.isEmpty() || all.size() > DISK_LIMIT) {
                SharedPreferences.Editor editor = prefs.edit();
                for (String key : expired) editor.remove(key);
                if (all.size() - expired.size() > DISK_LIMIT) editor.clear(); // Crude cap; rebuilt as accounts are seen.
                editor.apply();
            }
        } catch (Exception e) {
            Log.e(Hooks.TAG, "Failed to load cache", e);
        }
        diskLoaded = true;

        // Serve queued handles the disk already knew, look up the rest.
        List<String> served = new ArrayList<>();
        for (Iterator<String> it = cloudQueue.iterator(); it.hasNext(); ) {
            String handle = it.next();
            if (loaded.containsKey(handle)) {
                it.remove();
                served.add(handle);
            }
        }
        main.post(() -> {
            synchronized (memory) {
                memory.putAll(loaded);
            }
            for (String handle : served) {
                for (Listener l : listeners) l.onAccountUpdated(handle);
            }
        });
        flushCloud();
    }

    private static void flushCloud() {
        cloudFlushScheduled = false;
        while (!cloudQueue.isEmpty()) {
            List<String> batch = new ArrayList<>(CloudCache.BATCH_SIZE);
            for (Iterator<String> it = cloudQueue.iterator(); it.hasNext() && batch.size() < CloudCache.BATCH_SIZE; ) {
                batch.add(it.next());
                it.remove();
            }
            Map<String, AccountInfo> hits = CloudCache.lookup(batch);
            for (String handle : batch) {
                AccountInfo info = hits != null ? hits.get(handle) : null;
                if (info != null) {
                    store(handle, info);
                } else {
                    xQueue.add(handle);
                }
            }
        }
        pumpX();
    }

    private static void pumpX() {
        xPumpScheduled = false;
        if (xQueue.isEmpty() || xActive >= X_MAX_CONCURRENT) return;
        if (!XAboutApi.isAvailable()) {
            xQueue.clear(); // Not logged in yet, or the API moved; retried after RETRY_MS.
            return;
        }
        long now = System.currentTimeMillis();
        long next = Math.max(xBackoffUntil, lastXStart + X_INTERVAL_MS);
        if (now < next) {
            scheduleX(next - now);
            return;
        }

        Iterator<String> it = xQueue.iterator();
        String handle = it.next();
        it.remove();
        xActive++;
        lastXStart = now;

        // Settles the slot exactly once: on the result, or after a timeout if X's
        // coroutine never resumes, so a lost request can't hold a slot forever.
        AtomicBoolean done = new AtomicBoolean();
        worker.schedule(() -> {
            if (done.compareAndSet(false, true)) {
                xActive--;
                Log.w(Hooks.TAG, "About lookup timed out for @" + handle);
                pumpX();
            }
        }, X_TIMEOUT_MS, TimeUnit.MILLISECONDS);

        XAboutApi.fetch(handle, (info, error) -> worker.execute(() -> {
            if (!done.compareAndSet(false, true)) return;
            xActive--;
            Stats.add(Stats.X_LOOKUPS, 1);
            if (error != null) {
                Stats.add(Stats.X_FAILED, 1);
                xFailures++;
                // Rate limits and outages: back off up to ~15 minutes.
                if (xFailures >= 3) xBackoffUntil = System.currentTimeMillis() + Math.min(15, 1L << (xFailures - 3)) * 60_000;
                Log.w(Hooks.TAG, "About lookup failed for @" + handle + ": " + error);
            } else {
                xFailures = 0;
                if (info != null) Stats.add(Stats.X_FOUND, 1);
                AccountInfo result = info != null ? info : AccountInfo.empty(System.currentTimeMillis());
                AccountInfo previous = peek(handle);
                // A refresh that finds nothing must not wipe data we already have.
                if (!result.isEmpty() || previous == null || previous.isEmpty()) store(handle, result);
                if (!result.isEmpty()) CloudCache.contribute(handle, result);
            }
            pumpX();
        }));
        pumpX();
    }

    private static void scheduleX(long delayMs) {
        if (xPumpScheduled) return;
        xPumpScheduled = true;
        worker.schedule(Lookup::pumpX, delayMs, TimeUnit.MILLISECONDS);
    }

    private static void store(String handle, AccountInfo info) {
        Users.put(info.userId, handle);
        String json = info.toJson();
        if (json != null) {
            pendingWrites.put(handle, json);
            if (!writeScheduled) {
                writeScheduled = true;
                worker.schedule(Lookup::flushWrites, WRITE_DELAY_MS, TimeUnit.MILLISECONDS);
            }
        }
        // Composition reads memory on the main thread. Updating it in the same step as the
        // listeners, which recompose what shows the account, means a composable never sees the
        // new info before whatever contains it is told to recompose.
        main.post(() -> {
            synchronized (memory) {
                memory.put(handle, info);
            }
            for (Listener l : listeners) l.onAccountUpdated(handle);
        });
    }

    /** One cache file rewrite for a burst of results instead of one per account. Worker thread. */
    private static void flushWrites() {
        writeScheduled = false;
        if (pendingWrites.isEmpty()) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (Map.Entry<String, String> e : pendingWrites.entrySet()) editor.putString(e.getKey(), e.getValue());
        pendingWrites.clear();
        editor.apply();
    }

    /** Forgets every cached account; they are looked up again when next shown. */
    static void clear() {
        synchronized (memory) {
            memory.clear();
            attempts.clear();
        }
        worker.execute(() -> {
            pendingWrites.clear();
            if (prefs != null) prefs.edit().clear().apply();
        });
    }

    /** For the details dialog. */
    static AccountInfo peek(String handle) {
        synchronized (memory) {
            return memory.get(handle);
        }
    }

    static void runOnWorker(Runnable r) {
        worker.execute(r);
    }

    static void schedule(Runnable r, long delayMs) {
        worker.schedule(r, delayMs, TimeUnit.MILLISECONDS);
    }
}
