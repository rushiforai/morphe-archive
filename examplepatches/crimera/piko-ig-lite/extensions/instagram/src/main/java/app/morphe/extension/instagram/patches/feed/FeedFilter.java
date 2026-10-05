/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.feed;

import java.util.Iterator;
import java.util.List;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.utils.InstagramLogger;

/**
 * Filters the main feed once per parsed page, before the feed response stores its items.
 * The bridge stubs below are replaced at patch time with direct reads of the resolved models.
 */
@SuppressWarnings("unused")
public final class FeedFilter {
    private FeedFilter() {
    }

    /** Read on every page, so the toggle applies from the next feed load. */
    public static boolean hideAds() {
        return Settings.hideFeedAds();
    }

    /** Injection point: the parsed `feed_items` list, right before the feed response stores it. */
    public static List<Object> filterFeedItems(List<Object> items) {
        if (items == null || !hideAds()) return items;
        try {
            Iterator<Object> iterator = items.iterator();
            while (iterator.hasNext()) {
                if (isAd(iterator.next())) iterator.remove();
            }
        } catch (Exception e) {
            InstagramLogger.printException(() -> "filterFeedItems failure", e);
        }
        return items;
    }

    private static boolean isAd(Object feedItem) {
        if (feedItem == null) return false;
        if (getMultiAdPivot(feedItem) != null) return true;
        Object media = getMediaOrAd(feedItem);
        return media != null && getMediaInjected(media) != null;
    }

    /** The feed item's `stand_alone_multi_ad_pivot` media. The patch replaces this body. */
    static Object getMultiAdPivot(Object feedItem) {
        return null;
    }

    /** The feed item's `media_or_ad` media. The patch replaces this body. */
    static Object getMediaOrAd(Object feedItem) {
        return null;
    }

    /** The media's `injected` ad payload, null for organic posts. The patch replaces this body. */
    static Object getMediaInjected(Object media) {
        return null;
    }
}
