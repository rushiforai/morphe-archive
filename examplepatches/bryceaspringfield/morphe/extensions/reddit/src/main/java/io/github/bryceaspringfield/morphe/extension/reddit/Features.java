package io.github.bryceaspringfield.morphe.extension.reddit;

/**
 * Which of the bundle's patches were applied. Each method returns false here; the patch it names rewrites it to
 * return true, which shows the patch's section in Settings > Morphe.
 */
final class Features {

    private Features() {
    }

    /** Hide keyword content: the Keyword filter screen. */
    static boolean filters() {
        return false;
    }

    /** Navigation and sidebar: the Inbox button, bars, sidebar rows, and badge switches. */
    static boolean navigation() {
        return false;
    }

    /** The settings patch: Reddit's reads of Morphe's Trending switch go through TrendingPlaces. */
    static boolean trending() {
        return false;
    }

    /** Media options: captions, media links, and the 18+ caution switches. */
    static boolean media() {
        return false;
    }
}
