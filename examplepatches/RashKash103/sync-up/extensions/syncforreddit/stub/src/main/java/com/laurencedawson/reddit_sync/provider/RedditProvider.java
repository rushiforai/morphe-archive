package com.laurencedawson.reddit_sync.provider;

import android.net.Uri;

/**
 * Where Sync keeps what it has read. Writing to it is how the text of a post is changed, and
 * telling it so is how everything showing that post is made to draw again.
 *
 * <p>Compile only, and named as the app names it.
 */
public class RedditProvider {
    /** What is written to, with the id of the post or comment as the selection. */
    public static final Uri q = null;

    /** What is told that something changed. */
    public static final Uri B = null;
}
