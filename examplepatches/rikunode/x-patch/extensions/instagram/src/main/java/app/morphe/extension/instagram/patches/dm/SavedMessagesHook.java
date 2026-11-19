/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.dm;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;

import static app.morphe.extension.instagram.utils.IgStr.str;

import app.morphe.extension.instagram.db.PikoMessageDb;
import app.morphe.extension.instagram.entity.DirectItem;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Runtime hooks for "Save deleted messages". Field names are resolved at patch time into the
 * DirectItem entity.
 *
 * <p>The hooks run on the app's network threads, inside its parsers. Anything that touches the
 * app's own message object happens there and then, before the hook returns: the parser hands the
 * object on as soon as the hook is done with it. Only plain values copied out of it go to the
 * worker thread, which does the database and notification work.
 */
@SuppressWarnings("unused")
public class SavedMessagesHook {
    private static final long DAY_MS = 24L * 60 * 60 * 1000;

    private static volatile String sCurrentThreadId;

    /** Logs each distinct failure once, so a broken name costs one log line, not one per message. */
    private static final java.util.Set<String> LOGGED_FAILURES =
            java.util.Collections.synchronizedSet(new java.util.HashSet<String>());

    private static void logOnce(String where, Throwable failure) {
        if (LOGGED_FAILURES.add(where + failure.getClass().getName())) {
            Logger.printException(() -> "SavedMessagesHook." + where + " failed", failure);
        }
    }

    private static PikoMessageDb db() {
        Context context = Utils.getContext();
        if (context == null) throw new IllegalStateException("No app context yet");
        return PikoMessageDb.getInstance(context);
    }

    /** How long a message that was never deleted is kept. Set from the patch option. */
    private static int retentionDays() {
        int days = 30;
        return days;
    }

    // --- Hook 5 (open-thread id) --------------------------------------------------------
    // The chat action-bar builder holds the thread only as an obfuscated view model, and the
    // chain viewModel -> descriptor -> DirectThreadKey -> threadId needs three scratch
    // registers the builder does not always have below v16 (iget-object/invoke-static encode
    // their registers in 4 bits). So the patch passes the view model as a single Object and
    // the chain is walked here, with every obfuscated name baked in at patch time.

    private static String openThreadDescriptorField() { return "descriptorField"; }

    private static String openThreadConverterClass() { return "converterClass"; }

    private static String openThreadConverterMethod() { return "converterMethod"; }

    private static String openThreadIdField() { return "threadIdField"; }

