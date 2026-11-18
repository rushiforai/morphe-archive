/*
 * YTAfterglow for Android.
 *
 * Constant names and notes from the PlayerType class of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which mirrors YouTube's
 * own player type enum. Not an official Morphe file.
 */

package app.afterglow.extension.video;

/**
 * Where YouTube's regular (watch page) player is shown. YouTube's own enum has the same
 * constant names, so a value is mapped by name.
 */
public enum PlayerType {
    /** No video, or a Short is playing. */
    NONE,
    /** A Short is playing over a regular video that was open before it. */
    HIDDEN,
    WATCH_WHILE_MINIMIZED,
    WATCH_WHILE_MAXIMIZED,
    WATCH_WHILE_FULLSCREEN,
    WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN,
    WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED,
    WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED,
    WATCH_WHILE_SLIDING_FULLSCREEN_DISMISSED,
    /** The muted preview playing in a feed. */
    INLINE_MINIMAL,
    VIRTUAL_REALITY_FULLSCREEN,
    WATCH_WHILE_PICTURE_IN_PICTURE;

    static PlayerType fromName(String name) {
        if (name == null) return null;
        for (PlayerType type : values()) {
            if (type.name().equals(name)) return type;
        }
        return null;
    }

    public boolean isNoneOrHidden() {
        return this == NONE || this == HIDDEN;
    }

    /** The watch page player is open full size: maximized, fullscreen or on its way there. */
    public boolean isMaximizedOrFullscreen() {
        return this == WATCH_WHILE_MAXIMIZED || this == WATCH_WHILE_FULLSCREEN
                || this == WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN
                || this == WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED
                || this == VIRTUAL_REALITY_FULLSCREEN;
    }

    /** The watch page player, in any size, including picture-in-picture. */
    public boolean isWatchPage() {
        return this != NONE && this != HIDDEN && this != INLINE_MINIMAL;
    }
}
