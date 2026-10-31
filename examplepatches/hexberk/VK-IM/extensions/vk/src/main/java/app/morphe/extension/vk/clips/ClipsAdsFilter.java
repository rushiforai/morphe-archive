package app.morphe.extension.vk.clips;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class ClipsAdsFilter {
    private static final String TAG = "MorpheClipsAds";

    /**
     * Filters list of FeedItems in clips feed reducer (cbu.i).
     */
    public static List<?> filterFeedItems(List<?> items) {
        if (items == null) return null;
        ArrayList<Object> result = new ArrayList<>(items.size());
        for (Object item : items) {
            if (item == null || isClipAd(item)) {
                continue;
            }
            result.add(item);
        }
        return result;
    }

    /**
     * Filters list submitted to AsyncListDiffer if it is a clips feed list.
     */
    public static List<?> filterIfClipFeed(List<?> list) {
        if (list == null || list.isEmpty()) return list;
        try {
            Object first = list.get(0);
            if (first != null) {
                String name = first.getClass().getName();
                if (name.contains("clips") || name.contains("FeedItem") || isFeedItem(first)) {
                    return filterFeedItems(list);
                }
            }
        } catch (Throwable ignored) {}
        return list;
    }

    private static boolean isFeedItem(Object item) {
        if (item == null) return false;
        for (Class<?> iface : item.getClass().getInterfaces()) {
            if (iface.getName().endsWith("FeedItem")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Determines whether an item is an advertisement in clips.
     */
    public static boolean isClipAd(Object item) {
        if (item == null) return false;

        String className = item.getClass().getName();

        // 1. Direct class name checks for known clips ad classes
        if (className.endsWith(".FeedItem$a") // Video clip ads
                || className.endsWith(".FeedItem$h") // Market ads
                || className.endsWith(".FeedItem$k") // Static ads
                || className.endsWith(".FeedItem$b") // Ads controls
                || className.endsWith(".ubu") // Shops grid block
                || className.endsWith(".tbu")) { // NPS condition popup
            return true;
        }

        // Substring check for ad class names
        if (className.contains("MarketAds")
                || className.contains("ShopsGrid")
                || className.contains("AdsControls")
                || className.contains("StaticAds")
                || className.contains("ClipProductAttach")
                || className.contains("ShopsMoreBadge")) {
            return true;
        }

        // 2. Check marker interfaces (FeedItem.c or FeedItem.b)
        try {
            for (Class<?> iface : item.getClass().getInterfaces()) {
                String ifaceName = iface.getName();
                if (ifaceName.endsWith("FeedItem$c") || ifaceName.endsWith("FeedItem$b")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}

        // 3. Check k4() method on FeedItem
        try {
            Method mK4 = item.getClass().getMethod("k4");
            Object res = mK4.invoke(item);
            if (Boolean.TRUE.equals(res)) {
                return true;
            }
        } catch (Throwable ignored) {}

        // 4. Check associated video for ad info (b1() != null or p1() != null)
        if (hasAdVideo(item)) {
            return true;
        }

        // 5. Inspect string representation for ad markers
        try {
            String repr = item.toString().toLowerCase();
            if (repr.contains("videoadinfo")
                    || repr.contains("ordadsinfo")
                    || repr.contains("is_ad=true")
                    || repr.contains("isad=true")
                    || repr.contains("market_ads")
                    || repr.contains("static_ads")
                    || repr.contains("shops_grid_block")) {
                return true;
            }
        } catch (Throwable ignored) {}

        return false;
    }

    private static boolean hasAdVideo(Object item) {
        try {
            Class<?> clazz = item.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(item);
                    if (val == null) continue;
                    String valClass = val.getClass().getName();
                    if (valClass.contains("SdkClipVideoFile") || valClass.contains("SdkVideoFile") || valClass.contains("VideoFile")) {
                        // Check b1() (SdkVideoAdInfo)
                        try {
                            Method mB1 = val.getClass().getMethod("b1");
                            if (mB1.invoke(val) != null) {
                                return true;
                            }
                        } catch (Throwable ignored) {}

                        // Check p1() (SdkOrdAdsInfo)
                        try {
                            Method mP1 = val.getClass().getMethod("p1");
                            if (mP1.invoke(val) != null) {
                                return true;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}
        return false;
    }
}
