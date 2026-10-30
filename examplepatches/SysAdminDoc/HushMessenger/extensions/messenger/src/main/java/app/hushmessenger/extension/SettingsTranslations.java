package app.hushmessenger.extension;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Translations of the settings screen, one table per language tag: "pt-BR" for one region, or "pt" for all of them.
 * A table pairs each SettingsText id, and each control key plus ".title" or ".description", with its text. It has to
 * cover every id and keep every format placeholder, or SettingsTranslationTest fails. The tables are plain Java, so
 * they can't collide with the resource IDs in Messenger's own APK.
 */
final class SettingsTranslations {
    private SettingsTranslations() { }

    static final Map<String, Map<String, String>> LOCALES = new HashMap<>();

    static {
        // Add a locale with one line here, for example: add("pt-BR", SettingsTextPtBr.TEXT);
        add("zh-TW", SettingsTextZhTw.TEXT);
        // Traditional Chinese anywhere else (zh-Hant-HK, and zh-HK or zh-MO, which imply it). Simplified stays English.
        add("zh-Hant", SettingsTextZhTw.TEXT);
        // Vietnamese is written the same everywhere, so one table covers vi-VN and any other region.
        add("vi", SettingsTextViVN.TEXT);
    }

    /** Refuses a table that gives one id twice, since the later line would quietly replace the earlier one. */
    static void add(String tag, String[][] pairs) {
        Map<String, String> table = new HashMap<>();
        for (String[] pair : pairs)
            if (table.put(pair[0], pair[1]) != null)
                throw new IllegalStateException(tag + " translates " + pair[0] + " twice");
        LOCALES.put(tag, Collections.unmodifiableMap(table));
    }

    /**
     * The table for the locale's full tag, else for its language and script, else for its language, else an empty one
     * (English). A locale that names a script never falls back to a region's table, so zh-Hans-TW stays English. Chinese
     * without a script takes the one its region writes in.
     */
    static Map<String, String> forLocale(Locale locale) {
        String language = locale.getLanguage(), script = locale.getScript(), region = locale.getCountry();
        if (script.isEmpty() && language.equals("zh") && (region.equals("TW") || region.equals("HK") || region.equals("MO")))
            script = "Hant";
        Map<String, String> table = LOCALES.get(locale.toLanguageTag());
        if (table == null && !script.isEmpty()) table = LOCALES.get(language + "-" + script);
        if (table == null) table = LOCALES.get(language);
        return table != null ? table : Collections.emptyMap();
    }
}
