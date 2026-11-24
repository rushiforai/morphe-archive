package android.app;

import android.service.notification.StatusBarNotification;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class NotificationManager {
    public static final int IMPORTANCE_NONE = 0;
    public static final int IMPORTANCE_LOW = 2;
    public static final int IMPORTANCE_DEFAULT = 3;

    public static final class NotifyRecord {
        public final String tag;
        public final int id;
        public final String chatId;
        public final String messageId;
        public final Notification notification;

        NotifyRecord(String tag, int id, Notification notification) {
            this.tag = tag;
            this.id = id;
            this.notification = notification;
            this.chatId = notification.extras == null ? null : notification.extras.getString("line.chat.id");
            this.messageId = notification.extras == null ? null : notification.extras.getString("line.message.id");
        }
    }

    private final Map<String, StatusBarNotification> active = new LinkedHashMap<String, StatusBarNotification>();
    private final Map<String, NotificationChannel> channels = new HashMap<String, NotificationChannel>();
    private final Map<String, NotificationChannelGroup> groups = new HashMap<String, NotificationChannelGroup>();
    private final List<NotifyRecord> notifyHistory = new ArrayList<NotifyRecord>();
    private final List<String> cancelHistory = new ArrayList<String>();
    private long nextPostTime = 1000L;

    public NotificationManager() {
        resetForTest();
    }

    private static String slotKey(String tag, int id) {
        return (tag == null ? "<null>" : tag) + "#" + id;
    }

    public synchronized void notify(String tag, int id, Notification notification) {
        active.put(slotKey(tag, id), new StatusBarNotification(tag, id, ++nextPostTime, notification));
        notifyHistory.add(new NotifyRecord(tag, id, notification));
    }

    public synchronized void cancel(String tag, int id) {
        String key = slotKey(tag, id);
        active.remove(key);
        cancelHistory.add(key);
    }

    public synchronized StatusBarNotification[] getActiveNotifications() {
        return active.values().toArray(new StatusBarNotification[0]);
    }

    public synchronized void createNotificationChannel(NotificationChannel channel) {
        if (channel != null) channels.put(channel.getId(), channel);
    }

    public synchronized NotificationChannel getNotificationChannel(String channelId) {
        return channels.get(channelId);
    }

    public synchronized NotificationChannelGroup getNotificationChannelGroup(String channelGroupId) {
        return groups.get(channelGroupId);
    }

    public synchronized void putActiveForTest(String tag, int id, Notification notification) {
        active.put(slotKey(tag, id), new StatusBarNotification(tag, id, ++nextPostTime, notification));
    }

    public synchronized StatusBarNotification getActiveSlotForTest(String tag, int id) {
        return active.get(slotKey(tag, id));
    }

    public synchronized List<NotifyRecord> getNotifyHistoryForTest() {
        return new ArrayList<NotifyRecord>(notifyHistory);
    }

    public synchronized List<String> getCancelHistoryForTest() {
        return new ArrayList<String>(cancelHistory);
    }

    public synchronized void resetForTest() {
        active.clear();
        channels.clear();
        groups.clear();
        notifyHistory.clear();
        cancelHistory.clear();
        nextPostTime = 1000L;
        channels.put("line_default", new NotificationChannel("line_default", "Messages", IMPORTANCE_DEFAULT));
    }
}
