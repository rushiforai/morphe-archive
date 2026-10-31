package n4;

import android.app.Notification;
import android.app.Person;
import androidx.core.graphics.drawable.IconCompat;

/* loaded from: classes2.dex */
public abstract class h0 {
    public static void a(Notification.Builder builder, Person person) {
        builder.addPerson(person);
    }

    public static q0 b(Person person) {
        CharSequence name = person.getName();
        IconCompat iconCompatB = person.getIcon() != null ? IconCompat.b(person.getIcon()) : null;
        String uri = person.getUri();
        String key = person.getKey();
        boolean zIsBot = person.isBot();
        boolean zIsImportant = person.isImportant();
        q0 q0Var = new q0();
        q0Var.f77848a = name;
        q0Var.f77849b = iconCompatB;
        q0Var.f77850c = uri;
        q0Var.f77851d = key;
        q0Var.f77852e = zIsBot;
        q0Var.f77853f = zIsImportant;
        return q0Var;
    }

    public static void c(Notification.Action.Builder builder) {
        builder.setSemanticAction(0);
    }

    public static Person d(q0 q0Var) {
        Person.Builder name = new Person.Builder().setName(q0Var.f77848a);
        IconCompat iconCompat = q0Var.f77849b;
        return name.setIcon(iconCompat != null ? iconCompat.f(null) : null).setUri(q0Var.f77850c).setKey(q0Var.f77851d).setBot(q0Var.f77852e).setImportant(q0Var.f77853f).build();
    }
}
