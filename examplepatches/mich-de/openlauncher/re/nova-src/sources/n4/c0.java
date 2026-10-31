package n4;

import android.app.Notification;
import android.net.Uri;

/* loaded from: classes2.dex */
public abstract class c0 {
    public static Notification.MessagingStyle.Message a(CharSequence charSequence, long j11, CharSequence charSequence2) {
        return new Notification.MessagingStyle.Message(charSequence, j11, charSequence2);
    }

    public static Notification.MessagingStyle.Message b(Notification.MessagingStyle.Message message, String str, Uri uri) {
        return message.setData(str, uri);
    }
}
