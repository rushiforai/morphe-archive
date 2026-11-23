package dev.materialtidal.extension.tidal.linn;

/**
 * Compile-time / patch-time configuration for {@code LinnDsmPlaybackPatch}.
 * Methods are rewritten via {@code returnEarly(...)} in {@code LinnDsmPlaybackPatch.kt}.
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

    public static int getAudioQualityMode() {
        return QUALITY_HI_RES;
    }

    public static int getStreamDeliveryMode() {
        return STREAM_MODE_PROXY_ALL;
    }

    public static boolean isAutoWakeAndSwitchEnabled() {
        return true;
    }

    public static String getManualDeviceIp() {
        return "";
    }
}
