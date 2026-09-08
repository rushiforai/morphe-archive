/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import app.morphe.extension.shared.settings.BooleanSetting;

@SuppressWarnings("unused")
public final class SoundCloudPrivateSettings {
    // Keep the original key so settings migrate from the supplied Morphed APK.
    public static final BooleanSetting HIDE_TOP_CAST =
            new BooleanSetting("morphe_sc_hide_top_cast", Boolean.FALSE);

    private SoundCloudPrivateSettings() {
    }
}
