package com.anderson.applemusic.one.widget;

import android.os.Bundle;
import android.view.View;
import android.widget.ScrollView;

/**
 * Remembers a {@link ScrollView} position as a fraction of its scroll range, so a rotation
 * that changes the card sizes (portrait ↔ landscape) keeps the same place in the list
 * instead of an absolute pixel offset that could overshoot the new content.
 *
 * <p>The restore is deferred: the freshly rebuilt screen only has a range after its layout
 * pass, so the fraction is applied on a later frame.
 */
public final class ScrollMemory {

    /** Frames to wait for the content to be measured before giving up. */
    private static final int MAX_FRAMES = 12;

    private ScrollMemory() {
    }

    public static void save(Bundle out, String key, ScrollView scroll) {
        if (out == null || scroll == null) return;
        out.putFloat(key, fraction(scroll));
    }

    /** Current position as a fraction of the scroll range (0 when there is no range yet). */
    public static float fraction(ScrollView scroll) {
        if (scroll == null) return 0f;
        View content = scroll.getChildAt(0);
        int range = content == null ? 0 : content.getHeight() - scroll.getHeight();
        if (range <= 0) return 0f;
        return Math.max(0f, Math.min(1f, scroll.getScrollY() / (float) range));
    }

    public static void restore(final ScrollView scroll, final float fraction) {
        if (scroll == null || fraction <= 0f) return;
        scroll.post(new Runnable() {
            private int attempts;

            @Override
            public void run() {
                View content = scroll.getChildAt(0);
                int range = content == null ? 0 : content.getHeight() - scroll.getHeight();
                if (range <= 0 && attempts++ < MAX_FRAMES) {
                    scroll.postOnAnimation(this);
                    return;
                }
                scroll.scrollTo(0, Math.round(fraction * Math.max(0, range)));
            }
        });
    }
}
