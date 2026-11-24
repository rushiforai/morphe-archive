package android.app;

public final class NotificationChannelGroup {
    private final String id;
    private boolean blocked;

    public NotificationChannelGroup(String id, boolean blocked) {
        this.id = id;
        this.blocked = blocked;
    }

    public String getId() { return id; }
    public boolean isBlocked() { return blocked; }
    public void setBlocked(boolean blocked) { this.blocked = blocked; }
}
