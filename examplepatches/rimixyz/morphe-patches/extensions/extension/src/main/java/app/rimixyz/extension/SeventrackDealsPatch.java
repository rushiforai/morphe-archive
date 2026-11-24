package app.rimixyz.extension;

import java.util.Map;

/**
 * Forces the 17TRACK Deals tab and campaign-ad suppression flags inside the
 * legacy Flutter SharedPreferences map returned by
 * LegacySharedPreferencesPlugin.getAll().
 */
@SuppressWarnings("unused")
public final class SeventrackDealsPatch {

    private static final String FLUTTER_HIDE_DEALS_CAMPAIGN = "flutter.SHARE_PREFERENCES_HIDE_DEALS_CAMPAIGN";
    private static final String FLUTTER_HIDE_DEALS_TAB = "flutter.SHARE_PREFERENCES_HIDE_DEALS_TAB";

    private SeventrackDealsPatch() {
    }

    public static Map<String, Object> hideDeals(Map<String, Object> map) {
        if (map == null) {
            return null;
        }
        try {
            map.put(FLUTTER_HIDE_DEALS_CAMPAIGN, Boolean.TRUE);
            map.put(FLUTTER_HIDE_DEALS_TAB, Boolean.TRUE);
        } catch (Throwable ignored) {
            // Fail-safe: never break SharedPreferences.getInstance().
        }
        return map;
    }
}
