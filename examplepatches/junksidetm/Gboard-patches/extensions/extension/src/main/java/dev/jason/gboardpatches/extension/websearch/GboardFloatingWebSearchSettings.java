package dev.jason.gboardpatches.extension.websearch;

import android.annotation.SuppressLint;
import android.content.SharedPreferences;

import java.net.URI;

@SuppressLint("ApplySharedPref")
public final class GboardFloatingWebSearchSettings {
    public static final String PREF_KEY_ENABLED = "pref_floating_web_search_enabled";
    public static final String PREF_KEY_START_PAGE_MODE =
            "pref_floating_web_search_start_page_mode";
    public static final String PREF_KEY_CUSTOM_START_PAGE_URL =
            "pref_floating_web_search_custom_start_page_url";
    public static final String PREF_KEY_INITIAL_HEIGHT_PERCENT =
            "pref_floating_web_search_initial_height_percent";
    public static final String PREF_KEY_BROWSER_PROVIDER =
            "pref_floating_web_search_browser_provider";

    public static final String START_PAGE_GOOGLE = "google";
    public static final String START_PAGE_DUCKDUCKGO = "duckduckgo";
    public static final String START_PAGE_BING = "bing";
    public static final String START_PAGE_CUSTOM = "custom";
    public static final String BROWSER_SYSTEM_DEFAULT = "system_default";

    public static final String GOOGLE_URL = "https://www.google.com/";
    public static final String DUCKDUCKGO_URL = "https://duckduckgo.com/";
    public static final String BING_URL = "https://www.bing.com/";

    public static final boolean DEFAULT_ENABLED = true;
    public static final String DEFAULT_START_PAGE_MODE = START_PAGE_GOOGLE;
    public static final String DEFAULT_CUSTOM_START_PAGE_URL = GOOGLE_URL;
    public static final int DEFAULT_INITIAL_HEIGHT_PERCENT = 100;
    public static final String DEFAULT_BROWSER_PROVIDER = BROWSER_SYSTEM_DEFAULT;
    public static final int[] ALLOWED_HEIGHT_PERCENTAGES = {100, 90, 80, 70, 60, 50};

    private static final String LEGACY_PREF_KEY_ENABLED = "pref_inline_web_search_enabled";

    private GboardFloatingWebSearchSettings() {
    }

    public static GboardFloatingWebSearchSettingsSnapshot readSnapshotOrNull(
            SharedPreferences preferences) {
        Boolean enabled = readEnabledOrNull(preferences);
        if (enabled == null) {
            return null;
        }
        String mode = readStartPageMode(preferences);
        String customUrl = readCustomStartPageUrl(preferences);
        return new GboardFloatingWebSearchSettingsSnapshot(
                enabled.booleanValue(), mode, resolveStartPageUrl(mode, customUrl), customUrl,
                readInitialHeightPercent(preferences), readBrowserProvider(preferences));
    }

    public static Boolean readEnabledOrNull(SharedPreferences preferences) {
        if (preferences == null) {
            return null;
        }
        Object raw = preferences.getAll().get(PREF_KEY_ENABLED);
        if (raw == null && !preferences.contains(PREF_KEY_ENABLED)) {
            raw = preferences.getAll().get(LEGACY_PREF_KEY_ENABLED);
            if (raw == null && !preferences.contains(LEGACY_PREF_KEY_ENABLED)) {
                return Boolean.valueOf(DEFAULT_ENABLED);
            }
        }
        if (raw instanceof Boolean value) {
            return value;
        }
        if (raw instanceof String value) {
            if ("true".equalsIgnoreCase(value)) {
                return Boolean.TRUE;
            }
            if ("false".equalsIgnoreCase(value)) {
                return Boolean.FALSE;
            }
        }
        return null;
    }

    public static String readStartPageMode(SharedPreferences preferences) {
        String value = readString(preferences, PREF_KEY_START_PAGE_MODE,
                DEFAULT_START_PAGE_MODE);
        return isStartPageMode(value) ? value : DEFAULT_START_PAGE_MODE;
    }

    public static String readCustomStartPageUrl(SharedPreferences preferences) {
        String value = readString(preferences, PREF_KEY_CUSTOM_START_PAGE_URL,
                DEFAULT_CUSTOM_START_PAGE_URL);
        return isAllowedHttpsUrl(value) ? value : DEFAULT_CUSTOM_START_PAGE_URL;
    }

