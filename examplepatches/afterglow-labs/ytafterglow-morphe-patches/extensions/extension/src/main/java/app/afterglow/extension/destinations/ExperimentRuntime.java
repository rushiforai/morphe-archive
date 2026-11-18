package app.afterglow.extension.destinations;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import app.afterglow.extension.Afterglow;

/** Typed native flag boundary. No network, native preferences, or server configuration writes. */
public final class ExperimentRuntime {
    public static final class Observation {
        public final long flag, observedAt;
        public final String namespace;
        public final int type, slot;
        public final Object serverValue;
        Observation(String namespace, long flag, int type, int slot, Object value) {
            this.namespace = namespace;
            this.flag = flag; this.type = type; this.slot = slot; serverValue = value; observedAt = System.currentTimeMillis();
        }
    }
    private static final ConcurrentHashMap<String, Observation> CATALOG = new ConcurrentHashMap<>();
    private static final ArrayList<Observation> CHANGES = new ArrayList<>();
    private static volatile ExperimentStore store;
    private static volatile boolean loadFailed;
    private static boolean lifecycleRegistered;
    private static int resumed;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Runnable trial;
    private ExperimentRuntime() {}

    /** Replaced only by the verified native patch, never inferred from a settings entry. */
    public static boolean nativeHooksInstalled() { return false; }

    public static ExperimentStore store(Context context) {
        ExperimentStore result = store;
        if (result == null) synchronized (ExperimentRuntime.class) {
            result = store;
            if (result == null) {
                if (context == null) throw new IllegalStateException("The application context is not ready.");
                store = result = new ExperimentStore(new File(context.getFilesDir(), "Afterglow/Experiments"));
            }
        }
        return result;
    }
    private static Object resolve(String namespace, int slot, long flag, int type, Object server) {
        if (namespace == null) namespace = "<global>";
        if (namespace.isEmpty() || namespace.length() > 512) return server;
        if (server == null || flag <= 0 || type == 3 && ((String) server).length() > 16384
                || type == 2 && !Double.isFinite(((Number) server).doubleValue())) return server;
        try {
            String key = namespace + ":" + type + ":" + flag;
            Observation previous = CATALOG.get(key);
            if (previous != null || CATALOG.size() < 8192) {
                if (previous == null || !previous.serverValue.equals(server)) {
                    Observation current = new Observation(namespace, flag, type, slot, server);
                    CATALOG.put(key, current);
                    if (previous != null) synchronized (CHANGES) {
                        CHANGES.add(0, current); while (CHANGES.size() > 100) CHANGES.remove(CHANGES.size() - 1);
                    }
                }
            }
            ExperimentStore current = store;
            if (current == null && !loadFailed) current = store(Afterglow.context());
            Object override = current == null ? null : current.value(namespace, flag, type);
            return override == null ? server : override;
        } catch (Throwable error) {
            if (!loadFailed) { loadFailed = true; Afterglow.error("ExperimentRuntime", error); }
            return server;
        }
    }
    public static boolean booleanValue(String namespace, int slot, long flag, boolean value) { return (Boolean) resolve(namespace, slot, flag, 0, value); }
    public static long integerValue(String namespace, int slot, long flag, long value) { return ((Number) resolve(namespace, slot, flag, 1, value)).longValue(); }
    public static double doubleValue(String namespace, int slot, long flag, double value) { return ((Number) resolve(namespace, slot, flag, 2, value)).doubleValue(); }
    public static String stringValue(String namespace, int slot, long flag, String value) { return (String) resolve(namespace, slot, flag, 3, value); }
    public static List<Observation> catalog() {
        List<Observation> result = new ArrayList<>(CATALOG.values());
        result.sort(Comparator.comparing((Observation row) -> row.namespace).thenComparingLong(row -> row.flag).thenComparingInt(row -> row.type)); return result;
    }
    public static List<Observation> recentChanges() { synchronized (CHANGES) { return new ArrayList<>(CHANGES); } }

    /** Called at native main-activity creation, before its first resume callback. */
    public static void onActivityCreate(Activity activity) {
        if (activity == null) return;
        try {
            store(activity);
            if (lifecycleRegistered) return;
            Application app = activity.getApplication();
            if (app == null) return;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityCreated(Activity a, Bundle state) {}
                public void onActivityStarted(Activity a) {}
                public void onActivityResumed(Activity a) { resumed++; changed(); }
                public void onActivityPaused(Activity a) { resumed = Math.max(0, resumed - 1); if (resumed == 0) cancelTrial(); }
                public void onActivityStopped(Activity a) {}
                public void onActivitySaveInstanceState(Activity a, Bundle state) {}
                public void onActivityDestroyed(Activity a) {}
            });
            lifecycleRegistered = true;
        } catch (Throwable error) { Afterglow.error("ExperimentRuntime.lifecycle", error); }
    }
    /** UI calls this after a mutation; the safe period belongs to one exact revision. */
    public static void changed() {
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(ExperimentRuntime::changed); return; }
        cancelTrial();
        ExperimentStore current = store;
        if (resumed == 0 || current == null || current.bypass() || current.recoveryRequired() || !current.pending()) return;
        long revision = current.revision();
        trial = () -> {
            trial = null;
            if (resumed == 0) return;
            try { current.markKnownGood(revision); }
            catch (Exception error) { Afterglow.error("ExperimentRuntime.knownGood", error); }
        };
        MAIN.postDelayed(trial, 30000);
    }
    private static void cancelTrial() { if (trial != null) { MAIN.removeCallbacks(trial); trial = null; } }
}
