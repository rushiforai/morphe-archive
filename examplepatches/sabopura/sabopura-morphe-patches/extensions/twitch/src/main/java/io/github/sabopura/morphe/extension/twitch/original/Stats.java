package io.github.sabopura.morphe.extension.twitch.original;

import android.content.SharedPreferences;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLongArray;

import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Running totals across launches. Counted in memory, written at most every 30 seconds. */
public final class Stats {
    public static final int STOPPED = 0, REPLACED = 1, COVERED = 2, POINTS = 3, WATCHED_MS = 4;
    private static final int COUNT = 5;
    private static final String[] KEYS = {"stat_stopped", "stat_replaced", "stat_covered", "stat_points", "stat_watched_ms"};
    private static final long SAVE_DELAY_MS = 30_000;

    private static final AtomicLongArray VALUES = new AtomicLongArray(COUNT);
    private static final AtomicBoolean SAVING = new AtomicBoolean();
    private static volatile boolean loaded;
    private static final Runnable SAVE = Stats::save;

    private Stats() {
    }

    private static boolean on() {
        return Features.has(Feature.PATCH_STATS);
    }

    private static void load(SharedPreferences prefs) {
        if (loaded || prefs == null) return;
        synchronized (Stats.class) {
            if (loaded) return;
            for (int i = 0; i < COUNT; i++) VALUES.addAndGet(i, prefs.getLong(KEYS[i], 0));
            loaded = true;
        }
    }

    private static void add(int kind, long amount) {
        load(Original.prefs());
        VALUES.addAndGet(kind, amount);
        if (SAVING.compareAndSet(false, true)) Original.MAIN.postDelayed(SAVE, SAVE_DELAY_MS);
    }

    public static void ad(int adBlockKind) {
        if (on()) add(adBlockKind, 1);
    }

    public static void pointsClaimed() {
        if (on()) add(POINTS, 1);
    }

    static void addWatched(long millis) {
        if (on()) add(WATCHED_MS, millis);
    }

    private static void save() {
        SAVING.set(false);
        SharedPreferences prefs = Original.prefs();
        if (prefs == null) return;
        load(prefs);
        SharedPreferences.Editor editor = prefs.edit();
        for (int i = 0; i < COUNT; i++) editor.putLong(KEYS[i], VALUES.get(i));
        editor.apply();
    }

    public static long value(int kind) {
        load(Original.prefs());
        return VALUES.get(kind);
    }

    /** Watched time reads in minutes until it reaches an hour. */
    public static boolean watchedInHours(long millis) {
        return millis >= 3_600_000;
    }

    /** Whole minutes under an hour, then hours with one decimal. */
    public static String watchedNumber(long millis) {
        return watchedInHours(millis) ? String.format(java.util.Locale.ROOT, "%.1f", millis / 3_600_000.0)
                : String.valueOf(millis / 60_000);
    }

    /** Clears every total and returns what they were, so the reset can be undone. */
    public static long[] reset() {
        load(Original.prefs());
        long[] before = new long[COUNT];
        for (int i = 0; i < COUNT; i++) before[i] = VALUES.getAndSet(i, 0);
        saveNow();
        return before;
    }

    public static void restore(long[] values) {
        for (int i = 0; i < COUNT; i++) VALUES.set(i, values[i]);
        saveNow();
    }

    private static void saveNow() {
        Original.MAIN.removeCallbacks(SAVE);
        save();
    }
}
