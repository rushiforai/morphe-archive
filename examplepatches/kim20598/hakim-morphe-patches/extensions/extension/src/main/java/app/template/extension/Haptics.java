package app.template.extension;

import android.content.Context;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.View;

import app.template.extension.settings.Prefs;

/** A short, optional vibration on "Hide ratings until watched"'s reveal, gated by Mod settings. */
final class Haptics {

    private Haptics() {}

    static void tap(View anchor) {
        try {
            if (!Prefs.hapticOnReveal()) return;
            Vibrator vibrator = (Vibrator) anchor.getContext().getSystemService(Context.VIBRATOR_SERVICE);
            if (vibrator != null && vibrator.hasVibrator()) {
                vibrator.vibrate(VibrationEffect.createOneShot(18, VibrationEffect.DEFAULT_AMPLITUDE));
            }
        } catch (Throwable ignored) {
        }
    }
}
