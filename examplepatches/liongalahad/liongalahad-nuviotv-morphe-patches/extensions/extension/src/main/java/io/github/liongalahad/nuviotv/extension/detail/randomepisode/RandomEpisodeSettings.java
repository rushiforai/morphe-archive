package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import android.content.Context;
import android.content.SharedPreferences;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Preference state owned exclusively by the Random Episode patch. */
public final class RandomEpisodeSettings {
    public static final String KEY = "detail.random_episode_button";
    public static final String TITLE = "Enable Per-Show Random Playback";
    public static final String DESCRIPTION =
            "Show a persistent random playback toggle on each series detail page.";
    public static final String POOL_ALL = "all";
    public static final String POOL_UNWATCHED = "unwatched";

    private static final String ENABLED_SHOWS_KEY = "detail.random_episode.enabled_shows";
    private static final String UNWATCHED_SHOWS_KEY = "detail.random_episode.unwatched_shows";
    private static final String WATCHED_PREFIX = "detail.random_episode.watched.";

    private RandomEpisodeSettings() {}

    public static boolean isEnabled() {
        return read(preferences());
    }

    public static boolean toggle() {
        SharedPreferences preferences = preferences();
        boolean enabled = !read(preferences);
        preferences.edit().putBoolean(KEY, enabled).commit();
        return enabled;
    }

    public static void setEnabled(Context context, boolean enabled) {
        MorpheSettingsRuntime.initialize(context);
        context.getApplicationContext()
                .getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE)
                .edit().putBoolean(KEY, enabled).commit();
    }

    public static String canonicalShowKey(String contentType, String contentId) {
        if (contentType == null || contentId == null) return null;
        String type = contentType.trim().toLowerCase(Locale.ROOT);
        String id = contentId.trim();
        if (id.isEmpty() || !("series".equals(type) || "tv".equals(type))) return null;
        return "series:" + id;
    }

    public static boolean isShowEnabled(String showKey) {
        return showKey != null && readSet(preferences(), ENABLED_SHOWS_KEY).contains(showKey);
    }

    public static boolean toggleShow(String showKey) {
        if (showKey == null) return false;
        SharedPreferences preferences = preferences();
        Set<String> enabled = readSet(preferences, ENABLED_SHOWS_KEY);
        boolean nowEnabled;
        if (enabled.remove(showKey)) nowEnabled = false;
        else {
            enabled.add(showKey);
            nowEnabled = true;
        }
        preferences.edit().putStringSet(ENABLED_SHOWS_KEY, enabled).commit();
        return nowEnabled;
    }

    public static void setShowEnabled(String showKey, boolean enabled) {
        if (showKey == null) return;
        SharedPreferences preferences = preferences();
        Set<String> values = readSet(preferences, ENABLED_SHOWS_KEY);
        if (enabled) values.add(showKey);
        else values.remove(showKey);
        preferences.edit().putStringSet(ENABLED_SHOWS_KEY, values).commit();
    }

    public static String episodePool(String showKey) {
        return showKey != null && readSet(preferences(), UNWATCHED_SHOWS_KEY).contains(showKey)
                ? POOL_UNWATCHED : POOL_ALL;
    }

    public static void setEpisodePool(String showKey, String pool) {
        if (showKey == null) return;
        SharedPreferences preferences = preferences();
        Set<String> unwatched = readSet(preferences, UNWATCHED_SHOWS_KEY);
        if (POOL_UNWATCHED.equals(pool)) unwatched.add(showKey);
        else unwatched.remove(showKey);
        preferences.edit().putStringSet(UNWATCHED_SHOWS_KEY, unwatched).commit();
    }

    /** Applies a long-press choice and enables random playback in one preference transaction. */
    public static void selectEpisodePoolAndEnable(String showKey, String pool) {
        if (showKey == null) return;
        SharedPreferences preferences = preferences();
        Set<String> enabled = readSet(preferences, ENABLED_SHOWS_KEY);
        Set<String> unwatched = readSet(preferences, UNWATCHED_SHOWS_KEY);
        enabled.add(showKey);
        if (POOL_UNWATCHED.equals(pool)) unwatched.add(showKey);
        else unwatched.remove(showKey);
        preferences.edit()
                .putStringSet(ENABLED_SHOWS_KEY, enabled)
                .putStringSet(UNWATCHED_SHOWS_KEY, unwatched)
                .commit();
    }

    public static Set<String> watchedEpisodes(String showKey) {
        if (showKey == null) return Collections.emptySet();
        return readSet(preferences(), watchedKey(showKey));
    }

    public static void replaceWatchedEpisodes(String showKey, Set<String> watched) {
        if (showKey == null) return;
        Set<String> copy = watched == null ? new HashSet<>() : new HashSet<>(watched);
        preferences().edit().putStringSet(watchedKey(showKey), copy).commit();
    }

    public static void markEpisodeWatched(String showKey, Integer season, Integer episode) {
        String key = episodeKey(season, episode);
        if (showKey == null || key == null) return;
        SharedPreferences preferences = preferences();
        Set<String> watched = readSet(preferences, watchedKey(showKey));
        if (watched.add(key)) preferences.edit().putStringSet(watchedKey(showKey), watched).commit();
    }

    static String episodeKey(Integer season, Integer episode) {
        if (season == null || season <= 0 || episode == null || episode <= 0) return null;
        return season + ":" + episode;
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static boolean read(SharedPreferences preferences) {
        try { return preferences.getBoolean(KEY, true); }
        catch (ClassCastException ignored) { return false; }
    }

    private static Set<String> readSet(SharedPreferences preferences, String key) {
        try {
            Set<String> stored = preferences.getStringSet(key, Collections.emptySet());
            return stored == null ? new HashSet<>() : new HashSet<>(stored);
        } catch (ClassCastException ignored) {
            return new HashSet<>();
        }
    }

    private static String watchedKey(String showKey) {
        String encoded = Base64.getUrlEncoder().withoutPadding().encodeToString(
                showKey.getBytes(StandardCharsets.UTF_8));
        return WATCHED_PREFIX + encoded;
    }
}
