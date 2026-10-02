/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** Helper for the "Remove build expired popup" patch. */
public final class BuildExpiry {

    private BuildExpiry() {}

    /**
     * Asked at the start of the method that shows the screen saying this version of Instagram is
     * too old to use. True makes it return before it shows anything. False while the switch is off,
     * HushGram is paused or the settings aren't ready. Never throws.
     */
    public static boolean suppress() {
        HookStatus.invoked(FamilyNames.BUILD_EXPIRED_POPUP);
        try {
            return Utils.settingsReady() && Settings.REMOVE_BUILD_EXPIRED_POPUP.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BUILD_EXPIRED_POPUP, "switch read", t);
            return false;
        }
    }
}
