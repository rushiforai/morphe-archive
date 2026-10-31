/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.Context;
import android.content.SharedPreferences;

import org.robolectric.RuntimeEnvironment;

import java.util.ArrayDeque;
import java.util.Collections;
import java.util.Deque;
import java.util.List;

/**
 * Stands in for Recently watched's looper and background thread, and keeps its list in a test file
 * of its own, so the watch checks run when a test says and the writes land at once.
 */
public final class RecentlyWatchedForTests {
    /** The test's own preferences file. */
    static final String FILE = "hushfacebook_recently_watched_test";

    /** Watch checks started, not yet run. */
    static final Deque<Runnable> CHECKS = new ArrayDeque<>();

    private RecentlyWatchedForTests() {
    }

    /** An empty list, checks that wait for {@link #runChecks}, and writes that land at once. */
    public static void install() {
        RecentlyWatched.forget();
        CHECKS.clear();
        SharedPreferences store = store();
        store.edit().clear().commit();
        RecentlyWatched.listForTests = new WatchedList(store);
        RecentlyWatched.timer = (delayMs, task) -> CHECKS.add(task);
        RecentlyWatched.writer = Runnable::run;
    }

    /** The preferences file the list is kept in. */
    static SharedPreferences store() {
        return RuntimeEnvironment.getApplication().getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    /** Runs every watch check started so far. */
    public static void runChecks() {
        Runnable check;
        while ((check = CHECKS.poll()) != null) check.run();
    }

    /** What the list holds, newest first. */
    public static List<RecentlyWatched.Entry> entries() {
        WatchedList list = RecentlyWatched.listForTests;
        return list == null ? Collections.emptyList() : list.newestFirst();
    }

    /** Puts an entry on the installed list as if it was watched at [watchedAt]. */
    public static void watched(String kind, String id, String owner, String caption, String parent, long watchedAt,
                               int durationMs) {
        RecentlyWatched.listForTests.add(new RecentlyWatched.Entry(kind, id, owner, caption, parent, watchedAt, durationMs));
    }

    /** Stops the clock watches are stamped and aged by at [now]. Call after {@link #install}. */
    public static void clockAt(long now) {
        RecentlyWatched.clock = () -> now;
    }

    /** Puts the app's own looper, thread, clock and list back. */
    public static void forget() {
        CHECKS.clear();
        RecentlyWatched.forget();
    }

    /**
     * For the pause probe: a reel that starts and plays on for five seconds. True when it went on
     * the list, which a paused Hushfacebook must never do.
     */
    public static boolean keepsAWatchedReel() {
        ResumePlaybackForTests.install();
        install();
        try {
            ResumePlaybackForTests.Params params = new ResumePlaybackForTests.Params("2233445566", 30_000);
            params.reel = true;
            ResumePlaybackForTests.Player player = new ResumePlaybackForTests.Player(params);
            ResumePlayback.started(player, ResumePlaybackForTests.Trigger.BY_USER);
            player.position = 5_000;
            runChecks();
            return !entries().isEmpty();
        } finally {
            forget();
            ResumePlaybackForTests.forget();
        }
    }
}
