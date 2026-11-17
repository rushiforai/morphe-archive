/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keep chats you're removed from, a switch under Keep deleted messages (#71).
 *
 * <p>When a group or channel bans or removes you, Telegram learns it as an update whose chat now
 * reads forbidden or kicked, and it deletes the chat from the phone, saved messages and all. The
 * server won't serve that chat to you again, so what's on the phone is all there is. With the
 * switch on, that delete is skipped and the chat's dialog id goes into a short list here. The
 * chat list's loads keep a listed chat instead of dropping it as one you're not in, and opening it
 * shows a toast in place of the alert that closes the chat (and deletes it) when dismissed, so the
 * saved history scrolls. Telegram's own bar for a chat you're not in stays, so nothing can be sent.
 *
 * <p>A chat you left yourself, a deleted group and a group that moved to a supergroup keep
 * Telegram's behavior, and so does every chat while the switch is off or HushTelegram is paused.
 * Deleting a kept chat from the chat list deletes it as usual and takes it off the list here. The
 * list is HushTelegram's own state, the same dialog ids on every account, so turning the switch
 * off leaves it as it is: Telegram's next chat list load drops the chats, and turning it back on
 * brings them back.
 */
public final class KeepRemoved {
    private KeepRemoved() {}

    /** The most chats the list holds, so the setting stays inside a settings file's text limit. */
    public static final int MAX_CHATS = 50;

    // What the chat state stub answers, one bit each.
    static final int FORBIDDEN = 1;
    static final int KICKED = 2;
    static final int LEFT = 4;
    static final int DEACTIVATED = 8;
    static final int MIGRATED = 16;
    static final int EMPTY = 32;

    // The family keeps sixteen count names and Keep deleted messages already uses fifteen, so the
    // chat list's every-load answer isn't counted.
    static final String KEPT = "chats kept after you were removed";
    static final String OPENED = "kept chats opened";
    static final String FULL = "removed chats not kept, the list is full";

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** {@code MessagesController.getChat(chatId)}, or null. */
        @Nullable Object chat(Object controller, long chatId);

        /** The chat's state as the bits above, none for null. */
        int chatState(@Nullable Object chat);

        /** The chat's own id, positive. */
        long chatId(Object chat);

        /** {@code ChatObject.isNotInChat(chat)}, Telegram's own answer. */
        boolean notInChat(@Nullable Object chat);

        /** {@code MessagesController.deleteDialog(dialogId, onlyHistory, revoke)}, Telegram's own delete. */
        void delete(Object controller, int onlyHistory, long dialogId, int revoke);

