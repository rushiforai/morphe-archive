/*
 * Based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

/** The shared {@link app.fakh.extension.shared.I18n}, in the device language. */
final class I18n {
    private I18n() {
    }

    /** The language code in use: the device language when it has a translation, or "en". */
    static String language() {
        return app.fakh.extension.shared.I18n.language(app.fakh.extension.shared.I18n.LANGUAGE_AUTO);
    }

    /** The text in the device language, or the English text when it has no translation. */
    static String tr(String english) {
        return app.fakh.extension.shared.I18n.tr(english);
    }

    /** A translated template filled with values, for example f("Made by %1$s", AUTHOR). */
    static String f(String englishTemplate, Object... args) {
        return String.format(tr(englishTemplate), args);
    }
}
