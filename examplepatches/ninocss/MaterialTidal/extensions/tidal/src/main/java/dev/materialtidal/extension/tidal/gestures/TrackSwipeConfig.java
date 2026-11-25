package dev.materialtidal.extension.tidal.gestures;

import dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs;

/**
 * Runtime configuration and action constants for track swipe gestures.
 * Default getter bodies are patched at build/patch time via {@code returnEarly(...)} from Morphe
 * patch options, and live getters consult {@link PatchSettingsPrefs}.
 */
@SuppressWarnings("unused")
public final class TrackSwipeConfig {

    public static final int ACTION_NONE = 0;
    public static final int ACTION_ADD_TO_QUEUE = 1;
    public static final int ACTION_PLAY_NEXT = 2;
    public static final int ACTION_TOGGLE_FAVORITE = 3;
    public static final int ACTION_ADD_TO_PLAYLIST = 4;

    private TrackSwipeConfig() {
    }

    public static int defaultSwipeRightAction() {
        return ACTION_ADD_TO_QUEUE;
    }

    public static int getSwipeRightAction() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_SWIPE_RIGHT_ACTION, defaultSwipeRightAction());
    }

    public static int defaultSwipeLeftAction() {
        return ACTION_TOGGLE_FAVORITE;
    }

    public static int getSwipeLeftAction() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_SWIPE_LEFT_ACTION, defaultSwipeLeftAction());
    }

    public static boolean defaultHapticEnabled() {
        return true;
    }

    public static boolean isHapticEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_SWIPE_HAPTIC, defaultHapticEnabled());
    }

    public static int defaultSwipeThresholdDp() {
        return 72;
    }

    public static int getSwipeThresholdDp() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_SWIPE_THRESHOLD_DP, defaultSwipeThresholdDp());
    }
}
