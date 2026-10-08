/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Posts and reel captions stay in the language they were written in.
 *
 * <p>Facebook marks each post with how it may be translated. A post marked AUTO_TRANSLATION gets
 * its translated text, with a "See original" link, and one marked SEE_TRANSLATION gets its own
 * text with a "See translation" link. While the switch is on, the getter Facebook reads that mark
 * through answers SEE_TRANSLATION where it would answer AUTO_TRANSLATION, so the post keeps its
 * words and the link to translate it stays.
 *
 * <p>A reel's caption is translated on the phone's request: the reels footer asks Facebook for a
 * translation when the reel says its caption can be. While the switch is on, that answer is no, so
 * the request isn't made.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own.
 */
public final class AutoTranslation {
    /** Counted each time a post marked for automatic translation is shown with its own text. */
    static final String POST_KEPT = "post kept in its own language";

    /** Counted each time the reels footer is told a caption can't be translated by itself. */
    static final String CAPTION_KEPT = "reel caption kept in its own language";

    /** The member the report names once the translation type getter has run. */
    static final String TYPE = "translation type";

    /** The member the report names once the reels footer has asked about a caption. */
    static final String CAPTION = "reel caption translation";

    /** Facebook's GraphQLTranslatabilityType constants, kept as the enum's names. */
    static final String AUTO_TRANSLATION = "AUTO_TRANSLATION";
    static final String SEE_TRANSLATION = "SEE_TRANSLATION";

    private static final String FAMILY = FamilyNames.AUTO_TRANSLATION;

    /** SEE_TRANSLATION of the last enum class asked about. Facebook has one, so it's found once. */
    @Nullable
    private static volatile Enum<?> seeTranslation;

    private static volatile boolean loggedPost;
    private static volatile boolean loggedCaption;

    private AutoTranslation() {
    }

    /**
     * The hook, as the post translatability model hands back its translation type. Answers
     * SEE_TRANSLATION of the same enum for AUTO_TRANSLATION while the switch is on, and [type]
     * otherwise.
     */
    @Nullable
    public static Enum<?> translationType(@Nullable Enum<?> type) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, TYPE);
            if (type == null || !AUTO_TRANSLATION.equals(type.name())) return type;
            if (!Utils.settingsReady() || !Settings.TURN_OFF_AUTO_TRANSLATION.get()) return type;
            Enum<?> see = seeTranslationOf(type);
            if (see == null) return type;
            HookStatus.counted(FAMILY, POST_KEPT);
            if (!loggedPost) {
                loggedPost = true;
                Logger.printDebug(() -> "Auto-translation: a post marked for automatic translation keeps its own text");
            }
            return see;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, TYPE, failure);
            return type;
        }
    }

    /**
     * The hook, as the reels footer reads whether the reel's caption can be translated by itself
     * before it asks Facebook for that translation. Answers false while the switch is on, and
     * [translatable] otherwise.
     */
    public static boolean captionAutoTranslates(boolean translatable) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, CAPTION);
            if (!translatable || !Utils.settingsReady() || !Settings.TURN_OFF_AUTO_TRANSLATION.get()) {
                return translatable;
            }
            HookStatus.counted(FAMILY, CAPTION_KEPT);
            if (!loggedCaption) {
                loggedCaption = true;
                Logger.printDebug(() -> "Auto-translation: a reel caption keeps its own text");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, CAPTION, failure);
            return translatable;
        }
    }

    /** SEE_TRANSLATION from the enum [type] belongs to, or null when it has none. */
    @Nullable
    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Enum<?> seeTranslationOf(Enum<?> type) {
        Class kind = type.getDeclaringClass();
        Enum<?> cached = seeTranslation;
        if (cached != null && cached.getDeclaringClass() == kind) return cached;
        try {
            Enum<?> found = Enum.valueOf(kind, SEE_TRANSLATION);
            seeTranslation = found;
            return found;
        } catch (IllegalArgumentException missing) {
            HookStatus.missingMember(FAMILY, "enum constant", kind.getName(), SEE_TRANSLATION);
            return null;
        }
    }
}
