/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Reaction notifications without push talk to Telegram by name. Everything here is public and keeps
 * its name in the builds the patch accepts, and the patch refuses the switch on a build where one of
 * them has changed. The notification is built the way PushListenerController builds a reaction push.
 */
final class ReactionAlertsBridge implements ReactionAlerts.Source {
    private static final ConcurrentHashMap<String, Method> METHODS = new ConcurrentHashMap<>();

    /** Characters of the message's text the notification quotes. */
    static final int QUOTED = 100;

    /** A message's flag for having a sender, and Telegram's mark for a supergroup's message in a push. */
    private static final int FROM_ID = 256;
    private static final int SUPERGROUP = 0x80000000;

    /** A recent reaction's flag for being your own. */
    private static final int MY = 4;

    private final Object controller;
    private final Object storage;
    private final int account;

    private ReactionAlertsBridge(Object controller, Object storage, int account) {
        this.controller = controller;
        this.storage = storage;
        this.account = account;
    }

    static ReactionAlertsBridge of(Object controller) throws Exception {
        if (controller == null) throw new IllegalArgumentException("no message controller");
        Object storage = call(controller, "getMessagesStorage");
        if (storage == null) throw new IllegalStateException("no message storage");
        int account = ((Number) call(call(controller, "getAccountInstance"), "getCurrentAccount")).intValue();
        return new ReactionAlertsBridge(controller, storage, account);
    }

    /**
     * The recent reactions an update lists, with its chat, message and topic. A reactions update
     * names them itself. An edited message carries them on the message, and counts only in a private
     * chat and on a message you sent, which is how Telegram itself reads one.
     */
    static List<ReactionAlerts.Reaction> reactionsOf(Object update) throws Exception {
        if (update == null) return Collections.emptyList();
        Class<?> type = update.getClass();
        ClassLoader loader = type.getClassLoader();
        Method peerId = method(Class.forName("org.telegram.messenger.MessageObject", true, loader), "getPeerId",
                Class.forName("org.telegram.tgnet.TLRPC$Peer", true, loader));
        if (type.getName().endsWith("$TL_updateEditMessage")) {
            Object message = type.getField("message").get(update);
            if (message == null) return Collections.emptyList();
            Class<?> kind = message.getClass();
            if (!kind.getField("out").getBoolean(message)) return Collections.emptyList();
            Object peer = kind.getField("peer_id").get(message);
            long dialog = peer == null ? 0 : ((Number) peerId.invoke(null, peer)).longValue();
            if (dialog <= 0) return Collections.emptyList();
            return listed(kind.getField("reactions").get(message), peerId, dialog, kind.getField("id").getInt(message), 0);
        }
        long dialog = ((Number) peerId.invoke(null, type.getField("peer").get(update))).longValue();
        return listed(type.getField("reactions").get(update), peerId, dialog, type.getField("msg_id").getInt(update),
                type.getField("top_msg_id").getInt(update));
    }

    private static List<ReactionAlerts.Reaction> listed(Object reactions, Method peerId, long dialog, int id, int topic) throws Exception {
        if (reactions == null) return Collections.emptyList();
        Object recent = reactions.getClass().getField("recent_reactions").get(reactions);
        if (!(recent instanceof List) || ((List<?>) recent).isEmpty()) return Collections.emptyList();
        Class<?> emoji = Class.forName("org.telegram.tgnet.TLRPC$TL_reactionEmoji", true, reactions.getClass().getClassLoader());
        ArrayList<ReactionAlerts.Reaction> found = new ArrayList<>();
        for (Object item : new ArrayList<Object>((List<?>) recent)) {
            if (item == null) continue;
            Class<?> kind = item.getClass();
            Object peer = kind.getField("peer_id").get(item);
            Object reaction = kind.getField("reaction").get(item);
            String text = emoji.isInstance(reaction) ? (String) emoji.getField("emoticon").get(reaction) : null;
            long from = peer == null ? 0 : ((Number) peerId.invoke(null, peer)).longValue();
            boolean mine = (kind.getField("flags").getInt(item) & MY) != 0;
            found.add(new ReactionAlerts.Reaction(dialog, id, topic, from, text, kind.getField("date").getInt(item),
                    kind.getField("unread").getBoolean(item), mine));
        }
        return found;
    }

