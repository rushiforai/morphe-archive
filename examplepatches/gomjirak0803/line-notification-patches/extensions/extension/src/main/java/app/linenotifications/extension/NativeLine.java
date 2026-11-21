package app.linenotifications.extension;

import android.app.Notification;
import android.app.Person;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import app.linenotifications.extension.core.NotificationPolicy;

/** Adapter for the inspected 26.16.0 / 261600106 DEX only. Never writes LINE's database. */
final class NativeLine {
    private static final int MAX_CACHED_AVATARS = 8;
    private static final long AVATAR_TIMEOUT_MS = 150L;
    private static final ExecutorService AVATAR_EXECUTOR = Executors.newSingleThreadExecutor();
    private NativeLine() {}

    // Server ids bound the native read boundary, but are not necessarily chronological
    // within a Messaging API batch. Select the same latest-by-time order used to render.
    static final String RECENT_MESSAGES_SQL =
            "SELECT server_id, created_time, from_mid, content FROM chat_history "
            + "WHERE chat_id = ? AND from_mid IS NOT NULL AND from_mid != ? "
            + "AND CAST(server_id AS INTEGER) > ? "
            + "ORDER BY created_time DESC, CAST(server_id AS INTEGER) DESC LIMIT ?";

    static Class<?> type(String name) throws ClassNotFoundException {
        return Class.forName(name, false, Settings.context().getClassLoader());
    }

    static Object field(Object instance, String name) throws ReflectiveOperationException {
        Field field = instance.getClass().getField(name);
        return field.get(instance);
    }

    static String account() throws ReflectiveOperationException {
        Class<?> providerType = type("ap3.b");
        Object key = providerType.getField("k0").get(null);
        Object provider = type("sc0.f").getMethod("a", Context.class, type("sc0.a"))
                .invoke(null, Settings.context(), key);
        Object profile = providerType.getMethod("getProfile").invoke(provider);
        String account = (String) field(profile, "b");
        if (account == null || account.isEmpty()) throw new IllegalStateException("No active account");
        return account;
    }

    static boolean previewsAllowed() throws ReflectiveOperationException {
        return (Boolean) type("nn8.i").getMethod("c").invoke(null);
    }

    static boolean muted(String chat) throws ReflectiveOperationException {
        Object settings = type("nn8.c").getConstructor(boolean.class).newInstance(false);
        Object dto = settings.getClass().getMethod("a", String.class).invoke(settings, chat);
        return !(Boolean) dto.getClass().getMethod("c").invoke(dto);
    }

    static boolean notificationEnabled(Object manager, String chat) throws ReflectiveOperationException {
        return (Boolean) type("wk8.l0").getMethod("x", String.class).invoke(manager, chat);
    }

    static final class Chat {
        final String name, readUp;
        final int unread;
        Chat(String name, String readUp, int unread) {
            this.name = name; this.readUp = readUp; this.unread = unread;
        }
    }

    static Chat chat(String chatId) throws ReflectiveOperationException {
        Object manager = type("wk8.a2").getMethod("a", Context.class, boolean.class)
                .invoke(null, Settings.context(), false);
        Object repository = type("wk8.l0").getMethod("r").invoke(manager);
        Object data = type("ue3.k").getMethod("u1", String.class).invoke(repository, chatId);
        if (data == null) return null;
        int unread = (Integer) field(field(data, "n"), "c");
        if (unread < 0) throw new IllegalStateException("Invalid unread metadata");
        return new Chat((String) field(data, "b"), (String) field(data, "m"), unread);
    }

    static boolean regularChat(String chat) {
        // Verified LINE IDs: user, legacy room, group. OpenChat has a separate data model.
        return chat != null && chat.matches("[ucr][0-9a-f]{32}");
    }

