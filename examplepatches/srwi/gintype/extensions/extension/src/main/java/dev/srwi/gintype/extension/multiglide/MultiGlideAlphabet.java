package dev.srwi.gintype.extension.multiglide;

/**
 * Core alphabet and scoring constants for the MultiGlide multi-finger swipe engine.
 */
public final class MultiGlideAlphabet {

    public static final int ALPHABET_SIZE = 26;

    private MultiGlideAlphabet() {}

    public static int charIndex(char c) {
        char lower = Character.toLowerCase(c);
        if (lower >= 'a' && lower <= 'z') {
            return lower - 'a';
        }
        return -1;
    }

    public static char indexToChar(int idx) {
        return (char) ('a' + idx);
    }
}
