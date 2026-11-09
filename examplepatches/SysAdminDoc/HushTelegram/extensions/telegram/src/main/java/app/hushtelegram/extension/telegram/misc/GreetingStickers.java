/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The sticker an empty private chat offers to send as a greeting, Telegram's own or the one a
 * business introduction picked. Telegram never changes the sticker frame's own visibility, so
 * showing it is always Telegram's state. The business introduction editor's preview of your own
 * greeting, and the Premium or paid-message notice, keep their own layout.
 */
public final class GreetingStickers {
    private GreetingStickers() {}

    /**
     * Asked as the greeting measures itself, while it ignores layout requests.
     *
     * @param stickers the frame holding the greeting sticker
     * @param sends what a tap on the sticker sends it through: set in a chat, for a business
     *              introduction too, and null in the introduction editor's preview
     */
    public static void measure(View stickers, Object sends) {
        if (stickers == null) return;
        HookStatus.invoked(FamilyNames.HIDE_GREETING_STICKERS);
        boolean hide = false;
        try {
            hide = sends != null && Utils.settingsReady() && Settings.HIDE_GREETING_STICKERS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_GREETING_STICKERS, "greeting sticker switch", failure);
        }
        int visibility = hide ? View.GONE : View.VISIBLE;
        if (stickers.getVisibility() != visibility) stickers.setVisibility(visibility);
        if (hide) HookStatus.counted(FamilyNames.HIDE_GREETING_STICKERS, "greeting sticker hidden");
    }
}
