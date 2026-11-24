package android.service.notification;

import android.app.Notification;

public class StatusBarNotification {
    private final String tag;
    private final int id;
    private final String key;
    private final long postTime;
    private final Notification notification;

    public StatusBarNotification(String tag, int id, long postTime, Notification notification) {
        this.tag = tag;
        this.id = id;
        this.key = "0|jp.naver.line.android|" + id + "|" + (tag == null ? "null" : tag) + "|1000";
        this.postTime = postTime;
        this.notification = notification;
    }

    public String getTag() { return tag; }
    public int getId() { return id; }
    public String getKey() { return key; }
    public long getPostTime() { return postTime; }
    public Notification getNotification() { return notification; }
}
