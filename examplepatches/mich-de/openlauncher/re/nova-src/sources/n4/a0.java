package n4;

import android.app.Notification;

/* loaded from: classes2.dex */
public abstract class a0 {
    public static Notification.MessagingStyle a(Notification.MessagingStyle messagingStyle, Notification.MessagingStyle.Message message) {
        return messagingStyle.addHistoricMessage(message);
    }
}
