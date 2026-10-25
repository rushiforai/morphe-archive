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
 * What the Tap shows the controls patch asks when a reel is tapped (issue #225).
 *
 * <p>Facebook's reel tap handler holds two answers to a single tap. Everyone gets the one that pauses
 * the reel and shows its controls around a play button. The other shows the controls around a pause
 * button while the reel plays on, and a second tap hides them. One value on the player's config picks
 * between them, and Facebook ships it off. The patch hands that value to {@link #showControls}, which
 * says yes while the switch is on. The button in the middle of the controls still pauses.
 *
 * <p>Facebook hides the controls on a playing reel after a second, too soon to reach the skip or mute
 * buttons, so both of its waits go through {@link #hideDelay(long)} and {@link #hideDelay(int)}, which
 * make them {@link #HIDE_AFTER_MS} while the switch is on. On the unified reel player the tap handler
 * skips posting that hide at all, so the controls would stay up until the next tap; {@link #skipHide}
 * says no while the switch is on, so they go away on their own.
 *
 * <p>Off, paused, settings that aren't ready yet or a failure in here, and Facebook's own answer
 * goes on.
 */
public final class TapShowsControls {
    /** How long the controls stay up on a playing reel while the switch is on. */
    static final int HIDE_AFTER_MS = 3000;

    /** Counted each time a tap is answered with the controls in place of the pause. */
    static final String SHOWN = "tap shows the controls";

    /** Counted each time a wait before the controls hide is made longer. */
    static final String LONGER = "controls kept up longer";

    /** Counted each time the unified player is made to hide the controls it would have left up. */
    static final String HIDES = "controls hide on their own";

    private TapShowsControls() {
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.TAP_SHOWS_CONTROLS.get();
    }

    /**
     * Injection point, right after the tap handler reads which answer a tap gets: true for the one
     * that shows the controls and plays on. Never throws.
     */
    public static boolean showControls(boolean facebooks) {
        try {
            HookStatus.invoked(FamilyNames.TAP_SHOWS_CONTROLS);
            HookStatus.bound(FamilyNames.TAP_SHOWS_CONTROLS, "reel tap");
            if (facebooks || !on()) return facebooks;
            HookStatus.counted(FamilyNames.TAP_SHOWS_CONTROLS, SHOWN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_SHOWS_CONTROLS, "reel tap", failure);
            return facebooks;
        }
    }

    /**
     * Injection point, right after the tap handler reads whether this reel's player skips the hide it
     * posts once the controls show: false while the switch is on, so the controls hide on their own.
     * Never throws.
     */
    public static boolean skipHide(boolean facebooks) {
        try {
            if (!facebooks || !on()) return facebooks;
            HookStatus.counted(FamilyNames.TAP_SHOWS_CONTROLS, HIDES);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_SHOWS_CONTROLS, "controls hide", failure);
            return facebooks;
        }
    }

    /**
     * Injection point, where the controls' controller loads how long to wait before it hides them
     * on a playing reel: the wait to use, in milliseconds. Never throws.
     */
    public static long hideDelay(long facebooks) {
        try {
            if (facebooks >= HIDE_AFTER_MS || !on()) return facebooks;
            HookStatus.counted(FamilyNames.TAP_SHOWS_CONTROLS, LONGER);
            return HIDE_AFTER_MS;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_SHOWS_CONTROLS, "controls wait", failure);
            return facebooks;
        }
    }

    /**
     * Injection point, where the tap handler reads the unified player's wait before the controls
     * hide: the wait to use, in milliseconds. Never throws.
     */
    public static int hideDelay(int facebooks) {
        return (int) hideDelay((long) facebooks);
    }
}
