/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.Setting;

/**
 * Which ways open the HushTelegram settings (#29): the row on Telegram's Settings page, a long press on
 * the chat list title, the row in the side menu and the launcher shortcut. All four start on. A way
 * that's off acts as it does in Telegram without HushTelegram.
 *
 * <p>One way always stays on. The settings screen refuses to turn the last one off, and a read of
 * stored values that somehow say all four are off counts the row on Telegram's Settings page as on.
 *
 * <p>These switches keep answering while HushTelegram is paused: Pause must never take away the way
 * back to the switch that resumes it. Every way reads its switch each time it's used, so none of them
 * needs a restart. The settings lock holds these switches like the rest of the screen, so the ways
 * that are on stay on while it's locked.
 */
public final class SettingsRoutes {
    public static final BooleanSetting SETTINGS_ROW =
            new BooleanSetting("hushtelegram_route_settings_row", Boolean.TRUE);
    public static final BooleanSetting TITLE_PRESS =
            new BooleanSetting("hushtelegram_route_title_press", Boolean.TRUE);
    public static final BooleanSetting SIDE_MENU_ROW =
            new BooleanSetting("hushtelegram_route_side_menu_row", Boolean.TRUE);
    public static final BooleanSetting SHORTCUT =
            new BooleanSetting("hushtelegram_route_shortcut", Boolean.TRUE);

    static {
        Setting.keepWhenPaused(SETTINGS_ROW, TITLE_PRESS, SIDE_MENU_ROW, SHORTCUT);
    }

    private SettingsRoutes() {
    }

    /** The four switches, in the order the screen draws them. */
    static BooleanSetting[] all() {
        return new BooleanSetting[]{SETTINGS_ROW, TITLE_PRESS, SIDE_MENU_ROW, SHORTCUT};
    }

    /** Whether the switch is on. Before the settings are ready every way is on, as it always was. */
    private static boolean on(BooleanSetting way) {
        try {
            return !Utils.settingsReady() || way.get();
        } catch (Throwable failure) {
            return true;
        }
    }

    /** Whether any way other than [except] is on. */
    static boolean anotherIsOn(BooleanSetting except) {
        for (BooleanSetting way : all()) {
            if (way != except && on(way)) return true;
        }
        return false;
    }

    /** The row on Telegram's Settings page. It's the way that stays when storage says every way is off. */
    public static boolean settingsRow() {
        return on(SETTINGS_ROW) || !anotherIsOn(SETTINGS_ROW);
    }

    /** A long press on the chat list's title. */
    public static boolean titlePress() {
        return on(TITLE_PRESS);
    }

    /** The HushTelegram row in the side menu. */
    public static boolean sideMenuRow() {
        return on(SIDE_MENU_ROW);
    }

    /** The launcher shortcut, and any copy of it pinned on a home screen. */
    public static boolean shortcut() {
        return on(SHORTCUT);
    }

    /** Whether turning [way] off now would leave no way in. */
    static boolean wouldBeTheLast(BooleanSetting way) {
        return !anotherIsOn(way);
    }
}
