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
final class KeepDeletedBridge implements KeepDeleted.Source, KeepEdits.Source {
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
        int slots = Accounts.slots(loader);
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
        return (ArrayList<?>) HostNames.field(update.getClass(), "messages").get(update);
    }

    /** The channel a channel deletion update is about. */
    static long channel(Object update) throws Exception {
        return HostNames.field(update.getClass(), "channel_id").getLong(update);
    }

    /** The account, chat and ID of a message the bubble is measuring. */
    static long[] keyOf(Object message) throws Exception {
        int account = HostNames.field(message.getClass(), "currentAccount").getInt(message);
        Class<?> configs = Class.forName("org.telegram.messenger.UserConfig", true, message.getClass().getClassLoader());
        Object config = method(configs, "getInstance", int.class).invoke(null, account);
        return new long[] {
            ((Number) call(config, "getClientUserId")).longValue(),
            ((Number) call(message, "getDialogId")).longValue(),
            ((Number) call(message, "getId")).longValue(),
        };
    }

    /** An edit update's message: its chat, by Telegram's own reckoning, its ID, its new text and its edit time. */
    static Object[] editOf(Object message) throws Exception {
        if (message == null) return null;
        Class<?> type = message.getClass();
        ClassLoader loader = type.getClassLoader();
        Class<?> messages = Class.forName("org.telegram.tgnet.TLRPC$Message", true, loader);
        Class<?> objects = Class.forName("org.telegram.messenger.MessageObject", true, loader);
        // getDialogId fills in dialog_id, and the update loop still reads it as the server sent it.
        Field dialogId = HostNames.field(type, "dialog_id");
        long sent = dialogId.getLong(message);
        long dialog;
        try {
            dialog = ((Number) method(objects, "getDialogId", messages).invoke(null, message)).longValue();
        } finally {
            dialogId.setLong(message, sent);
        }
        return new Object[] {
            dialog,
            HostNames.field(type, "id").getInt(message),
            (String) HostNames.field(type, "message").get(message),
            HostNames.field(type, "edit_date").getInt(message),
        };
    }

    @Override public KeepEdits.Stored stored(long dialogId, int id) throws Exception {
        String sql = "SELECT out, ttl, data FROM messages_v2 WHERE mid = " + id + " AND uid = " + dialogId;
        Object database = call(storage, "getDatabase");
        Object cursor = method(database.getClass(), "queryFinalized", String.class, Object[].class).invoke(database, sql, new Object[0]);
        try {
            Class<?> type = cursor.getClass();
            if (!Boolean.TRUE.equals(method(type, "next").invoke(cursor))) return null;
            Method intValue = method(type, "intValue", int.class);
            boolean mine = (Integer) intValue.invoke(cursor, 0) != 0;
            boolean timed = (Integer) intValue.invoke(cursor, 1) != 0;
            Object message = readMessage(cursor, 2);
            if (message == null) return null;
            boolean[] flags = flags(message);
            String text = (String) HostNames.field(message.getClass(), "message").get(message);
            return new KeepEdits.Stored(text, mine || flags[0], timed || flags[1], flags[2] || chatIsProtected(dialogId));
        } finally {
            method(cursor.getClass(), "dispose").invoke(cursor);
        }
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
                Object message = readMessage(cursor, 4);
                boolean[] data = message == null ? null : flags(message);
                // A message that can't be read is left to Telegram.
                rows.add(new KeepDeleted.Row(dialog, id, mine || (data != null && data[0]), timed || data == null || data[1],
                        data == null || data[2] || chatIsProtected(dialog), message));
            }
        } finally {
            method(cursor.getClass(), "dispose").invoke(cursor);
        }
        return rows;
    }

    @Override public void stock(long dialogId, ArrayList<Integer> ids, long channelId) throws Exception {
        Method delete;
        boolean idsLast = false;
        try {
            delete = method(controller.getClass(), "deleteMessagesByPush", long.class, ArrayList.class, long.class);
        } catch (NoSuchMethodException reordered) {
            // R8 moved the IDs to the end in 13.2.
            delete = method(controller.getClass(), "deleteMessagesByPush", long.class, long.class, ArrayList.class);
            idsLast = true;
        }
        KeepDeleted.STOCK.set(Boolean.TRUE);
        try {
            if (idsLast) delete.invoke(controller, dialogId, channelId, ids);
            else delete.invoke(controller, dialogId, ids, channelId);
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
        int replaced = HostNames.field(center.getClass(), "replaceMessagesObjects").getInt(null);
        Method post = method(center.getClass(), "postNotificationName", int.class, Object[].class);
        ArrayList<Field> marks = new ArrayList<>(messages.size());
        for (Object message : messages) marks.add(HostNames.field(message.getClass(), "forceUpdate"));
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
     * Every size of a kept photo, so the bubble and the full-screen viewer each find theirs, and a
     * document's previews plus the document itself up to {@link #MEDIA_LIMIT}. Each goes through the
     * account's FileLoader the way Telegram's own download asks for it, so it lands under the name
     * and in the folder the bubble looks in, with the message as its parent.
     */
    @Override public int saveMedia(List<Object> messages) throws Exception {
        Object loader = call(controller, "getFileLoader");
        ClassLoader classes = loader.getClass().getClassLoader();
        Class<?> locations = Class.forName("org.telegram.messenger.ImageLocation", true, classes);
        Class<?> sizes = Class.forName("org.telegram.tgnet.TLRPC$PhotoSize", true, classes);
        Class<?> photos = Class.forName("org.telegram.tgnet.TLRPC$Photo", true, classes);
        Class<?> documents = Class.forName("org.telegram.tgnet.TLRPC$Document", true, classes);
        Method forPhoto = method(locations, "getForPhoto", sizes, photos);
        Method forDocument = method(locations, "getForDocument", sizes, documents);
        Method loadImage = method(loader.getClass(), "loadFile", locations, Object.class, String.class, int.class, int.class);
        Method loadDocument = method(loader.getClass(), "loadFile", documents, Object.class, int.class, int.class);
        List<Class<?>> previews = previews(classes);
        int asked = 0;
        for (Object message : messages) {
            Object media = HostNames.field(message.getClass(), "media").get(message);
            if (media == null) continue;
            Object photo = HostNames.field(media.getClass(), "photo").get(media);
            if (photo != null) {
                for (Object size : list(photo, "sizes")) {
                    Object location = downloadable(size, previews) ? forPhoto.invoke(null, size, photo) : null;
                    if (location == null) continue;
                    loadImage.invoke(loader, location, message, "jpg", PRIORITY_LOW, 0);
                    asked++;
                }
            }
            Object document = HostNames.field(media.getClass(), "document").get(media);
            if (document == null) continue;
            for (Object thumb : list(document, "thumbs")) {
                Object location = downloadable(thumb, previews) ? forDocument.invoke(null, thumb, document) : null;
                if (location == null) continue;
                loadImage.invoke(loader, location, message, "jpg", PRIORITY_LOW, 0);
                asked++;
            }
            long length = HostNames.field(document.getClass(), "size").getLong(document);
            if (length <= 0 || length > MEDIA_LIMIT) continue;
            loadDocument.invoke(loader, document, message, PRIORITY_LOW, 0);
            asked++;
        }
        return asked;
    }

    /** A video or file bigger than this keeps only its preview, so a deleted movie doesn't eat the data plan. */
    static final long MEDIA_LIMIT = 20L * 1024 * 1024;

    /** FileLoader's lowest priority, the one its own auto-download uses, so a chat being opened loads first. */
    private static final int PRIORITY_LOW = 0;

    /** The sizes with nothing to download: an empty one, an outline, and the tiny previews a message carries inside itself. */
    private static final String[] PREVIEWS = {
        "org.telegram.tgnet.TLRPC$TL_photoSizeEmpty", "org.telegram.tgnet.TLRPC$TL_photoPathSize",
        "org.telegram.tgnet.TLRPC$TL_photoStrippedSize", "org.telegram.tgnet.TLRPC$TL_photoCachedSize",
    };

    private static List<Class<?>> previews(ClassLoader classes) {
        List<Class<?>> out = new ArrayList<>();
        for (String name : PREVIEWS) {
            try {
                out.add(Class.forName(name, true, classes));
            } catch (ClassNotFoundException absent) {
                // A build without the type has no size of that kind to skip.
            }
        }
        return out;
    }

    private static boolean downloadable(Object size, List<Class<?>> previews) {
        if (size == null) return false;
        for (Class<?> preview : previews) if (preview.isInstance(size)) return false;
        return true;
    }

    private static List<?> list(Object owner, String name) throws Exception {
        Object value = HostNames.field(owner.getClass(), name).get(owner);
        return value == null ? new ArrayList<>() : (List<?>) value;
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
            if (!HostNames.named(candidate, "removeDeletedMessagesFromNotifications") || parameters.length != 2
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

    /** The stored message in [column], or null when there's none. Reaction notifications read it too. */
    static Object readMessage(Object cursor, int column) throws Exception {
        Object buffer = method(cursor.getClass(), "byteBufferValue", int.class).invoke(cursor, column);
        if (buffer == null) return null;
        try {
            ClassLoader loader = buffer.getClass().getClassLoader();
            int constructor = (Integer) method(buffer.getClass(), "readInt32", boolean.class).invoke(buffer, false);
            Class<?> input = Class.forName("org.telegram.tgnet.InputSerializedData", true, loader);
            Class<?> messages = Class.forName("org.telegram.tgnet.TLRPC$Message", true, loader);
            return method(messages, "TLdeserialize", input, int.class, boolean.class).invoke(null, buffer, constructor, false);
        } finally {
            method(buffer.getClass(), "reuse").invoke(buffer);
        }
    }

    /** Whether [message] is sent by me, disappears on a timer, or can't be saved. */
    private static boolean[] flags(Object message) throws Exception {
        Class<?> type = message.getClass();
        boolean mine = HostNames.field(type, "out").getBoolean(message);
        boolean timed = HostNames.field(type, "ttl_period").getInt(message) != 0;
        Object media = HostNames.field(type, "media").get(message);
        if (media != null && HostNames.field(media.getClass(), "ttl_seconds").getInt(media) != 0) timed = true;
        boolean noForwards = HostNames.field(type, "noforwards").getBoolean(message);
        return new boolean[] {mine, timed, noForwards};
    }

    /** A group or channel that doesn't allow saving or forwarding its content. */
    private boolean chatIsProtected(long dialog) throws Exception {
        if (dialog >= 0) return false;
        Object chat = method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(-dialog));
        if (chat == null) return false;
        Field flag = HostNames.field(chat.getClass(), "noforwards");
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
            found = HostNames.method(owner, name, parameters);
            METHODS.put(key.toString(), found);
        }
        return found;
    }
}
