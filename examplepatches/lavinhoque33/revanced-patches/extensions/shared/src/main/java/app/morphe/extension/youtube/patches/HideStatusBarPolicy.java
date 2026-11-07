/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */

package app.morphe.extension.youtube.patches;

/**
 * When the status bar is hidden again after the window gets the focus back.
 */
public final class HideStatusBarPolicy {

    private HideStatusBarPolicy() {
    }

    /**
     * @param windowHasFocus If the window has the focus when the hide request runs. A dialog, the launcher
     *                       or another app can take it again before the posted request runs.
     * @param pictureInPicture The activity is in picture in picture, which has no status bar to hide.
     * @param multiWindow The activity shares the screen, where the system decides about the status bar.
     * @param finishing The activity is finishing or destroyed.
     */
    public static boolean shouldRehideOnFocus(boolean windowHasFocus, boolean pictureInPicture,
                                              boolean multiWindow, boolean finishing) {
        return windowHasFocus && !pictureInPicture && !multiWindow && !finishing;
    }
}
