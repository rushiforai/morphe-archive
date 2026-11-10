package app.fakh.extension.shared;

import java.util.Locale;
import java.util.Map;

/**
 * Text of the Fakh Patches screens in the user's language, for every app. Strings are written in English in the code and
 * the English text is the key; the translations come from src/main/translations/*.json, which the build turns into the
 * {@link Translations} class.
 */
public final class I18n {
    /** The language setting that follows the device. */
    public static final String LANGUAGE_AUTO = "auto";

    private static String loadedFor;
    private static Map<String, String> table;

    private I18n() {
    }

    /**
     * The language code in use.
     *
     * @param picked the code the user picked in the app's settings, or {@link #LANGUAGE_AUTO}
     * @return a code from {@link Translations#LANGUAGES}, or "en"
     */
    public static String language(String picked) {
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

    /**
     * The text in the device language.
     *
     * @param english the English text
     * @return the translation, or the English text when it has none
     */
    public static String tr(String english) {
        return tr(english, LANGUAGE_AUTO);
    }

    /**
     * The text in the language an app lets the user pick.
     *
     * @param english the English text
     * @param picked  the code the user picked, or {@link #LANGUAGE_AUTO}
     * @return the translation, or the English text when it has none
     */
    public static String tr(String english, String picked) {
        if (english == null) return null;
        String language = language(picked);
        if (!language.equals(loadedFor)) {
            table = Translations.forLanguage(language);
            loadedFor = language;
        }
        String translated = table == null ? null : table.get(english);
        return translated == null || translated.isEmpty() ? english : translated;
    }

    /**
     * A translated template filled with values, in the device language.
     *
     * @param englishTemplate the English template, such as "Made by %1$s"
     * @param args            the values
     * @return the filled text
     */
    public static String f(String englishTemplate, Object... args) {
        return String.format(tr(englishTemplate), args);
    }
}
