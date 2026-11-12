package app.keyboardspeed.extension;

import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.EditText;

/**
 * Hardware keyboard shortcuts of the video player: playback speed, comments, fullscreen and minimize.
 * <p>
 * Each shortcut is enabled by its own patch, which changes the matching method below at patch time.
 */
@SuppressWarnings("unused")
public final class KeyboardShortcutsPatch {
    private static final String TAG = "KeyboardShortcuts";

    private KeyboardShortcutsPatch() {
    }

    // region Changed at patch time by the patch of each shortcut.

    private static boolean isSpeedEnabled() {
        return false;
    }

    private static boolean isCommentsEnabled() {
        return false;
    }

    private static boolean isFullscreenEnabled() {
        return false;
    }

    private static boolean isMinimizeEnabled() {
        return false;
    }

    // endregion

    /**
     * Injection point.
     *
     * @return Whether the event was consumed.
     */
    public static boolean dispatchKeyEvent(Activity activity, KeyEvent event) {
        try {
            // Leave shortcuts such as Ctrl+= and any text input (search, comments) alone.
            if (event.isCtrlPressed() || event.isAltPressed() || event.isMetaPressed()
                    || activity.getCurrentFocus() instanceof EditText) {
                return false;
            }

            return (isSpeedEnabled() && KeyboardSpeedPatch.handleKey(activity, event))
                    || (isCommentsEnabled() && KeyboardCommentsPatch.handleKey(activity, event))
                    || (isFullscreenEnabled() && KeyboardFullscreenPatch.handleKey(activity, event))
                    || (isMinimizeEnabled() && KeyboardMinimizePatch.handleKey(activity, event));
        } catch (Exception ex) {
            Log.e(TAG, "dispatchKeyEvent failure", ex);
            return false;
        }
    }

    /**
     * @return If the event is the key, and acts only on the first press, not on its release or repeats.
     */
    static boolean isFirstPress(KeyEvent event) {
        return event.getAction() == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0;
    }
}
