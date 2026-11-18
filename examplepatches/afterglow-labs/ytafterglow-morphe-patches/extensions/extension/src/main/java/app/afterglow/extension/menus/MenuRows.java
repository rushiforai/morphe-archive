package app.afterglow.extension.menus;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/**
 * Rows of YouTube's video menus (the "⋮" bottom sheet), for the iOS settings
 * removePlayNext, removeDownloadMenu, removeShareMenu, removeWatchLaterMenu,
 * removeSaveToPlaylistMenu, removeNotInterestedMenu, removeDontRecommendMenu and
 * removeReportMenu.
 *
 * <p>The patch asks {@link #hideRow} for every menu row YouTube builds, with the
 * row's icon type (YouTube's IconType enum, read from 21.43.523), so rows are
 * matched the same way in every language. iOS removes Play next by its icon
 * (251) too, and the other rows by language-independent ids. Download and Share
 * belong to the "player-buttons-menus" tweak, the rest to "feed-menus"; a row
 * is removed only when its tweak is installed and its setting is on.
 */
public final class MenuRows {
    private static final String PLAYER_MENUS = "player-buttons-menus";
    private static final String FEED_MENUS = "feed-menus";

    // YouTube IconType numbers (Lbgdf; in 21.43.523).
    private static final int ADD_TO_PLAYLIST = 46;
    private static final int SHARE = 48;
    private static final int FLAG = 52;
    private static final int OFFLINE_ADD = 57;
    private static final int ADD_TO_WATCH_LATER = 59;
    private static final int SHARE_ARROW = 100;
    private static final int REPORT_PROBLEM = 136;
    private static final int OFFLINE_DOWNLOAD = 147;
    private static final int PLAYLIST_ADD = 211;
    private static final int QUEUE_PLAY_NEXT = 251;
    /** "Don't recommend channel": the icon YouTube sends for that row. */
    private static final int REMOVE_CIRCLE = 350;
    private static final int NOT_INTERESTED = 433;
    private static final int BOOKMARK = 565;

    private MenuRows() {}

    /** Injection point: true to leave the row with this icon type out of the menu. */
    public static boolean hideRow(int iconType) {
        try {
            switch (iconType) {
                case QUEUE_PLAY_NEXT:
                    return on(FEED_MENUS, "removePlayNext");
                case OFFLINE_DOWNLOAD:
                case OFFLINE_ADD:
                    return on(PLAYER_MENUS, "removeDownloadMenu");
                case SHARE:
                case SHARE_ARROW:
                    return on(PLAYER_MENUS, "removeShareMenu");
                case ADD_TO_WATCH_LATER:
                    return on(FEED_MENUS, "removeWatchLaterMenu");
                case ADD_TO_PLAYLIST:
                case PLAYLIST_ADD:
                case BOOKMARK:
                    return on(FEED_MENUS, "removeSaveToPlaylistMenu");
                case NOT_INTERESTED:
                    return on(FEED_MENUS, "removeNotInterestedMenu");
                case REMOVE_CIRCLE:
                    return on(FEED_MENUS, "removeDontRecommendMenu");
                case FLAG:
                case REPORT_PROBLEM:
                    return on(FEED_MENUS, "removeReportMenu");
                default:
                    return false;
            }
        } catch (Throwable error) {
            // Keep the row if anything goes wrong.
            Afterglow.error("MenuRows.hideRow", error);
            return false;
        }
    }

    private static boolean on(String tweak, String key) {
        return InstalledTweaks.has(tweak) && LiteMode.effectiveBool(key);
    }
}
