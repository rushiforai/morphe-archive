/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3397
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.youtube.videoplayer;

import android.view.View;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.PipButtonPatch;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public class PipButton {

    static {
        if (Settings.PIP_BUTTON_OVERLAY.get() && PipButtonPatch.isPipSupported()) {
            LegacyPlayerControlButton.incrementUpperButtonCount();
        }
    }

    /**
     * Injection point.
     */
    public static void initializeLegacyButton(View controlsView) {
        try {
            new LegacyPlayerControlButton(
                    controlsView,
                    "tada_pip_button",
                    null,
                    "tada_pip_button",
                    () -> (Settings.PIP_BUTTON_OVERLAY.get() && PipButtonPatch.isPipSupported())
                            ? LegacyPlayerControlButton.ButtonVisibility.ENABLED
                            : LegacyPlayerControlButton.ButtonVisibility.DISABLED,
                    v -> PipButtonPatch.enterPictureInPicture(),
                    null
            );
        } catch (Exception ex) {
            Logger.printException(() -> "initialize failure", ex);
        }
    }
}
