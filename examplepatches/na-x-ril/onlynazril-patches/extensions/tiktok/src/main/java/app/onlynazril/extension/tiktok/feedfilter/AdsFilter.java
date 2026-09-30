package app.onlynazril.extension.tiktok.feedfilter;

import app.onlynazril.extension.tiktok.internal.Reflect;

/**
 * Ads.
 *
 * Four signals, because the app does not use one: `isAd` for a plain ad, `isSoftAd` for the milder
 * unit, `isWithPromotionalMusic` for a boosted song, and a raw-ad payload that only an ad carries.
 * Any of them is enough, and each is read by name for the same reason as everywhere else in the
 * extension: a build that renames one costs that signal, not the filter.
 */
public final class AdsFilter implements IFilter {
    @Override
    public boolean shouldRemove(Object item) {
        return isTrue(Reflect.property(item, "isAd", "isAd"))
                || isTrue(Reflect.property(item, "isSoftAd", "isSoftAd"))
                || isTrue(Reflect.property(item, "isWithPromotionalMusic", "isWithPromotionalMusic"))
                || Reflect.property(item, "getAwemeRawAd", "awemeRawAd") != null;
    }

    private static boolean isTrue(Object value) {
        return Boolean.TRUE.equals(value);
    }

    @Override
    public String reason(Object item) {
        return "ad";
    }
}
