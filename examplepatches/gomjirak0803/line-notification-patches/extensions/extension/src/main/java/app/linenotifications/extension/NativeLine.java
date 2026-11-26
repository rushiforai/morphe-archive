package app.linenotifications.extension;

import android.app.Notification;
import android.app.Person;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.drawable.Icon;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.util.Base64;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
    private static final int MAX_CHAT_LIST_CACHE = 256;
    private static final int MAX_MEDIA_PREVIEWS = 4;
    private static final int MAX_STAGED_PREVIEWS = 16;
    private static final int STICKER_MAX_DIM = 384;
    private static final int PHOTO_MAX_DIM = 512;
    private static final long MAX_LOCAL_IMAGE_BYTES = 25L * 1024L * 1024L;
    private static final long AVATAR_TIMEOUT_MS = 150L;
    private static final long MEDIA_SINGLE_TIMEOUT_MS = 2000L;
    private static final long MEDIA_TOTAL_BUDGET_MS = 3000L;
    private static final String PREVIEW_DIR_REL = "external_share/line_notify_previews";
    private static final String KEEP_NATIVE = "";
    private static final ExecutorService AVATAR_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Map<String, String> CHAT_LIST_CACHE = new LinkedHashMap<String, String>(64, 0.75f, true);
    private static long chatListCacheGeneration = 0L;
    private static final Object PREVIEW_FILE_LOCK = new Object();
    private static volatile long mediaPreviewGeneration = 0L;
    private NativeLine() {}

    // Server ids bound the native read boundary, but are not necessarily chronological
    // within a Messaging API batch. Select the same latest-by-time order used to render.
    static final String RECENT_MESSAGES_SQL =
            "SELECT server_id, created_time, from_mid, content, attachement_type, parameter, location_name, location_address, id, attachement_local_uri "
            + "FROM chat_history "
            + "WHERE chat_id = ? AND from_mid IS NOT NULL AND from_mid != ? "
            + "AND CAST(server_id AS INTEGER) > ? "
            + "ORDER BY created_time DESC, CAST(server_id AS INTEGER) DESC LIMIT ?";

    static final String MESSAGE_METADATA_SQL =
            "SELECT content, attachement_type, parameter, location_name, location_address FROM chat_history "
            + "WHERE chat_id = ? AND server_id = ? AND from_mid IS NOT NULL AND from_mid != ? LIMIT 1";

    static final String MESSAGE_MENTION_SQL =
            "SELECT parameter FROM chat_history "
            + "WHERE chat_id = ? AND server_id = ? AND from_mid IS NOT NULL AND from_mid != ? LIMIT 1";

    static final String LATEST_CHAT_MESSAGE_SQL =
            "SELECT type, created_time, content, attachement_type, parameter, location_name, location_address "
            + "FROM chat_history WHERE chat_id = ? ORDER BY created_time DESC, id DESC LIMIT 1";

    static final String MESSAGE_EXISTS_SQL =
            "SELECT 1 FROM chat_history WHERE chat_id = ? "
            + "AND server_id = ? AND from_mid IS NOT NULL AND from_mid != ? LIMIT 1";

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
            boolean saved = messageStored(context, chat, account, postedMessageId);
            // Account replacement can also replace the local database while this runs.
            return saved && account.equals(account());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    static boolean messageStored(Context context, String chat, String account, String postedMessageId) {
        if (context == null || !regularChat(chat) || account == null || account.isEmpty()
                || postedMessageId == null || postedMessageId.isEmpty()) {
            return false;
        }
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                context.getDatabasePath("naver_line").getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery(MESSAGE_EXISTS_SQL, new String[]{chat, postedMessageId, account})) {
            return cursor.moveToFirst();
        } catch (RuntimeException ignored) {
            return false;
        }
    }

    static final class MediaCandidate {
        final long localId;
        final int attachmentType;
        final String parameter;
        final String localUri;
        MediaCandidate(long localId, int attachmentType, String parameter, String localUri) {
            this.localId = localId;
            this.attachmentType = attachmentType;
            this.parameter = parameter;
            this.localUri = localUri;
        }
    }

    static final class RecentSnapshot {
        final List<NotificationPolicy.Message> messages;
        final Map<String, MediaCandidate> media;
        RecentSnapshot(List<NotificationPolicy.Message> messages, Map<String, MediaCandidate> media) {
            this.messages = messages;
            this.media = media;
        }
    }

    static final class MediaPreview {
        final String mimeType;
        final Uri uri;
        MediaPreview(String mimeType, Uri uri) {
            this.mimeType = mimeType;
            this.uri = uri;
        }
    }

    static RecentSnapshot recent(String chat, String account, Chat state, int maxMessages) {
        long lower = state.readUp == null || state.readUp.isEmpty() ? 0 : Long.parseLong(state.readUp);
        List<NotificationPolicy.Message> result = new ArrayList<>();
        Map<String, MediaCandidate> media = new HashMap<>();
        if (state.unread == 0) return new RecentSnapshot(result, media);
        int limit = Math.min(NotificationPolicy.clampMessageCount(maxMessages), state.unread);
        // A retained conversation can contain many messages by the same sender. Resolve
        // each name once for this snapshot without retaining contact data across updates.
        Map<String, String> senders = new HashMap<>();
        // Read only; no private database is copied, persisted, uploaded, or logged.
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                Settings.context().getDatabasePath("naver_line").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery(
                     RECENT_MESSAGES_SQL,
                     new String[]{chat, account, Long.toString(lower), Integer.toString(limit)})) {
            while (cursor.moveToNext()) {
                String id = cursor.getString(0), senderId = cursor.getString(2), body = cursor.getString(3);
                long numericId;
                try { numericId = Long.parseLong(id); } catch (NumberFormatException ignored) { continue; }
                int attachmentType = cursor.isNull(4) ? 0 : cursor.getInt(4);
                String parameter = cursor.getString(5);
                if (body == null || body.isEmpty() || attachmentType == 15 || attachmentType == 14 || attachmentType == 5) {
                    String label = Strings.get(
                            NotificationPolicy.attachmentPlaceholderKey(attachmentType),
                            NotificationPolicy.attachmentPlaceholderFallback(attachmentType));
                    body = NotificationPolicy.resolveMessageBody(
                            body, attachmentType, label, parameter, cursor.getString(6), cursor.getString(7));
                }
                String sender = senders.get(senderId);
                if (sender == null) {
                    sender = senderName(senderId);
                    senders.put(senderId, sender);
                }
                result.add(new NotificationPolicy.Message(id, cursor.getLong(1), numericId,
                        senderId, sender, body));
                if (NotificationPolicy.isPreviewableMediaType(attachmentType)) {
                    long localId = cursor.isNull(8) ? -1L : cursor.getLong(8);
                    String localUri = cursor.getString(9);
                    media.put(id, new MediaCandidate(localId, attachmentType, parameter, localUri));
                }
            }
        }
        return new RecentSnapshot(result, media);
    }

    static final class BypassMatch {
        static final BypassMatch NONE = new BypassMatch(false, false);
        final boolean mention;
        final boolean keyword;
        BypassMatch(boolean mention, boolean keyword) {
            this.mention = mention;
            this.keyword = keyword;
        }
        boolean matched() { return mention || keyword; }
    }

    /** Checks whether the stored `chat_history` row triggers `@mention` or keyword bypass. */
    static BypassMatch checkSilentBypass(String chat, String account, String messageId,
                                         boolean checkMention, List<String> keywords) {
        boolean checkKeywords = keywords != null && !keywords.isEmpty();
        if (checkKeywords) {
            try {
                if (!previewsAllowed()) checkKeywords = false;
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                checkKeywords = false;
            }
        }
        if ((!checkMention && !checkKeywords) || !regularChat(chat)
                || account == null || account.isEmpty() || messageId == null || messageId.isEmpty()) {
            return BypassMatch.NONE;
        }
        String sql = checkKeywords ? MESSAGE_METADATA_SQL : MESSAGE_MENTION_SQL;
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                Settings.context().getDatabasePath("naver_line").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery(sql, new String[]{chat, messageId, account})) {
            if (cursor.moveToFirst()) {
                if (!checkKeywords) {
                    String parameter = cursor.getString(0);
                    return NotificationPolicy.isMentionedInParameter(parameter, account)
                            ? new BypassMatch(true, false) : BypassMatch.NONE;
                }
                String content = cursor.getString(0);
                int attachmentType = cursor.isNull(1) ? 0 : cursor.getInt(1);
                String parameter = cursor.getString(2);
                String locationName = cursor.getString(3);
                String locationAddress = cursor.getString(4);
                boolean mentionMatched = checkMention
                        && NotificationPolicy.isMentionedInParameter(parameter, account);
                boolean keywordMatched = NotificationPolicy.matchesMessageKeywords(
                        content, attachmentType, parameter, locationName, locationAddress, keywords);
                return (mentionMatched || keywordMatched)
                        ? new BypassMatch(mentionMatched, keywordMatched)
                        : BypassMatch.NONE;
            }
        } catch (RuntimeException ignored) { }
        return BypassMatch.NONE;
    }

    static void clearChatListPreviewCache() {
        synchronized (CHAT_LIST_CACHE) {
            chatListCacheGeneration++;
            CHAT_LIST_CACHE.clear();
        }
    }

    static void invalidateChatListPreviewCache(String account, String chat) {
        synchronized (CHAT_LIST_CACHE) {
            chatListCacheGeneration++;
            if (chat == null || chat.isEmpty() || CHAT_LIST_CACHE.isEmpty()) return;
            String exactPrefix = (account != null && !account.isEmpty()) ? (account + ":" + chat + ":") : null;
            String roomSegment = ":" + chat + ":";
            java.util.Iterator<String> it = CHAT_LIST_CACHE.keySet().iterator();
            while (it.hasNext()) {
                String key = it.next();
                if (exactPrefix != null ? key.startsWith(exactPrefix) : key.contains(roomSegment)) {
                    it.remove();
                }
            }
        }
    }

    /** Resolves detailed `[File]`/`[Location]`/typed labels for chat-list rows from local DB cache. */
    static String chatListLastMessage(String chat, String account, String nativeText, long expectedTimeMillis) {
        if (!regularChat(chat) || account == null || account.isEmpty()) return nativeText;
        String key = account + ":" + chat + ":" + expectedTimeMillis + ":" + (nativeText == null ? "" : nativeText);
        long startGen;
        synchronized (CHAT_LIST_CACHE) {
            startGen = chatListCacheGeneration;
            String cached = CHAT_LIST_CACHE.get(key);
            if (cached != null) return KEEP_NATIVE.equals(cached) ? nativeText : cached;
        }
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(
                Settings.context().getDatabasePath("naver_line").getAbsolutePath(), null,
                SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery(LATEST_CHAT_MESSAGE_SQL, new String[]{chat})) {
            if (cursor.moveToFirst()) {
                int msgType = cursor.isNull(0) ? 0 : cursor.getInt(0);
                long rowTime = cursor.getLong(1);
                String content = cursor.getString(2);
                int attType = cursor.isNull(3) ? 0 : cursor.getInt(3);
                String parameter = cursor.getString(4);
                String locationName = cursor.getString(5);
                String locationAddress = cursor.getString(6);
                if (rowTime != expectedTimeMillis) {
                    return nativeText;
                }
                int effectiveType = NotificationPolicy.effectiveChatListAttachmentType(msgType, attType);
                String resolved = nativeText;
                String cacheValue = KEEP_NATIVE;
                if (effectiveType != 0) {
                    String label = Strings.get(
                            NotificationPolicy.attachmentPlaceholderKey(effectiveType),
                            NotificationPolicy.attachmentPlaceholderFallback(effectiveType));
                    resolved = NotificationPolicy.resolveChatListMessage(
                            nativeText, expectedTimeMillis, msgType, rowTime, content, attType,
                            label, parameter, locationName, locationAddress);
                    if (resolved != null && !resolved.equals(nativeText)) {
                        cacheValue = resolved;
                    }
                }
                synchronized (CHAT_LIST_CACHE) {
                    if (chatListCacheGeneration == startGen) {
                        CHAT_LIST_CACHE.put(key, cacheValue);
                        if (CHAT_LIST_CACHE.size() > MAX_CHAT_LIST_CACHE) {
                            java.util.Iterator<String> it = CHAT_LIST_CACHE.keySet().iterator();
                            if (it.hasNext()) {
                                it.next();
                                it.remove();
                            }
                        }
                    }
                }
                return resolved;
            }
        } catch (RuntimeException ignored) { }
        return nativeText;
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
        return Strings.get("line_notify_fallback_sender", "Message");
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

    static void clearMediaPreviewCache(Context context) {
        synchronized (PREVIEW_FILE_LOCK) {
            mediaPreviewGeneration++;
            if (context == null) return;
            File dir = new File(context.getCacheDir(), PREVIEW_DIR_REL);
            File[] files = dir.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) file.delete();
                }
            }
            if (dir.isDirectory()) dir.delete();
        }
    }

    private static boolean mediaPreviewStillAllowed(String account, long startGen) {
        try {
            return NotificationPolicy.canStageMediaPreview(
                    Settings.enabled(Settings.INFO),
                    Settings.enabled(Settings.INFO_MEDIA_PREVIEW),
                    previewsAllowed(),
                    startGen,
                    mediaPreviewGeneration,
                    account,
                    account());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    /**
     * Resolves thumbnail content URIs for photos, videos, and stickers. Checks local files first
     * and falls back to LINE's built-in Glide loader within a bounded total timeout when enabled.
     * Stage files use hashed non-PII names inside LINE's existing LineCommonFileProvider cache path.
     */
    static Map<String, MediaPreview> mediaPreviews(Context context, String account, String chat,
                                                    Notification original, List<NotificationPolicy.Message> messages,
                                                    Map<String, MediaCandidate> candidates) {
        Map<String, MediaPreview> result = new HashMap<>();
        if (context == null || account == null || chat == null || messages == null || messages.isEmpty()
                || candidates == null || candidates.isEmpty()) {
            return result;
        }
        long startGen;
        synchronized (PREVIEW_FILE_LOCK) {
            startGen = mediaPreviewGeneration;
            if (!Settings.mediaPreviewAllowed()) return result;
        }
        if (!mediaPreviewStillAllowed(account, startGen)) return result;
        File dir = new File(context.getCacheDir(), PREVIEW_DIR_REL);
        long deadline = System.currentTimeMillis() + MEDIA_TOTAL_BUDGET_MS;
        for (int i = messages.size() - 1; i >= 0 && result.size() < MAX_MEDIA_PREVIEWS; i--) {
            if (!mediaPreviewStillAllowed(account, startGen)) {
                result.clear();
                return result;
            }
            NotificationPolicy.Message msg = messages.get(i);
            MediaCandidate cand = candidates.get(msg.id);
            if (cand == null || !NotificationPolicy.isPreviewableMediaType(cand.attachmentType)) continue;
            boolean isSticker = cand.attachmentType == 7;
            String ext = isSticker ? ".png" : ".jpg";
            String mime = isSticker ? "image/png" : "image/jpeg";
            String name = "m_" + sha256Hex16(account + ":" + chat + ":" + msg.id + ":" + cand.attachmentType) + ext;
            File staged = new File(dir, name);
            boolean ready;
            synchronized (PREVIEW_FILE_LOCK) {
                if (!Settings.mediaPreviewAllowed() || mediaPreviewGeneration != startGen) {
                    result.clear();
                    return result;
                }
                ready = staged.isFile() && staged.length() > 0L;
                if (ready) staged.setLastModified(System.currentTimeMillis());
            }
            if (!ready) {
                long remainingMs = Math.max(0L, deadline - System.currentTimeMillis());
                Bitmap bitmap = isSticker
                        ? resolveStickerBitmap(context, original, msg.id, cand, remainingMs)
                        : resolvePhotoOrVideoBitmap(context, chat, msg.id, cand, remainingMs);
                if (bitmap != null) {
                    try {
                        boolean allowedOutside = mediaPreviewStillAllowed(account, startGen);
                        synchronized (PREVIEW_FILE_LOCK) {
                            if (!allowedOutside || !Settings.mediaPreviewAllowed() || mediaPreviewGeneration != startGen) {
                                result.clear();
                                return result;
                            }
                            if (!dir.isDirectory() && !dir.mkdirs()) continue;
                            ready = writeStagedBitmap(staged, bitmap, isSticker);
                        }
                    } finally {
                        if (!bitmap.isRecycled()) bitmap.recycle();
                    }
                }
            }
            if (ready) {
                if (!mediaPreviewStillAllowed(account, startGen)) {
                    result.clear();
                    return result;
                }
                Uri contentUri = contentUriForStagedFile(context, staged);
                if (contentUri != null) result.put(msg.id, new MediaPreview(mime, contentUri));
            }
        }
        synchronized (PREVIEW_FILE_LOCK) {
            if (!Settings.mediaPreviewAllowed() || mediaPreviewGeneration != startGen) {
                result.clear();
                return result;
            }
            prunePreviewDir(dir);
        }
        if (!mediaPreviewStillAllowed(account, startGen)) result.clear();
        return result;
    }

    private static Bitmap resolveStickerBitmap(Context context, Notification original,
                                               String messageId, MediaCandidate cand, long remainingMs) {
        long[] ids = NotificationPolicy.parseStickerIds(cand.parameter);
        if (ids != null) {
            try {
                Class<?> mgrType = type("su5.d");
                Object key = mgrType.getField("sa").get(null);
                Object mgr = type("sc0.f").getMethod("a", Context.class, type("sc0.a")).invoke(null, context, key);
                for (String method : new String[]{"n", "k", "m"}) {
                    Object fileObj = mgrType.getMethod(method, long.class, long.class).invoke(mgr, ids[0], ids[2]);
                    if (fileObj instanceof File) {
                        Bitmap decoded = decodeLocalFile((File) fileObj, STICKER_MAX_DIM, false);
                        if (decoded != null) return decoded;
                    }
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        if (original != null && original.extras != null) {
            boolean matchesMessage = messageId.equals(original.extras.getString("line.message.id"));
            boolean matchesSticker = ids != null && ids[2] == original.extras.getLong("line.sticker.id", -1L);
            if (matchesMessage || matchesSticker) {
                String stickerUrl = original.extras.getString("line.sticker.url");
                if (stickerUrl != null && !stickerUrl.isEmpty()) {
                    Bitmap loaded = glideBitmap(context, stickerUrl, STICKER_MAX_DIM, remainingMs);
                    if (loaded != null) return loaded;
                }
            }
        }
        if (ids != null) {
            try {
                Class<?> urlType = type("su5.o");
                Object key = urlType.getField("va").get(null);
                Object urlGen = type("sc0.f").getMethod("a", Context.class, type("sc0.a")).invoke(null, context, key);
                Object resData = type("zu5.d")
                        .getConstructor(long.class, long.class, long.class, type("zu5.e"), String.class)
                        .newInstance(ids[0], ids[1], ids[2], null, null);
                Object derivedUrl = urlType.getMethod("h", type("zu5.d")).invoke(urlGen, resData);
                if (derivedUrl instanceof String && !((String) derivedUrl).isEmpty()) {
                    Bitmap loaded = glideBitmap(context, derivedUrl, STICKER_MAX_DIM, remainingMs);
                    if (loaded != null) return loaded;
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return null;
    }

    private static Bitmap resolvePhotoOrVideoBitmap(Context context, String chat,
                                                    String messageId, MediaCandidate cand, long remainingMs) {
        if (cand.localId > 0L) {
            try {
                Class<?> mgrType = type("j31.a");
                Object key = mgrType.getField("I4").get(null);
                Object fileMgr = type("sc0.f").getMethod("a", Context.class, type("sc0.a")).invoke(null, context, key);
                Class<?> msgKeyType = type("j31.c");
                Object msgKey = msgKeyType.getConstructor(String.class, long.class).newInstance(chat, cand.localId);
                Object thumbObj = mgrType.getMethod("e", msgKeyType).invoke(fileMgr, msgKey);
                if (thumbObj instanceof File) {
                    Bitmap decoded = decodeLocalFile((File) thumbObj, PHOTO_MAX_DIM, true);
                    if (decoded != null) return decoded;
                }
                if (cand.attachmentType == 1 || cand.attachmentType == 21) {
                    Class<?> kindType = type("j31.e");
                    for (String kindName : new String[]{"IMAGE_STANDARD", "IMAGE_ORIGINAL"}) {
                        Object kind = kindType.getField(kindName).get(null);
                        Object mediaObj = mgrType.getMethod("k", msgKeyType, kindType).invoke(fileMgr, msgKey, kind);
                        if (mediaObj instanceof File) {
                            Bitmap decoded = decodeLocalFile((File) mediaObj, PHOTO_MAX_DIM, true);
                            if (decoded != null) return decoded;
                        }
                    }
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        if (cand.localUri != null && !cand.localUri.isEmpty()) {
            String path = null;
            if (cand.localUri.startsWith("file://")) path = Uri.parse(cand.localUri).getPath();
            else if (cand.localUri.startsWith("/")) path = cand.localUri;
            if (path != null && !path.isEmpty()) {
                Bitmap decoded = decodeLocalFile(new File(path), PHOTO_MAX_DIM, true);
                if (decoded != null) return decoded;
            }
        }
        if (remainingMs <= 0L) return null;
        String previewUrl = NotificationPolicy.parameterValue(cand.parameter, "PREVIEW_URL");
        String obsPop = NotificationPolicy.parameterValue(cand.parameter, "OBS_POP");
        Object obsEnc = buildObsEncryptionData(cand.parameter);
        try {
            Object glideModel = type("e80.d")
                    .getConstructor(String.class, String.class, long.class, String.class,
                            type("lg1.a$c"), String.class, boolean.class)
                    .newInstance(chat, messageId, cand.localId, previewUrl, obsEnc, obsPop, false);
            Bitmap loaded = glideBitmap(context, glideModel, PHOTO_MAX_DIM, remainingMs);
            if (loaded != null) return loaded;
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        if (previewUrl != null && previewUrl.startsWith("https://")) {
            return glideBitmap(context, previewUrl, PHOTO_MAX_DIM, remainingMs);
        }
        return null;
    }

    private static Object buildObsEncryptionData(String parameter) {
        String oid = NotificationPolicy.parameterValue(parameter, "OID");
        String sid = NotificationPolicy.parameterValue(parameter, "SID");
        String encKm = NotificationPolicy.parameterValue(parameter, "ENC_KM");
        if (oid == null || sid == null || encKm == null) return null;
        try {
            byte[] raw = Base64.decode(encKm, Base64.NO_WRAP);
            if (raw.length == 0) return null;
            List<Byte> bytes = new ArrayList<>(raw.length);
            for (byte b : raw) bytes.add(b);
            return type("lg1.a$c")
                    .getConstructor(String.class, String.class, List.class)
                    .newInstance(sid, oid, bytes);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static Bitmap glideBitmap(Context context, Object model, int maxDim, long remainingMs) {
        if (remainingMs <= 0L) return null;
        long timeoutMs = Math.min(MEDIA_SINGLE_TIMEOUT_MS, remainingMs);
        if (Looper.myLooper() == Looper.getMainLooper()) {
            try {
                return AVATAR_EXECUTOR.submit(() -> loadGlideBitmap(context, model, maxDim, timeoutMs))
                        .get(timeoutMs + 50L, TimeUnit.MILLISECONDS);
            } catch (Exception ignored) {
                return null;
            }
        }
        return loadGlideBitmap(context, model, maxDim, timeoutMs);
    }

    private static Bitmap loadGlideBitmap(Context context, Object model, int maxDim, long timeoutMs) {
        Object glideManager = null;
        Object futureTarget = null;
        try {
            Object retriever = type("com.bumptech.glide.c").getMethod("c", Context.class).invoke(null, context);
            glideManager = type("xn.o").getMethod("f", Context.class).invoke(retriever, context);
            Object request = type("com.bumptech.glide.o").getMethod("g").invoke(glideManager);
            request = type("com.bumptech.glide.n").getMethod("b0", Object.class).invoke(request, model);
            Class<?> optionsType = type("ao.a");
            Class<?> strategyType = type("kn.l");
            Object diskAuto = strategyType.getField("d").get(null); // DiskCacheStrategy.AUTOMATIC (Lkn/l$e;)
            request = optionsType.getMethod("h", strategyType).invoke(request, diskAuto);
            request = optionsType.getMethod("u", int.class, int.class).invoke(request, maxDim, maxDim);
            futureTarget = type("com.bumptech.glide.n").getMethod("g0").invoke(request);
            if (!(futureTarget instanceof Future<?>)) return null;
            Object result = ((Future<?>) futureTarget).get(timeoutMs, TimeUnit.MILLISECONDS);
            if (!(result instanceof Bitmap)) return null;
            Bitmap bitmap = (Bitmap) result;
            if (bitmap.isRecycled()) return null;
            return scaleDown(bitmap, maxDim, true);
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

    private static Bitmap decodeLocalFile(File file, int maxDim, boolean applyExif) {
        if (file == null || !file.isFile() || !file.canRead()) return null;
        long size = file.length();
        if (size <= 0L || size > MAX_LOCAL_IMAGE_BYTES) return null;
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), bounds);
        int width = bounds.outWidth;
        int height = bounds.outHeight;
        if (width <= 0 || height <= 0) return null;
        int sample = 1;
        while ((width / (sample * 2)) >= maxDim || (height / (sample * 2)) >= maxDim) {
            sample *= 2;
        }
        BitmapFactory.Options opts = new BitmapFactory.Options();
        opts.inSampleSize = sample;
        opts.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap decoded = BitmapFactory.decodeFile(file.getAbsolutePath(), opts);
        if (decoded == null) return null;
        Bitmap oriented = decoded;
        if (applyExif) {
            oriented = applyExifOrientation(file, decoded);
            if (oriented != decoded && !decoded.isRecycled()) decoded.recycle();
        }
        Bitmap scaled = scaleDown(oriented, maxDim, false);
        if (scaled != oriented && !oriented.isRecycled()) oriented.recycle();
        return scaled;
    }

    private static Bitmap applyExifOrientation(File file, Bitmap source) {
        try {
            int orientation = new ExifInterface(file).getAttributeInt(
                    ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL);
            Matrix matrix = new Matrix();
            switch (orientation) {
                case ExifInterface.ORIENTATION_FLIP_HORIZONTAL: matrix.setScale(-1f, 1f); break;
                case ExifInterface.ORIENTATION_ROTATE_180: matrix.setRotate(180f); break;
                case ExifInterface.ORIENTATION_FLIP_VERTICAL: matrix.setScale(1f, -1f); break;
                case ExifInterface.ORIENTATION_TRANSPOSE:
                    matrix.setRotate(90f);
                    matrix.postScale(-1f, 1f);
                    break;
                case ExifInterface.ORIENTATION_ROTATE_90: matrix.setRotate(90f); break;
                case ExifInterface.ORIENTATION_TRANSVERSE:
                    matrix.setRotate(-90f);
                    matrix.postScale(-1f, 1f);
                    break;
                case ExifInterface.ORIENTATION_ROTATE_270: matrix.setRotate(270f); break;
                default: return source;
            }
            Bitmap rotated = Bitmap.createBitmap(
                    source, 0, 0, source.getWidth(), source.getHeight(), matrix, true);
            return rotated != null ? rotated : source;
        } catch (IOException | RuntimeException ignored) {
            return source;
        }
    }

    private static Bitmap scaleDown(Bitmap source, int maxDim, boolean requireCopy) {
        int w = source.getWidth();
        int h = source.getHeight();
        if (w <= 0 || h <= 0) return null;
        if (w <= maxDim && h <= maxDim) {
            return requireCopy ? source.copy(Bitmap.Config.ARGB_8888, false) : source;
        }
        float scale = Math.min((float) maxDim / w, (float) maxDim / h);
        int targetW = Math.max(1, Math.round(w * scale));
        int targetH = Math.max(1, Math.round(h * scale));
        Bitmap scaled = Bitmap.createScaledBitmap(source, targetW, targetH, true);
        if (requireCopy && scaled == source) {
            return source.copy(Bitmap.Config.ARGB_8888, false);
        }
        return scaled;
    }

    private static boolean writeStagedBitmap(File target, Bitmap bitmap, boolean png) {
        File tmp = new File(target.getParentFile(), target.getName() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            boolean ok = bitmap.compress(
                    png ? Bitmap.CompressFormat.PNG : Bitmap.CompressFormat.JPEG,
                    png ? 100 : 85,
                    out);
            out.flush();
            if (!ok) {
                tmp.delete();
                return false;
            }
        } catch (IOException | RuntimeException ignored) {
            tmp.delete();
            return false;
        }
        if (!tmp.renameTo(target)) {
            tmp.delete();
            return false;
        }
        return target.isFile() && target.length() > 0L;
    }

    private static Uri contentUriForStagedFile(Context context, File staged) {
        try {
            Object companion = type("jp.naver.line.android.common.LineCommonFileProvider").getField("g").get(null);
            Object uri = type("jp.naver.line.android.common.LineCommonFileProvider$a")
                    .getMethod("d", Context.class, File.class)
                    .invoke(companion, context, staged);
            return uri instanceof Uri ? (Uri) uri : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static void prunePreviewDir(File dir) {
        File[] entries = dir.listFiles();
        if (entries == null) return;
        List<File> keep = new ArrayList<>();
        for (File entry : entries) {
            if (!entry.isFile()) continue;
            if (entry.getName().endsWith(".tmp")) entry.delete();
            else keep.add(entry);
        }
        while (keep.size() > MAX_STAGED_PREVIEWS) {
            int oldestIdx = 0;
            long oldestTime = keep.get(0).lastModified();
            for (int i = 1; i < keep.size(); i++) {
                long t = keep.get(i).lastModified();
                if (t < oldestTime) {
                    oldestTime = t;
                    oldestIdx = i;
                }
            }
            keep.remove(oldestIdx).delete();
        }
    }

    private static String sha256Hex16(String input) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256")
                    .digest(input.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(16);
            for (int i = 0; i < 8 && i < digest.length; i++) {
                int b = digest[i] & 0xff;
                if (b < 16) sb.append('0');
                sb.append(Integer.toHexString(b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            return Long.toHexString(input.hashCode() & 0xffffffffL);
        }
    }
}
