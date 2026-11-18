package app.afterglow.extension.video;

/**
 * What the player's play/pause control shows, mapped by name from YouTube's own enum
 * (the video state of the player controls state).
 */
public enum PlaybackState {
    NEW,
    PLAYING,
    PAUSED,
    RECOVERABLE_ERROR,
    UNRECOVERABLE_ERROR,
    ENDED;

    static PlaybackState fromName(String name) {
        if (name == null) return null;
        for (PlaybackState state : values()) {
            if (state.name().equals(name)) return state;
        }
        return null;
    }
}
