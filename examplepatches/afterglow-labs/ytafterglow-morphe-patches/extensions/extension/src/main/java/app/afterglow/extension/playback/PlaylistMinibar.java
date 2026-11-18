package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/** Selects YouTube's retained playlist bar without changing the video mini-player. */
public final class PlaylistMinibar {
    /*
     * The playlist controls, their event subject and the visibility animator are
     * created separately and cached. A live flag change would mix two native
     * architectures. Read the preference once, including when the first native
     * read is false; changing it or resetting preferences requires a restart.
     */
    private static final boolean OLD_MINIBAR = readOldMinibar();

    private PlaylistMinibar() {}

    private static boolean readOldMinibar() {
        try {
            return InstalledTweaks.has("miniplayer")
                    && LiteMode.effectiveBool("playlistOldMinibar");
        } catch (Throwable error) {
            Afterglow.error("PlaylistMinibar.readOldMinibar", error);
            // Keep the native architecture for this entire process. Retrying
            // after another owner has initialized could mix native bar layouts.
            return false;
        }
    }

    /** Native flag 45798642: ON keeps every owner on the original playlist bar. */
    public static boolean floatingPlaylistMinibar(boolean nativeEnabled) {
        return nativeEnabled && !OLD_MINIBAR;
    }
}