    @Override public long self() throws Exception {
        return ((Number) call(call(controller, "getUserConfig"), "getClientUserId")).longValue();
    }

    @Override public int now() throws Exception {
        return ((Number) call(call(controller, "getConnectionsManager"), "getCurrentTime")).intValue();
    }

    @Override public void post(Runnable work) throws Exception {
        Object queue = call(storage, "getStorageQueue");
        Object accepted = method(queue.getClass(), "postRunnable", Runnable.class).invoke(queue, work);
        if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("the storage queue took no work");
    }

    @Override public ReactionAlerts.Stored stored(long dialog, int id) throws Exception {
        String sql = "SELECT out, data FROM messages_v2 WHERE mid = " + id + " AND uid = " + dialog;
        Object database = call(storage, "getDatabase");
        Object cursor = method(database.getClass(), "queryFinalized", String.class, Object[].class).invoke(database, sql, new Object[0]);
        try {
            Class<?> type = cursor.getClass();
            if (!Boolean.TRUE.equals(method(type, "next").invoke(cursor))) return null;
            boolean mine = (Integer) method(type, "intValue", int.class).invoke(cursor, 0) != 0;
            Object message = KeepDeletedBridge.readMessage(cursor, 1);
            String text = message == null ? null : (String) message.getClass().getField("message").get(message);
            return new ReactionAlerts.Stored(text, mine || (message != null && message.getClass().getField("out").getBoolean(message)));
        } finally {
            method(cursor.getClass(), "dispose").invoke(cursor);
        }
    }

