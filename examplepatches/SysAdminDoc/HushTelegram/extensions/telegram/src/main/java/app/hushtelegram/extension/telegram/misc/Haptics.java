/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.Build;
import android.os.VibrationAttributes;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.View;
import androidx.annotation.RequiresApi;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram buzzes the phone for taps, long presses, swipes and wrong entries. Every one of those
 * calls comes here instead, and with the switch on nothing vibrates. Incoming calls keep their own
 * vibration, and notifications vibrate the way Telegram's notification settings say.
 */
public final class Haptics {
    private Haptics() {}

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean quiet() {
        HookStatus.invoked(FamilyNames.NO_HAPTICS);
        try {
            return Utils.settingsReady() && Settings.NO_HAPTICS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.NO_HAPTICS, "switch", failure);
            return false;
        }
    }

    /** In place of View.performHapticFeedback(int). */
    public static boolean tap(View view, int type) {
        return !quiet() && view.performHapticFeedback(type);
    }

    /** In place of View.performHapticFeedback(int, int). */
    public static boolean tapWithFlags(View view, int type, int flags) {
        return !quiet() && view.performHapticFeedback(type, flags);
    }

    /** In place of Vibrator.vibrate(long). */
    @SuppressWarnings("deprecation")
    public static void buzz(Vibrator vibrator, long milliseconds) {
        if (!quiet()) vibrator.vibrate(milliseconds);
    }

    /** In place of Vibrator.vibrate(long[], int). */
    @SuppressWarnings("deprecation")
    public static void buzzPattern(Vibrator vibrator, long[] pattern, int repeat) {
        if (!quiet()) vibrator.vibrate(pattern, repeat);
    }

    /** In place of Vibrator.vibrate(VibrationEffect). */
    public static void buzzEffect(Vibrator vibrator, VibrationEffect effect) {
        if (!quiet()) vibrator.vibrate(effect);
    }

    /** In place of Vibrator.vibrate(VibrationEffect, VibrationAttributes), which Telegram only calls on Android 13 and up. */
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    public static void buzzEffectWith(Vibrator vibrator, VibrationEffect effect, VibrationAttributes attributes) {
        if (!quiet()) vibrator.vibrate(effect, attributes);
    }
}
