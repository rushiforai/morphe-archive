package app.keyboardspeed.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;

/**
 * Enters and exits fullscreen with a key of a hardware keyboard.
 * <p>
 * Uses the fullscreen controller that the official Morphe YouTube patches hook, and otherwise
 * taps the fullscreen button of the player, which works even if the button is hidden.
 */
@SuppressWarnings("unused")
public final class KeyboardFullscreenPatch {
    private static final String TAG = "KeyboardFullscreen";

    private KeyboardFullscreenPatch() {
    }

    /**
     * Key code of the shortcut.
     * The body is replaced at patch time with the key chosen in the patch options.
     */
    static int getKeyCode() {
        return KeyEvent.KEYCODE_F;
    }

    /**
     * @return Whether the event was consumed.
     */
    static boolean handleKey(Activity activity, KeyEvent event) {
        if (event.getKeyCode() != getKeyCode() || !Morphe.isPlayerOpen()) {
            return false;
        }

        if (KeyboardShortcutsPatch.isFirstPress(event)) {
            final boolean enter = !Morphe.isPlayerFullscreen();
            if (!Morphe.setFullscreen(enter) && !clickFullscreenButton(activity)) {
                Log.w(TAG, "Could not toggle fullscreen");
            }
        }
        return true;
    }

    @SuppressLint("DiscouragedApi")
    private static boolean clickFullscreenButton(Activity activity) {
        int id = activity.getResources().getIdentifier("fullscreen_button", "id", activity.getPackageName());
        View button = id == 0 ? null : activity.findViewById(id);
        return button != null && button.performClick();
    }
}