    /** An action must not precede the incoming push's local save. Reads metadata only. */
    static boolean readReady(Context context, String chat, String postedMessageId) {
        if (!regularChat(chat) || postedMessageId == null) return false;
        try {
            long posted = Long.parseLong(postedMessageId);
            if (posted <= 0) return false;
            String account = account();
            Chat state = chat(chat);
            if (state == null || state.unread == 0) return false;
            long readUp = state.readUp == null || state.readUp.isEmpty() ? 0 : Long.parseLong(state.readUp);
            if (posted <= readUp) return false;
            boolean saved;
            try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                    context.getDatabasePath("naver_line").getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
                 Cursor cursor = db.rawQuery(
                         "SELECT 1 FROM chat_history WHERE chat_id = ? "
                         + "AND server_id = ? AND from_mid IS NOT NULL AND from_mid != ? LIMIT 1",
                         new String[]{chat, postedMessageId, account})) {
                saved = cursor.moveToFirst();
            }
            // Account replacement can also replace the local database while this runs.
            return saved && account.equals(account());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    static List<NotificationPolicy.Message> recent(String chat, String account, Chat state) {
        long lower = state.readUp == null || state.readUp.isEmpty() ? 0 : Long.parseLong(state.readUp);
        List<NotificationPolicy.Message> result = new ArrayList<>();
        if (state.unread == 0) return result;
        // A retained conversation can contain many messages by the same sender. Resolve
        // each name once for this snapshot without retaining contact data across updates.
        Map<String, String> senders = new HashMap<>();
        // Read only; no private database is copied, persisted, uploaded, or logged.
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                Settings.context().getDatabasePath("naver_line").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery(
                     RECENT_MESSAGES_SQL,
                     new String[]{chat, account, Long.toString(lower),
                             Integer.toString(Math.min(NotificationPolicy.MAX_RECENT_MESSAGES, state.unread))})) {
            while (cursor.moveToNext()) {
                String id = cursor.getString(0), senderId = cursor.getString(2), body = cursor.getString(3);
                long numericId;
                try { numericId = Long.parseLong(id); } catch (NumberFormatException ignored) { continue; }
                if (body == null || body.isEmpty()) body = "[첨부 메시지]";
                String sender = senders.get(senderId);
                if (sender == null) {
                    sender = senderName(senderId);
                    senders.put(senderId, sender);
                }
                result.add(new NotificationPolicy.Message(id, cursor.getLong(1), numericId,
                        senderId, sender, body));
            }
        }
        return result;
    }

