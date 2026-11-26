package app.template.extension.zalo.feed;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/** Removes sponsored items from the Timeline feed. */
public final class FeedAds {
    private FeedAds() { }

    public static List filterFeedAds(List items) {
        if (!isFeedAdsHidden(ZaloEnv.appContext()) || items == null || items.isEmpty()) return items;
        ArrayList filtered = new ArrayList(items.size());
        for (Object item : items) {
            if (!isFeedAdItem(item)) filtered.add(item);
        }
        return filtered;
    }

    private static boolean isFeedAdItem(Object item) {
        try {
            return item != null && item.getClass().getField("c").getInt(item) == 0x51;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce("NezumiFeedAds", "feed item type unavailable (field c)", failure);
            return false;
        }
    }

    static boolean isFeedAdsHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_FEED_ADS, false);
    }
}
