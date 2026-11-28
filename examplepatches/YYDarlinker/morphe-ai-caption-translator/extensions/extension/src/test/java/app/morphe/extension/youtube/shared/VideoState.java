package app.morphe.extension.youtube.shared;

public enum VideoState {
    PLAYING, PAUSED, BUFFERING;

    public static VideoState current = PLAYING;

    public static VideoState getCurrent() { return current; }
}
