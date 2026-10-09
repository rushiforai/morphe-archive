package app.pyflat.extension.disney;

import android.os.SystemClock;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;

import androidx.media3.common.Player;

import java.lang.ref.WeakReference;

import app.pyflat.extension.shared.HoldToSpeedUpController;

@SuppressWarnings("unused")
public final class HoldToSpeedUpPatch {

    private static WeakReference<Player> player = new WeakReference<>(null);
    private static HoldToSpeedUpController controller;
    private static ScaleGestureDetector scaleDetector;
    private static GestureDetector gestureDetector;

    /** Injection point. */
    public static void setPlayer(Object exoPlayer) {
        if (exoPlayer instanceof Player) {
            player = new WeakReference<>((Player) exoPlayer);
        }
    }

    /** Injection point. Replaces forwarding the player surface touches to the detectors. */
    public static void onTouch(View view, MotionEvent event,
                               ScaleGestureDetector scale, GestureDetector gesture) {
        if (controller == null) {
            controller = new HoldToSpeedUpController(
                    () -> player.get(),
                    HoldToSpeedUpPatch::cancelDetectors,
                    getSpeed(),
                    getHoldDelayMs()
            );
        }
        scaleDetector = scale;
        gestureDetector = gesture;

        if (controller.onTouchEvent(view, event)) return;

        scale.onTouchEvent(event);
        gesture.onTouchEvent(event);
    }

    // Otherwise releasing the hold is handled as a tap and toggles the controls.
    private static void cancelDetectors() {
        long now = SystemClock.uptimeMillis();
        MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, 0f, 0f, 0);
        if (scaleDetector != null) scaleDetector.onTouchEvent(cancel);
        if (gestureDetector != null) gestureDetector.onTouchEvent(cancel);
        cancel.recycle();
    }

    // Overridden by patch options.
    private static float getSpeed() {
        return 2.0f;
    }

    // Overridden by patch options.
    private static long getHoldDelayMs() {
        return 400L;
    }
}
