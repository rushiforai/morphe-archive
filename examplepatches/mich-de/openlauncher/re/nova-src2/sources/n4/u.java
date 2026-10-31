package n4;

import android.app.Notification;
import android.app.Person;
import android.os.Parcelable;

/* loaded from: classes2.dex */
public abstract class u {
    public static Notification.Builder a(Notification.Builder builder, Person person) {
        return builder.addPerson(person);
    }

    public static Parcelable b(Person person) {
        return person;
    }
}
