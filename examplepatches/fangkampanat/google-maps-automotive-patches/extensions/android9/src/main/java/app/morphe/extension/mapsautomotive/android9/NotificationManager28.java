package app.morphe.extension.mapsautomotive.android9;

import android.app.NotificationManager;
import android.os.Build;

/** Notification delegates (patch "Android 9 (API 28)"): none on Android 9. */
public final class NotificationManager28 {
    public static final String OWNER = "Landroid/app/NotificationManager;";

    private NotificationManager28() {
    }

    public static String getNotificationDelegate(NotificationManager manager) {
        if (Build.VERSION.SDK_INT >= 29) return manager.getNotificationDelegate();
        return null;
    }

    public static void setNotificationDelegate(NotificationManager manager, String delegate) {
        if (Build.VERSION.SDK_INT >= 29) manager.setNotificationDelegate(delegate);
    }
}