        /** The chat a chat screen shows, or null. */
        @Nullable Object screenChat(Object screen);
    }

    static Telegram telegram = new Stubs();

    /** The chat screens that showed the toast already, so a chat that asks again stays quiet. */
    private static final Map<Object, Boolean> TOLD = Collections.synchronizedMap(new WeakHashMap<>());

    /** Whether [state] reads as a chat that removed or banned you, rather than one you left, deleted or moved. */
    static boolean removed(int state) {
        return (state & (FORBIDDEN | KICKED)) != 0 && (state & (DEACTIVATED | MIGRATED | EMPTY)) == 0;
    }

    /**
     * The kept chats in [text], comma-separated dialog ids as {@link #join} writes them, or null
     * for anything else: a dialog id that isn't a group's or channel's, a repeat, a sign or padding
     * a write never puts there, or more than {@link #MAX_CHATS}.
     */
    @Nullable
    static Set<Long> parse(@Nullable String text) {
        if (text == null) return null;
        Set<Long> ids = new LinkedHashSet<>();
        if (text.isEmpty()) return ids;
        for (String part : text.split(",", -1)) {
            long id;
            try {
                id = Long.parseLong(part);
            } catch (NumberFormatException notAnId) {
                return null;
            }
            if (id >= 0 || !String.valueOf(id).equals(part) || !ids.add(id)) return null;
        }
        return ids.size() > MAX_CHATS ? null : ids;
    }

    /** Whether [text] is one this would save, for a settings file's value. */
    public static boolean allowed(@Nullable String text) {
        return parse(text) != null;
    }

    /** How many chats [text] keeps, none for a value this never wrote. */
    public static int count(@Nullable String text) {
        Set<Long> ids = parse(text);
        return ids == null ? 0 : ids.size();
    }

    static String join(Set<Long> ids) {
        StringBuilder text = new StringBuilder();
        for (long id : ids) {
            if (text.length() > 0) text.append(',');
            text.append(id);
        }
        return text.toString();
    }

    /**
     * The kept chats, paused or not, since the list is HushTelegram's own record; none when the
     * setting holds something this never wrote.
     */
    static Set<Long> kept() {
        Set<Long> ids = parse(Settings.KEPT_REMOVED_CHATS.savedValue());
        return ids == null ? Collections.emptySet() : ids;
    }

    /** Whether the switch is on, this build carries every hook, and HushTelegram isn't paused. */
    static boolean active() {
        return Utils.settingsReady() && Settings.KEEP_REMOVED_CHATS.get() && PatchFamily.Capability.REMOVED_CHATS.installed();
    }

    /**
     * Called in place of {@code deleteDialog(dialogId, onlyHistory, revoke)} where Telegram's
     * updates learn a group or channel no longer has you. Keeps a chat that removed or banned you
     * while the switch is on, and deletes every other one the way Telegram does.
     */
    public static void removing(Object controller, int onlyHistory, long dialogId, int revoke) {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        boolean keep;
        try {
            keep = keeps(controller, onlyHistory, dialogId);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "removed chat", failure);
            keep = false;
        }
        if (!keep) telegram.delete(controller, onlyHistory, dialogId, revoke);
    }

    private static boolean keeps(Object controller, int onlyHistory, long dialogId) {
        if (onlyHistory != 0 || dialogId >= 0 || !active()) return false;
        if (!removed(telegram.chatState(telegram.chat(controller, -dialogId)))) return false;
        // Saved before the update goes on, since the chat screen's alert can follow right after.
        if (!remember(dialogId)) return false;
        HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, KEPT);
        return true;
    }

    private static boolean remember(long dialogId) {
        synchronized (KeepRemoved.class) {
            Set<Long> ids = new LinkedHashSet<>(kept());
            if (ids.contains(dialogId)) return true;
            if (ids.size() >= MAX_CHATS) {
                HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, FULL);
                return false;
            }
            ids.add(dialogId);
            return Settings.KEPT_REMOVED_CHATS.saveCommitted(join(ids));
        }
    }

    /**
     * Called in place of {@code ChatObject.isNotInChat(chat)} where the chat list's loads drop the
     * chats you're not in: a kept chat that still reads removed stays in the list while the switch
     * is on. Every other answer is Telegram's own.
     */
    public static boolean notInChat(Object chat) {
        boolean stock = telegram.notInChat(chat);
        if (!stock) return false;
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            return chat == null || !keptAndRemoved(chat);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "kept chat in the chat list", failure);
            return true;
        }
    }

    private static boolean keptAndRemoved(Object chat) {
        return active() && removed(telegram.chatState(chat)) && kept().contains(-telegram.chatId(chat));
    }

    /**
     * Called by the chat screen before it shows the alert that a chat can't be opened, whose
     * dismissal closes the chat and deletes it. True skips the alert for a kept chat, which stays
     * open on what's saved, with a toast saying so the first time this screen asks.
     */
    public static boolean cantOpen(Object screen) {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            Object chat = telegram.screenChat(screen);
            if (chat == null || !keptAndRemoved(chat)) return false;
            if (TOLD.put(screen, Boolean.TRUE) == null) {
                Utils.showToastLong(L10n.t("You were removed. This is what's saved on this phone."));
            }
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, OPENED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "kept chat screen", failure);
            return false;
        }
    }

    /**
     * Called as Telegram deletes a chat: a kept chat deleted for good leaves the list, whatever the
     * switch says, so it isn't kept again by mistake. Clearing its history leaves it listed.
     */
    public static void deleting(long dialogId, int first, int onlyHistory) {
        try {
            if (dialogId >= 0 || (onlyHistory != 0 && onlyHistory != 3) || !Utils.settingsReady()) return;
            synchronized (KeepRemoved.class) {
                Set<Long> ids = new LinkedHashSet<>(kept());
                if (!ids.remove(dialogId)) return;
                HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
                if (!Settings.KEPT_REMOVED_CHATS.saveCommitted(join(ids))) {
                    HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "kept chats deleted but still listed");
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "deleted kept chat", failure);
        }
    }

    private static final class Stubs implements Telegram {
        @Override public Object chat(Object controller, long chatId) { return KeepRemoved.chat(controller, chatId); }
        @Override public int chatState(Object chat) { return KeepRemoved.chatState(chat); }
        @Override public long chatId(Object chat) { return KeepRemoved.chatId(chat); }
        @Override public boolean notInChat(Object chat) { return KeepRemoved.stockNotInChat(chat); }
        @Override public void delete(Object controller, int onlyHistory, long dialogId, int revoke) {
            KeepRemoved.stockDelete(controller, onlyHistory, dialogId, revoke);
        }
        @Override public Object screenChat(Object screen) { return KeepRemoved.screenChat(screen); }
    }

    // Stubs. The patch gives them Telegram's code; until then no chat reads removed and nothing is deleted.

    /** {@code MessagesController.getChat(Long.valueOf(chatId))}. */
    @Nullable
    public static Object chat(Object controller, long chatId) { return null; }

    /**
     * The bits for {@code TL_chatForbidden} or {@code TL_channelForbidden}, {@code kicked},
     * {@code left}, {@code deactivated}, {@code migrated_to} and {@code TL_chatEmpty}.
     */
    public static int chatState(Object chat) { return 0; }

    /** {@code TLRPC.Chat.id}. */
    public static long chatId(Object chat) { return 0; }

    /** {@code ChatObject.isNotInChat(chat)}. */
    public static boolean stockNotInChat(Object chat) { return chat == null; }

    /** {@code MessagesController.deleteDialog(dialogId, onlyHistory, revoke)}, with revoke as non-zero. */
    public static void stockDelete(Object controller, int onlyHistory, long dialogId, int revoke) {}

    /** {@code ChatActivity.currentChat}. */
    @Nullable
    public static Object screenChat(Object screen) { return null; }
}
