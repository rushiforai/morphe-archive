/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Double tap to skip patch asks each time Facebook reads whether its own double-tap skip
 * is on (issue #225).
 *
 * <p>Facebook's reel and video players carry a double-tap skip of their own: a double tap on the
 * left or right fifth of the player skips back or forward, 10 seconds on a video of 30 seconds or
 * more and 5 on a shorter one, and the tap goes no further, so it doesn't like the video. One of
 * Facebook's server tests turns it on, and most accounts don't get it. The patch hands every read
 * of that test to {@link #flag}, which answers yes while the switch is on. A double tap in the
 * middle of the player still does what it did.
 *
 * <p>Off, paused, settings that aren't ready yet or a failure in here, and Facebook's own answer
 * goes on.
 */
public final class DoubleTapSkip {
    /** Counted each time a read of Facebook's test is answered yes in its place. */
    static final String TURNED_ON = "double-tap skip turned on";

    private DoubleTapSkip() {
    }

    /**
     * Injection point, right after Facebook reads whether its double-tap skip is on: the answer to
     * go on with. Never throws.
     */
    public static boolean flag(boolean facebooks) {
        try {
            HookStatus.invoked(FamilyNames.DOUBLE_TAP_SKIP);
            HookStatus.bound(FamilyNames.DOUBLE_TAP_SKIP, "double-tap skip test");
            if (facebooks || !Utils.settingsReady() || !Settings.DOUBLE_TAP_SKIP.get()) return facebooks;
            HookStatus.counted(FamilyNames.DOUBLE_TAP_SKIP, TURNED_ON);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOUBLE_TAP_SKIP, "double-tap skip test", failure);
            return facebooks;
        }
    }
}
