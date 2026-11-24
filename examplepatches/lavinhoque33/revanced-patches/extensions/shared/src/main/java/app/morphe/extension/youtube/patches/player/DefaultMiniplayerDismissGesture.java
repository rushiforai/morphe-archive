/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.youtube.patches.player;

import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.youtube.shared.PlayerType;

/** Supplies the native Close action when a downward swipe on the minimized player does not dismiss it. */
final class DefaultMiniplayerDismissGesture {
    private static final Rect visibleBounds = new Rect();
    private static final int[] screenLocation = new int[2];
    private static WeakReference<View> modernClose = new WeakReference<>(null);
    private static WeakReference<View> modernControls = new WeakReference<>(null);
    private static WeakReference<View> legacyClose = new WeakReference<>(null);
    private static WeakReference<View> swipeTarget;
    private static float downX;
    private static float downY;

    private DefaultMiniplayerDismissGesture() {}

    static void setModernClose(View button) {
        modernClose = new WeakReference<>(button);
        modernControls = new WeakReference<>(button.getParent() instanceof View parent ? parent : null);
    }

    static void setLegacyClose(View button) {
        legacyClose = new WeakReference<>(button);
    }

    static void observe(View watchLayout, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN -> startSwipe(watchLayout, event.getRawX(), event.getRawY());
            case MotionEvent.ACTION_POINTER_DOWN, MotionEvent.ACTION_CANCEL -> swipeTarget = null;
            case MotionEvent.ACTION_UP -> finishSwipe(watchLayout, event.getRawX(), event.getRawY());
            default -> { }
        }
    }

    private static void startSwipe(View watchLayout, float x, float y) {
        swipeTarget = null;
        if (PlayerType.getCurrent() != PlayerType.WATCH_WHILE_MINIMIZED) return;

        View legacyButton = legacyClose.get();
        if (legacyButton != null && legacyButton.hasOnClickListeners()
                && legacyButton.getParent() instanceof View controls && contains(watchLayout, controls, x, y)) {
            swipeTarget = legacyClose;
        } else {
            View modernButton = modernClose.get();
            if (modernButton != null && modernButton.hasOnClickListeners()
                    && contains(watchLayout, modernControls.get(), x, y)) {
                swipeTarget = modernClose;
            }
        }

        downX = x;
        downY = y;
    }

    private static boolean contains(View watchLayout, View controls, float x, float y) {
        if (controls == null || !controls.isShown() || !controls.isAttachedToWindow()
                || controls.getWindowToken() != watchLayout.getWindowToken()
                || !controls.getLocalVisibleRect(visibleBounds)) return false;

        controls.getLocationOnScreen(screenLocation);
        return visibleBounds.contains((int) (x - screenLocation[0]), (int) (y - screenLocation[1]));
    }

    private static void finishSwipe(View watchLayout, float x, float y) {
        WeakReference<View> target = swipeTarget;
        swipeTarget = null;
        if (target == null) return;

        float distanceY = y - downY;
        if (distanceY < Dim.dp(32) || distanceY < 1.5f * Math.abs(x - downX)) return;

        // Let YouTube process the original event first. If it already closed or started dismissing,
        // do not duplicate the action. All other gestures are passed to YouTube unchanged.
        watchLayout.post(() -> {
            View button = target.get();
            if (button != null && (target == modernClose || target == legacyClose)
                    && watchLayout.isAttachedToWindow()
                    && PlayerType.getCurrent() == PlayerType.WATCH_WHILE_MINIMIZED) {
                button.performClick();
            }
        });
    }
}
