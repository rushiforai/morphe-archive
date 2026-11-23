package dev.materialtidal.extension.tidal.gestures;

/**
 * Runtime configuration and action constants for track swipe gestures.
 * Getter bodies are patched at build/patch time via {@code returnEarly(...)} from Morphe patch options.
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

    public static int getSwipeRightAction() {
        return ACTION_ADD_TO_QUEUE;
    }

    public static int getSwipeLeftAction() {
        return ACTION_TOGGLE_FAVORITE;
    }

    public static boolean isHapticEnabled() {
        return true;
    }

    public static int getSwipeThresholdDp() {
        return 72;
    }
}
