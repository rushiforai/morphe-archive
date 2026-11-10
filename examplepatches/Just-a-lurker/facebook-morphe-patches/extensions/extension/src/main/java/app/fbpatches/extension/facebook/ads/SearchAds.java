/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/SearchAdFilter.java. Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.extension.facebook.ads;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

/** Removes ad modules from a page of search results. */
@SuppressWarnings("unused")
public final class SearchAds {
    private static final String TAG = "FbPatches";

    /** Search result roles that are ads (GraphQLGraphSearchResultRole constant names). */
    static final String[] AD_ROLES = {
            "SEARCH_ADS",
            "DEPENDENT_SEARCH_ADS",
            "LATE_DEPENDENT_SEARCH_ADS",
            "TOP_POSITION_SEARCH_ADS",
            "TOP_POSITION_SHOPPABLE_ADS",
            "MARKETPLACE_SEARCH_ADS",
            "MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS",
            "SEARCH_ADS_DISCOVERY_HEADER",
            "SEARCH_ADS_FLOATING_SEE_MORE",
    };

    private SearchAds() {
    }

    /**
     * Injection point, first in the search results page constructor, with the page's module list.
     * Null keeps that list; otherwise the modules to keep, which the patch copies into an
     * ImmutableList. Never throws.
     */
    public static Object kept(Object modules) {
        try {
            if (!(modules instanceof List)) return null;
            List<?> list = (List<?>) modules;
            ArrayList<Object> kept = null;
            for (int index = 0; index < list.size(); index++) {
                Object module = list.get(index);
                if (isAd(module)) {
                    if (kept == null) {
                        kept = new ArrayList<>(list.size());
                        kept.addAll(list.subList(0, index));
                    }
                } else if (kept != null) {
                    kept.add(module);
                }
            }
            return kept;
        } catch (Throwable failure) {
            Log.w(TAG, "SearchAds.kept failed", failure);
            return null;
        }
    }

    private static boolean isAd(Object item) {
        if (item == null || !isModule(item)) return false;
        Object role = role(item);
        if (!(role instanceof Enum)) return false;
        String name = ((Enum<?>) role).name();
        for (String ad : AD_ROLES) {
            if (ad.equals(name)) return true;
        }
        return false;
    }

    /** Filled in by the patch: whether an item is a search module. */
    public static boolean isModule(Object item) {
        return false;
    }

    /** Filled in by the patch: the module's result role. Only for an item {@link #isModule} took. */
    public static Object role(Object module) {
        return null;
    }
}
