package app.jimaku.extension;

import android.content.Context;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerControlsVisibility;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * State read from Morphe Patches' extension. The patch checks at patch time that each of these
 * methods exists; enums are compared by name, so a constant Morphe adds changes nothing here.
 */
final class Morphe {
    private Morphe() {
    }

    /** The app's context, which Morphe sets to YouTube's main activity when it is created. */
    static Context context() {
        return Utils.getContext();
    }

    /** Whether YouTube shows its dark theme: its own setting, which the activity's night mode doesn't always carry. */
    static boolean darkTheme() {
        return Utils.isDarkModeEnabled();
    }

    /** The playback time in milliseconds, asked from the player on each call. */
    static long videoTimeMillis() {
        return VideoInformation.getVideoTime();
    }

    /** The length of the video in front in milliseconds, or 0 before it is known. */
    static long videoLengthMillis() {
        return VideoInformation.getVideoLength();
    }

    static boolean lastVideoIsShort() {
        return VideoInformation.lastVideoIdIsShort();
    }

    static String playerType() {
        PlayerType type = PlayerType.getCurrent();
        return type == null ? "NONE" : type.name();
    }

    /** Whether the controls show or are about to show. */
    static boolean controlsShown() {
        PlayerControlsVisibility visibility = PlayerControlsVisibility.getCurrent();
        if (visibility == null) return false;
        String name = visibility.name();
        return name.equals("PLAYER_CONTROLS_VISIBILITY_SHOWN") || name.equals("PLAYER_CONTROLS_VISIBILITY_WILL_SHOW");
    }

    /** The watch player, whether full size, in the mini player or in picture-in-picture. Not feed previews. */
    static boolean isWatchPlayer(String playerType) {
        return playerType.startsWith("WATCH_WHILE_");
    }

    /** Where subtitles may show: the full-size watch player, in portrait or fullscreen. */
    static boolean showsSubtitles(String playerType) {
        switch (playerType) {
            case "WATCH_WHILE_MAXIMIZED":
            case "WATCH_WHILE_FULLSCREEN":
            case "WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN":
                return true;
            default:
                return false;
        }
    }
}
