package app.morphe.extension.mapsautomotive.android9;

import android.app.Notification;
import android.os.Build;

/** Android 10 settings of Notification.Builder (patch "Android 9 (API 28)"): features Android 9 lacks, ignored. */
public final class NotificationBuilder28 {
    public static final String OWNER = "Landroid/app/Notification$Builder;";

    private NotificationBuilder28() {
    }

    public static Notification.Builder setAllowSystemGeneratedContextualActions(Notification.Builder builder, boolean allowed) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setAllowSystemGeneratedContextualActions(allowed);
        return builder;
    }

    public static Notification.Builder setBubbleMetadata(Notification.Builder builder, Notification.BubbleMetadata data) {
        if (Build.VERSION.SDK_INT >= 29) return builder.setBubbleMetadata(data);
        return builder;
    }
}