    private static java.lang.reflect.Field findField(Class<?> type, String name) {
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                java.lang.reflect.Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {}
        }
        return null;
    }

    /** Hook 5: remember which thread is on screen, given the action bar's view model. */
    public static void noteOpenThread(Object viewModel) {
        if (viewModel == null) return;
        try {
            java.lang.reflect.Field descriptorField =
                    findField(viewModel.getClass(), openThreadDescriptorField());
            if (descriptorField == null) return;
            Object descriptor = descriptorField.get(viewModel);
            if (descriptor == null) return;

            Object threadKey = null;
            String converterName = openThreadConverterMethod();
            for (java.lang.reflect.Method m :
                    Class.forName(openThreadConverterClass()).getDeclaredMethods()) {
                if (!m.getName().equals(converterName)) continue;
                Class<?>[] params = m.getParameterTypes();
                if (params.length != 1 || !params[0].isInstance(descriptor)) continue;
                m.setAccessible(true);
                threadKey = m.invoke(null, descriptor);
                break;
            }
            if (threadKey == null) return;

            java.lang.reflect.Field idField = findField(threadKey.getClass(), openThreadIdField());
            if (idField == null) return;
            Object threadId = idField.get(threadKey);
            if (threadId instanceof String && !((String) threadId).isEmpty()) {
                sCurrentThreadId = (String) threadId;
            }
        } catch (Throwable failure) {
            logOnce("noteOpenThread", failure);
        }
    }

    /** Hook 6: harvest participant id→username from the thread deserializer's user list. */
    public static void noteThreadUsers(final java.util.List<?> users) {
        if (users == null || users.isEmpty()) return;
        if (!Pref.saveDeletedMessages()) return;

        // Read the names here: the list and its users are the app's, and are handed on as soon
        // as this returns.
        final java.util.List<String[]> named = new java.util.ArrayList<>();
        try {
            for (Object user : users) {
                if (user == null) continue;
                UserData data = new UserData(user);
                String id = data.getUserId();
                if (id == null || !id.matches("\\d{6,14}")) continue;
                String name = data.getUsername();
                if (name == null || name.isEmpty()) name = data.getFullName();
                if (name != null && !name.isEmpty()) named.add(new String[]{id, name});
            }
        } catch (Throwable failure) {
            logOnce("noteThreadUsers", failure);
        }
        if (named.isEmpty()) return;

        getWorker().post(() -> {
            try {
                PikoMessageDb db = db();
                for (String[] entry : named) db.putUsername(entry[0], entry[1]);
            } catch (Throwable failure) {
                logOnce("noteThreadUsers.store", failure);
            }
        });
    }

    /** Opens the deleted-messages screen for the current thread (or all if unknown). */
    public static void openDeletedMessages(Context ctx) {
        try {
            if (ctx == null) ctx = Utils.getContext();
            if (ctx == null) return;
            Intent intent = new Intent(ctx, DeletedMessagesActivity.class);
            String openThreadId = sCurrentThreadId;
            if (openThreadId != null && !openThreadId.isEmpty()) {
                intent.putExtra("thread_id", openThreadId);
            }
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
        } catch (Exception failure) {
            Logger.printException(() -> "SavedMessagesHook.openDeletedMessages failed", failure);
        }
    }

    // Our own user id, learned from messages whose is_sent_by_viewer flag is set (and persisted),
    // so even a freshly-sent message is recognised as own by comparing sender ids.
    private static volatile String sMyUserId;

    private static String myUserId() {
        if (sMyUserId == null) {
            try {
                Context ctx = Utils.getContext();
                if (ctx != null) {
                    String v = ctx.getSharedPreferences("piko_dm", Context.MODE_PRIVATE)
                            .getString("my_user_id", null);
                    if (v != null && !v.isEmpty()) sMyUserId = v;
                }
            } catch (Exception ignored) {}
        }
        return sMyUserId;
    }

    private static void rememberMyUserId(String id) {
        if (id == null || id.isEmpty() || id.equals(sMyUserId)) return;
        sMyUserId = id;
        try {
            Context ctx = Utils.getContext();
            if (ctx != null) {
                ctx.getSharedPreferences("piko_dm", Context.MODE_PRIVATE)
                        .edit().putString("my_user_id", id).apply();
            }
        } catch (Exception ignored) {}
    }

    // Background thread so the app's network threads never wait on the database.
    private static android.os.Handler sWorker;

    private static synchronized android.os.Handler getWorker() {
        if (sWorker == null) {
            android.os.HandlerThread thread = new android.os.HandlerThread("piko-dm-hook");
            thread.start();
            sWorker = new android.os.Handler(thread.getLooper());
        }
        return sWorker;
    }

    // Dedup set of item_ids already queued (bounded to 2000 via eldest-entry eviction).
    private static final java.util.Map<String, Boolean> SEEN_ITEM_IDS =
        java.util.Collections.synchronizedMap(new java.util.LinkedHashMap<String, Boolean>() {
            @Override protected boolean removeEldestEntry(java.util.Map.Entry<String, Boolean> e) {
                return size() > 2000;
            }
        });

    // Notification dedup: a live unsend can surface via Hook 2 (re-delivery) and Hook 4 (DB hide).
    // Notify at most once per message_id (bounded, eldest-evicted).
    private static final java.util.Map<String, Boolean> NOTIFIED_IDS =
        java.util.Collections.synchronizedMap(new java.util.LinkedHashMap<String, Boolean>() {
            @Override protected boolean removeEldestEntry(java.util.Map.Entry<String, Boolean> e) {
                return size() > 1000;
            }
        });

    /** True the first time this message_id is offered for notification; false on repeats. */
    private static boolean claimNotification(String messageId) {
        if (messageId == null) return true; // can't dedup → allow
        return NOTIFIED_IDS.put(messageId, Boolean.TRUE) == null;
    }

    /** Hook 1 (REST): the parsed DirectItem carries its own thread_key, so no hint is needed. */
    public static void onMessageReceived(final Object item) {
        onMessageReceived(item, null);
    }

    /** What the worker needs of a message, copied out of the app's object on the hook's thread. */
    private static final class Captured {
        String messageId;
        String senderId;
        String threadId;
        String content;
        String type;
        long timestamp;
        boolean deleted;
    }

    /**
     * Hook 2 (MQTT/MSys): the item's thread_key is null here, so the patch passes the thread id
     * read from the MSys delta as {@code threadIdHint}.
     */
    public static void onMessageReceived(final Object item, final String threadIdHint) {
        if (item == null) return;
        if (!Pref.saveDeletedMessages()) return;
        // Class guard: only X.* (obfuscated IG classes) are DirectItem candidates.
        if (!item.getClass().getName().startsWith("X.")) return;

        final Captured captured;
        try {
            DirectItem di = new DirectItem(item);
            captured = capture(di, threadIdHint);
            if (captured == null) return;

            // Un-hide before the parser hands the message to the thread view: done later, on
            // another thread, the view has usually already dropped it.
            if (captured.deleted) restore(di, captured);
        } catch (Throwable failure) {
            logOnce("onMessageReceived", failure);
            return;
        }

        getWorker().post(() -> store(captured));
    }

    private static Captured capture(DirectItem di, String threadIdHint) {
        String senderId = di.getUserId();
        if (di.isSentByViewer()) {
            rememberMyUserId(senderId);
            return null;
        }
        String me = myUserId();
        if (senderId != null && senderId.equals(me)) return null;

        Captured c = new Captured();
        c.senderId = senderId;
        c.messageId = di.getItemId();
        c.deleted = di.isHideInThread();
        // dedup key includes deletion state: alive and unsent are different events.
        if (c.messageId != null
                && SEEN_ITEM_IDS.put(c.messageId + (c.deleted ? ":1" : ":0"), Boolean.TRUE) != null) {
            return null;
        }

        c.type = di.getItemType();
        if (c.type != null) c.type = c.type.trim().toLowerCase();
        if ("action_log".equals(c.type) || "expired_placeholder".equals(c.type)
                || "placeholder".equals(c.type)) return null;

        c.content = di.getText();
        c.timestamp = di.getTimestampMs();

        // For non-text items, capture the CDN url or permalink so the media stays recoverable. A
        // caption must not block this: it would be stored instead of the url.
        if (c.type != null && !c.type.equals("text")
                && (c.content == null || c.content.isEmpty() || !c.content.startsWith("http"))) {
            // Unsupported shapes (animated_media/story_share/link) return null → "[type]" label.
            String url = di.getMediaUrl();
            // xma reshares carry no CDN media — recover the permalink instead.
            if (url == null && c.type.startsWith("xma")) url = di.xmaReshareLink();
            if (url != null && url.startsWith("http")) c.content = url;
        }

        if (c.messageId == null) {
            // The MQTT subclass may not resolve item_id: key on sender + timestamp so a later
            // unsend maps back to the same row.
            if (senderId == null) return null;
            c.messageId = "syn:" + senderId + ":" + c.timestamp;
        }

        c.threadId = di.getThreadId();
        // MQTT path: the thread id comes from the MSys delta.
        if ((c.threadId == null || c.threadId.isEmpty()) && threadIdHint != null && !threadIdHint.isEmpty()) {
            c.threadId = threadIdHint;
        }
        if (c.threadId == null) c.threadId = "";
        return c;
    }

    /** Keeps an unsent message in the thread, with its text restored from the stored copy. */
    private static void restore(DirectItem di, Captured captured) {
        di.setHideInThread(false);
        if (captured.content == null || captured.content.isEmpty()) {
            // One indexed read, only for an unsent message, on the app's network thread.
            String stored = db().getStoredContent(captured.messageId);
            if (stored != null) di.setText(stored);
        }
    }

    private static long lastPruneMs;

    private static void store(Captured c) {
        try {
            PikoMessageDb db = db();

            long now = System.currentTimeMillis();
            if (now - lastPruneMs > DAY_MS) {
                lastPruneMs = now;
                db.pruneAliveOlderThan(now - retentionDays() * DAY_MS);
            }

            // Sender name: id→handle directory first, then the thread's single sender's name.
            String senderUser = db.getUsername(c.senderId);
            if (senderUser == null) senderUser = db.getThreadUsername(c.threadId);

            if (c.deleted) {
                // Only notify when we previously captured this message alive.
                boolean liveDeletion = db.isStoredAlive(c.messageId);
                db.insertOrIgnore(c.messageId, c.threadId, c.senderId, senderUser, c.content, c.type, c.timestamp);
                db.markDeleted(c.messageId);
                if (liveDeletion && claimNotification(c.messageId)) {
                    String notifySender = senderUser != null ? senderUser : db.getSenderDisplay(c.messageId);
                    String notifyBody = (c.content != null && !c.content.isEmpty())
                            ? c.content : db.getStoredContent(c.messageId);
                    notifyDeletion(notifySender, notifyBody, c.type);
                }
            } else {
                db.insertOrIgnore(c.messageId, c.threadId, c.senderId, senderUser, c.content, c.type, c.timestamp);
            }
        } catch (Throwable failure) {
            logOnce("store", failure);
        }
    }

    // Instagram declares POST_NOTIFICATIONS; this extension has no manifest of its own.
    @SuppressLint("NotificationPermission")
    private static void notifyDeletion(String sender, String content, String type) {
        try {
            Context ctx = Utils.getContext();
            if (ctx == null) return;

            android.app.NotificationManager nm =
                (android.app.NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) return;

            String channelId = "piko_deleted_messages";
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                android.app.NotificationChannel ch = new android.app.NotificationChannel(
                    channelId, str("piko_deleted_messages_channel"), android.app.NotificationManager.IMPORTANCE_DEFAULT);
                ch.setDescription(str("piko_deleted_messages_channel_desc"));
                nm.createNotificationChannel(ch);
            }

            String who = (sender != null && !sender.isEmpty()) ? sender : str("piko_someone");
            String body = (content != null && !content.isEmpty())
                    ? content
                    : (type != null && !type.isEmpty()) ? "[" + type + "]" : str("piko_media_deleted_generic");

            Intent intent = new Intent(ctx, DeletedMessagesActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            int piFlags = android.app.PendingIntent.FLAG_UPDATE_CURRENT
                | (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M
                    ? android.app.PendingIntent.FLAG_IMMUTABLE : 0);
            android.app.PendingIntent pi = android.app.PendingIntent.getActivity(ctx, 0, intent, piFlags);

            int iconRes = ctx.getApplicationInfo().icon;
            android.app.Notification.Builder b =
                android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O
                    ? new android.app.Notification.Builder(ctx, channelId)
                    : new android.app.Notification.Builder(ctx);
            android.app.Notification n = b
                .setSmallIcon(iconRes != 0 ? iconRes : android.R.drawable.ic_dialog_info)
                .setContentTitle(String.format(str("piko_deleted_a_message"), who))
                .setContentText(body)
                .setAutoCancel(true)
                .setContentIntent(pi)
                .build();

            nm.notify((int) (System.currentTimeMillis() & 0x7fffffff), n);
        } catch (Exception failure) {
            logOnce("notifyDeletion", failure);
        }
    }

    /** Hook 4: the app hid a message in its own database. Runs on the caller's thread. */
    public static void onMessageHiddenFromDb(final String serverId, final String clientId) {
        if (!Pref.saveDeletedMessages()) return;
        final String itemId = (serverId != null && !serverId.isEmpty()) ? serverId : clientId;
        if (itemId == null) return;

        getWorker().post(() -> {
            try {
                PikoMessageDb vault = db();
                if (!vault.isStored(itemId)) return;

                boolean wasReceived = vault.isStoredAlive(itemId);
                String messageType = vault.getMessageType(itemId);

                vault.markDeleted(itemId);

                if (wasReceived && claimNotification(itemId)) {
                    String stored = vault.getStoredContent(itemId);
                    // A text message may itself be a link: only non-text items are media.
                    boolean isMedia = !"text".equals(messageType)
                            && (stored == null || stored.isEmpty() || stored.startsWith("http") || stored.startsWith("["));
                    String notifBody = isMedia ? describeMediaType(messageType) : stored;
                    String name = vault.getThreadUsername(vault.getThreadIdOf(itemId));
                    if (name == null) name = vault.getSenderDisplay(itemId);
                    notifyDeletion(name, notifBody, messageType);
                }
            } catch (Throwable failure) {
                logOnce("onMessageHiddenFromDb", failure);
            }
        });
    }

    private static String describeMediaType(String type) {
        if (type == null) return str("piko_media_deleted_generic");
        String label;
        switch (type) {
            case "media":
            case "image":           label = str("piko_media_photo"); break;
            case "raven_media":     label = str("piko_media_disappearing_photo"); break;
            case "video":           label = str("piko_media_video"); break;
            case "voice_media":
            case "audio":           label = str("piko_media_voice"); break;
            case "animated_media":  label = str("piko_media_gif"); break;
            case "reel_share":      label = str("piko_media_reel"); break;
            case "story_share":     label = str("piko_media_story"); break;
            case "media_share":     label = str("piko_media_post"); break;
            case "like":            label = str("piko_media_like"); break;
            case "link":            label = str("piko_media_link"); break;
            case "action_log":      label = str("piko_media_activity"); break;
            default:                label = type; break;
        }
        return String.format(str("piko_media_deleted"), label);
    }
}
