package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.content.Context;
import android.content.SharedPreferences;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Preference boundary owned by Local Downloads. */
public final class LocalDownloadsSettings {
    public static final String ENABLED_KEY = "playback.local_downloads.enabled";
    public static final String FREE_PERCENT_KEY = "playback.local_downloads.free_percent";
    public static final String AUTOPLAY_KEY = "playback.local_downloads.autoplay";
    public static final int DEFAULT_FREE_PERCENT = 80;
    public static final int MIN_FREE_PERCENT = 1;
    public static final int MAX_FREE_PERCENT = 100;
    private static final int[] ALLOWED_PERCENTAGES = {
            1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50,
            55, 60, 65, 70, 75, 80, 85, 90, 95, 100
    };

    private LocalDownloadsSettings() {}

    public static boolean isEnabled() {
        try { return preferences().getBoolean(ENABLED_KEY, false); }
        catch (ClassCastException ignored) { return false; }
    }

    public static void setEnabled(boolean value) {
        preferences().edit().putBoolean(ENABLED_KEY, value).apply();
    }

    public static boolean isAutoplayEnabled() {
        try { return preferences().getBoolean(AUTOPLAY_KEY, false); }
        catch (ClassCastException ignored) { return false; }
    }

    public static void setAutoplayEnabled(boolean value) {
        preferences().edit().putBoolean(AUTOPLAY_KEY, value).apply();
    }

    public static int freePercent() {
        int value;
        try { value = preferences().getInt(FREE_PERCENT_KEY, DEFAULT_FREE_PERCENT); }
        catch (ClassCastException ignored) { value = DEFAULT_FREE_PERCENT; }
        return nearestAllowedPercentage(value);
    }

    public static void setFreePercent(int value) {
        if (!isAllowedPercentage(value)) {
            throw new IllegalArgumentException("Unsupported storage percentage step: " + value);
        }
        preferences().edit().putInt(FREE_PERCENT_KEY, value).apply();
    }

    public static boolean isValidFreePercent(int value) {
        return value >= MIN_FREE_PERCENT && value <= MAX_FREE_PERCENT;
    }

    public static boolean isAllowedPercentage(int value) {
        for (int allowed : ALLOWED_PERCENTAGES) if (allowed == value) return true;
        return false;
    }

    public static int sliderIndex() {
        int percentage = freePercent();
        for (int index = 0; index < ALLOWED_PERCENTAGES.length; index++) {
            if (ALLOWED_PERCENTAGES[index] == percentage) return index;
        }
        return 0;
    }

    public static int percentageAtSliderIndex(int index) {
        if (index < 0) index = 0;
        if (index >= ALLOWED_PERCENTAGES.length) index = ALLOWED_PERCENTAGES.length - 1;
        return ALLOWED_PERCENTAGES[index];
    }

    public static int sliderMaximum() { return ALLOWED_PERCENTAGES.length - 1; }

    static int nearestAllowedPercentage(int value) {
        if (!isValidFreePercent(value)) return DEFAULT_FREE_PERCENT;
        int nearest = ALLOWED_PERCENTAGES[0];
        int distance = Math.abs(value - nearest);
        for (int allowed : ALLOWED_PERCENTAGES) {
            int candidateDistance = Math.abs(value - allowed);
            if (candidateDistance < distance) {
                nearest = allowed;
                distance = candidateDistance;
            }
        }
        return nearest;
    }

    private static SharedPreferences preferences() {
        Context context = MorpheSettingsRuntime.applicationContext();
        if (context == null) throw new IllegalStateException("Morphe settings were not initialized");
        return context.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
