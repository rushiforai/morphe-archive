/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.util.Locale;
import java.util.Map;

/**
 * The language of the Loki Patches screens.
 *
 * <p>Code always passes English text; that English text is the key into the table the build
 * generates from src/main/translations. An unknown key, an empty translation or a language without
 * a table all end at the English text, so a half translated screen still reads correctly.
 */
final class I18n {
    /** Value of the language setting that means "follow the device". */
    static final String LANGUAGE_AUTO = "auto";
    private static final String FALLBACK_LANGUAGE = "en";

    /** Language whose table is loaded, and the table itself. */
    private static String tableLanguage;
    private static Map<String, String> texts;

    private I18n() {
    }

    /**
     * The language to display: the one picked in settings, or the closest match for the device
     * language when settings say automatic. Unknown languages fall back to English.
     */
    static String language() {
        String chosen = Settings.language();
        if (!LANGUAGE_AUTO.equals(chosen)) return chosen;

        Locale device = Locale.getDefault();
        String language = device.getLanguage();
        // Old Android releases still report Indonesian under its former code.
        if ("in".equals(language)) language = "id";

        String withCountry = language + "-" + device.getCountry();
        Map<String, String> known = Translations.LANGUAGES;
        if (known.containsKey(withCountry)) return withCountry;
        if (known.containsKey(language)) return language;
        // A region we do not ship still gets its language: pt-PT shows the pt-BR table.
        for (String candidate : known.keySet()) {
            if (candidate.startsWith(language + "-")) return candidate;
        }
        return FALLBACK_LANGUAGE;
    }

    /** The current language's text for {@code english}, or {@code english} when there is none. */
    static String tr(String englishText) {
        if (englishText == null) return null;
        String wanted = language();
        if (!wanted.equals(tableLanguage)) {
            texts = Translations.forLanguage(wanted);
            tableLanguage = wanted;
        }
        if (texts == null) return englishText;
        String translated = texts.get(englishText);
        if (translated == null || translated.isEmpty()) return englishText;
        return translated;
    }

    /** A translated template filled in, for example f("Made by %1$s", AUTHOR). */
    static String f(String template, Object... values) {
        return String.format(tr(template), values);
    }
}
