package app.tiktoklitepatches.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class FeedFilter {
    private FeedFilter() {}

    public static List<?> removeAds(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        ArrayList<Object> filtered = new ArrayList<>(items.size());
        for (Object item : items) {
            if (!isAd(item) && !hasAdvertisingDisclosure(item)) filtered.add(item);
        }
        return filtered.size() == items.size() ? items : filtered;
    }

    private static boolean isAd(Object item) {
        if (item == null) return false;
        try {
            return Boolean.TRUE.equals(item.getClass().getMethod("isAd").invoke(item));
        } catch (ReflectiveOperationException ignored) {
            return false;
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
