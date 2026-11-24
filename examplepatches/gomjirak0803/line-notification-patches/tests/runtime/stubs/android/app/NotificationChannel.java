package android.app;

import android.net.Uri;

public final class NotificationChannel {
    private final String id;
    private CharSequence name;
    private int importance;
    private String group;
    private String description;
    private int lockscreenVisibility = Notification.VISIBILITY_PUBLIC;

    public NotificationChannel(String id, CharSequence name, int importance) {
        this.id = id;
        this.name = name;
        this.importance = importance;
    }

    public String getId() { return id; }
    public int getImportance() { return importance; }
    public void setImportance(int importance) { this.importance = importance; }
    public String getGroup() { return group; }
    public void setGroup(String groupId) { this.group = groupId; }
    public int getLockscreenVisibility() { return lockscreenVisibility; }
    public void setLockscreenVisibility(int visibility) { this.lockscreenVisibility = visibility; }
    public void setSound(Uri sound, Object audioAttributes) {}
    public void enableVibration(boolean vibration) {}
    public void enableLights(boolean lights) {}
    public void setDescription(String description) { this.description = description; }
    public String getDescription() { return description; }
}
