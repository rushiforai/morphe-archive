package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Locale lookup only. Optional features own and register their own translation catalogues. */
public final class MorpheTranslations {
    private static final Map<String, String[]> STRINGS = new ConcurrentHashMap<>();
    private MorpheTranslations() {}

    public static void register(String[][] entries) {
        for (String[] entry : entries) {
            if (entry.length != 10) throw new IllegalArgumentException("Expected all 10 supported locale columns");
            STRINGS.put(entry[0], entry.clone());
        }
    }

    public static String text(String english) {
        if (english == null) return null;
        Activity activity = MorpheSettingsRuntime.resumedActivity();
        Locale locale = activity == null ? Locale.getDefault()
                : activity.getResources().getConfiguration().getLocales().get(0);
        return text(english, locale);
    }

    static String text(String english, Locale locale) {
        String[] entry = STRINGS.get(english);
        if (entry == null) return english;
        int index;
        switch (locale.getLanguage()) {
            case "es": index = 1; break;
            case "it": index = 2; break;
            case "de": index = 3; break;
            case "fr": index = 4; break;
            case "pt": index = 5; break;
            case "ja": index = 6; break;
            case "ko": index = 7; break;
            case "zh":
                // An explicit script takes precedence over the region (e.g. zh-Hans-HK).
                boolean traditional = "Hant".equals(locale.getScript())
                        || (locale.getScript().isEmpty() && ("TW".equals(locale.getCountry())
                        || "HK".equals(locale.getCountry()) || "MO".equals(locale.getCountry())));
                index = traditional ? 9 : 8;
                break;
            default: index = 0;
        }
        return entry[index];
    }

    public static String format(String english, Object... values) {
        return String.format(Locale.getDefault(), text(english), values);
    }
}
