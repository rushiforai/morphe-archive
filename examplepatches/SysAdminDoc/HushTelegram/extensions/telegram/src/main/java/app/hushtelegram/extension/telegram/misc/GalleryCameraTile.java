/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The attachment menu's photo grid starts with a live camera tile. With the switch on, Telegram
 * builds the gallery the way it does for pickers that want no camera, so the grid starts with
 * your photos and the gallery never starts the camera. A chat builds its attachment menu once and
 * keeps it, so the switch reaches a chat the next time it's opened.
 */
public final class GalleryCameraTile {
    private GalleryCameraTile() {}

    /**
     * Asked as Telegram builds an attachment gallery.
     *
     * @param wanted whether Telegram wants the camera tile in this gallery
     * @return whether the gallery gets it
     */
    public static boolean tile(boolean wanted) {
        if (!wanted || !on()) return wanted;
        HookStatus.counted(FamilyNames.HIDE_GALLERY_CAMERA_TILE, "gallery built without the camera tile");
        return false;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_GALLERY_CAMERA_TILE);
        try {
            return Utils.settingsReady() && Settings.HIDE_GALLERY_CAMERA_TILE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_GALLERY_CAMERA_TILE, "switch", failure);
            return false;
        }
    }
}
