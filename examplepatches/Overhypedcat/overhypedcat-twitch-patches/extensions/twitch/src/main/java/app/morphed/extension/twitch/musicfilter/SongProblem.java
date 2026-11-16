package app.morphed.extension.twitch.musicfilter;

/** Something the user is told about: the message says what went wrong and why. */
public class SongProblem extends Exception {
    public SongProblem(String message) {
        super(message);
    }

    public SongProblem(String message, Throwable cause) {
        super(message, cause);
    }

    /** Shazam is getting too many requests from this connection: it's asked again only after a while. */
    public static final class RateLimited extends SongProblem {
        public RateLimited(String message) {
            super(message);
        }
    }
}
