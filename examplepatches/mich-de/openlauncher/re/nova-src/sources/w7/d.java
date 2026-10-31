package w7;

import android.app.Notification;
import android.app.Service;

/* loaded from: classes2.dex */
public abstract class d {
    public static void a(Service service, int i5, Notification notification, int i11) {
        service.startForeground(i5, notification, i11);
    }
}
