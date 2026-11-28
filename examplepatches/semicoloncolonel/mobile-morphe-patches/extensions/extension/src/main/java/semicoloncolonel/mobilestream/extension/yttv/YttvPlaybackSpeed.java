package semicoloncolonel.mobilestream.extension.yttv;

import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/**
 * Playback speed for the YouTube TV player.
 *
 * YouTube TV changes speed through one Java method on its player facade
 * (10.46.0: anti.r(float, PlayerConfigModel)): it moves itself onto the player
 * thread, clamps the rate to the allowed range, and applies it through the
 * player's own pipeline. The app calls it each time a new video loads. That
 * method now first reports itself to onSetRate() and passes its rate through
 * filterRate(), so this class can both see the player and steer the rate.
 *
 *  - "Set playback speed": filterRate() turns the app's own rate into the
 *    chosen default, so every video starts at it.
 *  - "Press and hold to speed up": holding a finger still on the player calls
 *    the same method with the hold speed; lifting it returns to the normal speed.
 */
public final class YttvPlaybackSpeed {

    private static volatile Object player;
    private static volatile Object playerConfig;
    private static volatile float ownRequest = Float.NaN;

    private static final Handler HANDLER = new Handler(Looper.getMainLooper());
    private static volatile boolean holding;
    private static boolean pending;
    private static float downX, downY;

    private static final Runnable START_HOLD = () -> {
        pending = false;
        holding = true;
        request(holdRate());
    };

    private YttvPlaybackSpeed() {}

    // Overwritten by "Press and hold to speed up" to return the chosen hold speed.
    public static float holdRate() {
        return 2f;
    }

    // Overwritten by "Set playback speed" to return the chosen speed. 0 means off.
    public static float defaultRate() {
        return 0f;
    }

    // Overwritten at patch time to call the player's speed method directly:
    // player.setRate(rate, playerConfig).
    public static void callSetRate(Object player, float rate, Object playerConfig) {
    }

    /** First thing in the player's speed method: remember the player and its config. */
    public static void onSetRate(Object speedPlayer, Object config) {
        player = speedPlayer;
        if (config != null) playerConfig = config;
    }

    /** Second thing in the player's speed method: the rate it should actually use. */
    public static float filterRate(float requested) {
        if (requested == ownRequest) {
            return requested;
        }
        float result = requested;
        if (holding) {
            result = holdRate();
        } else if (defaultRate() > 0f) {
            result = defaultRate();
        }
        return result;
    }

    private static float normalRate() {
        float rate = defaultRate();
        return rate > 0f ? rate : 1f;
    }

    private static void request(float rate) {
        Object p = player;
        if (p == null) {
            return;
        }
        ownRequest = rate;
        try {
            callSetRate(p, rate, playerConfig);
        } catch (Throwable t) {
            // The player went away; ignore.
        }
    }

    // Every touch on the watch screen, while "Press and hold to speed up" is on.
    public static void onPlayerTouch(View watchLayout, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                cancelPending();
                downX = event.getX();
                downY = event.getY();
                if (YttvPlayerTouch.inPlayer(watchLayout, event.getRawX(), event.getRawY())) {
                    pending = true;
                    HANDLER.postDelayed(START_HOLD, ViewConfiguration.getLongPressTimeout());
                }
            } else if (action == MotionEvent.ACTION_MOVE) {
                if (pending) {
                    float slop = ViewConfiguration.get(watchLayout.getContext()).getScaledTouchSlop();
                    if (Math.abs(event.getX() - downX) > slop || Math.abs(event.getY() - downY) > slop) {
                        cancelPending(); // it is a drag, not a hold
                    }
                }
            } else if (action == MotionEvent.ACTION_POINTER_DOWN) {
                cancelPending(); // second finger: pinch, not a hold
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                cancelPending();
                if (holding) {
                    holding = false;
                    request(normalRate());
                }
            }
        } catch (Throwable t) {
            // Never break the player's own touch handling.
        }
    }

    private static void cancelPending() {
        if (pending) HANDLER.removeCallbacks(START_HOLD);
        pending = false;
    }
}
