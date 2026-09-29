/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.os.SystemClock;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * A return after all Facebook UI was hidden, and the one answer every feed refresh check of that
 * return gets.
 *
 * <p>Facebook checks more than once as it comes back: FeedRefreshTriggerController's resume
 * callback, the feed's warm-start check, which NewsFeedFragment's onResume reaches and which
 * refreshes a feed left alone for a few minutes, and NewsFeedFragment's foreground auto-scroll. The
 * first check after the UI was hidden decides, and every check within {@link #SAME_RETURN_MS} of it
 * gets the same answer. Later checks, a tab switch among them, are Facebook's own.
 *
 * <p>While Facebook is away it also tears the feed's stories down once it has been gone as long as
 * the warm-start threshold, and a torn-down feed loads new posts on the return whatever the checks
 * say. With the switch on that teardown is skipped: see {@link #keepFeedWhileAway()}.
 */
public final class ReturnRefresh {
    private static final long HOLD_MS = 10 * 60 * 1000L;
    /** How long after the first check of a return a later check still belongs to it. */
    static final long SAME_RETURN_MS = 10_000L;
    static final String FEED_RESUME = "feed resume";
    static final String WARM_START = "warm start";
    static final String AUTO_SCROLL = "foreground auto-scroll";
    private static final String KEPT_ON_RESUME = "kept the feed on resume";
    private static final String KEPT_ON_WARM_START = "kept the feed at warm start";
    private static final String KEPT_ON_AUTO_SCROLL = "kept the feed from the foreground auto-scroll";
    private static final String KEPT_WHILE_AWAY = "kept the feed loaded while away";
    /** Prefix for a refusal's count label; one label per fixed reason from refreshBecause()/offBecause(). */
    private static final String LET_FACEBOOK_REFRESH = "let Facebook refresh: ";
    private static long hiddenAt = -1;
    private static long decidedAt = -1;
    /** Why the first check of the current return let Facebook refresh, or null while it's holding. */
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
        Logger.printDebug(() -> "Return refresh: Facebook's screens were hidden");
    }

    /**
     * Called only from the feed's resume callback, never from swipe refresh or cold start. Counts
     * each call in the report, so a report can tell a callback that moved, which never calls, from
     * one that ran and let Facebook refresh. A failure lets Facebook refresh, as it would unpatched.
     */
    public static boolean skip() {
        return ask(FEED_RESUME, KEPT_ON_RESUME);
    }

    /**
     * Called from the feed's warm-start check once it knows the feed has stories, before it looks
     * at how long the feed sat idle. True skips the check the way Facebook's own skip does, so an
     * empty feed still loads.
     */
    public static boolean holdWarmStart() {
        return ask(WARM_START, KEPT_ON_WARM_START);
    }

    /**
     * Called first thing in NewsFeedFragment's foreground auto-scroll decision, which on some
     * accounts moves the feed on a post after a return a few minutes long. True answers Facebook's
     * own "no scroll".
     */
    public static boolean holdAutoScroll() {
        return ask(AUTO_SCROLL, KEPT_ON_AUTO_SCROLL);
    }

    /**
     * Called first thing in the runnable Facebook posts as it leaves for the background, timed to
     * the warm-start threshold, which tears the feed's stories down if Facebook is still away. True
     * skips that teardown while the switch is on, since the return it clears the feed for may be one
     * to keep. How long Facebook will be away isn't known yet, so a return past the ten minutes still
     * gets new posts, through the warm-start check. It leaves the pending return alone.
     */
    public static boolean keepFeedWhileAway() {
        try {
            HookStatus.invoked(FamilyNames.RETURN_REFRESH);
            String off = offBecause();
            Logger.printDebug(() -> "Return refresh: feed teardown while away"
                    + (off == null ? ": skipped, keeping the feed" : ": Facebook tears the feed down, " + off));
            HookStatus.counted(FamilyNames.RETURN_REFRESH, off == null ? KEPT_WHILE_AWAY : LET_FACEBOOK_REFRESH + off);
            return off == null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.RETURN_REFRESH, "feed teardown", failure);
            return false;
        }
    }

    /**
     * Called first thing where Facebook writes down what its reset to feed decided on a return, to
     * log it. It changes nothing: it's there so a debug log says whether that reset ran.
     */
    public static void resetToFeed(String outcome, String destination) {
        try {
            Logger.printDebug(() -> "Return refresh: Facebook's reset to feed: " + outcome + ", to " + destination);
        } catch (Throwable ignored) {
            // A log line is not worth failing Facebook's call over.
        }
    }

    private static boolean ask(String check, String kept) {
        try {
            HookStatus.invoked(FamilyNames.RETURN_REFRESH);
            Decision decision = decide(SystemClock.elapsedRealtime(), check);
            if (decision.countable) {
                HookStatus.counted(FamilyNames.RETURN_REFRESH,
                        decision.hold ? kept : LET_FACEBOOK_REFRESH + decision.reason);
            }
            return decision.hold;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.RETURN_REFRESH, check, failure);
            return false;
        }
    }

    static boolean skipAt(long now) {
        return decide(now, FEED_RESUME).hold;
    }

    static boolean askAt(long now, String check) {
        return decide(now, check).hold;
    }

    /**
     * Decides one check. A check outside any tracked return (a resume or tab switch with nothing
     * hidden, or past {@link #SAME_RETURN_MS} of the last one) isn't a decision at all: it's
     * {@link Decision#countable countable} false so callers don't count it either way, the bug
     * behind #22's "let Facebook refresh 15" from a switch that never once refused a real return.
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
                + (hold ? ": keeping the feed" : ": Facebook goes ahead, " + logReason));
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

    /** Why a return from {@code at} to {@code now} lets Facebook refresh, or null when it keeps the feed. */
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
        if (!Settings.BLOCK_RETURN_REFRESH.get()) return Setting.isPaused() ? "Hushfacebook paused" : "switch off";
        return null;
    }
}
