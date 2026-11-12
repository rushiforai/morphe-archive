package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Collections;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/** Optional metadata: coalesce writes and never overlap preference disk snapshots. */
final class ReporterMetadataWrites {
    static final int MAX_PENDING = 4096;
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread thread = new Thread(r, "Haiagaru-reporter-metadata"); thread.setDaemon(true); return thread;
    });
    interface Scheduler { void later(Runnable work); }
    final SharedPreferences prefs;
    private final Scheduler scheduler;
    private Map<String,String> pending = new LinkedHashMap<>();
    private Map<String,String> flushing = Collections.emptyMap();
    private boolean scheduled, disabled;

    ReporterMetadataWrites(SharedPreferences prefs) {
        this(prefs, work -> WORKER.schedule(work, 200, TimeUnit.MILLISECONDS));
    }
    ReporterMetadataWrites(SharedPreferences prefs, Scheduler scheduler) {
        this.prefs = prefs; this.scheduler = scheduler;
    }
    synchronized String get(String key) {
        String value = pending.get(key);
        if (value == null) value = flushing.get(key);
        return value == null ? prefs.getString(key, null) : value;
    }
    synchronized void put(String key, String value) {
        if (disabled || value == null || !headroom() || value.equals(get(key))) return;
        try {
            if (!pending.containsKey(key) && pending.size() >= MAX_PENDING)
                pending.remove(pending.keySet().iterator().next());
            pending.put(key, value);
            if (!scheduled) { scheduled = true; scheduler.later(this::flush); }
        } catch (OutOfMemoryError | RuntimeException unavailable) {
            disable();
        }
    }
    static boolean headroom() {
        Runtime runtime = Runtime.getRuntime();
        long available = runtime.maxMemory() - runtime.totalMemory() + runtime.freeMemory();
        return available > Math.max(4L * 1024 * 1024, runtime.maxMemory() / 100);
    }
    private synchronized void disable() {
        disabled = true; scheduled = false; pending.clear(); flushing = Collections.emptyMap();
    }
    private void flush() {
        final Map<String,String> batch;
        synchronized (this) {
            if (disabled || !flushing.isEmpty()) return;
            if (!headroom()) { pending.clear(); scheduled = false; return; }
            batch = pending; pending = new LinkedHashMap<>(); flushing = batch;
        }
        try {
            SharedPreferences.Editor edit = null;
            for (Map.Entry<String,String> row : batch.entrySet()) {
                if (row.getValue().equals(prefs.getString(row.getKey(), null))) continue;
                if (edit == null) edit = prefs.edit();
                edit.putString(row.getKey(), row.getValue());
            }
            // commit completes the disk write before another batch can edit this file.
            // apply would keep writes in flight and cause SharedPreferences to clone its map.
            if (edit != null && !edit.commit()) { disable(); return; }
        } catch (OutOfMemoryError | RuntimeException unavailable) {
            // Losing optional metadata must not crash history or clear persisted user data.
            disable(); return;
        }
        synchronized (this) {
            flushing = Collections.emptyMap(); scheduled = false;
            if (!pending.isEmpty() && !disabled) {
                scheduled = true;
                try { scheduler.later(this::flush); }
                catch (RuntimeException unavailable) { disable(); }
            }
        }
    }
}
