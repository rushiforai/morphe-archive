package app.morphe.extension.youtube.shared;

/** Signature stub of the Morphe Patches player type. */
public enum PlayerType {
    NONE, HIDDEN, WATCH_WHILE_MINIMIZED, WATCH_WHILE_MAXIMIZED, WATCH_WHILE_FULLSCREEN,
    WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN, WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED,
    WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED, WATCH_WHILE_SLIDING_FULLSCREEN_DISMISSED,
    INLINE_MINIMAL, VIRTUAL_REALITY_FULLSCREEN, WATCH_WHILE_PICTURE_IN_PICTURE;

    public static PlayerType getCurrent() {
        throw new UnsupportedOperationException();
    }
}
