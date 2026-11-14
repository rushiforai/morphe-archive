package app.template.extension;

import android.content.Context;
import android.os.VibrationAttributes;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.provider.Settings;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Tracks the displayed half-star step for the duration of a native rating drag. */
public final class RatingHaptics {
    private static final WeakHashMap<Object, Drag> DRAGS = new WeakHashMap<>();

    private RatingHaptics() {}

    public static void onTouch(Object listener, View view, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                DRAGS.put(listener, new Drag(view));
                break;
            case MotionEvent.ACTION_MOVE:
                break;
            default:
                DRAGS.remove(listener);
        }
    }

    public static void onStep(Object listener, long halfStars) {
        Drag drag = DRAGS.get(listener);
        if (drag == null || halfStars == drag.lastStep || halfStars < 0 || halfStars > 10) return;
        drag.lastStep = halfStars;
        View view = drag.view.get();
        if (view == null || !view.isHapticFeedbackEnabled()) return;

        Context context = view.getContext();
        if (Settings.System.getInt(context.getContentResolver(), Settings.System.HAPTIC_FEEDBACK_ENABLED, 1) == 0) return;
        VibratorManager manager = context.getSystemService(VibratorManager.class);
        Vibrator vibrator = manager == null ? null : manager.getDefaultVibrator();
        if (android.os.Build.VERSION.SDK_INT >= 33 && vibrator != null && vibrator.hasAmplitudeControl()) {
            int amplitude = 35 + 8 * (int) halfStars;
            vibrator.vibrate(VibrationEffect.createOneShot(12, amplitude),
                    VibrationAttributes.createForUsage(VibrationAttributes.USAGE_TOUCH));
        } else {
            view.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        }
    }

    private static final class Drag {
        final WeakReference<View> view;
        long lastStep = -1;

        Drag(View view) {
            this.view = new WeakReference<>(view);
        }
    }
}
