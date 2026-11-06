package jp.futabanet.gaugau.patch;

import android.app.Activity;

import java.lang.ref.WeakReference;

/** Holds the currently resumed GauGau activity for patch-added settings actions. */
public final class GaugauActivityBridge {
    private static volatile WeakReference<Activity> current = new WeakReference<>(null);

    private GaugauActivityBridge() { }

    public static void setCurrentActivity(Activity activity) {
        current = new WeakReference<>(activity);
    }

    public static Activity getCurrentActivity() {
        Activity activity = current.get();
        return activity == null || activity.isFinishing() ? null : activity;
    }

    public static void openDeviceIdEditor() {
        Activity activity = getCurrentActivity();
        if (activity != null) DeviceId.showEditor(activity);
    }

    public static void openFavoritesTransfer() {
        Activity activity = getCurrentActivity();
        if (activity != null) FavoritesTransfer.showMenu(activity);
    }
}
