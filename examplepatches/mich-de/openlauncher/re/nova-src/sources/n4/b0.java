package n4;

import android.app.Notification;
import android.app.Person;

/* loaded from: classes2.dex */
public abstract class b0 {
    public static Notification.MessagingStyle a(Person person) {
        return new Notification.MessagingStyle(person);
    }

    public static Notification.MessagingStyle b(Notification.MessagingStyle messagingStyle, boolean z11) {
        return messagingStyle.setGroupConversation(z11);
    }
}
