package app.morphe.extension.mapsautomotive.android9;

import android.app.Notification;
import android.os.Build;

/** Notification.Action.Builder.setContextual (patch "Android 9 (API 28)"): no contextual actions on Android 9. */
public final class NotificationActionBuilder28 {
    public static final String OWNER = "Landroid/app/Notification$Action$Builder;";

    private NotificationActionBuilder28() {
    }

    public static Notification.Action.Builder setContextual(Notification.Action.Builder builder, boolean isContextual) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setContextual(isContextual);
        return builder;
    }
}
