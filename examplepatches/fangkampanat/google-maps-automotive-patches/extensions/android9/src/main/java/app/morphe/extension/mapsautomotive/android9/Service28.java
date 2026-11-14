package app.morphe.extension.mapsautomotive.android9;

import android.app.Notification;
import android.app.Service;
import android.os.Build;

/** Service.startForeground with a type (patch "Android 9 (API 28)"): Android 9 has no foreground service types. */
public final class Service28 {
    public static final String OWNER = "Landroid/app/Service;";

    private Service28() {
    }

    public static void startForeground(Service service, int id, Notification notification, int foregroundServiceType) {
        if (Build.VERSION.SDK_INT >= 29) {
            service.startForeground(id, notification, foregroundServiceType);
            return;
        }
        service.startForeground(id, notification);
    }
}
