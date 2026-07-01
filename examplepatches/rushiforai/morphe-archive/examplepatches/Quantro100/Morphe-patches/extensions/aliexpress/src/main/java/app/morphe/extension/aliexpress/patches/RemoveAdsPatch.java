package app.morphe.extension.aliexpress.patches;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unused")
public final class RemoveAdsPatch {

    public static boolean shouldShowAd() {
        return false;
    }

    public static List<Object> filterAds(List<Object> items) {
        if (items == null || items.isEmpty()) return items;
        List<Object> filtered = new ArrayList<>();
        for (Object item : items) {
            if (!isAdItem(item)) {
                filtered.add(item);
            }
        }
        return filtered;
    }

    private static boolean isAdItem(Object item) {
        if (item == null) return false;
        String cls = item.getClass().getName();
        return cls.contains("AdItem")
            || cls.contains("Sponsored")
            || cls.contains("advertisement");
    }
}
