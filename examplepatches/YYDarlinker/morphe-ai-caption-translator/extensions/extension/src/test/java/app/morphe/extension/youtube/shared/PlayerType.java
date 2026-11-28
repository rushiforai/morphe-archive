package app.morphe.extension.youtube.shared;

public enum PlayerType {
    NONE,
    WATCH_WHILE_MAXIMIZED,
    WATCH_WHILE_FULLSCREEN,
    WATCH_WHILE_MINIMIZED,
    WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED,
    WATCH_WHILE_PICTURE_IN_PICTURE;

    public static PlayerType current = NONE;

    public static PlayerType getCurrentPlayerType() { return current; }
}