    public static int readInitialHeightPercent(SharedPreferences preferences) {
        Object raw = readRaw(preferences, PREF_KEY_INITIAL_HEIGHT_PERCENT);
        int value = DEFAULT_INITIAL_HEIGHT_PERCENT;
        if (raw instanceof Number number) {
            value = number.intValue();
        } else if (raw instanceof String stringValue) {
            try {
                value = Integer.parseInt(stringValue);
            } catch (NumberFormatException ignored) {
                value = DEFAULT_INITIAL_HEIGHT_PERCENT;
            }
        }
        return isAllowedHeightPercent(value) ? value : DEFAULT_INITIAL_HEIGHT_PERCENT;
    }

    public static String readBrowserProvider(SharedPreferences preferences) {
        String value = readString(preferences, PREF_KEY_BROWSER_PROVIDER,
                DEFAULT_BROWSER_PROVIDER);
        return isBrowserProviderValue(value) ? value : DEFAULT_BROWSER_PROVIDER;
    }

    public static String resolveStartPageUrl(String mode, String customUrl) {
        if (START_PAGE_DUCKDUCKGO.equals(mode)) {
            return DUCKDUCKGO_URL;
        }
        if (START_PAGE_BING.equals(mode)) {
            return BING_URL;
        }
        if (START_PAGE_CUSTOM.equals(mode) && isAllowedHttpsUrl(customUrl)) {
            return customUrl;
        }
        return GOOGLE_URL;
    }

    public static boolean isAllowedHttpsUrl(String rawUrl) {
        if (rawUrl == null || rawUrl.isBlank()) {
            return false;
        }
        try {
            URI uri = URI.create(rawUrl);
            return "https".equalsIgnoreCase(uri.getScheme()) && uri.getHost() != null;
        } catch (IllegalArgumentException ignored) {
            return false;
        }
    }

    public static boolean isAllowedHeightPercent(int value) {
        for (int allowed : ALLOWED_HEIGHT_PERCENTAGES) {
            if (value == allowed) {
                return true;
            }
        }
        return false;
    }

    public static boolean isStartPageMode(String value) {
        return START_PAGE_GOOGLE.equals(value)
                || START_PAGE_DUCKDUCKGO.equals(value)
                || START_PAGE_BING.equals(value)
                || START_PAGE_CUSTOM.equals(value);
    }

    public static boolean isBrowserProviderValue(String value) {
        return BROWSER_SYSTEM_DEFAULT.equals(value)
                || value != null && value.matches("[A-Za-z0-9_]+(?:\\.[A-Za-z0-9_]+)+");
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        SharedPreferences.Editor editor = preferences.edit();
        boolean changed = false;
        if (!preferences.contains(PREF_KEY_ENABLED)) {
            Boolean legacy = readEnabledOrNull(preferences);
            editor.putBoolean(PREF_KEY_ENABLED,
                    legacy != null ? legacy.booleanValue() : DEFAULT_ENABLED);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_START_PAGE_MODE)) {
            editor.putString(PREF_KEY_START_PAGE_MODE, DEFAULT_START_PAGE_MODE);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_CUSTOM_START_PAGE_URL)) {
            editor.putString(PREF_KEY_CUSTOM_START_PAGE_URL, DEFAULT_CUSTOM_START_PAGE_URL);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_INITIAL_HEIGHT_PERCENT)) {
            editor.putInt(PREF_KEY_INITIAL_HEIGHT_PERCENT, DEFAULT_INITIAL_HEIGHT_PERCENT);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_BROWSER_PROVIDER)) {
            editor.putString(PREF_KEY_BROWSER_PROVIDER, DEFAULT_BROWSER_PROVIDER);
            changed = true;
        }
        if (changed) {
            editor.commit();
        }
    }

    private static Object readRaw(SharedPreferences preferences, String key) {
        return preferences == null ? null : preferences.getAll().get(key);
    }

    private static String readString(SharedPreferences preferences, String key,
            String defaultValue) {
        Object raw = readRaw(preferences, key);
        return raw instanceof String value ? value : defaultValue;
    }
}
