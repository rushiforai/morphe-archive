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
    }

    static void add(String tag, String[][] pairs) {
        Map<String, String> table = new HashMap<>();
        for (String[] pair : pairs) table.put(pair[0], pair[1]);
        LOCALES.put(tag, Collections.unmodifiableMap(table));
    }

    /** The table for the locale's full tag, else for its language, else an empty one (English). */
    static Map<String, String> forLocale(Locale locale) {
        String tag = locale.toLanguageTag();
        Map<String, String> table = LOCALES.get(tag);
        if (table == null) table = LOCALES.get(tag.split("-")[0]);
        return table != null ? table : Collections.emptyMap();
    }
}
