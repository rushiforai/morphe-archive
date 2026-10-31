// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.chat;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;

import androidx.annotation.Nullable;

import com.onelouder.baconreader.Preferences;
import com.onelouder.baconreader.data.SessionManager;
import com.onelouder.baconreader.reddit.Comment;
import com.onelouder.baconreader.reddit.Message;
import com.onelouder.baconreader.reddit.RedditApi;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * The chat messages Reddit sends to the inbox. BaconReader's own message check, which runs when the app comes to
 * the foreground and at its update interval, hands them over: they're counted for Chat, notified as chat messages,
 * and marked as read on Reddit when the chat shows.
 */
final class ChatMessages {
    private static final String TAG = "ChatMessages";

    private static final String PREFERENCES = "baconreader_patches";
    private static final String KEY_ACCOUNT = "reddit_chat.unread_account";
    private static final String KEY_UNREAD = "reddit_chat.unread_ids";
    private static final String KEY_NOTIFIED = "reddit_chat.notified_time";

    private static final int NOTIFICATION_ID = 0x43484154;

    // BaconReader's channel for new messages, which NotificationsChannels creates at start.
    private static final String APP_CHANNEL = "Messages";
    private static final String OWN_CHANNEL = "baconreader_patches_chat";

    /** While the chat shows, new messages don't notify, and are marked as read: the user sees them. */
    private static volatile boolean chatShowing;

    private ChatMessages() {
    }

    static boolean isChat(@Nullable Object message) {
        return message instanceof Message
                && InboxChats.isChat(((Message) message).subject, message instanceof Comment);
    }

    /** The unread chat messages of the last message check, for the account shown. */
    static int unread(Context context) {
        if (!InboxChats.separate()) return 0;
        List<String> ids = unreadIds(preferences(context));
        return ids == null ? 0 : ids.size();
    }

    /**
     * The unread messages of BaconReader's message check: keeps the chat messages' ids, notifies of new ones, and
     * returns the other messages, which the app notifies of.
     */
    static List<?> onUnread(Context context, List<?> messages) {
        List<Message> chats = new ArrayList<>();
        List<Object> others = new ArrayList<>();
        for (Object message : messages) {
            if (isChat(message)) chats.add((Message) message);
            else others.add(message);
        }
        if (chats.isEmpty() && !InboxChats.separate()) return messages;

        SharedPreferences preferences = preferences(context);
        List<String> ids = new ArrayList<>();
        for (Message chat : chats) {
            if (chat.name != null) ids.add(chat.name);
        }
        if (chatShowing) {
            markRead(context, ids);
            preferences.edit().remove(KEY_UNREAD).apply();
        } else {
            preferences.edit()
                    .putString(KEY_ACCOUNT, account())
                    .putString(KEY_UNREAD, TextUtils.join(",", ids))
                    .apply();
        }

        Message newestChat = newest(chats);
        long newest = newestChat == null ? 0L : newestChat.created_utc;
        long notified = preferences.getLong(KEY_NOTIFIED, 0L);
        if (chats.isEmpty() || chatShowing) {
            cancelNotification(context);
        } else if (newest > notified && Preferences.getNotifyOnMessage()) {
            notify(context, chats, newestChat);
        }
        if (newest > notified) preferences.edit().putLong(KEY_NOTIFIED, newest).apply();
        return others;
    }

    /** Called when the chat shows: its messages are seen. */
    static void onChatShown(Context context) {
        chatShowing = true;
        cancelNotification(context);
        SharedPreferences preferences = preferences(context);
        List<String> ids = unreadIds(preferences);
        if (ids == null) return;
        preferences.edit().remove(KEY_UNREAD).apply();
        markRead(context, ids);
    }

    static void onChatHidden() {
        chatShowing = false;
    }

    @Nullable
    private static List<String> unreadIds(SharedPreferences preferences) {
        if (!account().equals(preferences.getString(KEY_ACCOUNT, null))) return null;
        String saved = preferences.getString(KEY_UNREAD, null);
        if (saved == null) return null;
        List<String> ids = new ArrayList<>();
        for (String id : Arrays.asList(saved.split(","))) {
            if (!id.trim().isEmpty()) ids.add(id);
        }
        return ids.isEmpty() ? null : ids;
    }

    /** Marks the messages as read on Reddit, through the app's own request code. */
    private static void markRead(Context context, List<String> ids) {
        // Reddit takes up to 100 ids, separated by commas.
        for (int start = 0; start < ids.size(); start += 100) {
            List<String> batch = ids.subList(start, Math.min(start + 100, ids.size()));
            RedditApi.readMessage(context, TextUtils.join(",", batch));
        }
    }

    private static String account() {
        String name = SessionManager.getUsername();
        return name == null ? "" : name;
    }

    @Nullable
    private static Message newest(List<Message> chats) {
        Message newest = null;
        for (Message chat : chats) {
            if (newest == null || chat.created_utc > newest.created_utc) newest = chat;
        }
        return newest;
    }

    private static void cancelNotification(Context context) {
        try {
            notifications(context).cancel(NOTIFICATION_ID);
        } catch (Exception exception) {
            Log.i(TAG, "Could not clear the chat notification", exception);
        }
    }

    @SuppressWarnings("deprecation")
    private static void notify(Context context, List<Message> chats, Message newest) {
        NotificationManager notifications = notifications(context);
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            builder = new Notification.Builder(context, channel(notifications));
        } else {
            builder = new Notification.Builder(context).setDefaults(Notification.DEFAULT_ALL);
        }
        int flags = PendingIntent.FLAG_UPDATE_CURRENT
                | (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M ? PendingIntent.FLAG_IMMUTABLE : 0);
        PendingIntent open = PendingIntent.getActivity(context, NOTIFICATION_ID,
                RedditChatPatch.intent(context, null), flags);
        int count = chats.size();
        String text = TextUtils.isEmpty(newest.author)
                ? str("revanced_baconreader_chat_notification_text")
                : newest.author + ": " + (newest.body == null ? "" : newest.body.trim());

        // The icon and color of BaconReader's own notification of new messages.
        int icon = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, "notify_new");
        int color = ResourceUtils.getIdentifier(context, ResourceType.COLOR, "dkPrimary");
        builder.setSmallIcon(icon != 0 ? icon : context.getApplicationInfo().icon)
                .setContentTitle(count == 1
                        ? str("revanced_baconreader_chat_notification_one")
                        : str("revanced_baconreader_chat_notification_many", count))
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setNumber(count)
                .setAutoCancel(true)
                .setContentIntent(open);
        if (color != 0) {
            try {
                builder.setColor(context.getColor(color));
            } catch (Exception exception) {
                Log.i(TAG, "No color for the chat notification", exception);
            }
        }
        notifications.notify(NOTIFICATION_ID, builder.build());
    }

    private static String channel(NotificationManager notifications) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return APP_CHANNEL;
        if (notifications.getNotificationChannel(APP_CHANNEL) != null) return APP_CHANNEL;
        if (notifications.getNotificationChannel(OWN_CHANNEL) == null) {
            notifications.createNotificationChannel(new NotificationChannel(OWN_CHANNEL,
                    str("revanced_baconreader_chat_notification_channel"),
                    NotificationManager.IMPORTANCE_DEFAULT));
        }
        return OWN_CHANNEL;
    }

    private static NotificationManager notifications(Context context) {
        return (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }
}
