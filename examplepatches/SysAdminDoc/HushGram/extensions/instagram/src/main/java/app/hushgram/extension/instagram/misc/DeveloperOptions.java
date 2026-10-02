/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Open developer options" patch.
 *
 * <p>A long press on the Home tab asks {@link #open} first. While the switch is on, the patch opens
 * Instagram's own developer options instead, through the opener its settings link and debug button
 * use. Those options hold Instagram's server flag screens (MetaConfig and quick experiments), where
 * a flag can be looked at and overridden on this phone.
 */
public final class DeveloperOptions {
    private DeveloperOptions() {
    }

    /**
     * Injected first thing in the Home tab's long press. Answers 1 while the switch is on, and the
     * patch opens the developer options and ends the press. Otherwise 0, and the long press does
     * what it did. Never throws, and never waits for the settings: before they're ready it's 0.
     */
    public static int open() {
        try {
            HookStatus.invoked(FamilyNames.DEVELOPER_OPTIONS);
            if (!Utils.settingsReady() || !Settings.OPEN_DEVELOPER_OPTIONS.get()) return 0;
            Logger.printDebug(() -> "Developer options: opened from a long press of Home");
            return 1;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DEVELOPER_OPTIONS, "long press", failure);
            return 0;
        }
    }
}
