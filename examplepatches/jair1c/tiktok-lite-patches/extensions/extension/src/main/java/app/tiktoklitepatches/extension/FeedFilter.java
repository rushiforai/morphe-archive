package app.tiktoklitepatches.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

public final class FeedFilter {
    private static final java.util.concurrent.atomic.AtomicInteger REMOVED = new java.util.concurrent.atomic.AtomicInteger();

    private static final Set<Object> countedAds =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private FeedFilter() {}

    public static int removedCount() { return REMOVED.get(); }

    public static List<?> filterFeed(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        boolean hideAds = ModSettings.hideAds();
        boolean hideLive = ModSettings.hideLive();
        boolean hidePhotos = ModSettings.hidePhotoPosts();
        if (!hideAds && !hideLive && !hidePhotos) return items;

        ArrayList<Object> filtered = new ArrayList<>(items.size());
        int removedAds = 0;
        for (Object item : items) {
            if (hideAds && (isAd(item) || hasFullModelAdSignal(item) || hasAdvertisingDisclosure(item))) {
                if (countedAds.add(item)) removedAds++;
                continue;
            }
            if (hideLive && isLivePost(item)) continue;
            if (hidePhotos && read(item, "getPhotoModeImageInfo") != null) continue;
            if (hidePhotos && Boolean.TRUE.equals(read(item, "isPhotoMode"))) continue;
            filtered.add(item);
        }
        if (removedAds > 0) REMOVED.addAndGet(removedAds);
        return filtered.size() == items.size() ? items : filtered;
    }

    private static boolean isLivePost(Object item) {
        return Boolean.TRUE.equals(read(item, "isLive")) ||
                read(item, "getRoom") != null ||
                read(item, "getRoomFeedCellStruct") != null;
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
        if (item == null) return null;
        try {
            return item.getClass().getMethod(method).invoke(item);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static boolean hasAdvertisingDisclosure(Object item) {
        Object commerce = read(item, "getCommerceInfo");
        return isAdvertisingLabel(readField(commerce, "bcHashtag"))
                || isAdvertisingLabel(readField(commerce, "bcLabelText"));
    }

    private static Object readField(Object item, String field) {
        if (item == null) return null;
        try {
            return item.getClass().getField(field).get(item);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static boolean isAdvertisingLabel(Object disclosure) {
        if (!(disclosure instanceof String)) return false;
        String label = ((String) disclosure).trim().toLowerCase(Locale.ROOT);
        return label.equals("publicidad") || label.equals("#publicidad") ||
                label.equals("advertisement") || label.equals("sponsored") ||
                label.equals("patrocinado") || label.equals("paid partnership") ||
                label.equals("colaboración pagada");
    }
}
