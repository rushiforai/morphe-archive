package app.template.extension.extension;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Removes TikTok Lite ads from feed-shaped responses before the TV client renders them. */
@SuppressWarnings("unused")
public class Ads {

    private static final String TAG = "TikTokTVAds";

    /**
     * Accepts whatever a feed-shaped response offers: a `FeedItemList`, whose `items` and
     * `preloadAds` are both aweme lists.
     */
    public static void strip(Object response) {
        if (response == null) return;
        try {
            int removed = drop(itemsOf(response, "getItems"));
            int preloaded = clear(itemsOf(response, "getPreloadAds"));
            if (removed > 0) Log.i(TAG, "stripped " + removed + " ads");
            if (preloaded > 0) Log.i(TAG, "cleared " + preloaded + " preload ads");
        } catch (Throwable throwable) {
            Log.i(TAG, "strip failed: " + throwable.getClass().getSimpleName());
        }
    }

    @SuppressWarnings("unchecked")
    private static List<Object> itemsOf(Object response, String getter) {
        // An unwrapped list is a page of posts, which carries no preload queue of its own.
        if (response instanceof List) {
            return "getItems".equals(getter) ? (List<Object>) response : null;
        }
        try {
            Method method = response.getClass().getMethod(getter);
            Object value = method.invoke(response);
            return value instanceof List ? (List<Object>) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Removes from the tail so no index shifts under an earlier element. */
    private static int drop(List<Object> items) {
        if (items == null || items.isEmpty()) return 0;
        List<String> aids = new ArrayList<>();
        try {
            for (int i = items.size() - 1; i >= 0; i--) {
                if (!isAd(items.get(i))) continue;
                aids.add(0, aidOf(items.remove(i)));
            }
        } catch (Throwable throwable) {
            Log.i(TAG, "list cannot be edited: " + throwable.getClass().getSimpleName());
        }
        if (aids.isEmpty()) return 0;
        Log.i(TAG, "dropped " + aids);
        return aids.size();
    }

    private static int clear(List<Object> items) {
        if (items == null || items.isEmpty()) return 0;
        int size = items.size();
        try {
            items.clear();
        } catch (Throwable throwable) {
            return 0;
        }
        return size;
    }

    /** `is_ads` or `raw_ad_data` alone is enough: a response can carry either without the other. */
    private static boolean isAd(Object item) {
        if (item == null) return false;
        try {
            if (Boolean.TRUE.equals(item.getClass().getField("isAd").get(item))) return true;
            return item.getClass().getField("awemeRawAd").get(item) != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String aidOf(Object item) {
        try {
            Object aid = item.getClass().getMethod("getAid").invoke(item);
            return String.valueOf(aid);
        } catch (Throwable ignored) {
            return "<unknown>";
        }
    }
}
