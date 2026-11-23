package dev.ytmruskippper.skipper;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Reads the skipper's settings from Morphe's settings. Without the Morphe extension in the app
 * (no official Morphe patches applied), there is no settings screen and the defaults apply.
 */
public final class SkipperSettings {
    private static final String TAG = "YtmRuSkipper";
    private static final String MORPHE_PREFERENCES = "morphe_prefs";
    private static final String KEY_PREFIX = "ytm_ru_skip_";

    private static volatile Context app;
    private static volatile boolean morphe;

    // Held strongly, since SharedPreferences only keeps weak references to listeners.
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER = (preferences, key) -> {
        if (key != null && key.startsWith(KEY_PREFIX)) TrackSkipper.onSettingsChanged();
    };

    private SkipperSettings() {}

    /** Called from Application.onCreate. */
    public static void initialize(Context context) {
        if (app != null) return;
        app = context.getApplicationContext();
        // After onCreate returns, so the Morphe extension has set up its own context first.
        new Handler(Looper.getMainLooper()).post(SkipperSettings::load);
    }

    private static void load() {
        try {
            Class.forName("app.morphe.extension.shared.settings.Setting", false, SkipperSettings.class.getClassLoader());
            MorpheSettings.load();
            morphe = true;
            app.getSharedPreferences(MORPHE_PREFERENCES, Context.MODE_PRIVATE)
                    .registerOnSharedPreferenceChangeListener(LISTENER);
        } catch (ClassNotFoundException | LinkageError | RuntimeException error) {
            Log.i(TAG, "Morphe settings are not available, using the default settings");
        }
    }

    static Context context() {
        return app;
    }

    static boolean skipEnabled() {
        return !morphe || MorpheSettings.ENABLED.get();
    }

    static boolean toastEnabled() {
        return !morphe || MorpheSettings.TOAST.get();
    }

    static boolean flagsEnabled() {
        return morphe && MorpheSettings.FLAGS.get();
    }

    static boolean titleMarkersEnabled() {
        return !morphe || MorpheSettings.TITLE_MARKERS.get();
    }

    static boolean keepUkrainianEnabled() {
        return !morphe || MorpheSettings.KEEP_UKRAINIAN.get();
    }

    static boolean countryLookupEnabled() {
        return !morphe || MorpheSettings.COUNTRY_LOOKUP.get();
    }

    /** Upper-case entries, separated by commas or new lines. */
    static Set<String> blockedCountries() {
        return entries(morphe ? MorpheSettings.BLOCKED_COUNTRIES.get() : "RU", "[,\\n]");
    }

    /** Normalized artist names, one per line. */
    static Set<String> alwaysKeep() {
        return morphe ? entries(MorpheSettings.ALWAYS_KEEP.get(), "\\n") : Collections.emptySet();
    }

    static Set<String> alwaysSkip() {
        return morphe ? entries(MorpheSettings.ALWAYS_SKIP.get(), "\\n") : Collections.emptySet();
    }

    static long skipDelayMs() {
        return morphe ? clamp(MorpheSettings.SKIP_DELAY_SECONDS.get(), 0, 60) * 1000L : 0;
    }

    static long lookupWindowMs() {
        return (morphe ? clamp(MorpheSettings.LOOKUP_WINDOW_SECONDS.get(), 3, 120) : 15) * 1000L;
    }

    static String normalize(String value) {
        return value.trim().toUpperCase(Locale.ROOT);
    }

    private static Set<String> entries(String text, String separator) {
        Set<String> entries = new HashSet<>();
        if (text == null) return entries;
        for (String entry : text.split(separator)) {
            String normalized = normalize(entry);
            if (!normalized.isEmpty()) entries.add(normalized);
        }
        return entries;
    }

    private static int clamp(Integer value, int min, int max) {
        return value == null ? min : Math.max(min, Math.min(max, value));
    }
}
