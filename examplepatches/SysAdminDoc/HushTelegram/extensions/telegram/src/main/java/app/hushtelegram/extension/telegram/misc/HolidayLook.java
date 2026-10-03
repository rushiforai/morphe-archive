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
 * Telegram's New Year look on any day. Telegram's holiday check loads the Santa hat for the chat
 * list title only on Dec 31 and Jan 1, and lets snow start by itself only on Jan 1, over the chat
 * list's top bar and, with animated chat backgrounds on, over chat backgrounds. The check runs
 * whenever the top bar draws its title, so the hook at its start asks here on every frame and the
 * counts below move only when the answer changes. The bar draws the hat only over a plain-text
 * title, and 12.10.6's chat list title is Telegram's logo, so there only the snow shows.
 */
public final class HolidayLook {
    /** Telegram's own check runs. */
    public static final int STOCK = 0;
    /** The hat loads if it hasn't, and snow may start. Telegram's date check is skipped. */
    public static final int SHOW = 1;
    /** Once after SHOW: the hat and Telegram's last check are cleared, so its own dates apply at once. */
    public static final int RESTORE = 2;

    private static boolean shown;

    private HolidayLook() {}

    /** Telegram's holiday check, before its date test: one of {@link #STOCK}, {@link #SHOW}, {@link #RESTORE}. */
    public static int mode() {
        HookStatus.invoked(FamilyNames.HOLIDAY_LOOK);
        if (enabled()) {
            if (!shown) {
                shown = true;
                HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "holiday look shown");
            }
            return SHOW;
        }
        if (!shown) return STOCK;
        shown = false;
        HookStatus.counted(FamilyNames.HOLIDAY_LOOK, "holiday look restored");
        return RESTORE;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.HOLIDAY_LOOK.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HOLIDAY_LOOK, "switch read", t);
            return false;
        }
    }
}
