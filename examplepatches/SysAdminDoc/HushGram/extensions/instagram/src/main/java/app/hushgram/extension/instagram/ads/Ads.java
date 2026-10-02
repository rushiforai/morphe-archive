/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.ads;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** Helper for the "Hide ads" patch. */
public final class Ads {

    private Ads() {}

    /**
     * Asked at the start of the method that puts a sponsored item into a feed. True makes it
     * answer that nothing went in, so the item isn't shown and no gap is left. False while the
     * switch is off, HushGram is paused or the settings aren't ready. Never throws.
     */
    public static boolean hide() {
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        try {
            return Utils.settingsReady() && Settings.HIDE_ADS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "switch read", t);
            return false;
        }
    }
}
