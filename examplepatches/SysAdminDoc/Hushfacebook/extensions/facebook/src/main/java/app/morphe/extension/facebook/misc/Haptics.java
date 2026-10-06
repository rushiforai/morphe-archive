/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.os.VibrationAttributes;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.View;

import androidx.annotation.RequiresApi;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Turn off haptics patch asks each time Facebook plays a haptic.
 *
 * <p>Facebook plays its short vibrations, on a like, the reactions bar, a comment, a drag to put
 * something in order, scrubbing a reel and more, through {@code View.performHapticFeedback}, and
 * about forty more methods, the top bar's buttons among them, hand an effect to the vibrator
 * themselves. The patch sends every one of those calls here. While the switch is on they don't
 * play, and the View call answers false, as Android does for a view whose haptics are off. The
 * keyboard's and the phone's own haptics never pass through Facebook's code, and a ring or a
 * notification's buzz is a timed or patterned vibration the patch leaves alone, so they stay.
 *
 * <p>Off, paused, settings that aren't ready yet, or a failure in here, and they play as Facebook
 * asked.
 */
public final class Haptics {
    /** The diagnostic counter route: each haptic Facebook asked for, and the ones held back. */
    static final String ROUTE = "Haptics";

    private Haptics() {
    }

    /** Injection point, in place of each of Facebook's {@code View.performHapticFeedback(int)} calls. */
    public static boolean performHapticFeedback(View view, int feedbackConstant) {
        if (holdsBack("view haptic")) return false;
        return view.performHapticFeedback(feedbackConstant);
    }

    /** Injection point, in place of each of Facebook's {@code View.performHapticFeedback(int, int)} calls. */
    public static boolean performHapticFeedback(View view, int feedbackConstant, int flags) {
        if (holdsBack("view haptic")) return false;
        return view.performHapticFeedback(feedbackConstant, flags);
    }

    /** Injection point, in place of each of Facebook's {@code Vibrator.vibrate(VibrationEffect)} calls. */
    public static void vibrate(Vibrator vibrator, VibrationEffect effect) {
        if (holdsBack("vibration")) return;
        vibrator.vibrate(effect);
    }

    /** Injection point, in place of each {@code Vibrator.vibrate(VibrationEffect, VibrationAttributes)} call. */
    @RequiresApi(33)
    public static void vibrate(Vibrator vibrator, VibrationEffect effect, VibrationAttributes attributes) {
        if (holdsBack("vibration")) return;
        vibrator.vibrate(effect, attributes);
    }

    /** True when the switch holds back the haptic Facebook asked for, counted under [what]. Never throws. */
    private static boolean holdsBack(String what) {
        try {
            HookStatus.invoked(FamilyNames.HAPTICS);
            FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.sawKind(ROUTE, what);
            if (!Utils.settingsReady() || !Settings.TURN_OFF_HAPTICS.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, "held back");
            Logger.printDebug(() -> "Turn off haptics: held back a " + what);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HAPTICS, what, failure);
            return false;
        }
    }
}
