package app.morphed.extension.twitch;

/**
 * Which feature patches were applied. Each returns false here; its patch makes it return true, so a feature whose
 * patch was left out stays off and has no switch.
 */
public final class Included {
    private Included() {
    }

    public static boolean adBlock() {
        return false;
    }

    public static boolean songRemoval() {
        return false;
    }

    public static boolean qualityUnlock() {
        return false;
    }
}
