package app.keyboardspeed.extension;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.KeyEvent;

import java.lang.ref.WeakReference;

/**
 * Minimizes the open video to the miniplayer with a key of a hardware keyboard (Esc by default).
 * <p>
 * Back minimizes the player, but first closes an open panel (such as the comments) and exits fullscreen,
 * so back is repeated until the player is minimized.
 */
@SuppressWarnings("unused")
public final class KeyboardMinimizePatch {
    private static final String TAG = "KeyboardMinimize";

    /**
     * Time for the player to change after a back, such as the fullscreen exit animation.
     */
    private static final long BACK_STEP_DELAY_MS = 250;

    /**
     * Panel, fullscreen, player: three backs are needed at most, with one extra for nested panels.
     */
    private static final int MAX_BACK_STEPS = 4;

    private static final Handler handler = new Handler(Looper.getMainLooper());

    /**
     * Incremented by each key press, so the steps of a previous press stop.
     */
    private static int minimizeRequest;

    private KeyboardMinimizePatch() {
    }

    /**
     * Key code of the shortcut.
     * The body is replaced at patch time with the key chosen in the patch options.
     */
    static int getKeyCode() {
        return KeyEvent.KEYCODE_ESCAPE;
    }

    /**
     * @return Whether the event was consumed.
     */
    static boolean handleKey(Activity activity, KeyEvent event) {
        // Without an open video, the key keeps its default action, such as Esc going back.
        if (event.getKeyCode() != getKeyCode() || !Morphe.isPlayerOpen()) {
            return false;
        }

        if (KeyboardShortcutsPatch.isFirstPress(event)) {
            minimize(new WeakReference<>(activity), ++minimizeRequest, MAX_BACK_STEPS);
        }
        return true;
    }

    private static void minimize(WeakReference<Activity> activityRef, int request, int stepsLeft) {
        Activity activity = activityRef.get();
        if (activity == null || request != minimizeRequest || activity.isFinishing()) {
            return;
        }

        String playerType = Morphe.getPlayerType();
        if (playerType == null) {
            // The player type is not known, so only one back is done, which minimizes a player without a panel.
            activity.onBackPressed();
            return;
        }
        if (!playerType.equals("WATCH_WHILE_MAXIMIZED") && !playerType.equals("WATCH_WHILE_FULLSCREEN")) {
            return; // Minimized, or the player was closed.
        }
        if (stepsLeft <= 0) {
            Log.w(TAG, "Player did not minimize, player type: " + playerType);
            return;
        }

        activity.onBackPressed();
        handler.postDelayed(() -> minimize(activityRef, request, stepsLeft - 1), BACK_STEP_DELAY_MS);
    }
}
