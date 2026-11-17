/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import androidx.annotation.Nullable;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Send read receipt in the message menu (#79): with Ghost mode keeping a chat's reads back, a
 * message someone else sent can be marked read on its own, so they see it read up to there while
 * Ghost mode stays on. It goes the way Telegram marks a chat read, up to and including that
 * message, which is all Telegram's servers take: there's no reading one message and not the ones
 * before it. The read passes Ghost mode's gate this once.
 *
 * <p>Offered in a chat with a person, a group or a supergroup that Ghost mode covers, on a message
 * that isn't yours. A broadcast channel's read already goes out, and a secret chat's read goes
 * through its own encrypted service message, so neither gets it.
 */
public final class ReadReceipt {
    private ReadReceipt() {}

    static final String FAMILY = FamilyNames.DISABLE_ANALYTICS;

    /** What a chat is to this: one whose read can be sent this way, a broadcast channel, or neither. */
    static final int NONE = 0;
    static final int CHAT = 1;
    static final int BROADCAST = 2;

    /** What this asks of Telegram, so the tests can stand in for it. */
    interface Telegram {
        /** Whether [dialog] of [account] is a chat whose read this sends ({@link #CHAT}), a {@link #BROADCAST} channel, or {@link #NONE}. */
        int kind(int account, long dialog) throws ReflectiveOperationException;

        /** The read of [dialog] up to message [id], the way Telegram marks it, or null when it has no peer for it. */
        @Nullable
        Object request(int account, long dialog, int id) throws ReflectiveOperationException;
    }

    static volatile Telegram telegram = new Bridge();

    /** Whether Ghost mode keeps any chat's reads back, so the menu has a reason to ask. Marks no hook as run. */
    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.GHOST_READS.get() && (Settings.GHOST_MODE.get() || GhostChats.any());
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipt switch read", failure);
            return false;
        }
    }

    /** Whether the menu offers Send read receipt on [message]. */
    static boolean offered(Object message) {
        try {
            if (!on() || !PatchFamily.Capability.GHOST_MODE.installed()) return false;
            int account = MessageMenu.account(message);
            long dialog = MessageMenu.dialog(message);
            if (MessageMenu.id(message) <= 0 || dialog == 0 || MessageMenu.secret(dialog)) return false;
            long self = MessageMenu.selfId(account);
            if (dialog == self || MessageMenu.sender(message) == self) return false;
            // A chat Ghost mode covers: every chat but the exceptions while it's on, only those while it's off.
            if (Settings.GHOST_MODE.get() == GhostChats.flipped(dialog)) return false;
            return telegram.kind(account, dialog) == CHAT;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipt menu item", failure);
            return false;
        }
    }

    /** Sends the read up to [message] past Ghost mode's gate and says how it went. */
    static void send(Context context, Object message) {
        boolean sent = false;
        try {
            int account = MessageMenu.account(message);
            Object request = telegram.request(account, MessageMenu.dialog(message), MessageMenu.id(message));
            sent = request != null && GhostMode.sendOwn(account, request);
            if (sent) HookStatus.counted(FAMILY, "read receipts sent from the message menu");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipt from the message menu", failure);
        }
        MessageMenu.feedback(context, sent ? L10n.t(context, "Read receipt sent.")
                : L10n.t(context, "Couldn't send the read receipt. Try again."));
    }

    /** Telegram's own MessagesController, reached by reflection. */
    private static final class Bridge implements Telegram {
        private static Object controller(int account) throws ReflectiveOperationException {
            Class<?> controllers = Class.forName("org.telegram.messenger.MessagesController", true, ReadReceipt.class.getClassLoader());
            Object controller = HostNames.method(controllers, "getInstance", int.class).invoke(null, account);
            if (controller == null) throw new IllegalStateException("no messages controller");
            return controller;
        }

        /** The chat behind a group or channel [dialog], null when this phone doesn't have it. */
        @Nullable
        private static Object chat(Object controller, long dialog) throws ReflectiveOperationException {
            return HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-dialog));
        }

        private static boolean channel(Object chat) throws ReflectiveOperationException {
            Class<?> chats = Class.forName("org.telegram.messenger.ChatObject", true, ReadReceipt.class.getClassLoader());
            Class<?> type = Class.forName("org.telegram.tgnet.TLRPC$Chat", true, ReadReceipt.class.getClassLoader());
            return Boolean.TRUE.equals(HostNames.method(chats, "isChannel", type).invoke(null, chat));
        }

        private static boolean flag(Object owner, String name) throws ReflectiveOperationException {
            return HostNames.field(owner.getClass(), name).getBoolean(owner);
        }

        @Override public int kind(int account, long dialog) throws ReflectiveOperationException {
            if (dialog > 0) return CHAT;
            Object chat = chat(controller(account), dialog);
            if (chat == null) return NONE;
            if (channel(chat) && flag(chat, "broadcast") && !flag(chat, "megagroup")) return BROADCAST;
            return CHAT;
        }

        @Override public Object request(int account, long dialog, int id) throws ReflectiveOperationException {
            Object controller = controller(account);
            ClassLoader loader = controller.getClass().getClassLoader();
            Object chat = dialog < 0 ? chat(controller, dialog) : null;
            Object request;
            if (chat != null && channel(chat)) {
                Object input = HostNames.method(controller.getClass(), "getInputChannel", long.class).invoke(controller, -dialog);
                if (input == null) return null;
                request = Class.forName("org.telegram.tgnet.TLRPC$TL_channels_readHistory", true, loader).getConstructor().newInstance();
                HostNames.field(request.getClass(), "channel").set(request, input);
            } else {
                Object peer = HostNames.method(controller.getClass(), "getInputPeer", long.class).invoke(controller, dialog);
                if (peer == null) return null;
                request = Class.forName("org.telegram.tgnet.TLRPC$TL_messages_readHistory", true, loader).getConstructor().newInstance();
                HostNames.field(request.getClass(), "peer").set(request, peer);
            }
            HostNames.field(request.getClass(), "max_id").setInt(request, id);
            return request;
        }
    }
}
