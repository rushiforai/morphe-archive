/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.ViewConfiguration;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * When the last tap on a Facebook screen ended.
 *
 * <p>Every touch on a Facebook activity passes through {@code FbFragmentActivity.dispatchTouchEvent},
 * and the patch hands each one here before Facebook sees it. A tap is a finger that went down and
 * came up again without moving further than the touch slop, however long it stayed: a quick tap and
 * a long press both count, a scroll, a fling or a second finger don't. Only the time the finger came
 * up is kept, on the clock {@link MotionEvent#getEventTime()} uses. A later non-tap gesture
 * invalidates that tap, so swiping to another video can't borrow it.
 *
 * <p>It only reads the event. It never changes, consumes or recycles one, and the hook returns
 * nothing, so Facebook gets every event exactly as it was.
 */
public final class TapClock {
    static final long NO_TAP = Long.MIN_VALUE;

    /** The slop a test asks for, or -1 for the activity's own. */
    static volatile int slopForTests = -1;

    private static volatile long lastTapUp = NO_TAP;
    private static int slop = -1;
    private static boolean tracking;
    private static boolean moved;
    private static float downX;
    private static float downY;

    private TapClock() { }

    /** The hook, first thing in FbFragmentActivity.dispatchTouchEvent. */
    public static void touch(Activity activity, MotionEvent event) {
        try {
            if (event == null) return;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) HookStatus.bound(FamilyNames.TAP_TO_PLAY, "tap clock");
            record(action, event.getX(), event.getY(), event.getEventTime(), slop(activity));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY, "tap clock", failure);
        }
    }

    static synchronized void record(int action, float x, float y, long time, int touchSlop) {
        switch (action) {
            case MotionEvent.ACTION_DOWN:
                tracking = true;
                moved = false;
                downX = x;
                downY = y;
                break;
            case MotionEvent.ACTION_POINTER_DOWN:
                // A second finger makes a pinch or a zoom, not a tap.
                invalidateTap();
                break;
            case MotionEvent.ACTION_MOVE:
                if (tracking && beyond(x, y, touchSlop)) invalidateTap();
                break;
            case MotionEvent.ACTION_UP:
                if (tracking && !moved && !beyond(x, y, touchSlop)) lastTapUp = time;
                else if (tracking) invalidateTap();
                tracking = false;
                break;
            case MotionEvent.ACTION_CANCEL:
                invalidateTap();
                tracking = false;
                break;
            default:
                break;
        }
    }

    private static void invalidateTap() {
        lastTapUp = NO_TAP;
        if (!moved) TapToPlay.nonTapGesture();
        moved = true;
    }

    private static boolean beyond(float x, float y, int touchSlop) {
        float dx = x - downX;
        float dy = y - downY;
        return dx * dx + dy * dy > (float) touchSlop * touchSlop;
    }

    /** The touch slop in pixels, read once from the first activity that asks. */
    private static int slop(Activity activity) {
        int forTests = slopForTests;
        if (forTests >= 0) return forTests;
        if (slop < 0 && activity != null) slop = ViewConfiguration.get(activity).getScaledTouchSlop();
        return Math.max(slop, 0);
    }

    /** How long ago the last tap ended, or -1 when none has, or the clock reads earlier than it. */
    static long msSinceTap(long now) {
        long at = lastTapUp;
        if (at == NO_TAP || now < at) return -1;
        return now - at;
    }

    static synchronized void forget() {
        lastTapUp = NO_TAP;
        tracking = false;
        moved = false;
        slop = -1;
    }
}
