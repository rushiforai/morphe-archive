package n4;

import android.app.Notification;
import android.app.Person;
import android.os.Parcelable;

/* loaded from: classes2.dex */
public abstract class d0 {
    public static Parcelable a(Person person) {
        return person;
    }

    public static Notification.MessagingStyle.Message b(CharSequence charSequence, long j11, Person person) {
        return new Notification.MessagingStyle.Message(charSequence, j11, person);
    }
}
