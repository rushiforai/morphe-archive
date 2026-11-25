/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Locale;

/**
 * Preferences of the Nyandex settings page, stored in the app's own private storage.
 */
@SuppressWarnings("unused")
public final class NyandexSettings {
    static final String TAG = "NyandexSettings";
    static final String PREFERENCES = "nyandex";
    static final String HIDDEN_TAB_PREFIX = "hide_tab_";
    static final String TAB_TOUCH_AREA_KEY = "tab_touch_area";
    static final String HIDE_PROMO_KEY = "hide_promo_blocks";
    static final String HIDE_OFFERS_KEY = "hide_offer_blocks";

    /** Keys read by the LRCLIB lyrics extension (LrcLibLyrics). */
    static final String LYRICS_OFFSET_KEY = "lyrics_offset_ms";
    static final String LYRICS_PREFETCH_KEY = "lyrics_prefetch";
    static final String LYRICS_CACHE_LIMIT_KEY = "lyrics_cache_limit";
    static final String LYRICS_DOWNLOAD_KEY = "lyrics_download_with_tracks";
    static final String LYRICS_KEEP_DOWNLOADED_KEY = "lyrics_keep_downloaded";
    /** Choices for the number of lyrics kept on disk; 0 keeps none. Must contain the default. */
    static final int[] LYRICS_CACHE_LIMITS = {0, 500, 1000, 3000, 10000};
    static final int LYRICS_CACHE_LIMIT_DEFAULT = 3000;
    static final String LYRICS_CLASS = "app.nyandex.extension.yandexmusic.lyrics.LrcLibLyrics";

    /** Keys read by the haptics extension (HapticsHook): switch name, default. */
    static final String HAPTICS_CLASS = "app.nyandex.extension.yandexmusic.haptics.HapticsHook";
    static final String HAPTICS_BUTTONS_KEY = "haptics_buttons";
    static final String HAPTICS_OTHER_TAPS_KEY = "haptics_other_taps";
    static final String HAPTICS_LONG_PRESS_KEY = "haptics_long_press";
    static final String HAPTICS_REFRESH_KEY = "haptics_refresh";
    static final int LYRICS_OFFSET_STEP_MS = 100;
    static final int LYRICS_OFFSET_LIMIT_MS = 5000;

    /**
     * Bottom bar tabs, by the name of the app's tab enum constant, in bar order.
     * Each entry: {enum name, English label, Russian label}.
     */
    static final String[][] BOTTOM_TABS = {
            {"WAVE", "My Vibe", "Моя волна"},
            {"LANDING", "Main", "Главное"},
            {"PODCASTS", "Podcasts and books", "Подкасты и книги"},
            {"CONCERTS", "Concerts", "Концерты"},
            {"KIDS", "For kids", "Детям"},
            {"MY_MUSIC", "Collection", "Коллекция"},
    };

    private static volatile Context context;

    private NyandexSettings() {
    }

    /**
     * Whether the "Hide bottom bar tabs" patch is applied. The patch replaces this method so it
     * returns true; the settings page shows the tab section only then.
     */
    public static boolean bottomTabsAvailable() {
        return false;
    }

    static Context context() {
        Context current = context;
        if (current != null) return current;
        try {
            // The application object of the current process; a public, unrestricted hidden API.
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (application instanceof Context) {
                current = ((Context) application).getApplicationContext();
                context = current;
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "No application context", throwable);
        }
        return current;
    }

    static SharedPreferences preferences() {
        Context current = context();
        return current == null ? null : current.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /**
     * Whether the "Hide promo and offers" patch is applied. The patch replaces this method so it
     * returns true; the settings page shows the promo section only then.
     */
    public static boolean promoAvailable() {
        return false;
    }

    static boolean hidePromo() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(HIDE_PROMO_KEY, true);
    }

    static boolean hideOffers() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(HIDE_OFFERS_KEY, true);
    }

    static void setHidePromo(boolean hide) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(HIDE_PROMO_KEY, hide).apply();
    }

    static void setHideOffers(boolean hide) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(HIDE_OFFERS_KEY, hide).apply();
    }

    /** Whether a touch anywhere in a tab's share of the bottom bar counts as a tap on the tab. */
    static boolean tabTouchArea() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(TAB_TOUCH_AREA_KEY, true);
    }

    static void setTabTouchArea(boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(TAB_TOUCH_AREA_KEY, enabled).apply();
    }

    static boolean isTabHidden(SharedPreferences preferences, String tab) {
        return preferences.getBoolean(HIDDEN_TAB_PREFIX + tab, false);
    }

    static void setTabHidden(String tab, boolean hidden) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(HIDDEN_TAB_PREFIX + tab, hidden).apply();
    }

    /** Whether the "Haptic feedback" patch is applied (its extension class is in the app). */
    static boolean hapticsAvailable() {
        try {
            Class.forName(HAPTICS_CLASS);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean hapticsEnabled(String key, boolean fallback) {
        SharedPreferences preferences = preferences();
        return preferences == null ? fallback : preferences.getBoolean(key, fallback);
    }

    static void setHapticsEnabled(String key, boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(key, enabled).apply();
    }

    /** The lyrics extension class, present only when the "LRCLIB lyrics" patch is applied. */
    static Class<?> lyricsClass() {
        try {
            return Class.forName(LYRICS_CLASS);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Call a public static no-argument int method of the lyrics extension, or return -1. */
    static int callLyrics(String method) {
        try {
            Class<?> lyrics = lyricsClass();
            return lyrics == null ? -1 : (Integer) lyrics.getMethod(method).invoke(null);
        } catch (Throwable throwable) {
            Log.e(TAG, "Lyrics call " + method + " failed", throwable);
            return -1;
        }
    }

    static int lyricsOffset() {
        SharedPreferences preferences = preferences();
        return preferences == null ? 0 : preferences.getInt(LYRICS_OFFSET_KEY, 0);
    }

    static void setLyricsOffset(int offsetMs) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putInt(LYRICS_OFFSET_KEY, offsetMs).apply();
    }

    static int lyricsCacheLimit() {
        SharedPreferences preferences = preferences();
        return preferences == null
                ? LYRICS_CACHE_LIMIT_DEFAULT
                : preferences.getInt(LYRICS_CACHE_LIMIT_KEY, LYRICS_CACHE_LIMIT_DEFAULT);
    }

    /** Store the limit synchronously: the lyrics extension trims its cache right after. */
    static void setLyricsCacheLimit(int limit) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putInt(LYRICS_CACHE_LIMIT_KEY, limit).commit();
    }

    static boolean lyricsDownloadWithTracks() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(LYRICS_DOWNLOAD_KEY, true);
    }

    static void setLyricsDownloadWithTracks(boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(LYRICS_DOWNLOAD_KEY, enabled).apply();
    }

    static boolean lyricsKeepDownloaded() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(LYRICS_KEEP_DOWNLOADED_KEY, true);
    }

    /** Stored synchronously: the lyrics extension moves its files right after. */
    static void setLyricsKeepDownloaded(boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(LYRICS_KEEP_DOWNLOADED_KEY, enabled).commit();
    }

    static boolean lyricsPrefetch() {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(LYRICS_PREFETCH_KEY, true);
    }

    static void setLyricsPrefetch(boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(LYRICS_PREFETCH_KEY, enabled).apply();
    }

    static boolean isRussian() {
        return "ru".equals(Locale.getDefault().getLanguage());
    }

    static String text(String english, String russian) {
        return isRussian() ? russian : english;
    }
}
