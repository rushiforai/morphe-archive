package app.morphed.extension.twitch;

/** Failures as words for the screen: what went wrong, without the code's class names (the log keeps those). */
public final class Messages {
    private Messages() {
    }

    public static String of(Throwable error) {
        String text = error.getMessage();
        return text == null || text.trim().isEmpty() ? "an unexpected error (" + error.getClass().getSimpleName() + ")" : text;
    }
}