    /**
     * PushListenerController's reaction message: the reacted message's ID with the formatted line as
     * its text, the reactor as its sender, in a group the chat's title as the name and the reactor's
     * as the user name, and marked as a reaction push, which also puts it in Telegram's quiet channel.
     */
    @Override public void show(ReactionAlerts.Reaction reaction, String text) throws Exception {
        ClassLoader loader = controller.getClass().getClassLoader();
        String who = nameOf(reaction.from);
        if (who == null) return;
        boolean group = reaction.dialog < 0;
        Object chat = group ? method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-reaction.dialog)) : null;
        if (group && chat == null) return;
        String title = group ? (String) chat.getClass().getField("title").get(chat) : null;
        boolean channel = group && Boolean.TRUE.equals(method(Class.forName("org.telegram.messenger.ChatObject", true, loader), "isChannel",
                Class.forName("org.telegram.tgnet.TLRPC$Chat", true, loader)).invoke(null, chat));
        String quoted = quote(text);
        String key;
        Object[] args;
        if (group) {
            key = quoted.isEmpty() ? "PushChatReactNotext" : "PushChatReactText";
            args = quoted.isEmpty() ? new Object[] {who, title, reaction.emoji} : new Object[] {who, title, reaction.emoji, quoted};
        } else {
            key = quoted.isEmpty() ? "PushReactNoText" : "PushReactText";
            args = quoted.isEmpty() ? new Object[] {who, reaction.emoji} : new Object[] {who, reaction.emoji, quoted};
        }
        int string = Class.forName("org.telegram.messenger.R$string", true, loader).getField(key).getInt(null);
        String line = (String) method(Class.forName("org.telegram.messenger.LocaleController", true, loader), "formatString",
                int.class, Object[].class).invoke(null, string, args);

        Class<?> messages = Class.forName("org.telegram.tgnet.TLRPC$Message", true, loader);
        Object message = Class.forName("org.telegram.tgnet.TLRPC$TL_message", true, loader).getConstructor().newInstance();
        Object peer = !group ? peer(loader, "TL_peerUser", "user_id", reaction.dialog)
                : channel ? peer(loader, "TL_peerChannel", "channel_id", -reaction.dialog)
                : peer(loader, "TL_peerChat", "chat_id", -reaction.dialog);
        messages.getField("id").setInt(message, reaction.id);
        messages.getField("message").set(message, line);
        messages.getField("date").setInt(message, reaction.date);
        messages.getField("dialog_id").setLong(message, reaction.dialog);
        messages.getField("peer_id").set(message, peer);
        int flags = messages.getField("flags").getInt(message) | FROM_ID;
        messages.getField("flags").setInt(message, channel ? flags | SUPERGROUP : flags);
        messages.getField("from_id").set(message, !group ? peer : reaction.from > 0
                ? peer(loader, "TL_peerUser", "user_id", reaction.from) : peer(loader, "TL_peerChannel", "channel_id", -reaction.from));

        Class<?> objects = Class.forName("org.telegram.messenger.MessageObject", true, loader);
        Object shown = objects.getConstructor(int.class, messages, String.class, String.class, String.class,
                boolean.class, boolean.class, boolean.class, boolean.class)
                .newInstance(account, message, line, group ? title : who, group ? who : null, false, false, channel, false);
        if (reaction.topic != 0) {
            Object reply = Class.forName("org.telegram.tgnet.TLRPC$TL_messageReplyHeader", true, loader).getConstructor().newInstance();
            reply.getClass().getField("forum_topic").setBoolean(reply, true);
            reply.getClass().getField("reply_to_top_id").setInt(reply, reaction.topic);
            messages.getField("reply_to").set(message, reply);
        }
        objects.getField("isReactionPush").setBoolean(shown, true);
        ArrayList<Object> list = new ArrayList<>();
        list.add(shown);
        Object notifications = call(controller, "getNotificationsController");
        // It posts to Telegram's notification queue itself, where a push for the same message is skipped.
        method(notifications.getClass(), "processNewMessages", ArrayList.class, boolean.class, boolean.class,
                Class.forName("java.util.concurrent.CountDownLatch")).invoke(notifications, list, true, true, null);
    }

    /** The reactor's name the way Telegram writes it in a notification, or null when it isn't known. */
    private String nameOf(long from) throws Exception {
        if (from > 0) {
            Object user = method(controller.getClass(), "getUser", Long.class).invoke(controller, Long.valueOf(from));
            if (user == null) return null;
            ClassLoader loader = user.getClass().getClassLoader();
            return (String) method(Class.forName("org.telegram.messenger.UserObject", true, loader), "getUserName",
                    Class.forName("org.telegram.tgnet.TLRPC$User", true, loader)).invoke(null, user);
        }
        Object chat = method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-from));
        return chat == null ? null : (String) chat.getClass().getField("title").get(chat);
    }

    /** The message's text on one line, cut to {@link #QUOTED} characters, or empty for a message without any. */
    static String quote(String text) {
        if (text == null) return "";
        String line = text.replace('\n', ' ').replace('\r', ' ').trim();
        if (line.length() <= QUOTED) return line;
        int end = QUOTED;
        if (Character.isHighSurrogate(line.charAt(end - 1))) end--;
        return line.substring(0, end).trim() + (char) 0x2026;
    }

    private static Object peer(ClassLoader loader, String type, String field, long id) throws Exception {
        Object peer = Class.forName("org.telegram.tgnet.TLRPC$" + type, true, loader).getConstructor().newInstance();
        peer.getClass().getField(field).setLong(peer, id);
        return peer;
    }

    private static Object call(Object target, String name) throws Exception {
        return method(target.getClass(), name).invoke(target);
    }

    private static Method method(Class<?> owner, String name, Class<?>... parameters) throws Exception {
        StringBuilder key = new StringBuilder(owner.getName()).append('#').append(name);
        for (Class<?> parameter : parameters) key.append(',').append(parameter.getName());
        Method found = METHODS.get(key.toString());
        if (found == null) {
            found = owner.getMethod(name, parameters);
            METHODS.put(key.toString(), found);
        }
        return found;
    }
}
