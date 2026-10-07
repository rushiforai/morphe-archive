/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.function.BooleanSupplier;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A chat in another language shows a "Translate to" bar at the top when Telegram can translate it,
 * which means Premium or a channel with automatic translation on. The chat screen asks whether the
 * bar is hidden in two places: the top bar itself, and the menu, which offers Translate exactly when
 * the bar is hidden. Both ask here instead. Message translation asks Telegram directly, so a chat
 * being translated stays translated, and it keeps its bar so the original is one tap away.
 */
public final class TranslateBar {
    private TranslateBar() {}

    /**
     * Answers the chat screen's question in place of Telegram's own.
     *
     * @param controller Telegram's translate controller for the account
     * @param dialogId the chat on screen
     * @return whether the bar is hidden
     */
    public static boolean hidden(Object controller, long dialogId) {
        // Telegram's answer comes first and throws the way it always did.
        return hide(stockHidden(controller, dialogId), () -> translating(controller, dialogId));
    }

    /** Telegram's answer, or hidden when the switch is on and the chat isn't being translated. */
    static boolean hide(boolean stock, BooleanSupplier translating) {
        HookStatus.invoked(FamilyNames.HIDE_TRANSLATE_BAR);
        try {
            if (stock || !Utils.settingsReady() || !Settings.HIDE_TRANSLATE_BAR.get()) return stock;
            if (translating.getAsBoolean()) return false;
            HookStatus.counted(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_TRANSLATE_BAR, "translate bar", failure);
            return stock;
        }
    }

    /** Telegram's own answer. Replaced with TranslateController.isTranslateDialogHidden when patching. */
    public static boolean stockHidden(Object controller, long dialogId) { return false; }

    /** Whether the chat is being translated. Replaced with TranslateController.isTranslatingDialog when patching. */
    public static boolean translating(Object controller, long dialogId) { return false; }
}
