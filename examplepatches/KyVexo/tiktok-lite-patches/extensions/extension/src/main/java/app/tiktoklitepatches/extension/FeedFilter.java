package app.tiktoklitepatches.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class FeedFilter {
    private static final java.util.concurrent.atomic.AtomicInteger REMOVED = new java.util.concurrent.atomic.AtomicInteger();

    private FeedFilter() {}

    public static int removedCount() { return REMOVED.get(); }

    public static List<?> removeAds(List<?> items) {
        if (!ModSettings.hideAds() || items == null || items.isEmpty()) return items;
        ArrayList<Object> filtered = new ArrayList<>(items.size());
        for (Object item : items) {
            if (!isAd(item) && !hasFullModelAdSignal(item) && !hasAdvertisingDisclosure(item)) filtered.add(item);
        }
        int removed = items.size() - filtered.size();
        if (removed == 0) return items;
        REMOVED.addAndGet(removed);
        return filtered;
    }

    private static boolean isAd(Object item) {
        if (item == null) return false;
        try {
            return Boolean.TRUE.equals(item.getClass().getMethod("isAd").invoke(item));
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }

    private static boolean hasFullModelAdSignal(Object item) {
        if (item == null || !item.getClass().getName().equals("com.ss.android.ugc.aweme.feed.model.Aweme")) {
            return false;
        }
        return Boolean.TRUE.equals(read(item, "isSoftAd")) || read(item, "getAwemeRawAd") != null;
    }

    private static Object read(Object item, String method) {
        try {
            return item.getClass().getMethod(method).invoke(item);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static boolean hasAdvertisingDisclosure(Object item) {
        if (item == null) return false;
        try {
            Object commerce = item.getClass().getMethod("getCommerceInfo").invoke(item);
            if (commerce == null) return false;
            Object disclosure = commerce.getClass().getField("bcHashtag").get(commerce);
            if (!(disclosure instanceof String)) return false;
            String label = ((String) disclosure).trim().toLowerCase(Locale.ROOT);
            return label.equals("publicidad") || label.equals("#publicidad") ||
                   label.equals("advertisement") || label.equals("sponsored");
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }
}
