package dev.materialtidal.extension.tidal.linn;

import dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs;

/**
 * Compile-time / patch-time configuration for {@code LinnDsmPlaybackPatch}.
 * Default methods are rewritten via {@code returnEarly(...)} in {@code LinnDsmPlaybackPatch.kt},
 * and live getters consult {@link PatchSettingsPrefs}.
 */
@SuppressWarnings("unused")
public final class LinnConfig {

    public static final int QUALITY_HI_RES = 0;
    public static final int QUALITY_LOSSLESS = 1;
    public static final int QUALITY_HIGH = 2;

    public static final int STREAM_MODE_PROXY_ALL = 0;
    public static final int STREAM_MODE_HYBRID = 1;

    private LinnConfig() {
    }

    public static int defaultAudioQualityMode() {
        return QUALITY_HI_RES;
    }

    public static int getAudioQualityMode() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_LINN_AUDIO_QUALITY, defaultAudioQualityMode());
    }

    public static int defaultStreamDeliveryMode() {
        return STREAM_MODE_PROXY_ALL;
    }

    public static int getStreamDeliveryMode() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_LINN_STREAM_MODE, defaultStreamDeliveryMode());
    }

    public static boolean defaultAutoWakeAndSwitchEnabled() {
        return true;
    }

    public static boolean isAutoWakeAndSwitchEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_LINN_AUTO_WAKE, defaultAutoWakeAndSwitchEnabled());
    }

    public static String defaultManualDeviceIp() {
        return "";
    }

    public static String getManualDeviceIp() {
        return PatchSettingsPrefs.getString(PatchSettingsPrefs.OPT_LINN_MANUAL_IP, defaultManualDeviceIp());
    }
}
