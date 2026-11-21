package app.ra1nify.f4t.extension.keyboard;

import android.util.Log;
import android.view.View;

/**
 * Skeleton of the keyboard effects engine.
 *
 * The injected calls arrive from the stock keyboard body view; the engine is gated by the effects
 * switch and currently only records that the hook path works, so the patch can be verified before the
 * drawing logic lands. Failures must never break drawing or touch handling.
 */
public final class EffectsEngine {
    private static final String TAG = "F4T";
    private static boolean logged;

    private EffectsEngine() {
    }

    /** Called from the patched body view onTouchEvent(). */
    public static void onTouch(View view, android.view.MotionEvent event) {
        try {
            if (event == null) return;
            if (!FeatureSwitches.isKeyboardEffectsEnabled(view.getContext())) return;
            if (!logged) {
                logged = true;
                Log.i(TAG, "effects touch hook active: " + view.getClass().getName());
            }
        } catch (Throwable error) {
            Log.e(TAG, "effects touch hook failed", error);
        }
    }
}
