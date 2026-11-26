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
    private final List<Runnable> pendingActiveUpdates = new ArrayList<Runnable>();
    private boolean deferActiveVisibility;
    private long nextPostTime = 1000L;
    private int failNextNotifyCount;
    public volatile Runnable onGetActiveNotificationsForTest;

    public NotificationManager() {
        resetForTest();
    }

    private static String slotKey(String tag, int id) {
        return (tag == null ? "<null>" : tag) + "#" + id;
    }

    public synchronized void failNextNotifyForTest(int count) {
        this.failNextNotifyCount = Math.max(0, count);
    }

    public synchronized void setDeferActiveVisibilityForTest(boolean defer) {
        this.deferActiveVisibility = defer;
    }

    public synchronized void flushDeferredActiveVisibilityForTest() {
        List<Runnable> updates = new ArrayList<Runnable>(pendingActiveUpdates);
        pendingActiveUpdates.clear();
        for (Runnable r : updates) {
            r.run();
        }
    }

    public synchronized void notify(String tag, int id, Notification notification) {
        if (failNextNotifyCount > 0) {
            failNextNotifyCount--;
            throw new RuntimeException("Simulated notify IPC failure");
        }
        notifyHistory.add(new NotifyRecord(tag, id, notification));
        Runnable apply = new Runnable() {
            @Override public void run() {
                active.put(slotKey(tag, id), new StatusBarNotification(tag, id, ++nextPostTime, notification));
            }
        };
        if (deferActiveVisibility) {
            pendingActiveUpdates.add(apply);
        } else {
            apply.run();
        }
    }

    private void applyCancelLocked(String key) {
        StatusBarNotification removed = active.remove(key);
        if (removed == null) return;
        Notification n = removed.getNotification();
        if (n == null || (n.flags & Notification.FLAG_GROUP_SUMMARY) == 0) return;
        String group = n.getGroup();
        if (group == null) return;
        java.util.Iterator<Map.Entry<String, StatusBarNotification>> it = active.entrySet().iterator();
        while (it.hasNext()) {
            StatusBarNotification candidate = it.next().getValue();
            Notification cn = candidate == null ? null : candidate.getNotification();
            if (cn != null && (cn.flags & Notification.FLAG_GROUP_SUMMARY) == 0 && group.equals(cn.getGroup())) {
                it.remove();
            }
        }
    }

    public synchronized void cancel(String tag, int id) {
        final String key = slotKey(tag, id);
        cancelHistory.add(key);
        Runnable apply = new Runnable() {
            @Override public void run() {
                applyCancelLocked(key);
            }
        };
        if (deferActiveVisibility) {
            pendingActiveUpdates.add(apply);
        } else {
            apply.run();
        }
    }

    public StatusBarNotification[] getActiveNotifications() {
        Runnable hook = onGetActiveNotificationsForTest;
        if (hook != null) hook.run();
        synchronized (this) {
            return active.values().toArray(new StatusBarNotification[0]);
        }
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
        pendingActiveUpdates.clear();
        deferActiveVisibility = false;
        nextPostTime = 1000L;
        failNextNotifyCount = 0;
        onGetActiveNotificationsForTest = null;
        channels.put("line_default", new NotificationChannel("line_default", "Messages", IMPORTANCE_DEFAULT));
    }
}
