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
 * A swipe to the right goes back from anywhere on a profile except two places that keep it for
 * themselves: the photo gallery, where it shows the previous photo, and the shared media tabs past
 * the first, where it shows the previous tab. The profile asks whether a touch lands in either place,
 * and each answer comes here first. A swipe to the left still goes to the next photo or tab, and the
 * media list's own refusals (selecting, animating) stay Telegram's.
 */
public final class SwipeBack {
    private SwipeBack() {}

    /**
     * Asked with the profile's answer to whether a touch lands on its photos or on a media tab past the first.
     *
     * @param inside Telegram's answer
     * @return whether the profile keeps the swipe
     */
    public static boolean touchBlocks(boolean inside) {
        HookStatus.invoked(FamilyNames.SWIPE_BACK_ON_PROFILES);
        return inside && !goesBack();
    }

    /** Whether a swipe on the photos or the media tabs goes back. */
    static boolean goesBack() {
        try {
            if (!Utils.settingsReady() || !Settings.SWIPE_BACK_ON_PROFILES.get()) return false;
            HookStatus.counted(FamilyNames.SWIPE_BACK_ON_PROFILES, "profile swipe sent back");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SWIPE_BACK_ON_PROFILES, "profile swipe", failure);
            return false;
        }
    }
}
