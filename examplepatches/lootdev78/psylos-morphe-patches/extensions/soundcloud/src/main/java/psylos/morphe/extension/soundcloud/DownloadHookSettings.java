/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.StringSetting;

@SuppressWarnings("unused")
public final class DownloadHookSettings {
    // Keep the original keys so settings migrate from the supplied Morphed APK.
    public static final BooleanSetting ENABLED =
            new BooleanSetting("morphe_download_hook_enabled", Boolean.FALSE);
    public static final StringSetting TARGET_PACKAGE =
            new StringSetting("morphe_download_hook_package", "");

    private DownloadHookSettings() {
    }
}
