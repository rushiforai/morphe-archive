/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

/** Asks the translation hooks the way Facebook's post model and reels footer do. */
public final class AutoTranslationForTests {
    private AutoTranslationForTests() {
    }

    /** A stand-in for Facebook's GraphQLTranslatabilityType, whose constants keep their names. */
    public enum Translatability {
        UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
        AUTO_TRANSLATION,
        HIDE_AUTO_TRANSLATION,
        NO_TRANSLATION,
        SEE_TRANSLATION,
    }

    /** True when a post marked for automatic translation is handed back as one to translate on request. */
    public static boolean keepsThePost() {
        return AutoTranslation.translationType(Translatability.AUTO_TRANSLATION) == Translatability.SEE_TRANSLATION;
    }

    /** True when the reels footer is told a caption it would translate can't be. */
    public static boolean keepsTheCaption() {
        return !AutoTranslation.captionAutoTranslates(true);
    }
}
