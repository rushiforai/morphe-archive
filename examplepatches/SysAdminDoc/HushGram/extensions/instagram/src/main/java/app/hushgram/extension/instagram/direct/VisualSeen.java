/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** Decides whether the visual-only DM receipt should complete locally without being sent. */
public final class VisualSeen {
    private VisualSeen() {}

    /** Default off. Paused, before settings load or on a failed read, Instagram's request proceeds. */
    public static boolean hold() {
        try {
            HookStatus.invoked(FamilyNames.DM_MEDIA_SEEN);
            boolean held = Utils.settingsReady() && Settings.VIEW_DM_MEDIA_ANONYMOUSLY.get();
            if (held) Logger.printDebug(() -> "DM photos and videos: opened receipt held back");
            return held;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DM_MEDIA_SEEN, "switch read", failure);
            return false;
        }
    }
}
