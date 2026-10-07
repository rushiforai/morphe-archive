/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.ads;

import app.morphe.extension.hushthreads.settings.SettingsStatus;

import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

/**
 * Stands in for the calls the patch writes into {@link FeedAds}. Unpatched they answer nothing, so
 * no item is ever an ad and a filter that runs can't be told from one that doesn't. Here an item is
 * its own post, {@link #AD} is the one post Threads' check calls an ad, and an enum constant is its
 * own unit type.
 *
 * <p>A test that uses it names this class in its Config's shadows and FeedAds' package in its
 * instrumentedPackages, so Robolectric routes the two calls here.
 */
@Implements(FeedAds.class)
public class ShadowFeedAds {
    public static final Object SUGGESTED = new Object();
    public static final Object KICKSTART = new Object();
    public static final Object BROKEN_SUGGESTED = new Object();

    /** Models independently selected named patches, rather than enabling every rule. */
    @Implements(SettingsStatus.class)
    public static class Status {
        public static boolean ads = true;
        public static boolean suggestions;

        @Implementation protected static boolean hideAds() { return ads; }
        @Implementation protected static boolean hideSuggestedUsers() { return suggestions; }
    }
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
    protected static Object itemUnitType(Object item) {
        return item instanceof Enum ? item : null;
    }

    @Implementation
    protected static boolean isAd(Object media) {
        if (media == BROKEN) throw new IllegalStateException("the check broke on this post");
        return media == AD;
    }

    @Implementation
    protected static boolean isSuggestedUserItem(Object item) {
        if (item == BROKEN_SUGGESTED) throw new IllegalStateException("the card check broke");
        return item == SUGGESTED || item == KICKSTART;
    }
}
