/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import android.view.MotionEvent;
import android.view.View;

import app.pixkk.extension.core.Settings;

/**
 * Seeks where the finger is. The feed's seek bar overlay hands the controller how far the finger
 * moved since the last event and the controller adds that to the progress; here the progress is
 * put under the finger on the bar instead, as TikTok used to do.
 */
public final class SeekAtFinger {
    private static float fingerX = Float.NaN;

    private SeekAtFinger() {
    }

    /** Called with every touch the overlay over the seek bar gets. */
    public static void onOverlayTouch(MotionEvent event) {
        if (event == null) return;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            fingerX = Float.NaN;
        } else {
            fingerX = event.getRawX();
        }
    }

    /**
     * @param progress the progress TikTok worked out, from 0 to 100.
     * @param bar the seek bar the finger drags along.
     * @return the progress under the finger while one is down on the bar, otherwise {@code progress}.
     */
    public static float progressAt(float progress, View bar) {
        if (!Settings.SEEK_FOLLOWS_FINGER.get() || Float.isNaN(fingerX) || bar == null) return progress;
        int width = bar.getWidth();
        if (width <= 0) return progress;
        int[] location = new int[2];
        bar.getLocationOnScreen(location);
        float percent = (fingerX - location[0]) / width * 100f;
        if (bar.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) percent = 100f - percent;
        return Math.max(0f, Math.min(100f, percent));
    }
}
