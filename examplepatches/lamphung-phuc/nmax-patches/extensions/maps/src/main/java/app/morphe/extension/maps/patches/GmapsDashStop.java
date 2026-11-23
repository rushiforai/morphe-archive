package app.morphe.extension.maps.patches;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.service.notification.StatusBarNotification;
import android.util.Log;

/**
 * Ends Maps' trip for NmaxConnect (the app that lost the dash under Auto) the way the rider would: the one action of
 * Maps' own navigation notification ({@code category=navigation}, "Exit navigation"). No obfuscated Maps code and no
 * label text is used, so it survives Maps updates and the phone's language.
 */
public final class GmapsDashStop {
    private static final String TAG = "GmapsDashStop";

    private GmapsDashStop() {
    }

    /** False when Maps shows no navigation notification (not navigating) or the action would not fire. */
    static boolean stop(Context context) {
        NotificationManager nm = context.getSystemService(NotificationManager.class);
        if (nm == null) return false;
        for (StatusBarNotification sbn : nm.getActiveNotifications()) {
            Notification n = sbn.getNotification();
            if (!Notification.CATEGORY_NAVIGATION.equals(n.category) || n.actions == null || n.actions.length == 0) continue;
            try {
                n.actions[0].actionIntent.send();
                return true;
            } catch (Exception e) {
                Log.w(TAG, "exit navigation action refused", e);
                return false;
            }
        }
        return false;
    }
}
