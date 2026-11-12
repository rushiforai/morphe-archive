/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * My messages in a group's menu at the top. It opens the chat's search on the messages you sent,
 * the way Telegram's own search does after you pick yourself as the sender, so you can step through
 * them or see them as a list. The patch asks this class whenever the chat updates its Translate
 * item, which every chat with that menu has, and first whenever an item of the menu is chosen.
 * Off by default.
 */
public final class MyMessages {
    private MyMessages() {
    }

    /** The item's number, which Telegram's own menu may never use, next to Outside translate's. */
    static final int ITEM = 0x48545408;

    /** The chats that already have the item, so a later update doesn't add a second one. */
    private static final Set<Object> ADDED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    static boolean active() {
        HookStatus.invoked(FamilyNames.MY_MESSAGES);
        try {
            return Utils.settingsReady() && Settings.MY_MESSAGES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "switch", failure);
            return false;
        }
    }

    /** Asked whenever the chat updates its own Translate item, which exists when the chat has a menu at the top. */
    public static void headerMenu(Object chat) {
        try {
            if (chat == null || ADDED.contains(chat) || !active() || !hasHeader(chat) || !group(chat)) return;
            addHeaderItem(chat, ITEM, icon(), L10n.t("My messages"));
            ADDED.add(chat);
            HookStatus.counted(FamilyNames.MY_MESSAGES, "my messages item added");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "header menu", failure);
        }
    }

    /**
     * Asked first when an item of the chat's menu at the top is chosen.
     *
     * @return true when the choice was ours, so Telegram's own handling is skipped
     */
    public static boolean headerClick(Object delegate, int id) {
        if (id != ITEM) return false;
        try {
            // An item left in an open menu after the switch went off is still ours, and does nothing.
            if (!active()) return true;
            Object chat = chatOf(delegate);
            if (chat != null && search(chat)) {
                HookStatus.counted(FamilyNames.MY_MESSAGES, "my messages opened");
            } else {
                HookStatus.counted(FamilyNames.MY_MESSAGES, "my messages account unknown");
                Utils.showToastShort(L10n.t("Couldn't open your messages here."));
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MY_MESSAGES, "header menu choice", failure);
            Utils.showToastShort(L10n.t("Couldn't open your messages here."));
        }
        return true;
    }

    /** Telegram's search icon, or none where it has none. */
    static int icon() {
        Context context = Utils.getContext();
        return context == null ? 0 : context.getResources().getIdentifier("msg_search", "drawable", context.getPackageName());
    }

    static void resetForTests() {
        ADDED.clear();
    }

    // Stubs. The patch writes their bodies.

    /** Whether the chat built its menu at the top, read from the Translate item Telegram adds to it. */
    public static boolean hasHeader(Object chat) { return false; }

    /** Whether the chat is a group, not a channel or a channel's direct messages, as Telegram has it now. */
    public static boolean group(Object chat) { return false; }

    public static Object addHeaderItem(Object chat, int id, int icon, String text) { return null; }

    public static Object chatOf(Object delegate) { return null; }

    /**
     * Opens the chat's search on the messages of the account the chat is in, as Telegram's own
     * instant search does.
     *
     * @return false when Telegram doesn't know that account's user, so nothing opened
     */
    public static boolean search(Object chat) { return false; }
}
