package app.voidhack.extension.applemusic.lyrics;

/**
 * Compile-time feature gates flipped to {@code true} by the corresponding Morphe bytecode patches:
 * {@code LRCLIB lyrics}, {@code On-device pronunciation guides}, and {@code Lyrics editor}.
 */
public final class LyricsFeatures {
    private LyricsFeatures() {}

    public static boolean lrclib() {
        return false;
    }

    public static boolean pronunciation() {
        return false;
    }

    public static boolean editor() {
        return false;
    }
}
