/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Keep deleted messages talks to Telegram by name. Everything it calls is public and keeps its name
 * in the builds the patch accepts, and the patch refuses a build where one of them has changed.
 * Any failure here ends in Telegram's own deletion, so a lookup that goes wrong costs nothing.
 */
final class KeepDeletedBridge implements KeepDeleted.Source {
    private static final ConcurrentHashMap<String, Method> METHODS = new ConcurrentHashMap<>();

    private final Object controller;
    private final Object storage;

    private KeepDeletedBridge(Object controller, Object storage) {
        this.controller = controller;
        this.storage = storage;
    }

    static KeepDeletedBridge of(Object controller) throws Exception {
        if (controller == null) throw new IllegalArgumentException("no message controller");
        Object storage = call(controller, "getMessagesStorage");
        if (storage == null) throw new IllegalStateException("no message storage");
        return new KeepDeletedBridge(controller, storage);
    }

    /** Each account slot Telegram has whose user is signed in, the way Telegram walks them itself. */
    static List<KeepDeleted.Source> signedIn() throws Exception {
        ClassLoader loader = KeepDeletedBridge.class.getClassLoader();
        Class<?> configs = Class.forName("org.telegram.messenger.UserConfig", true, loader);
        Class<?> controllers = Class.forName("org.telegram.messenger.MessagesController", true, loader);
        int slots = configs.getField("MAX_ACCOUNT_COUNT").getInt(null);
        Method config = method(configs, "getInstance", int.class);
        Method controller = method(controllers, "getInstance", int.class);
        ArrayList<KeepDeleted.Source> accounts = new ArrayList<>();
        for (int account = 0; account < slots; account++) {
            if (!Boolean.TRUE.equals(call(config.invoke(null, account), "isClientActivated"))) continue;
            accounts.add(of(controller.invoke(null, account)));
        }
        return accounts;
    }

    /** The message IDs a deletion update carries. */
    static ArrayList<?> messages(Object update) throws Exception {
        return (ArrayList<?>) update.getClass().getField("messages").get(update);
    }

    /** The channel a channel deletion update is about. */
    static long channel(Object update) throws Exception {
        return update.getClass().getField("channel_id").getLong(update);
    }

    /** The account, chat and ID of a message the bubble is measuring. */
    static long[] keyOf(Object message) throws Exception {
        int account = message.getClass().getField("currentAccount").getInt(message);
        Class<?> configs = Class.forName("org.telegram.messenger.UserConfig", true, message.getClass().getClassLoader());
        Object config = method(configs, "getInstance", int.class).invoke(null, account);
        return new long[] {
            ((Number) call(config, "getClientUserId")).longValue(),
            ((Number) call(message, "getDialogId")).longValue(),
            ((Number) call(message, "getId")).longValue(),
        };
    }

    @Override public long self() throws Exception {
        return ((Number) call(call(controller, "getUserConfig"), "getClientUserId")).longValue();
    }

    @Override public void post(Runnable work) throws Exception {
        Object queue = call(storage, "getStorageQueue");
        Object accepted = method(queue.getClass(), "postRunnable", Runnable.class).invoke(queue, work);
        if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("the storage queue took no work");
    }

    @Override public List<KeepDeleted.Row> rows(long dialogId, List<Integer> ids) throws Exception {
        StringBuilder list = new StringBuilder();
        for (Integer id : ids) {
            if (list.length() > 0) list.append(',');
            list.append(id.intValue());
        }
        // The same lookup Telegram's own deletion starts with: a chat's messages, or any chat but a channel.
        String sql = "SELECT uid, mid, out, ttl, data FROM messages_v2 WHERE mid IN(" + list + ")"
                + (dialogId != 0 ? " AND uid = " + dialogId : " AND is_channel = 0");
        Object database = call(storage, "getDatabase");
        Object cursor = method(database.getClass(), "queryFinalized", String.class, Object[].class).invoke(database, sql, new Object[0]);
        ArrayList<KeepDeleted.Row> rows = new ArrayList<>();
        try {
            Class<?> type = cursor.getClass();
            Method next = method(type, "next");
            Method longValue = method(type, "longValue", int.class);
            Method intValue = method(type, "intValue", int.class);
            while (Boolean.TRUE.equals(next.invoke(cursor))) {
                long dialog = (Long) longValue.invoke(cursor, 0);
                int id = (Integer) intValue.invoke(cursor, 1);
                boolean mine = (Integer) intValue.invoke(cursor, 2) != 0;
                boolean timed = (Integer) intValue.invoke(cursor, 3) != 0;
                boolean[] data = readData(cursor, 4);
                // A message that can't be read is left to Telegram.
                rows.add(new KeepDeleted.Row(dialog, id, mine || (data != null && data[0]), timed || data == null || data[1],
                        data == null || data[2] || chatIsProtected(dialog)));
            }
        } finally {
            method(cursor.getClass(), "dispose").invoke(cursor);
        }
        return rows;
    }

    @Override public void stock(long dialogId, ArrayList<Integer> ids, long channelId) throws Exception {
        Method delete = method(controller.getClass(), "deleteMessagesByPush", long.class, ArrayList.class, long.class);
        KeepDeleted.STOCK.set(Boolean.TRUE);
        try {
            delete.invoke(controller, dialogId, ids, channelId);
        } finally {
            KeepDeleted.STOCK.remove();
        }
    }

