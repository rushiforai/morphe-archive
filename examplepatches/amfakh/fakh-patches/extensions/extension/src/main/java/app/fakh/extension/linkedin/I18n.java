package app.fakh.extension.linkedin;

/** The shared {@link app.fakh.extension.shared.I18n} with the language LinkedIn's settings let the user pick. */
final class I18n {
    static final String LANGUAGE_AUTO = app.fakh.extension.shared.I18n.LANGUAGE_AUTO;

    private I18n() {
    }

    /** The language code in use: the one picked in settings, or the device language when set to automatic. */
    static String language() {
        return app.fakh.extension.shared.I18n.language(Settings.language());
    }

    /** The text in the current language, or the English text when it has no translation. */
    static String tr(String english) {
        return app.fakh.extension.shared.I18n.tr(english, Settings.language());
    }

    /** A translated template filled with values, for example f("Made by %1$s", AUTHOR). */
    static String f(String englishTemplate, Object... args) {
        return String.format(tr(englishTemplate), args);
    }
}
