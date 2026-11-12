/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Open chat and Close preview at the end of the menu under a chat's preview (#71). Pressing and
 * holding a chat shows it in a preview with Telegram's own menu under it, and the preview stays
 * after you let go, so Open chat opens it fully and Close preview puts it away without tapping the
 * dim area around it. Telegram opens a preview fully only when it has no menu, so Open chat takes
 * the menu away first. The patch asks this class just before a preview with a menu opens, with the
 * screen showing it, the screen it previews and the menu. Off by default.
 */
public final class ChatPreview {
    private ChatPreview() {
    }

    /** The same minimum Telegram gives the items of its own preview menus. */
    private static final int MIN_WIDTH = 160;

    static boolean active() {
        HookStatus.invoked(FamilyNames.CHAT_PREVIEW_BUTTONS);
        try {
            return Utils.settingsReady() && Settings.CHAT_PREVIEW_BUTTONS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_PREVIEW_BUTTONS, "switch", failure);
            return false;
        }
    }

    /** Asked just before [host] previews [preview] with [menu] under it. */
    public static void menu(Object host, Object preview, Object menu) {
        try {
            if (host == null || preview == null || !(menu instanceof ViewGroup) || !active()) return;
            ViewGroup layout = (ViewGroup) menu;
            Context context = layout.getContext();
            View open = item(context, L10n.t("Open chat"), openIcon(), false);
            View close = item(context, L10n.t("Close preview"), closeIcon(), true);
            open.setMinimumWidth(MIN_WIDTH);
            close.setMinimumWidth(MIN_WIDTH);
            open.setOnClickListener(view -> tapped(host, true));
            close.setOnClickListener(view -> tapped(host, false));
            layout.addView(open);
            layout.addView(close);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_PREVIEW_BUTTONS, "menu", failure);
        }
    }

    private static void tapped(Object host, boolean open) {
        try {
            if (open) {
                expand(host);
            } else {
                finish(host);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_PREVIEW_BUTTONS, open ? "open" : "close", failure);
        }
    }

    /** One of Telegram's own menu items, with [text] and [icon], rounded at the bottom when [last]. Replaced when patching. */
    public static View item(Context context, CharSequence text, int icon, boolean last) { return null; }

    /** Takes the menu away from [host]'s preview and opens the preview fully. Replaced when patching. */
    public static void expand(Object host) {}

    /** Closes [host]'s preview the way tapping outside it does. Replaced when patching. */
    public static void finish(Object host) {}

    /** The icon beside Open chat. Replaced when patching. */
    public static int openIcon() { return 0; }

    /** The icon beside Close preview. Replaced when patching. */
    public static int closeIcon() { return 0; }
}
