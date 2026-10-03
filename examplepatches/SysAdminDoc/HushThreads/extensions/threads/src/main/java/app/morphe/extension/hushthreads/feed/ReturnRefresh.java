/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at d12e61b4 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.feed;

import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.os.SystemClock;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * A return after all Threads UI was hidden, and the one answer every feed refresh check of that
 * return gets.
 *
 * <p>Threads checks up to four times as it comes back. BarcelonaActivity's onStart asks for a
 * hot-start decision, which can refresh For you in the background or badge the home tab, and
 * whether to reset to the main feed after a long absence. The feed screen's warm-start check then
 * refreshes every feed once the time away passes Threads' threshold, scrolling back to the top.
 * When that check skips its reload, For you compares the time away again and swaps in the posts it
 * fetched while Threads was in the background. The first check after the UI was hidden decides, and
 * every check within {@link #SAME_RETURN_MS} of it gets the same answer. Later checks are Threads'
 * own.
 */
public final class ReturnRefresh {
    private static final long HOLD_MS = 10 * 60 * 1000L;
    /** How long after the first check of a return a later check still belongs to it. */
    static final long SAME_RETURN_MS = 10_000L;
    static final String HOT_START = "hot start";
    static final String RESET_TO_FEED = "reset to feed";
    static final String WARM_START = "warm start";
    static final String CACHED_POSTS = "cached posts";
    private static final String KEPT_ON_HOT_START = "kept the feed at hot start";
    private static final String KEPT_ON_RESET = "kept the feed from the reset to feed";
    private static final String KEPT_ON_WARM_START = "kept the feed at warm start";
    private static final String KEPT_ON_CACHED_POSTS = "kept the feed from the cached posts swap";
    /** Prefix for a refusal's count label; one label per fixed reason from refreshBecause()/offBecause(). */
    private static final String LET_THREADS_REFRESH = "let Threads refresh: ";
    private static long hiddenAt = -1;
    private static long decidedAt = -1;
    /** Why the first check of the current return let Threads refresh, or null while it's holding. */
    private static String decidedBecause;
    private static boolean registered;

    private ReturnRefresh() { }

    public static synchronized void register(Context context) {
        if (registered || !(context instanceof Application)) return;
        ((Application) context).registerComponentCallbacks(new ComponentCallbacks2() {
            @Override public void onTrimMemory(int level) {
                if (level == TRIM_MEMORY_UI_HIDDEN) ReturnRefresh.uiHidden();
            }
            @Override public void onConfigurationChanged(Configuration configuration) { }
            @Override public void onLowMemory() { }
        });
        registered = true;
    }

    public static void uiHidden() {
        uiHidden(SystemClock.elapsedRealtime());
    }

    static void uiHidden(long now) {
        synchronized (ReturnRefresh.class) {
            hiddenAt = now;
            decidedAt = -1;
            decidedBecause = null;
        }
        Logger.printDebug(() -> "Return refresh: Threads' screens were hidden");
    }

    /**
     * Called first thing in the hot-start decision BarcelonaActivity's onStart asks for. True makes
     * it answer null, which is what it answers when no stop time was recorded: no background
     * refresh of For you and no home-tab badge. A failure lets Threads decide, as it would unpatched.
     */
    public static boolean holdHotStart() {
        return ask(HOT_START, KEPT_ON_HOT_START);
    }

    /**
     * Called with what BarcelonaActivity decided about resetting to the main feed, as it hands that
     * answer back to onStart. Only a reset is a question: false stays false, uncounted.
     */
    public static boolean resetToFeed(boolean reset) {
        return reset && !ask(RESET_TO_FEED, KEPT_ON_RESET);
    }

    /**
     * Called with the warm-start check's refresh answer, after Threads compared the time away with
     * its threshold and before it stores the answer. False takes Threads' own skip, so no head load,
     * scroll to the top or shimmer. Only a refresh is a question: false stays false, uncounted.
     */
    public static boolean warmStart(boolean refresh) {
        return refresh && !ask(WARM_START, KEPT_ON_WARM_START);
    }

    /**
     * Called with For you's own answer, after the warm-start check skipped its reload, on whether
     * the time away passed the same threshold, before it swaps the posts fetched in the background
     * in at the top. False keeps the feed as it was. Only a swap is a question: false stays false,
     * uncounted.
     */
    public static boolean cachedPosts(boolean swap) {
        return swap && !ask(CACHED_POSTS, KEPT_ON_CACHED_POSTS);
    }

    private static boolean ask(String check, String kept) {
        try {
            HookStatus.invoked(FamilyNames.RETURN_REFRESH);
            Decision decision = decide(SystemClock.elapsedRealtime(), check);
            if (decision.countable) {
                HookStatus.counted(FamilyNames.RETURN_REFRESH,
                        decision.hold ? kept : LET_THREADS_REFRESH + decision.reason);
            }
            return decision.hold;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.RETURN_REFRESH, check, failure);
            return false;
        }
    }

    static boolean askAt(long now, String check) {
        return decide(now, check).hold;
    }

    /**
     * Decides one check. A check outside any tracked return (an onStart with nothing hidden, or past
     * {@link #SAME_RETURN_MS} of the last one) isn't a decision at all: it's
     * {@link Decision#countable countable} false so callers don't count it either way.
     */
    private static Decision decide(long now, String check) {
        final long away;
        final String reason;
        final boolean countable;
        synchronized (ReturnRefresh.class) {
            long at = hiddenAt;
            if (at >= 0) {
                hiddenAt = -1;
                decidedAt = now;
                away = now - at;
                reason = refreshBecause(now, at);
                decidedBecause = reason;
                countable = true;
            } else if (decidedAt >= 0 && now >= decidedAt && now - decidedAt <= SAME_RETURN_MS) {
                away = -1;
                reason = decidedBecause;
                countable = true;
            } else {
                decidedAt = -1;
                away = -2;
                reason = "no return from the background";
                countable = false;
            }
        }
        boolean hold = countable && reason == null;
        String logReason = away == -1 && reason != null ? "as the first check of this return decided" : reason;
        Logger.printDebug(() -> "Return refresh: " + check
                + (away >= 0 ? " after " + away / 1000 + " s away" : away == -1 ? " in the same return" : "")
                + (hold ? ": keeping the feed" : ": Threads goes ahead, " + logReason));
        return new Decision(hold, countable, reason);
    }

    /** The outcome of one {@link #decide} call: whether to hold, and whether it belongs to a count. */
    private static final class Decision {
        final boolean hold;
        final boolean countable;
        final String reason;

        Decision(boolean hold, boolean countable, String reason) {
            this.hold = hold;
            this.countable = countable;
            this.reason = reason;
        }
    }

    /** Why a return from {@code at} to {@code now} lets Threads refresh, or null when it keeps the feed. */
    private static String refreshBecause(long now, long at) {
        if (now < at) return "the clock went back";
        String off = offBecause();
        if (off != null) return off;
        if (now - at > HOLD_MS && !Settings.RETURN_REFRESH_NO_LIMIT.get()) return "away over ten minutes";
        return null;
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.BLOCK_RETURN_REFRESH.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
