package app.keyboardspeed.extension;

import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.EditText;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Changes the playback speed with the - and = keys of a hardware keyboard.
 * <p>
 * The speed is changed through the playback speed code of the official Morphe YouTube patches,
 * which this bundle is applied together with. Those classes are looked up by reflection,
 * so if they are missing or renamed the keys keep their default behavior instead of crashing.
 */
@SuppressWarnings("unused")
public final class KeyboardSpeedPatch {
    private static final String TAG = "KeyboardSpeedPatch";

    private static final String VIDEO_INFORMATION_CLASS = "app.morphe.extension.youtube.patches.VideoInformation";
    private static final String PLAYER_TYPE_CLASS = "app.morphe.extension.youtube.shared.PlayerType";

    private static final int MINIMUM_SPEED = 25;
    private static final int MAXIMUM_SPEED = 800;

    private static boolean initialized;
    private static Method getPlaybackSpeed;
    private static Method changePlaybackSpeed;
    private static Method getCurrentPlayerType;
    private static Method isMaximizedOrFullscreen;

    private static Toast lastToast;

    /**
     * Speed change per key press, in hundredths of 1x.
     * The body is replaced at patch time with the step chosen in the patch options.
     */
    private static int getSpeedStep() {
        return 25;
    }

    /**
     * Injection point.
     *
     * @return Whether the event was consumed.
     */
    public static boolean dispatchKeyEvent(Activity activity, KeyEvent event) {
        try {
            final int direction;
            switch (event.getKeyCode()) {
                case KeyEvent.KEYCODE_MINUS:
                case KeyEvent.KEYCODE_NUMPAD_SUBTRACT:
                    direction = -1;
                    break;
                case KeyEvent.KEYCODE_EQUALS:
                case KeyEvent.KEYCODE_PLUS:
                case KeyEvent.KEYCODE_NUMPAD_ADD:
                    direction = 1;
                    break;
                default:
                    return false;
            }

            // Leave shortcuts such as Ctrl+= and any text input (search, comments) alone.
            if (event.isCtrlPressed() || event.isAltPressed() || event.isMetaPressed()
                    || activity.getCurrentFocus() instanceof EditText
                    || !initialize()
                    || !isPlayerOpen()) {
                return false;
            }

            if (event.getAction() == KeyEvent.ACTION_DOWN) {
                final int step = getSpeedStep();
                final int currentSpeed = Math.round((float) getPlaybackSpeed.invoke(null) * 100);

                // Snap to the step grid, so 1.1x goes to 1.25x or 1.0x with a 0.25x step.
                final int snappedSpeed = direction > 0
                        ? (currentSpeed / step + 1) * step
                        : ((currentSpeed + step - 1) / step - 1) * step;
                final float newSpeed = Math.max(MINIMUM_SPEED, Math.min(MAXIMUM_SPEED, snappedSpeed)) / 100f;

                changePlaybackSpeed.invoke(null, newSpeed);
                showSpeedToast(activity, newSpeed);
            }

            return true;
        } catch (Exception ex) {
            Log.e(TAG, "dispatchKeyEvent failure", ex);
            return false;
        }
    }

    /**
     * @return Whether the Morphe playback speed classes are available.
     */
    private static boolean initialize() {
        if (!initialized) {
            initialized = true;
            try {
                ClassLoader classLoader = KeyboardSpeedPatch.class.getClassLoader();
                Class<?> videoInformation = Class.forName(VIDEO_INFORMATION_CLASS, true, classLoader);
                getPlaybackSpeed = videoInformation.getMethod("getPlaybackSpeed");
                changePlaybackSpeed = videoInformation.getMethod("changePlaybackSpeed", float.class);
            } catch (Exception ex) {
                Log.e(TAG, "Morphe playback speed classes not found, apply this together with the Morphe YouTube patches", ex);
                getPlaybackSpeed = null;
                changePlaybackSpeed = null;
            }

            try {
                ClassLoader classLoader = KeyboardSpeedPatch.class.getClassLoader();
                Class<?> playerType = Class.forName(PLAYER_TYPE_CLASS, true, classLoader);
                getCurrentPlayerType = playerType.getMethod("getCurrent");
                isMaximizedOrFullscreen = playerType.getMethod("isMaximizedOrFullscreen");
            } catch (Exception ex) {
                // Not required, the keys then also work while the player is minimized.
                Log.w(TAG, "Morphe player type class not found", ex);
                getCurrentPlayerType = null;
                isMaximizedOrFullscreen = null;
            }
        }

        return changePlaybackSpeed != null;
    }

    private static boolean isPlayerOpen() throws Exception {
        if (getCurrentPlayerType == null) {
            return true;
        }

        Object current = getCurrentPlayerType.invoke(null);
        return current != null && (boolean) isMaximizedOrFullscreen.invoke(current);
    }

    private static void showSpeedToast(Activity activity, float speed) {
        String text = String.format(Locale.US, "%.2f", speed)
                .replaceAll("0+$", "")
                .replaceAll("\\.$", "") + "x";

        // Cancel the previous toast, so holding a key does not queue up a toast per step.
        if (lastToast != null) {
            lastToast.cancel();
        }
        lastToast = Toast.makeText(activity, text, Toast.LENGTH_SHORT);
        lastToast.show();
    }
}
