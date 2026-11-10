/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/ReelsAdFilter.java and reels/ReelSections.java.
 * Copyright 2026 Hushfacebook contributors. Modified for facebook-morphe-patches, 2026: always on,
 * no settings or diagnostics.
 */
package app.fbpatches.extension.facebook.ads;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * What Hide sponsored reels asks about Reels and Watch. An item is an ad when it extends the ad item
 * base class, or when its story carries sponsored_data. Every page filter hands back the very
 * collection it got when nothing in it is an ad.
 */
@SuppressWarnings("unused")
public final class ReelsAds {
    private static final String TAG = "FbPatches";

    /** Comment-sheet floating button plugins shown on ads, by class name. */
    static final Set<String> AD_PILLS = new HashSet<>(Arrays.asList(
            "com.facebook.feedback.comments.plugins.indicatorpill.reelsadsfloatingcta.ReelsAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.watchadsfloatingcta.WatchAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.instreamadsfloatingcta.InstreamAdsFloatingCtaPlugin",
            // Feed ads opened as a permalink or in the comment flyout.
            "com.facebook.feedback.comments.plugins.indicatorpill.permalinkadsfloatingcta.PermalinkAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.flyoutadsfloatingcta.FlyoutAdsFloatingCtaPlugin"));

    static final Object UNPATCHED = new Object();

    private ReelsAds() {
    }

    /** Injection point: a page of sections the Reels controller receives. */
    public static List<?> withoutAdSections(List<?> page, String adClassName) {
        if (page == null || page.isEmpty()) return page;
        try {
            int dropped = 0;
            boolean sectionEmptied = false;
            ArrayList<Object> kept = new ArrayList<>(page.size());
            for (Object section : page) {
                int removed = stripItems(section, adClassName);
                dropped += removed;
                if (removed > 0 && !holdsAnyItem(section)) {
                    sectionEmptied = true;
                    continue;
                }
                kept.add(section);
            }
            return dropped == 0 || !sectionEmptied ? page : kept;
        } catch (Throwable failure) {
            Log.w(TAG, "ReelsAds.withoutAdSections failed", failure);
            return page;
        }
    }

    /** Injection point: a page of items entering the Reels and Watch collection. */
    public static Collection<?> withoutAds(Collection<?> items, String adClassName) {
        if (items == null || items.isEmpty()) return items;
        try {
            boolean found = false;
            for (Object item : items) {
                if (isAd(item, adClassName)) {
                    found = true;
                    break;
                }
            }
            if (!found) return items;
            ArrayList<Object> kept = new ArrayList<>(items.size());
            for (Object item : items) {
                if (!isAd(item, adClassName)) kept.add(item);
            }
            return kept;
        } catch (Throwable failure) {
            Log.w(TAG, "ReelsAds.withoutAds failed", failure);
            return items;
        }
    }

    /** Injection point: the collection's listener walk over a new page. */
    public static Collection<?> withoutAnnouncedAds(Collection<?> items, String adClassName) {
        return withoutAds(items, adClassName);
    }

    /** Injection point: the Reels tab ad pool's vends. True answers "no ad". */
    public static boolean holdPoolAd() {
        return true;
    }

    /** Injection point: the feed Reels row ad pool's vends. True answers "no ad". */
    public static boolean holdRowAd() {
        return true;
    }

    /** Injection point: a profile's Reels tab ad query. True skips it. */
    public static boolean holdProfileReelAds() {
        return true;
    }

    /** Injection point: called each time an ad-break fetch is answered with a failed future. */
    public static void heldAdBreakFetch() {
    }

    /** Injection point: the comment sheet's pill check, with the plugin's class name. True hides it. */
    public static boolean holdsAdPill(String plugin) {
        return plugin != null && AD_PILLS.contains(plugin);
    }

    private static boolean isAd(Object item, String adClassName) {
        if (item == null) return false;
        if (extendsAdBase(item, adClassName)) return true;
        try {
            if (!isReelItem(item)) return false;
            Object story = itemStory(item);
            if (story == null || story == UNPATCHED) return false;
            if (!isStory(story)) return false;
            Object data = sponsoredData(story);
            return data != null && data != UNPATCHED;
        } catch (Throwable failure) {
            Log.w(TAG, "ReelsAds.isAd failed", failure);
            return false;
        }
    }

    private static boolean isStory(Object unit) {
        for (Class<?> type = unit.getClass(); type != null; type = type.getSuperclass()) {
            if ("com.facebook.graphql.model.GraphQLStory".equals(type.getName())) return true;
        }
        return false;
    }

    private static boolean extendsAdBase(Object item, String adClassName) {
        if (adClassName == null) return false;
        for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
            if (adClassName.equals(type.getName())) return true;
        }
        return false;
    }

    private static int stripItems(Object section, String adClassName) {
        if (section == null) return 0;
        int removed = 0;
        try {
            for (Field field : section.getClass().getDeclaredFields()) {
                List<?> items = itemsOf(field, section);
                if (items == null || items.isEmpty()) continue;
                ArrayList<Object> dropping = new ArrayList<>();
                for (Object item : items) {
                    if (isAd(item, adClassName)) dropping.add(item);
                }
                if (dropping.isEmpty()) continue;
                try {
                    items.removeAll(dropping);
                } catch (UnsupportedOperationException immutable) {
                    ArrayList<Object> keptItems = new ArrayList<>(items.size() - dropping.size());
                    for (Object item : items) {
                        if (!holdsSame(dropping, item)) keptItems.add(item);
                    }
                    field.set(section, keptItems);
                }
                removed += dropping.size();
            }
        } catch (Throwable t) {
            Log.w(TAG, "ReelsAds section filter failed", t);
        }
        return removed;
    }

    private static boolean holdsAnyItem(Object section) {
        try {
            for (Field field : section.getClass().getDeclaredFields()) {
                List<?> items = itemsOf(field, section);
                if (items != null && !items.isEmpty()) return true;
            }
        } catch (Throwable t) {
            return true;
        }
        return false;
    }

    private static List<?> itemsOf(Field field, Object section) throws IllegalAccessException {
        if (Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) return null;
        field.setAccessible(true);
        Object value = field.get(section);
        return value instanceof List ? (List<?>) value : null;
    }

    private static boolean holdsSame(List<Object> dropping, Object item) {
        for (Object candidate : dropping) {
            if (candidate == item) return true;
        }
        return false;
    }

    /** Filled in by the patch: whether an object is a Reels and Watch item. */
    public static boolean isReelItem(Object item) {
        return false;
    }

    /** Filled in by the patch: a reel item's story. */
    public static Object itemStory(Object item) {
        return UNPATCHED;
    }

    /** Filled in by the patch: a story's sponsored_data model. */
    public static Object sponsoredData(Object story) {
        return UNPATCHED;
    }
}
