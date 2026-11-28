package app.onlynazril.extension.tiktok.speedonly;

import android.view.MotionEvent;
import android.view.View;

import app.onlynazril.extension.tiktok.settings.SpeedOnlySettings;

/**
 * The feed cell's guard for a hold that starts on the like or comment button.
 * <p>
 * TikTok's speed-up zone check refuses a down over either button. The patch turns that refusal
 * around and reports the point here, which marks the gesture as a button one. From then on the
 * button's own long press is silenced, and a release after the speed-up delay is turned into a
 * cancel: the running 2x stops and the button never clicks. A tap is shorter than that delay, so
 * it still likes or opens the comments.
 */
public final class SpeedOnlyTouch {
    /** TikTok schedules its 2x at 300 ms; a release at or past this is a hold, not a tap. */
    private static final long HOLD_MS = 250L;

    /** Set by [allowZone]: the down is over the like or comment button. */
    private static volatile boolean buttonZone;
    private static volatile long downAt;
    /** The switch, cached from the gesture being handled: the zone check has no context. */
    private static volatile Boolean enabled;

    private SpeedOnlyTouch() {}

    /**
     * Called from the cell root's touch dispatch before anything else. True means the release was
     * consumed here.
     */
    public static boolean consume(View root, MotionEvent event) {
        if (root == null || event == null) return false;
        boolean on = SpeedOnlySettings.isEnabled(root.getContext());
        enabled = on;
        if (!on) return false;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            buttonZone = false;
            downAt = event.getEventTime();
            return false;
        }
        if (action == MotionEvent.ACTION_CANCEL) {
            buttonZone = false;
            return false;
        }
        if (action != MotionEvent.ACTION_UP) return false;

        boolean hold = event.getEventTime() - downAt >= HOLD_MS;
        boolean swallowed = buttonZone && hold;
        buttonZone = false;
        if (!swallowed) return false;
        cancel(root, event);
        return true;
    }

    /**
     * Asked by the speed-up zone check where it would refuse the like or comment button. With the
     * switch on the point becomes a speed-up zone and the gesture is marked, so the 2x starts
     * there; with it off the refusal stands and nothing changes.
     */
    public static boolean allowZone() {
        Boolean on = enabled;
        if (on == null || !on) return false;
        buttonZone = true;
        return true;
    }

    /** Called by the button actions themselves: a long press must not fire during the hold. */
    public static boolean buttonZone() {
        return buttonZone;
    }

    /**
     * Hands the method a cancel so a running speed-up stops and the views under the finger clear
     * their press. The real release never reaches them.
     */
    private static void cancel(View root, MotionEvent event) {
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        try {
            root.dispatchTouchEvent(cancel);
        } catch (Throwable ignored) {
            // A cell torn down mid-gesture has nothing left to cancel.
        } finally {
            cancel.recycle();
        }
    }
}
