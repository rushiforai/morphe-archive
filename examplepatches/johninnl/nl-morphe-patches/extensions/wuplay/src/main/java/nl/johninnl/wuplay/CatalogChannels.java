package nl.johninnl.wuplay;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/** Process-owned foreground refresh. No service, root access or independent network client. */
public final class CatalogChannels {
    static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> new Thread(r, "WuplayTvChannels"));
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean QUEUED = new AtomicBoolean();
    private static boolean installed;
    private static int resumed;
    static final String PREFS = "morphe_wuplay_tv_channels";
    private CatalogChannels() {}

    public static synchronized void install(Application application) {
        if (installed) return;
        installed = true;
        Runnable tick = new Runnable() {
            public void run() {
                if (resumed <= 0) return;
                request(application);
                MAIN.postDelayed(this, 30 * 60 * 1000L);
            }
        };
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityResumed(Activity activity) { if (++resumed == 1) { MAIN.removeCallbacks(tick); tick.run(); } }
            public void onActivityPaused(Activity activity) { if (--resumed <= 0) { resumed = 0; MAIN.removeCallbacks(tick); } }
            public void onActivityCreated(Activity a, Bundle b) {}
            public void onActivityStarted(Activity a) {}
            public void onActivityStopped(Activity a) {}
            public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            public void onActivityDestroyed(Activity a) {}
        });
        Log.i("WuplayTvChannels", "Catalog publisher installed (0.9.4-beta/49)");
    }

    static boolean supported(Context context) {
        return Build.VERSION.SDK_INT >= 26 && context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_LEANBACK);
    }

    static SharedPreferences preferences(Context context) { return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    static Set<String> selected(Context context) { return new HashSet<>(preferences(context).getStringSet("selected", java.util.Collections.emptySet())); }

    static void request(Application application) {
        if (!supported(application) || !QUEUED.compareAndSet(false, true)) return;
        WORKER.execute(() -> {
            try { refresh(application); }
            finally { QUEUED.set(false); }
        });
    }

    static String refresh(Application application) {
        String status;
        try {
            if (!supported(application)) return "Preview channels require Android TV 8 or later.";
            Set<String> selected = selected(application);
            CatalogPublisher publisher = new CatalogPublisher(application);
            if (selected.isEmpty()) {
                publisher.removeUnselected(selected);
                status = "No catalogs selected. Published catalog channels removed.";
            } else {
                NativeCatalogs nativeApi = new NativeCatalogs(application);
                NativeCatalogs.Snapshot snapshot = nativeApi.snapshot();
                Set<String> desired = new HashSet<>();
                for (NativeCatalogs.Definition definition : snapshot.definitions) if (selected.contains(definition.key)) desired.add(definition.key);
                nativeApi.requireDefault(snapshot.profileId);
                publisher.removeUnselected(desired);
                int published = 0, failed = 0;
                for (NativeCatalogs.Definition definition : snapshot.definitions) if (desired.contains(definition.key)) {
                    try {
                        if (!selected(application).contains(definition.key)) continue;
                        java.util.List<?> items = nativeApi.fetch(snapshot, definition);
                        // Selection can change while the native request is suspended.
                        if (!selected(application).contains(definition.key)) continue;
                        nativeApi.requireDefault(snapshot.profileId);
                        publisher.publish(definition, items); published++;
                    } catch (Exception | LinkageError failure) {
                        failed++;
                        Log.w("WuplayTvChannels", "Catalog refresh failed; retaining previous programs (" + failure.getClass().getSimpleName() + ")");
                    }
                }
                status = "Published " + published + " catalogs." + (failed == 0 ? "" : " " + failed + " failed; previous content retained.");
            }
            Log.i("WuplayTvChannels", status);
        } catch (Exception | LinkageError failure) {
            status = failure instanceof IllegalStateException && failure.getMessage() != null ? failure.getMessage() : "Could not refresh TV channels. Open Wuplay's default profile and try again.";
            Log.w("WuplayTvChannels", "Catalog refresh stopped (" + failure.getClass().getSimpleName() + ")");
        }
        preferences(application).edit().putString("status", status).putLong("last_attempt", System.currentTimeMillis()).apply();
        return status;
    }
}
