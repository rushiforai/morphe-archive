package dev.materialtidal.extension.tidal.crossfade;

/**
 * Build/patch-time default configuration for the Seamless Track Transitions (Crossfade) patch.
 * Getter bodies are patched via {@code returnEarly(...)} by {@code CrossfadePlaybackPatch}.
 */
@SuppressWarnings("unused")
public final class CrossfadeConfig {

    public static final int CURVE_EQUAL_POWER = 0;
    public static final int CURVE_SMOOTH_S = 1;
    public static final int CURVE_SOFT_DIP = 2;
    public static final int CURVE_DJ_BLEND = 3;

    public static final int MIN_DURATION_SECONDS = 0;
    public static final int MAX_DURATION_SECONDS = 12;

    private CrossfadeConfig() {
    }

    public static int getDefaultDurationSeconds() {
        return 5;
    }

    public static int getDefaultCurveType() {
        return CURVE_EQUAL_POWER;
    }

    public static int getDefaultStrengthPercent() {
        return 50;
    }

    public static boolean isDefaultPreserveGaplessAlbums() {
        return false;
    }
}
