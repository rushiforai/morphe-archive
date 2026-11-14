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

/**
 * Send read receipts in a chat's menu at the top (#69): sends the read Ghost mode kept back in
 * that chat alone, so a reader inside a conversation doesn't have to go back to the chat list's
 * button, which sends every chat's. The item is added while the chat list's button is on.
 */
public final class ReadsMenu {
    private ReadsMenu() {}

    static final String FAMILY = FamilyNames.DISABLE_ANALYTICS;

    /** The item's number, which Telegram's own menu may never use, after Chat reveal's two. */
    static final int ITEM = 0x4854540E;

    /** The chats that already have the item, so a later update doesn't add it again. */
    private static final Set<Object> ADDED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    /** Asked whenever the chat updates its own Translate item, which exists when the chat has a menu at the top. */
    public static void headerMenu(Object chat) {
        try {
            if (chat == null || ADDED.contains(chat) || !ReadsButton.on() || !hasHeader(chat)) return;
            addHeaderItem(chat, ITEM, icon(), L10n.t("Send read receipts"));
            ADDED.add(chat);
            HookStatus.counted(FAMILY, "read receipts item added to a chat menu");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts chat menu", failure);
        }
    }

    /**
     * Asked first when an item of the chat's menu at the top is chosen. The item sends that chat's
     * held read even after its switches went off, since a read Ghost mode kept back is still waiting.
     *
     * @return true when the choice was ours, so Telegram's own handling is skipped
     */
    public static boolean headerClick(Object delegate, int id) {
        if (id != ITEM) return false;
        try {
            Object chat = chatOf(delegate);
            ReadsButton.say(chat == null ? -1 : GhostMode.sendHeld(account(chat), dialogId(chat)));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts chat menu choice", failure);
            ReadsButton.say(-1);
        }
        return true;
    }

    /** Telegram's mark-as-read icon, or none where it has none. */
    static int icon() {
        Context context = Utils.getContext();
        return context == null ? 0 : context.getResources().getIdentifier("msg_markread", "drawable", context.getPackageName());
    }

    static void resetForTests() {
        ADDED.clear();
    }

    // Stubs. The patch writes their bodies.

    /** Whether the chat built its menu at the top, read from the Translate item Telegram adds to it. */
    public static boolean hasHeader(Object chat) { return false; }

    public static Object addHeaderItem(Object chat, int id, int icon, String text) { return null; }

    public static Object chatOf(Object delegate) { return null; }

    /** The chat's dialog ID, which Ghost mode keeps its held read under. */
    public static long dialogId(Object chat) { return 0; }

    /** The account the chat is open in. */
    public static int account(Object chat) { return 0; }
}
