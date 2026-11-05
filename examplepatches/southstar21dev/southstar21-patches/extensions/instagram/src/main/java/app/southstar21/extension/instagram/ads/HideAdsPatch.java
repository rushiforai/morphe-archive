package app.southstar21.extension.instagram.ads;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.SettingsGroup;

/**
 * Hide ads patch: entry points for every hook and their settings.
 * <ul>
 *   <li>Sponsored content: Feed, Stories, Reels and the other feeds share one sponsored
 *       content controller. Each batch of ads it receives from the network is emptied here,
 *       which Instagram treats as a delivery with no ads.</li>
 *   <li>Home feed: ad units that arrive with the feed itself are dropped as they're parsed,
 *       like Disable Reels does with reels.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class HideAdsPatch {
    private static final String TAG = "HideAds";

    static final BooleanSetting HIDE_SPONSORED = new BooleanSetting("ads_hide_sponsored",
            "Sponsored posts", "Ads in the home feed, Stories, Reels and feeds opened from Explore.", true, true);
    static final BooleanSetting HIDE_FEED_UNITS = new BooleanSetting("ads_hide_feed_units",
            "Ad units in the feed", "Shop and ad carousels, and \"Why am I seeing ads\" prompts.", true, true);

    public static final PatchSettings SETTINGS = new PatchSettings("ads",
            "Hide ads",
            "Removes ads from Instagram.",
            HideAdsPatch::isIncluded,
            new SettingsGroup("Hide",
                    "Changes apply to newly loaded posts. Ads loaded earlier may still show once.",
                    HIDE_SPONSORED, HIDE_FEED_UNITS))
            .icon(Icons.Glyph.NO_ADS, 0xFFFF9500);

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    /** Overwritten by the patch to call FeedItem's type getter. */
    public static Object feedItemType(Object feedItem) {
        return null;
    }

    /** Called with each batch of ads Instagram receives. An empty list means no ads. */
    public static List<?> filterSponsoredContent(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        try {
            if (SETTINGS.isActive() && HIDE_SPONSORED.get()) return new ArrayList<>();
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter sponsored content", t);
        }
        return items;
    }

    /** Feed units that are ads or about ads. */
    private static final String[] AD_FEED_ITEM_TYPES = {
            "AD",
            "INTENT_AWARE_AD_PIVOT",
            "STAND_ALONE_MULTI_AD_PIVOT",
            "ADS_FEEDBACK_INTERFACE",
            "ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER",
            "ADS_FEEDBACK_INTERFACE_REPETITION",
    };

    /** Called with each feed item Instagram parses. Returning null drops it. */
    public static Object filterFeedItem(Object item) {
        if (item == null) return null;
        try {
            if (SETTINGS.isActive() && HIDE_FEED_UNITS.get() && isAdFeedItem(item)) return null;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter feed item", t);
        }
        return item;
    }

    private static boolean isAdFeedItem(Object item) {
        Object type;
        try {
            type = feedItemType(item);
        } catch (Throwable ignored) {
            return false; // Instagram's getter throws if the item has no type yet.
        }
        if (!(type instanceof Enum)) return false;
        String name = ((Enum<?>) type).name();
        for (String adType : AD_FEED_ITEM_TYPES) {
            if (adType.equals(name)) return true;
        }
        return false;
    }
}
