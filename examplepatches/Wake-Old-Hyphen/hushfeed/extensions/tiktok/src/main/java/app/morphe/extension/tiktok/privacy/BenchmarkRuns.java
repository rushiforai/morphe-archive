/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Keeps TikTok's ByteBench phone benchmark from starting (#64).
 *
 * <p>When TikTok's servers hand it a benchmark task, it binds ByteBench's collection service,
 * which the manifest runs in a process of its own, {@code :bm}. That process held about 194 MB
 * on the reporter's phone. On 47.1.4 the starter binds once and gives up when the bind fails,
 * so a disabled component is all it takes: nothing retries it. The manifest puts one other
 * service in {@code :bm}, {@code com.benchmark.BenchmarkService}, but 47.0.3 to 47.1.4 carry no
 * code for it and nothing names it. The ByteBench-named strategies
 * in 47.1.4 (camera, editor, effects and LIVE settings) come from TikTok's servers, and none of
 * them is the feed's player.
 *
 * <p>PackageManager keeps a component's state across restarts and updates, so the switch is
 * put into effect both ways: on disables the service, and off (or Pause) puts it back to what
 * the manifest says. A process that is already running keeps going until TikTok restarts. A
 * build patched without this switch leaves the service as the last one set it, until TikTok is
 * reinstalled.
 */
public final class BenchmarkRuns {
    static final String SERVICE = "com.benchmark.collection.service.ByteBenchService";

    /** The latest choice asked for. Each queued task applies this, not the value it was queued with. */
    private static volatile Boolean requested;

    private BenchmarkRuns() {
    }

    /** From TikTok's main activity, so a change made anywhere is in force from this start. */
    public static void onAppOpened(Activity activity) {
        request(activity.getApplicationContext(), Settings.STOP_BENCHMARK_RUNS.get());
    }

    /**
     * From the settings row. The listener runs before the change is saved, so the new value
     * comes in rather than being read back.
     */
    public static void settingsChanged(Context context, boolean stop) {
        request(context.getApplicationContext(), stop && !Setting.isPaused());
    }

    /**
     * Two quick flips run on two pool threads at once, and whichever finished last used to win,
     * so on then off could leave the service disabled under a switch that reads off. Every task
     * applies the latest request under one lock instead, so the last to run agrees with the switch.
     */
    private static void request(Context app, boolean stop) {
        requested = stop;
        Utils.runOnBackgroundThread(() -> {
            synchronized (BenchmarkRuns.class) {
                Boolean latest = requested;
                if (latest != null) apply(app, latest);
            }
        });
    }

    static int wantedState(boolean stop) {
        return stop ? PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
    }

    static void apply(Context context, boolean stop) {
        try {
            PackageManager packages = context.getPackageManager();
            ComponentName service = new ComponentName(context.getPackageName(), SERVICE);
            int wanted = wantedState(stop);
            if (packages.getComponentEnabledSetting(service) == wanted) return;
            packages.setComponentEnabledSetting(service, wanted, PackageManager.DONT_KILL_APP);
            Logger.printInfo(() -> "Benchmark runs: the benchmark service is "
                    + (stop ? "disabled" : "back to its default"));
        } catch (IllegalArgumentException | SecurityException missing) {
            // A build without the service in its manifest has nothing to switch.
            Logger.printInfo(() -> "Benchmark runs: no benchmark service in the manifest");
        }
    }
}
