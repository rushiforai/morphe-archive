package app.template.extension;

import android.view.HapticFeedbackConstants;
import android.view.View;

import app.template.extension.settings.Prefs;

/** Optional system haptic feedback for the ratings reveal. */
final class Haptics {
    private Haptics() {}

    static void tap(View anchor) {
        if (Prefs.hapticOnReveal()) anchor.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
    }
}
