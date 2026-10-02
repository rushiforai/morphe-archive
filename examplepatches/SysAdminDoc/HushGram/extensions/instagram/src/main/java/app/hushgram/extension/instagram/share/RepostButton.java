/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.share;

import androidx.annotation.Nullable;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide the Repost button" patch.
 *
 * <p>Instagram marks each post and reel with whether it can be reposted, in a field its code calls
 * enable_media_notes_production. The Repost button, its count and the repost action all ask that
 * field first. The patch answers it through {@link #hide} where the post's model reads it, and
 * through {@link #eligible} wherever the buttons read it from the post's data tree, so while the
 * switch is on no post or reel can be reposted and the button isn't drawn.
 */
public final class RepostButton {
    private static volatile boolean logged;

    private RepostButton() {
    }

    /**
     * Injected first thing in the post model's read of the field. Answers true, and the read says
     * the post can't be reposted, while the switch is on, and false otherwise, or when anything goes
     * wrong. Never throws, and never waits for the settings: before they're ready the button stays.
     */
    public static boolean hide() {
        return hidden("post model");
    }

    /**
     * Injected right after a button reads the field from a post's data tree. Answers false while the
     * switch is on, and what the tree said otherwise, null included, or when anything goes wrong.
     * Never throws.
     */
    @Nullable
    public static Boolean eligible(@Nullable Boolean eligible) {
        return hidden("data tree") ? Boolean.FALSE : eligible;
    }

    private static boolean hidden(String where) {
        try {
            HookStatus.invoked(FamilyNames.REPOST_BUTTON);
            if (!Utils.settingsReady() || !Settings.HIDE_REPOST_BUTTON.get()) return false;
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Repost button: answered no reposts, first from the " + where);
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPOST_BUTTON, where, failure);
            return false;
        }
    }
}
