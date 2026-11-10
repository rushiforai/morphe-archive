package app.morphed.extension.twitch.adblock;

public interface Logger {
    Logger NONE = message -> {
    };

    void log(String message);

    /**
     * Whether lines written for every playlist poll or request are wanted. They come about once a
     * second while a stream plays, so they are only built while someone reads them.
     */
    default boolean detailed() {
        return true;
    }
}
