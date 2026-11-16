/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
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
}
