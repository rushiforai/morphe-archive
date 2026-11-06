package dev.jason.gboardpatches.extension.symbolfooter;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

public final class GboardSymbolFooterOrderSettings {
    private static final String TAG = "GboardPatches";
    private static final String LOG_LABEL = "expression footer tab order";
    public static final String PREF_FILE = "gboard_symbol_footer_order";
    public static final String PREF_KEY_SYMBOL_FOOTER_ORDER = "pref_symbol_footer_order";

    public static final String SYMBOL_FOOTER_TAB_EMOJI = "smiley";
    public static final String SYMBOL_FOOTER_TAB_CUSTOM_SYMBOLS = "jasondev_symbol";
    public static final String SYMBOL_FOOTER_TAB_EMOTICON = "emoticon";
    public static final String SYMBOL_FOOTER_TAB_GIF = "gif_search_result";
    public static final String SYMBOL_FOOTER_TAB_STICKER = "sticker_search_result";

    public static final List<String> DEFAULT_SYMBOL_FOOTER_ORDER =
            Collections.unmodifiableList(Arrays.asList(
                    SYMBOL_FOOTER_TAB_EMOJI,
                    SYMBOL_FOOTER_TAB_GIF,
                    SYMBOL_FOOTER_TAB_STICKER,
                    SYMBOL_FOOTER_TAB_EMOTICON,
                    SYMBOL_FOOTER_TAB_CUSTOM_SYMBOLS));

    private static final String ORDER_DELIMITER = ",";

    private GboardSymbolFooterOrderSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        Context applicationContext = context != null ? context.getApplicationContext() : null;
        Context lookupContext = applicationContext != null ? applicationContext : context;
        if (lookupContext == null) {
            return null;
        }
        try {
            return lookupContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to resolve preferences for " + LOG_LABEL, throwable);
            return null;
        }
    }

    public static void ensureDefaults(Context context) {
        if (context == null) {
            return;
        }
        ensureDefaults(preferences(context));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        try {
            String storedValue = readStringPreference(preferences, PREF_KEY_SYMBOL_FOOTER_ORDER, null);
            String normalizedValue = normalizeStoredSymbolFooterOrder(preferences);
            if (!normalizedValue.equals(storedValue)) {
                preferences.edit()
                        .putString(PREF_KEY_SYMBOL_FOOTER_ORDER, normalizedValue)
                        .apply();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to normalize " + LOG_LABEL + " defaults", throwable);
        }
    }

    public static List<String> readSymbolFooterOrder(Context context) {
        SharedPreferences preferences = preferences(context);
        if (preferences == null) {
            return defaultOrderCopy();
        }
        ensureDefaults(preferences);
        return readSymbolFooterOrder(preferences);
    }

    public static List<String> readSymbolFooterOrder(SharedPreferences preferences) {
        if (preferences == null) {
            return defaultOrderCopy();
        }
        ensureDefaults(preferences);
        try {
            String storedValue = readStringPreference(
                    preferences,
                    PREF_KEY_SYMBOL_FOOTER_ORDER,
                    joinSymbolFooterOrder(DEFAULT_SYMBOL_FOOTER_ORDER));
            return sanitizeSymbolFooterOrder(storedValue);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to read " + LOG_LABEL + "; using defaults", throwable);
            return defaultOrderCopy();
        }
    }

    public static void writeSymbolFooterOrder(Context context, List<String> order) {
        if (context == null) {
            return;
        }
        writeSymbolFooterOrder(preferences(context), order);
    }

    public static void writeSymbolFooterOrder(SharedPreferences preferences, List<String> order) {
        if (preferences == null) {
            return;
        }
        String persistedValue = joinSymbolFooterOrder(order);
        try {
            boolean committed = preferences.edit()
                    .putString(PREF_KEY_SYMBOL_FOOTER_ORDER, persistedValue)
                    .commit();
            if (!committed) {
                Log.w(TAG, "Commit returned false while persisting " + LOG_LABEL
                        + ": " + persistedValue);
            } else {
                Log.i(TAG, "Persisted " + LOG_LABEL + ": " + persistedValue);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to persist " + LOG_LABEL, throwable);
        } finally {
            GboardSymbolFooterOrderRuntime.invalidateCachedSettings();
        }
    }

    private static String readStringPreference(SharedPreferences preferences, String key,
            String defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        try {
            return preferences.getString(key, defaultValue);
        } catch (Throwable ignored) {
            // Fall through to the raw map lookup below.
        }
        try {
            Object value = preferences.getAll().get(key);
            if (value instanceof String) {
                return (String) value;
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to read " + LOG_LABEL + " preference=" + key, throwable);
        }
        return defaultValue;
    }

    private static String normalizeStoredSymbolFooterOrder(SharedPreferences preferences) {
        return joinSymbolFooterOrder(sanitizeSymbolFooterOrder(readStringPreference(
                preferences,
                PREF_KEY_SYMBOL_FOOTER_ORDER,
                joinSymbolFooterOrder(DEFAULT_SYMBOL_FOOTER_ORDER))));
    }

    private static List<String> sanitizeSymbolFooterOrder(String storedValue) {
        if (storedValue == null || storedValue.trim().isEmpty()) {
            return new ArrayList<String>(DEFAULT_SYMBOL_FOOTER_ORDER);
        }
        return sanitizeSymbolFooterOrder(Arrays.asList(storedValue.split(ORDER_DELIMITER)));
    }

    private static List<String> sanitizeSymbolFooterOrder(List<String> storedOrder) {
        LinkedHashSet<String> normalized = new LinkedHashSet<String>();
        if (storedOrder != null) {
            for (String value : storedOrder) {
                String sanitizedValue = sanitizeSymbolFooterTabType(value);
                if (sanitizedValue != null) {
                    normalized.add(sanitizedValue);
                }
            }
        }
        for (String defaultValue : DEFAULT_SYMBOL_FOOTER_ORDER) {
            normalized.add(defaultValue);
        }
        return new ArrayList<String>(normalized);
    }

    private static String sanitizeSymbolFooterTabType(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        if (SYMBOL_FOOTER_TAB_EMOJI.equals(trimmed)
                || SYMBOL_FOOTER_TAB_CUSTOM_SYMBOLS.equals(trimmed)
                || SYMBOL_FOOTER_TAB_EMOTICON.equals(trimmed)
                || SYMBOL_FOOTER_TAB_GIF.equals(trimmed)
                || SYMBOL_FOOTER_TAB_STICKER.equals(trimmed)) {
            return trimmed;
        }
        return null;
    }

    private static String joinSymbolFooterOrder(List<String> order) {
        List<String> sanitizedOrder = sanitizeSymbolFooterOrder(order);
        StringBuilder builder = new StringBuilder();
        for (int index = 0; index < sanitizedOrder.size(); index++) {
            if (index > 0) {
                builder.append(ORDER_DELIMITER);
            }
            builder.append(sanitizedOrder.get(index));
        }
        return builder.toString();
    }

    private static List<String> defaultOrderCopy() {
        return new ArrayList<String>(DEFAULT_SYMBOL_FOOTER_ORDER);
    }
}
