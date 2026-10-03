/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keeps the Popular apps list out of search's Apps tab. Its loader neither reads its cache nor
 * asks the server, and the tab draws that section the way Telegram does once the list is empty
 * and fully loaded: no heading, no rows, no loading placeholders. The tab's other sections stay.
 */
public final class PopularApps {
    private PopularApps() {}

    /** The loader: true returns before the cache read and the getPopularAppBots request. */
    public static boolean skipLoad() {
        HookStatus.invoked(FamilyNames.HIDE_POPULAR_APPS);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.HIDE_POPULAR_APPS, "popular apps load skipped");
        return true;
    }

    /** The Apps tab: true draws the section as an empty, finished list, so nothing of it shows. */
    public static boolean hideSection() {
        HookStatus.invoked(FamilyNames.HIDE_POPULAR_APPS);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.HIDE_POPULAR_APPS, "popular apps section hidden");
        return true;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.HIDE_POPULAR_APPS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_POPULAR_APPS, "switch read", t);
            return false;
        }
    }
}
