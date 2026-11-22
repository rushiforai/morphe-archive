package app.template.extension.alerts;

import java.util.ArrayList;
import java.util.List;

public final class AlertHistoryEntryTest {
    public static void main(String[] args) {
        var recent = new AlertHistoryEntry("stream:one", "Film", "Now streaming", "https://boxd.it/a", 100, true);
        var read = new AlertHistoryEntry("release:two", "Film", "Theatrical release", "https://boxd.it/a", 200, false);
        var entries = new ArrayList<>(List.of(recent, read));
        entries.sort(AlertHistoryEntry.NEWEST_FIRST);
        assert entries.equals(List.of(read, recent));
        assert AlertHistoryEntry.unreadCount(entries) == 1;
        assert AlertHistoryEntry.unreadCount(List.of(read, recent.markRead())) == 0;
        assert recent.markRead().id.equals(recent.id);
        assert recent.markRead().receivedAt == recent.receivedAt;
    }
}
