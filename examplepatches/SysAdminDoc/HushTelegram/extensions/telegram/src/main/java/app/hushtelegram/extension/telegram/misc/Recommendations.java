/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.util.ArrayList;

/** Runtime guards for Telegram's shared recommendation request, its separate cache getter and the keyboards' trending packs. */
public final class Recommendations {
    private Recommendations() {}

    /**
     * True makes the controller answer null before reading its cache or fetching similar channels
     * and bots. A cached lookup also reaches this hook, so the count records hidden results rather
     * than claiming each invocation prevented a network request. Never throws.
     */
    public static boolean skipRecommendations() {
        HookStatus.invoked(FamilyNames.HIDE_RECOMMENDATIONS);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_RECOMMENDATIONS.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_RECOMMENDATIONS, "switch read", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_RECOMMENDATIONS, "recommendations hidden");
        return true;
    }

    /**
     * True makes the cache-only getter return a fresh empty host result. Its real cache stays
     * intact, and search avoids the loading placeholders it would draw for null. Never throws.
     */
    public static boolean skipCachedRecommendations() {
        HookStatus.invoked(FamilyNames.HIDE_RECOMMENDATIONS);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_RECOMMENDATIONS.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_RECOMMENDATIONS, "switch read", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_RECOMMENDATIONS, "cached recommendations hidden");
        return true;
    }

    /**
     * The sticker and emoji keyboards copy Telegram's featured packs from this answer. With the
     * switch on they get a new empty list, so the Trending tab, the trending row and the emoji
     * keyboard's trending packs aren't drawn. Telegram's own list is never changed, and search and
     * the Stickers and Emoji screen keep reading it. Never throws.
     */
    public static ArrayList<?> keyboardFeatured(ArrayList<?> featured) {
        HookStatus.invoked(FamilyNames.HIDE_RECOMMENDATIONS);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_KEYBOARD_FEATURED.get()) return featured;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_RECOMMENDATIONS, "trending packs switch", failure);
            return featured;
        }
        HookStatus.counted(FamilyNames.HIDE_RECOMMENDATIONS, "trending packs hidden");
        return new ArrayList<>();
    }
}
