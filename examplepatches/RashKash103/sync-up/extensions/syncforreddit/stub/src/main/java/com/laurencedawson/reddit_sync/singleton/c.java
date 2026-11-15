package com.laurencedawson.reddit_sync.singleton;

/**
 * Sync's own answer to how many columns a feed is drawn in.
 *
 * <p>{@code c(int)} takes the view mode — 4 is {@code Cards} — and hands back the column count
 * for the orientation the device is in, reading {@code post_columns_portrait} or
 * {@code post_columns_landscape} and answering 1 for the modes that are never laid out in
 * columns. Asking it is better than reading the two settings here, because the orientation and
 * the modes that ignore the setting are its business rather than ours.
 *
 * <p>The class keeps nothing but its minified name, so this stub is pinned to the one supported
 * build along with every fingerprint. Compile only.
 */
public final class c {
    private c() {}

    /** @param viewMode Sync's own number for the way the feed is drawn. */
    public static int c(int viewMode) {
        return 1;
    }
}