    @Override public void clearNotifications(ArrayList<Integer> ids, long channelId) throws Exception {
        Object notifications = call(controller, "getNotificationsController");
        Method[] cleanup = cleanup(notifications.getClass());
        Object deleted = cleanup[0].getParameterTypes()[0].getConstructor().newInstance();
        // Telegram's own key: 0 outside channels, the channel's dialog ID inside one.
        cleanup[1].invoke(deleted, ids, -channelId);
        cleanup[0].invoke(notifications, deleted, false);
    }

    /**
     * Telegram's own test: a channel or supergroup is a channel, a basic group isn't. The chat is
     * looked for in memory first, then in the stored chats, which this runs next to on the storage
     * queue. A chat found in neither has no stored messages left to show, so it goes as a plain chat.
     */
    @Override public long channel(long dialogId) throws Exception {
        if (dialogId >= 0) return 0;
        Object chat = method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-dialogId));
        if (chat == null) chat = method(storage.getClass(), "getChat", long.class).invoke(storage, -dialogId);
        if (chat == null) return 0;
        ClassLoader loader = chat.getClass().getClassLoader();
        Class<?> chats = Class.forName("org.telegram.messenger.ChatObject", true, loader);
        Class<?> type = Class.forName("org.telegram.tgnet.TLRPC$Chat", true, loader);
        return Boolean.TRUE.equals(method(chats, "isChannel", type).invoke(null, chat)) ? -dialogId : 0;
    }

    /**
     * The way Telegram redraws an edited message: each message is marked for a fresh layout, and
     * the account's NotificationCenter says the chat's messages were replaced, by themselves. The
     * open chat puts each one back in its place and its bubble measures again, label and all.
     */
    @Override public void redraw(long dialogId, ArrayList<Object> messages) throws Exception {
        Object center = call(controller, "getNotificationCenter");
        int replaced = center.getClass().getField("replaceMessagesObjects").getInt(null);
        Method post = method(center.getClass(), "postNotificationName", int.class, Object[].class);
        ArrayList<Field> marks = new ArrayList<>(messages.size());
        for (Object message : messages) marks.add(message.getClass().getField("forceUpdate"));
        // Telegram's chat screens read the event and their messages on the main thread only.
        Utils.runOnMainThread(() -> {
            try {
                for (int i = 0; i < messages.size(); i++) marks.get(i).setBoolean(messages.get(i), true);
                post.invoke(center, replaced, new Object[] {Long.valueOf(dialogId), messages});
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "redraw", failure);
            }
        });
    }

    /**
     * The cleanup and the put that fills its argument. The argument is androidx's LongSparseArray,
     * which R8 renames, so its type comes from the cleanup's own signature and its put is the one
     * (Object, long) method that type has. The patch refuses a build where either isn't single.
     */
    private static Method[] cleanup(Class<?> notifications) throws Exception {
        String key = notifications.getName() + "#cleanup";
        Method clear = METHODS.get(key);
        Method put = METHODS.get(key + "#put");
        if (clear != null && put != null) return new Method[] {clear, put};
        clear = null;
        for (Method candidate : notifications.getMethods()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (!candidate.getName().equals("removeDeletedMessagesFromNotifications") || parameters.length != 2
                    || parameters[1] != boolean.class) continue;
            if (clear != null) throw new IllegalStateException("two notification cleanups");
            clear = candidate;
        }
        if (clear == null) throw new NoSuchMethodException("removeDeletedMessagesFromNotifications");
        put = null;
        for (Method candidate : clear.getParameterTypes()[0].getMethods()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (Modifier.isStatic(candidate.getModifiers()) || candidate.getReturnType() != void.class || parameters.length != 2
                    || parameters[0] != Object.class || parameters[1] != long.class) continue;
            if (put != null) throw new IllegalStateException("two sparse array puts");
            put = candidate;
        }
        if (put == null) throw new NoSuchMethodException("sparse array put");
        METHODS.put(key, clear);
        METHODS.put(key + "#put", put);
        return new Method[] {clear, put};
    }

    /** Whether the message is sent by me, disappears on a timer, or can't be saved. Null when it can't be read. */
    private boolean[] readData(Object cursor, int column) throws Exception {
        Object buffer = method(cursor.getClass(), "byteBufferValue", int.class).invoke(cursor, column);
        if (buffer == null) return null;
        try {
            ClassLoader loader = buffer.getClass().getClassLoader();
            int constructor = (Integer) method(buffer.getClass(), "readInt32", boolean.class).invoke(buffer, false);
            Class<?> input = Class.forName("org.telegram.tgnet.InputSerializedData", true, loader);
            Class<?> messages = Class.forName("org.telegram.tgnet.TLRPC$Message", true, loader);
            Object message = method(messages, "TLdeserialize", input, int.class, boolean.class).invoke(null, buffer, constructor, false);
            if (message == null) return null;
            Class<?> type = message.getClass();
            boolean mine = type.getField("out").getBoolean(message);
            boolean timed = type.getField("ttl_period").getInt(message) != 0;
            Object media = type.getField("media").get(message);
            if (media != null && media.getClass().getField("ttl_seconds").getInt(media) != 0) timed = true;
            boolean noForwards = type.getField("noforwards").getBoolean(message);
            return new boolean[] {mine, timed, noForwards};
        } finally {
            method(buffer.getClass(), "reuse").invoke(buffer);
        }
    }

    /** A group or channel that doesn't allow saving or forwarding its content. */
    private boolean chatIsProtected(long dialog) throws Exception {
        if (dialog >= 0) return false;
        Object chat = method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-dialog));
        if (chat == null) return false;
        Field flag = chat.getClass().getField("noforwards");
        return flag.getBoolean(chat);
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
