/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.ads;

import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

/**
 * Stands in for the two calls the patch writes into {@link FeedAds}. Unpatched they answer
 * nothing, so no item is ever an ad and a filter that runs can't be told from one that doesn't.
 * Here an item is its own post, and {@link #AD} is the one post Threads' check calls an ad.
 *
 * <p>A test that uses it names this class in its Config's shadows and FeedAds' package in its
 * instrumentedPackages, so Robolectric routes the two calls here.
 */
@Implements(FeedAds.class)
public class ShadowFeedAds {
    /** A sponsored post. */
    public static final Object AD = new Object() {
        @Override
        public String toString() {
            return "sponsored post";
        }
    };

    /** A post Threads' own check throws on. */
    public static final Object BROKEN = new Object() {
        @Override
        public String toString() {
            return "post the check throws on";
        }
    };

    @Implementation
    protected static Object itemMedia(Object item) {
        return item;
    }

    @Implementation
    protected static boolean isAd(Object media) {
        if (media == BROKEN) throw new IllegalStateException("the check broke on this post");
        return media == AD;
    }
}
