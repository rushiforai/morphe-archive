package app.fakh.extension.linkedin;

import java.util.Locale;
import java.util.Map;

/**
 * Text of the Fakh Patches screens in the user's language. Strings are written in English in the code; the
 * translations come from src/main/translations/*.json, which the build turns into the Translations class.
 */
final class I18n {
    static final String LANGUAGE_AUTO = "auto";

    private static String loadedFor;
    private static Map<String, String> table;

    private I18n() {
    }

    /** The language code in use: the one picked in settings, or the device language when set to automatic. */
    static String language() {
        String picked = Settings.language();
        if (!LANGUAGE_AUTO.equals(picked)) return picked;
        Locale locale = Locale.getDefault();
        String language = locale.getLanguage();
        if ("in".equals(language)) language = "id"; // Older Android reports Indonesian as "in".
        String withRegion = language + "-" + locale.getCountry();
        if (Translations.LANGUAGES.containsKey(withRegion)) return withRegion;
        if (Translations.LANGUAGES.containsKey(language)) return language;
        // Another region of a translated language, for example Portuguese (Portugal) gets pt-BR.
        for (String code : Translations.LANGUAGES.keySet()) {
            if (code.startsWith(language + "-")) return code;
        }
        return "en";
    }

    /** The text in the current language, or the English text when it has no translation. */
    static String tr(String english) {
        if (english == null) return null;
        String language = language();
        if (!language.equals(loadedFor)) {
            table = Translations.forLanguage(language);
            loadedFor = language;
        }
        String translated = table == null ? null : table.get(english);
        return translated == null || translated.isEmpty() ? english : translated;
    }

    /** A translated template filled with values, for example f("Made by %1$s", AUTHOR). */
    static String f(String englishTemplate, Object... args) {
        return String.format(tr(englishTemplate), args);
    }
}
