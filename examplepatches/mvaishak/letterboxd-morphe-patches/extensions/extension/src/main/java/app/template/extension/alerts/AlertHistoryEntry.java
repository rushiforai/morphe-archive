package app.template.extension.alerts;

import java.util.Comparator;
import java.util.List;

final class AlertHistoryEntry {
    static final Comparator<AlertHistoryEntry> NEWEST_FIRST =
            Comparator.<AlertHistoryEntry>comparingLong(entry -> entry.receivedAt).reversed()
                    .thenComparing(entry -> entry.id);

    final String id, title, message, url;
    final long receivedAt;
    final boolean unread;

    AlertHistoryEntry(String id, String title, String message, String url, long receivedAt, boolean unread) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.url = url;
        this.receivedAt = receivedAt;
        this.unread = unread;
    }

    AlertHistoryEntry markRead() {
        return unread ? new AlertHistoryEntry(id, title, message, url, receivedAt, false) : this;
    }

    static int unreadCount(List<AlertHistoryEntry> entries) {
        int count = 0;
        for (AlertHistoryEntry entry : entries) {
            if (entry.unread) count++;
        }
        return count;
    }
}
