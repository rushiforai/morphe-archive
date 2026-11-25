/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.settings;

import android.content.SharedPreferences;
import android.util.Log;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Called by the app's block registry, which maps the type of a block of a screen (the home feed,
 * an artist page, ...) to the code that builds it. A type that maps to nothing is skipped by the
 * screen, so a hidden block is simply never built.
 */
@SuppressWarnings("unused")
public final class PromoHook {
    /** Never a type of the app, so the registry finds nothing for it. */
    private static final String NOTHING = "nyandex:hidden";

    /** Promotion blocks of the home feed and the "promo" blocks of albums and artists. */
    static final Set<String> PROMO_TYPES = new HashSet<>(Arrays.asList(
            "PROMOTIONS", "EDITORIAL_PROMOTIONS", "NON_MUSIC_PROMOTIONS",
            "ALBUM_PROMO", "SIMPLE_ALBUM_PROMO",
            "ARTIST_RECOMMENDATIONS_PROMO", "SIMPLE_ARTIST_RECOMMENDATIONS_PROMO"));

    /** Banners and subscription offers. */
    static final Set<String> OFFER_TYPES = new HashSet<>(Arrays.asList(
            "BANNER", "DYNAMIC_BANNER", "PAY_OFFERS"));

    private PromoHook() {
    }

    /** The registry looks a block type up by this name; hidden types get one that is not there. */
    public static String lookupKey(String type) {
        try {
            if (type == null) return null;
            boolean promo = PROMO_TYPES.contains(type);
            boolean offer = OFFER_TYPES.contains(type);
            if (!promo && !offer) return type;
            SharedPreferences preferences = NyandexSettings.preferences();
            if (preferences == null) return type;
            if (promo && preferences.getBoolean(NyandexSettings.HIDE_PROMO_KEY, true)) return NOTHING;
            if (offer && preferences.getBoolean(NyandexSettings.HIDE_OFFERS_KEY, true)) return NOTHING;
            return type;
        } catch (Throwable throwable) {
            Log.e(NyandexSettings.TAG, "Failed to filter a block type", throwable);
            return type;
        }
    }
}
