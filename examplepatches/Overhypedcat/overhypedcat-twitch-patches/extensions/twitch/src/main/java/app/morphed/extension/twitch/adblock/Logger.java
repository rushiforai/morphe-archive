package app.morphed.extension.twitch.adblock;

public interface Logger {
    Logger NONE = message -> {
    };

    void log(String message);
}
