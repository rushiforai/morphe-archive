package app.jofslash.extension.quora;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Translations of the Patch settings texts, one class per language (TextsDe, TextsSk, …). The
 * English text is the key; a text that isn't listed, or a phone in a language without a class,
 * shows the English one. Patch names stay in English, as Morphe Manager and the README show them.
 *
 * .github/scripts/check_texts.py fails the build when a language misses a text the app uses.
 */
final class Texts {

    /** The languages load() has texts for. */
    private static final java.util.Set<String> LANGUAGES = new java.util.HashSet<>(
            java.util.Arrays.asList("cs", "de", "es", "fr", "it", "pl", "pt", "sk"));

    private static String loadedLanguage;
    private static Map<String, String> table;

    private Texts() {
    }

    /** The text in the phone's language, when there is a translation. */
    static String t(String english) {
        if (english == null) return null;
        Map<String, String> current = table();
        if (current == null) return english;
        String translated = current.get(english);
        return translated != null ? translated : english;
    }

    /** The table for the phone's language, made the first time it is needed. */
    private static synchronized Map<String, String> table() {
        String language = language();
        if (!language.equals(loadedLanguage)) {
            loadedLanguage = language;
            table = load(language);
        }
        return table;
    }

    /**
     * The first language in the phone's (or the app's own) language list that has texts here.
     * Locale.getDefault() isn't enough: Android sets it to the best language Quora's own
     * resources have, and Quora has no Czech or Slovak, so a Slovak phone would get English.
     * LocaleList.getDefault() keeps the whole list as the user set it.
     */
    private static String language() {
        try {
            android.os.LocaleList list = android.os.LocaleList.getDefault();
            for (int i = 0; i < list.size(); i++) {
                String language = list.get(i).getLanguage();
                if (language.equals("en") || LANGUAGES.contains(language)) return language;
            }
        } catch (Throwable ignored) {
            // Not on Android (the page script tests): fall back to the JVM's language.
        }
        return Locale.getDefault().getLanguage();
    }

    private static Map<String, String> load(String language) {
        Map<String, String> m = new HashMap<>();
        switch (language) {
            case "cs": TextsCs.fill(m); break;
            case "de": TextsDe.fill(m); break;
            case "es": TextsEs.fill(m); break;
            case "fr": TextsFr.fill(m); break;
            case "it": TextsIt.fill(m); break;
            case "pl": TextsPl.fill(m); break;
            case "pt": TextsPt.fill(m); break;
            case "sk": TextsSk.fill(m); break;
            default: return null;
        }
        return m;
    }
}
