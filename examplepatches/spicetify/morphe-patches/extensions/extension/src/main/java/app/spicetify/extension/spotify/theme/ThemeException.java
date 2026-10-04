package app.spicetify.extension.spotify.theme;

/** A theme problem; its message is shown to the user. */
public final class ThemeException extends IllegalArgumentException {
    public ThemeException(String message) {
        super(message);
    }
}
