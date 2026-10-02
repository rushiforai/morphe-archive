/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The hook's place, the feed cache's merge, is the one
 * zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.extension.hushthreads.ads;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes ad posts out of each page of the Threads feed before the feed cache merges it.
 *
 * <p>Every page Threads fetches for the feed, For You and Following alike, goes through one merge
 * method of {@code BarcelonaFeedCache} before anything is cached or drawn. The patch hands that
 * method's page of items to {@link #filter} first and merges what comes back, so an ad never
 * reaches the screen and never takes a slot in the cache.
 *
 * <p>An item is an ad when the post it carries is one: Threads' own check reads the post's
 * "injected" data, the block the server attaches to a sponsored post, and this asks that same check.
 * A thread unit counts by its first post, which is the one the feed shows, the same post Threads'
 * own item reads for its media.
 *
 * <p>The two methods at the bottom have no body of their own here. Their answers are Threads'
 * obfuscated names, which change with every build, so the patch finds them by what they do and
 * writes the calls in when you patch. Unpatched they answer nothing and every item stays.
 */
public final class FeedAds {
    private FeedAds() {}

    /**
     * Injected at the start of the feed cache's merge, with the page it was given. Answers the page
     * without its ad posts, or the same list when it holds none, the switch is off, HushThreads is
     * paused or anything goes wrong. Never throws.
     */
    public static List<?> filter(List<?> items) {
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        if (items == null || items.isEmpty()) return items;
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_ADS.get()) return items;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "switch read", t);
            return items;
        }
        try {
            List<Object> kept = null;
            int index = 0;
            for (Object item : items) {
                if (isAdItem(item)) {
                    if (kept == null) {
                        kept = new ArrayList<>(items.size());
                        kept.addAll(items.subList(0, index));
                    }
                } else if (kept != null) {
                    kept.add(item);
                }
                index++;
            }
            if (kept == null) return items;
            int removed = items.size() - kept.size();
            HookStatus.counted(FamilyNames.HIDE_ADS, "ad posts taken out", removed);
            Logger.printDebug(() -> "Hide ads: took " + removed + " of " + items.size() + " feed items out");
            return kept;
        } catch (Throwable t) {
            // One bad item keeps the whole page as Threads sent it rather than dropping posts blind.
            HookStatus.threw(FamilyNames.HIDE_ADS, "feed page", t);
            return items;
        }
    }

    /** Whether the post this feed item carries is an ad. */
    static boolean isAdItem(Object item) {
        if (item == null) return false;
        Object media = itemMedia(item);
        return media != null && isAd(media);
    }

    /**
     * The post a feed item carries ({@code com.instagram.feed.media.Media}), or null for an item
     * that carries none. The patch writes the item class's own getter in.
     */
    static Object itemMedia(Object item) {
        return null;
    }

    /** Threads' own check of whether a post is an ad. The patch writes the call in. */
    static boolean isAd(Object media) {
        return false;
    }
}
