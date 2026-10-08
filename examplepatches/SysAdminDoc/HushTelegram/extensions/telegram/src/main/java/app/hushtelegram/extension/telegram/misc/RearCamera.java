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
 * The attachment menu's camera starts on the lens Telegram picks for it: the one that was on
 * before a photo last opened over the gallery, or the front lens when you're choosing a profile
 * picture. With the switch on it starts on the rear lens each time the camera comes up, and the
 * flip button still switches lenses while it's open.
 */
public final class RearCamera {
    private RearCamera() {}

    /**
     * Asked as the attachment camera is built, before it picks a lens.
     *
     * @param front Telegram's choice, true for the front lens
     * @return the lens to start on, true for the front
     */
    public static boolean front(boolean front) {
        if (!front || !on()) return front;
        HookStatus.counted(FamilyNames.REAR_CAMERA_FIRST, "camera started on the rear lens");
        return false;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.REAR_CAMERA_FIRST);
        try {
            return Utils.settingsReady() && Settings.REAR_CAMERA_FIRST.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REAR_CAMERA_FIRST, "switch", failure);
            return false;
        }
    }
}
