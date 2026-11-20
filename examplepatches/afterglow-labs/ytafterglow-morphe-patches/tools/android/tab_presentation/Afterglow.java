package app.afterglow.extension;

public final class Afterglow {
    public static void error(String source, Throwable error) {
        throw new AssertionError(source, error);
    }
}
