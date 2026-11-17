/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-16.
 * Written by lavinhoque33, 2026-11-14.
 */

package app.morphe.extension.music.patches;

/** The additional room beyond stock's fixed miniplayer reserve, in window coordinates. */
final class MusicGlassFloatingButtonInsets {
    private MusicGlassFloatingButtonInsets() {
    }

    static int extraRoom(int contentBottom, int miniplayerTop, int nativeMiniplayerHeight, int navigationRoom) {
        // The stock margin already includes the miniplayer and the page's edge/snackbar spacing.
        // The extended page also needs the navigation bar's room, even without a visible player.
        return Math.max(navigationRoom, contentBottom - miniplayerTop - nativeMiniplayerHeight);
    }

    static int minimumMargin(int currentMargin, int buttonBottom, int obstacleTop, int edgeSpacing) {
        return currentMargin + buttonBottom - obstacleTop + edgeSpacing;
    }

    static final class MarginState {
        private static final int MAX_CONSECUTIVE_CANCELS = 2;

        private boolean initialized;
        private int nativeMargin;
        private int lastTarget;
        private int consecutiveCancels;

        int target(int currentMargin, int room, int minimumMargin) {
            if (!initialized || currentMargin != lastTarget) {
                nativeMargin = currentMargin;
                initialized = true;
            }

            lastTarget = Math.max(nativeMargin + room, minimumMargin);
            return lastTarget;
        }

        boolean shouldDraw(boolean marginChanged, boolean layoutRequested, boolean violatesFloor) {
            if (!violatesFloor || (!marginChanged && !layoutRequested)) {
                resetDrawCancellation();
                return true;
            }
            // Stay permissive after the cap until a safe/stable transaction resets it.
            if (consecutiveCancels >= MAX_CONSECUTIVE_CANCELS) return true;

            consecutiveCancels++;
            return false;
        }

        void resetDrawCancellation() {
            consecutiveCancels = 0;
        }
    }
}
