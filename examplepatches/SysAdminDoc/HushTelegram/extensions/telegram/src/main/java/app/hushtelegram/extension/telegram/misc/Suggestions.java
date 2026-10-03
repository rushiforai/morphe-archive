/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.LinkedHashSet;
import java.util.Set;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Filters only the chat-list renderer's local suggestion values. Stored sets stay untouched. */
public final class Suggestions {
    private Suggestions() {}

    /**
     * Injected after reads of MessagesController.pendingSuggestions in the chat-list renderer.
     * Preserves iteration order and returns the original set when nothing needs hiding.
     */
    public static Set<String> filterChatList(Set<String> original) {
        HookStatus.invoked(FamilyNames.HIDE_PROMOTIONAL_BANNERS);
        if (original == null || !enabled()) return original;
        try {
            Set<String> visible = null;
            for (String key : original) {
                if (!promotional(key)) continue;
                if (visible == null) visible = new LinkedHashSet<>(original);
                visible.remove(key);
            }
            if (visible == null) return original;
            HookStatus.counted(FamilyNames.HIDE_PROMOTIONAL_BANNERS, "promotional suggestion presentation filtered");
            return visible;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_PROMOTIONAL_BANNERS, "suggestion presentation filter", t);
            return original;
        }
    }

    /**
     * Birthday gift prompts check dismissedSuggestions instead of pendingSuggestions. This only
     * changes the renderer's boolean answer, leaving both stored sets and dismiss RPCs alone.
     */
    public static boolean birthdayGiftBannerDismissed(boolean dismissed) {
        HookStatus.invoked(FamilyNames.HIDE_PROMOTIONAL_BANNERS);
        if (dismissed || !enabled()) return dismissed;
        HookStatus.counted(FamilyNames.HIDE_PROMOTIONAL_BANNERS, "birthday gift banner hidden");
        return true;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.HIDE_PROMOTIONAL_BANNERS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_PROMOTIONAL_BANNERS, "switch read", t);
            return false;
        }
    }

    /** Exact server keys only. New suggestions retain Telegram's behavior until reviewed. */
    private static boolean promotional(String key) {
        if (key == null) return false;
        switch (key) {
            case "PREMIUM_UPGRADE":
            case "PREMIUM_CHRISTMAS":
            case "PREMIUM_RESTORE":
            case "PREMIUM_SMSJOBS":
            case "BIRTHDAY_SETUP":
            case "BIRTHDAY_CONTACTS_TODAY":
            case "STARS_SUBSCRIPTION_LOW_BALANCE":
                return true;
            default:
                return false;
        }
    }
}
