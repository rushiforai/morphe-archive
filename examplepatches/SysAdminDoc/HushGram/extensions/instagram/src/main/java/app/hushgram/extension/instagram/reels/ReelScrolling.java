/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Stop Reels scrolling" patch.
 *
 * <p>The Reels viewer shows its reels in AndroidX's pager, which a finger moves from one reel to the
 * next. Instagram turns the pager's input off and back on itself at times, from several places,
 * always through the pager's one setter. The patch hands each Reels pager to {@link #pager} as the
 * viewer sets it up, and every value any pager is given to {@link #userInput}. Around the viewer
 * sits a layout that loads fresh reels when you pull down; its two touch handlers ask
 * {@link #pull} first.
 *
 * <p>While the switch is on, a Reels pager's input is off from the start and stays off whatever
 * Instagram asks, and the pull-down layout lets every touch go by, so neither a swipe nor a pull
 * gets you past the reel you opened. Taps on the reel and its buttons go where they did. Instagram's own
 * auto scroll is the app moving the pager, not a finger, so it still moves on when it's turned on.
 *
 * <p>Every other pager in Instagram is left alone. The hooks fail open: with the switch off,
 * HushGram paused, the settings not read yet or anything thrown, the pager takes what Instagram
 * gives it and the layout handles touches as before.
 */
public final class ReelScrolling {
    /** What {@link HookStatus} names a failure of each hook. */
    static final String PAGER = "Reels pager";
    static final String INPUT = "pager input";
    static final String PULL = "pull to refresh";

    /** The Reels pagers handed over so far, held weakly so a closed viewer's pager can go. */
    private static final Map<Object, Boolean> PAGERS = Collections.synchronizedMap(new WeakHashMap<>());

    private ReelScrolling() {
    }

    /**
     * Injected right after the Reels viewer keeps its pager. Remembers the pager and answers 0, turn
     * its input off now, while the switch is on, and 1, leave it, otherwise or when anything goes
     * wrong. Never throws.
     */
    public static int pager(Object pager) {
        return pager(pager, ReelScrolling::switchedOn);
    }

    static int pager(Object pager, BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.REEL_SCROLLING);
            if (pager == null) return 1;
            PAGERS.put(pager, Boolean.TRUE);
            if (!on.getAsBoolean()) return 1;
            Logger.printDebug(() -> "Reels scrolling: a Reels pager's swipes are off");
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REEL_SCROLLING, PAGER, failure);
            return 1;
        }
    }

    /**
     * Injected first thing in the pager's setter for whether a finger can move it, with the value as
     * an int (non-zero is yes). Answers 0 for a Reels pager while the switch is on, and the value
     * otherwise, or when anything goes wrong. Never throws.
     */
    public static int userInput(Object pager, int enabled) {
        return userInput(pager, enabled, ReelScrolling::switchedOn);
    }

    static int userInput(Object pager, int enabled, BooleanSupplier on) {
        try {
            if (enabled == 0 || pager == null || !PAGERS.containsKey(pager)) return enabled;
            HookStatus.invoked(FamilyNames.REEL_SCROLLING);
            return on.getAsBoolean() ? 0 : enabled;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REEL_SCROLLING, INPUT, failure);
            return enabled;
        }
    }

    /**
     * Injected first thing in both touch handlers of the pull-down layout around the Reels viewer.
     * Answers 0, let the touch go by, while the switch is on, and 1, handle it as before, otherwise
     * or when anything goes wrong. Never throws.
     */
    public static int pull() {
        return pull(ReelScrolling::switchedOn);
    }

    static int pull(BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.REEL_SCROLLING);
            return on.getAsBoolean() ? 0 : 1;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REEL_SCROLLING, PULL, failure);
            return 1;
        }
    }

    /** Forgets every pager handed over, for tests. */
    static void forget() {
        PAGERS.clear();
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.STOP_REELS_SCROLLING.get();
    }
}
