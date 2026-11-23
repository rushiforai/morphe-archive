package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.media.AudioAttributes;
import android.os.Build;
import android.os.VibrationAttributes;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;
import android.view.HapticFeedbackConstants;
import android.view.View;

public final class GboardHapticHelper {
    private static final String TAG = "GboardHaptics";
    private static final int USAGE_IME_FEEDBACK_INT = 18;

    private GboardHapticHelper() {}

    public static void vibrateKeypress(Object vibratorObj, int value, View view) {
        if (value <= 0) {
            return;
        }

        Vibrator vibrator = null;
        if (vibratorObj instanceof Vibrator) {
            vibrator = (Vibrator) vibratorObj;
        }

        boolean vibrated = false;
        if (vibrator != null && vibrator.hasVibrator()) {
            try {
                long duration = Math.min(100L, Math.max(5L, (long) value));

                VibrationEffect effect;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    boolean hasAmp = false;
                    try {
                        hasAmp = vibrator.hasAmplitudeControl();
                    } catch (Throwable ignored) {}

                    if (hasAmp) {
                        int amp = Math.min(255, Math.max(1, (value * 255) / 100));
                        effect = VibrationEffect.createOneShot(duration, amp);
                    } else {
                        effect = VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE);
                    }

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        try {
                            VibrationAttributes attrs = new VibrationAttributes.Builder()
                                    .setUsage(USAGE_IME_FEEDBACK_INT)
                                    .setFlags(1, 1)
                                    .build();
                            vibrator.vibrate(effect, attrs);
                            vibrated = true;
                        } catch (Throwable t) {
                            vibrator.vibrate(effect);
                            vibrated = true;
                        }
                    } else {
                        try {
                            AudioAttributes audioAttrs = new AudioAttributes.Builder()
                                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                                    .setUsage(AudioAttributes.USAGE_ASSISTANCE_SONIFICATION)
                                    .setFlags(AudioAttributes.FLAG_AUDIBILITY_ENFORCED)
                                    .build();
                            vibrator.vibrate(effect, audioAttrs);
                            vibrated = true;
                        } catch (Throwable t) {
                            vibrator.vibrate(effect);
                            vibrated = true;
                        }
                    }
                } else {
                    vibrator.vibrate(duration);
                    vibrated = true;
                }
            } catch (Throwable t) {
                Log.w(TAG, "Direct vibration failed, falling back to HapticFeedback", t);
            }
        }

        if (!vibrated && view != null) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    view.performHapticFeedback(
                            HapticFeedbackConstants.KEYBOARD_TAP,
                            HapticFeedbackConstants.FLAG_IGNORE_VIEW_SETTING
                                    | HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING);
                } else {
                    view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                }
            } catch (Throwable ignored) {}
        }
    }

    public static void vibratePreview(Context context, int value) {
        if (value <= 0 || context == null) return;
        try {
            Vibrator vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
            vibrateKeypress(vibrator, value, null);
        } catch (Throwable ignored) {}
    }
}