    private static String senderName(String mid) {
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                Settings.context().getDatabasePath("contact").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery("SELECT coalesce(nullif(overridden_name,''), "
                     + "nullif(address_book_name,''), profile_name) FROM contacts WHERE mid = ? LIMIT 1",
                     new String[]{mid})) {
            if (cursor.moveToFirst() && cursor.getString(0) != null) return cursor.getString(0);
        } catch (RuntimeException ignored) { }
        return "메시지";
    }

    /**
     * Resolves sender profile avatars for expanded MessagingStyle notifications using only
     * icons already attached to the notification and LINE's local Glide cache
     * (`onlyRetrieveFromCache(true)`). Never performs network requests or writes storage.
     */
    static Map<String, Icon> senderIcons(Context context, String account, boolean group,
                                         Notification original, List<NotificationPolicy.Message> messages) {
        Map<String, Icon> icons = new HashMap<>();
        if (messages == null || messages.isEmpty()) return icons;

        String keyPrefix = account + ":";
        Icon nativeSenderIcon = null;
        CharSequence nativeSenderName = null;
        if (original != null && original.extras != null) {
            Parcelable[] rawMessages = original.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if (rawMessages != null) {
                for (Parcelable entry : rawMessages) {
                    if (!(entry instanceof Bundle)) continue;
                    Person person = ((Bundle) entry).getParcelable("sender_person");
                    if (person == null || person.getIcon() == null) continue;
                    String key = person.getKey();
                    if (key != null && key.startsWith(keyPrefix)) {
                        icons.put(key.substring(keyPrefix.length()), person.getIcon());
                    } else {
                        nativeSenderIcon = person.getIcon();
                        nativeSenderName = person.getName();
                    }
                }
            }
        }
        Icon largeIcon = original != null ? original.getLargeIcon() : null;

        if (!group) {
            Icon directIcon = nativeSenderIcon != null ? nativeSenderIcon : largeIcon;
            if (directIcon != null) {
                for (NotificationPolicy.Message message : messages) {
                    icons.putIfAbsent(message.senderId, directIcon);
                }
                return icons;
            }
        }

        // Prioritize the most recent distinct senders up to a bounded count to keep Binder IPC small.
        Set<String> missing = new LinkedHashSet<>();
        for (int i = messages.size() - 1; i >= 0 && missing.size() < MAX_CACHED_AVATARS; i--) {
            String sid = messages.get(i).senderId;
            if (sid != null && !sid.isEmpty() && !icons.containsKey(sid)) missing.add(sid);
        }
        if (!missing.isEmpty()) {
            Map<String, String> paths = picturePaths(context, missing);
            int sizePx = Math.min(Math.max(Math.round(40f * context.getResources().getDisplayMetrics().density), 64), 128);
            for (String sid : missing) {
                String path = paths.get(sid);
                if (path == null || path.isEmpty()) continue;
                Icon cached = cachedAvatarIcon(context, sid, path, sizePx);
                if (cached != null) icons.put(sid, cached);
            }
        }

        // Group fallback for the newest sender only when LINE's original notification carried
        // a matching individual sender Person icon (avoiding assigning a group icon to a person).
        if (group && nativeSenderIcon != null && nativeSenderName != null) {
            NotificationPolicy.Message latest = messages.get(messages.size() - 1);
            if (!icons.containsKey(latest.senderId) && latest.sender != null
                    && latest.sender.contentEquals(nativeSenderName)) {
                icons.put(latest.senderId, nativeSenderIcon);
            }
        }
        return icons;
    }

    private static Map<String, String> picturePaths(Context context, Set<String> mids) {
        Map<String, String> paths = new HashMap<>();
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                context.getDatabasePath("contact").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY)) {
            for (String mid : mids) {
                try (Cursor cursor = db.rawQuery(
                        "SELECT picture_path FROM contacts WHERE mid = ? LIMIT 1", new String[]{mid})) {
                    if (cursor.moveToFirst()) {
                        String path = cursor.getString(0);
                        if (path != null && !path.isEmpty()) paths.put(mid, path);
                    }
                }
            }
        } catch (RuntimeException ignored) { }
        return paths;
    }

    private static Icon cachedAvatarIcon(Context context, String mid, String picturePath, int sizePx) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            try {
                return AVATAR_EXECUTOR.submit(() -> loadCachedAvatar(context, mid, picturePath, sizePx))
                        .get(AVATAR_TIMEOUT_MS + 50L, TimeUnit.MILLISECONDS);
            } catch (Exception ignored) {
                return null;
            }
        }
        return loadCachedAvatar(context, mid, picturePath, sizePx);
    }

    private static Icon loadCachedAvatar(Context context, String mid, String picturePath, int sizePx) {
        Object glideManager = null;
        Object futureTarget = null;
        try {
            Object model = type("e80.l0").getConstructor(String.class, String.class, boolean.class)
                    .newInstance(mid, picturePath, true);
            Object retriever = type("com.bumptech.glide.c").getMethod("c", Context.class).invoke(null, context);
            glideManager = type("xn.o").getMethod("f", Context.class).invoke(retriever, context);
            Object request = type("com.bumptech.glide.o").getMethod("g").invoke(glideManager);
            request = type("com.bumptech.glide.n").getMethod("b0", Object.class).invoke(request, model);
            Class<?> optionsType = type("ao.a");
            Class<?> strategyType = type("kn.l");
            Object diskData = strategyType.getField("b").get(null);
            request = optionsType.getMethod("h", strategyType).invoke(request, diskData);
            request = optionsType.getMethod("s", boolean.class).invoke(request, true); // onlyRetrieveFromCache(true)
            request = optionsType.getMethod("u", int.class, int.class).invoke(request, sizePx, sizePx);
            request = optionsType.getMethod("d").invoke(request); // circleCrop()
            futureTarget = type("com.bumptech.glide.n").getMethod("g0").invoke(request);
            if (!(futureTarget instanceof Future<?>)) return null;
            Object result = ((Future<?>) futureTarget).get(AVATAR_TIMEOUT_MS, TimeUnit.MILLISECONDS);
            if (!(result instanceof Bitmap)) return null;
            Bitmap bitmap = (Bitmap) result;
            if (bitmap.isRecycled()) return null;
            Bitmap copy = bitmap.copy(Bitmap.Config.ARGB_8888, false);
            return copy != null ? Icon.createWithBitmap(copy) : null;
        } catch (Exception ignored) {
            return null;
        } finally {
            if (glideManager != null && futureTarget != null) {
                try {
                    type("com.bumptech.glide.o").getMethod("n", type("bo.j")).invoke(glideManager, futureTarget);
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        }
    }
}
