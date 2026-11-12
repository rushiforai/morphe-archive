/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Delete for them in the message menu (#71): your own message goes for everyone else in the chat
 * and stays on this phone, marked deleted the way Keep deleted messages marks one.
 *
 * <p>The message goes on the account's kept list first, and only once that list reached the disk
 * does the deletion go to the server. It goes the way Telegram sends a deletion it saved for later,
 * which asks the server and leaves the phone's copy alone. A deletion update for the message that
 * arrives afterwards meets Keep deleted messages, which holds on to a message on its list even
 * with its own switch off. A failure before the request takes the message off the list again.
 *
 * <p>Offered on your own sent messages in a chat with a person, a basic group or a supergroup,
 * while Telegram still allows deleting them for everyone there. Never in Saved Messages, a secret
 * chat, a bot or a channel, and never on a message that's already kept. Clear kept messages
 * removes it from this phone too.
 */
public final class DeleteForThem {
    private DeleteForThem() {}

    static final int NONE = 0;
    static final int PERSON = 1;
    static final int GROUP = 2;
    static final int SUPERGROUP = 3;

    /** What this asks of Telegram, so the tests can stand in for it. */
    interface Telegram {
        /** What [dialog] is to [account]: {@link #PERSON}, {@link #GROUP}, {@link #SUPERGROUP} or {@link #NONE}. */
        int kind(int account, long dialog) throws Exception;

        /** How many seconds after sending a message in a chat of [kind] Telegram lets it be deleted for everyone. */
        int limit(int account, int kind) throws Exception;

        /** The server's time now, in seconds. */
        int now(int account) throws Exception;

        KeepDeleted.Source source(int account) throws Exception;

        /** Asks the server to delete [ids] in [dialog] for everyone, leaving the phone's copies alone. */
        void delete(int account, long dialog, ArrayList<Integer> ids, long channel) throws Exception;
    }

    static Telegram telegram = new Bridge();

    /** Whether the switch is on and HushTelegram isn't paused. Asked as each bubble measures, so it marks no hook as run. */
    public static boolean on() {
        try {
            return Utils.settingsReady() && Settings.MESSAGE_MENU_DELETE_FOR_THEM.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "delete for them switch", failure);
            return false;
        }
    }

    /** Whether the menu offers Delete for them on [message]. */
    static boolean offered(Object message) {
        try {
            if (!MessageMenu.on(Settings.MESSAGE_MENU_DELETE_FOR_THEM) || !PatchFamily.Capability.HIDE_FOR_ME.installed()
                    || !PatchFamily.KEEP_DELETED_MESSAGES.inBuild()) return false;
            int account = MessageMenu.account(message);
            long self = MessageMenu.selfId(account);
            long dialog = MessageMenu.dialog(message);
            if (self == 0 || dialog == 0 || dialog == self || MessageMenu.secret(dialog)) return false;
            int kind = telegram.kind(account, dialog);
            return kind != NONE && allowed(message, self, telegram.limit(account, kind), telegram.now(account))
                    && !KeepDeleted.isKept(self, dialog, MessageMenu.id(message));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "delete for them offer", failure);
            return false;
        }
    }

    /** Sent by [self], numbered by the chat itself, not a live location, and young enough for Telegram's [limit]. */
    static boolean allowed(Object message, long self, int limit, int now) {
        return MessageMenu.sender(message) == self && HiddenMessages.hideable(message)
                && (limit == Integer.MAX_VALUE || (long) MessageMenu.date(message) + limit > now);
    }

    /** Deletes [message], with the rest of its album, for everyone else, and keeps it here. */
    static void unsend(Context context, Object chat, Object message) {
        try {
            int account = MessageMenu.account(message);
            long self = MessageMenu.selfId(account);
            long dialog = MessageMenu.dialog(message);
            int kind = telegram.kind(account, dialog);
            if (self == 0 || kind == NONE) throw new IllegalStateException("not a chat to delete in");
            int limit = telegram.limit(account, kind);
            int now = telegram.now(account);
            ArrayList<Integer> ids = new ArrayList<>();
            ArrayList<long[]> kept = new ArrayList<>();
            for (Object each : MessageMenu.batch(chat, message)) {
                if (MessageMenu.dialog(each) != dialog || !allowed(each, self, limit, now)) continue;
                int id = MessageMenu.id(each);
                ids.add(id);
                kept.add(new long[] {dialog, id});
            }
            if (ids.isEmpty()) throw new IllegalStateException("nothing to delete");
            KeepDeleted.Source source = telegram.source(account);
            long channel = kind == SUPERGROUP ? -dialog : 0;
            source.post(() -> send(context, source, account, self, dialog, ids, kept, channel));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "delete for them", failure);
            MessageMenu.feedback(context, L10n.t(context, "Couldn't complete that action. Try again."));
        }
    }

    /** Runs on the account's storage queue: kept first, then the request, so the message is never gone from both. */
    static void send(Context context, KeepDeleted.Source source, int account, long self, long dialog, ArrayList<Integer> ids,
            List<long[]> kept, long channel) {
        boolean saved = false;
        try {
            // The slot may have signed out, or hold another account, since the menu opened.
            if (source.self() != self) throw new IllegalStateException("the account changed");
            if (!KeepDeleted.keepOwn(source, self, kept)) throw new IllegalStateException("the kept messages weren't saved");
            saved = true;
            telegram.delete(account, dialog, ids, channel);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "delete for them", failure);
            if (saved) KeepDeleted.forget(self, kept);
            MessageMenu.feedback(context, L10n.t(context, "Couldn't complete that action. Try again."));
            return;
        }
        KeepDeleted.redraw(source, self, kept);
        MessageMenu.feedback(context, L10n.t(context, "Deleted for them, kept here."));
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message deleted for them");
    }

    /** Telegram by name. Everything here keeps its name or is in the build's table, and a lookup that fails offers nothing. */
    private static final class Bridge implements Telegram {
        private static Object controller(int account) throws Exception {
            Class<?> controllers = Class.forName("org.telegram.messenger.MessagesController", true, DeleteForThem.class.getClassLoader());
            Object controller = HostNames.method(controllers, "getInstance", int.class).invoke(null, account);
            if (controller == null) throw new IllegalStateException("no message controller");
            return controller;
        }

        private static boolean flag(Object owner, String name) throws Exception {
            return HostNames.field(owner.getClass(), name).getBoolean(owner);
        }

        @Override public int kind(int account, long dialog) throws Exception {
            Object controller = controller(account);
            if (dialog > 0) {
                Object user = HostNames.method(controller.getClass(), "getUser", Long.class).invoke(controller, Long.valueOf(dialog));
                return user == null || flag(user, "bot") ? NONE : PERSON;
            }
            Object chat = HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-dialog));
            // Left, removed, or a basic group that became a supergroup: nothing to delete in any more.
            if (chat == null || flag(chat, "left") || flag(chat, "kicked") || flag(chat, "deactivated")) return NONE;
            ClassLoader loader = chat.getClass().getClassLoader();
            Class<?> chats = Class.forName("org.telegram.messenger.ChatObject", true, loader);
            Class<?> type = Class.forName("org.telegram.tgnet.TLRPC$Chat", true, loader);
            if (!Boolean.TRUE.equals(HostNames.method(chats, "isChannel", type).invoke(null, chat))) return GROUP;
            return flag(chat, "megagroup") ? SUPERGROUP : NONE;
        }

        @Override public int limit(int account, int kind) throws Exception {
            // A supergroup lets you delete your own messages for everyone at any time.
            if (kind == SUPERGROUP) return Integer.MAX_VALUE;
            Object controller = controller(account);
            return HostNames.field(controller.getClass(), kind == PERSON ? "revokeTimePmLimit" : "revokeTimeLimit").getInt(controller);
        }

        @Override public int now(int account) throws Exception {
            Object controller = controller(account);
            Object connections = HostNames.method(controller.getClass(), "getConnectionsManager").invoke(controller);
            return ((Number) HostNames.method(connections.getClass(), "getCurrentTime").invoke(connections)).intValue();
        }

        @Override public KeepDeleted.Source source(int account) throws Exception {
            return KeepDeletedBridge.of(controller(account));
        }

        /**
         * Telegram's deletion with a saved request: it sends the request as it is and touches nothing
         * on the phone. A supergroup's goes by its channel, anything else asks for everyone's copy.
         */
        @Override public void delete(int account, long dialog, ArrayList<Integer> ids, long channel) throws Exception {
            Object controller = controller(account);
            ClassLoader loader = controller.getClass().getClassLoader();
            Object request;
            if (channel != 0) {
                request = Class.forName("org.telegram.tgnet.TLRPC$TL_channels_deleteMessages", true, loader).getConstructor().newInstance();
                Object input = HostNames.method(controller.getClass(), "getInputChannel", long.class).invoke(controller, channel);
                if (input == null) throw new IllegalStateException("no channel");
                HostNames.field(request.getClass(), "channel").set(request, input);
            } else {
                request = Class.forName("org.telegram.tgnet.TLRPC$TL_messages_deleteMessages", true, loader).getConstructor().newInstance();
                HostNames.field(request.getClass(), "revoke").setBoolean(request, true);
            }
            Field field = HostNames.field(request.getClass(), "id");
            @SuppressWarnings("unchecked")
            List<Integer> requested = (List<Integer>) field.get(request);
            if (requested == null) field.set(request, new ArrayList<>(ids));
            else requested.addAll(ids);
            Class<?> secret = Class.forName("org.telegram.tgnet.TLRPC$EncryptedChat", true, loader);
            Class<?> object = Class.forName("org.telegram.tgnet.TLObject", true, loader);
            Method delete = HostNames.method(controller.getClass(), "deleteMessages", ArrayList.class, ArrayList.class, secret, long.class,
                    boolean.class, int.class, boolean.class, long.class, object, int.class, boolean.class, int.class);
            // A task ID that isn't 0 is what sends the request alone; with -1 there's no saved task to clear afterwards.
            delete.invoke(controller, new ArrayList<>(ids), null, null, dialog, true, 0, false, -1L, request, 0, false, 0);
        }
    }
}
