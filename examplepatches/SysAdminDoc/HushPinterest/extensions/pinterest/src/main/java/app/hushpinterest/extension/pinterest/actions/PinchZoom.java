/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import androidx.annotation.Nullable;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Pinch to zoom only (#48). A pinch on a pin's picture zooms a copy of it while the fingers move.
 * When they let go, Pinterest's pin page loads pins that look like the picture and opens them. With
 * the switch on, the pin page asks here first, the picture opens full screen in the viewer
 * Long-press download's View uses, and Pinterest loads nothing.
 */
public final class PinchZoom {
    private PinchZoom() {}

    /**
     * The pin page is about to load pins that look like [pin]'s picture because of a pinch. Non-zero
     * means the pinch was handled here and Pinterest stops. A pin with no picture to show, such as a
     * video, still loads nothing while the switch is on: the pinch just springs back.
     */
    public static int pinch(@Nullable Object pin) {
        HookStatus.invoked(FamilyNames.PINCH_TO_ZOOM_ONLY);
        try {
            if (!Utils.settingsReady() || !Settings.PINCH_TO_ZOOM_ONLY.get()) return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PINCH_TO_ZOOM_ONLY, "switch read", failure);
            return 0;
        }
        try {
            if (PinViewer.open(pin, null)) {
                HookStatus.counted(FamilyNames.PINCH_TO_ZOOM_ONLY, "pinch opened the picture full screen");
            } else {
                HookStatus.counted(FamilyNames.PINCH_TO_ZOOM_ONLY, "pinch kept on the pin");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PINCH_TO_ZOOM_ONLY, "open pinched picture", failure);
        }
        return 1;
    }
}
