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
 * Keeps Proxy in the chat list's menu. Telegram adds that row only while a proxy is switched on,
 * or in a country where Telegram is blocked and a proxy is saved; everywhere else the proxy list
 * is four screens into Settings. The patch asks this class just before Telegram checks for a
 * blocked country, and true adds the row Telegram already built. Off by default.
 */
public final class ProxyMenu {
    private ProxyMenu() {
    }

    /**
     * Asked when the chat list's menu opens without a proxy in use. True adds the Proxy row.
     *
     * @param unused always 1 from the patch; the hook takes int, not boolean, per the Morphe rule
     */
    public static boolean show(int unused) {
        HookStatus.invoked(FamilyNames.PROXY_MENU);
        try {
            if (!Utils.settingsReady() || !Settings.PROXY_MENU.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.PROXY_MENU, "proxy menu switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.PROXY_MENU, "proxy row added to the chat list menu");
        return true;
    }
}
