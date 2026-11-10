// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.slideshow;

import android.content.Context;
import android.view.MotionEvent;
import android.widget.ScrollView;

/**
 * Scrolls a post's text while it can, and leaves the swipe to the page's list at its ends, and to the post pager
 * when it goes sideways.
 */
final class EdgeScrollView extends ScrollView {
    private float startX;
    private float startY;
    private float lastY;

    EdgeScrollView(Context context) {
        super(context);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                // The list and the pager saw the touch start; a quick flick would be theirs on its first move,
                // before the text moves.
                startX = event.getX();
                startY = event.getY();
                lastY = event.getY();
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(canScrollVertically(1) || canScrollVertically(-1));
                }
                break;
            case MotionEvent.ACTION_MOVE:
                float dy = event.getY() - lastY;
                lastY = event.getY();
                boolean vertical = Math.abs(event.getY() - startY) > Math.abs(event.getX() - startX);
                if (getParent() != null) {
                    if (!vertical) {
                        getParent().requestDisallowInterceptTouchEvent(false);
                    } else if (dy != 0f) {
                        getParent().requestDisallowInterceptTouchEvent(canScrollVertically(dy < 0 ? 1 : -1));
                    }
                }
                break;
            default:
                break;
        }
        return super.dispatchTouchEvent(event);
    }
}
