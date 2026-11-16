package app.onlynazril.extension.tiktok.refreshrate;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import app.onlynazril.extension.tiktok.internal.Activities;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.settings.RefreshRateSettings;

/**
 * Applies the refresh-rate choice to every activity.
 * <p>
 * One lifecycle callback is installed at process start. On each resume the saved rate is put on
 * the activity's window as `preferredRefreshRate`, which is the public request the window manager
 * uses to pick a matching display mode. The default choice writes zero, which clears a rate chosen
 * earlier.
 * <p>
 * A rate the panel does not support stays a request: the platform picks the closest mode it has.
 * Nothing here forces a mode id, so the app cannot be left on a mode the display did not offer.
 */
public final class RefreshRate {
    private static volatile boolean installed;

    private RefreshRate() {}

    /** Registers the lifecycle callback once, at the earliest point a process has an Application. */
    public static void install(Context context) {
        if (installed || !(context instanceof Application)) return;
        synchronized (RefreshRate.class) {
            if (installed) return;
            ((Application) context).registerActivityLifecycleCallbacks(new Lifecycle());
            installed = true;
        }
    }

    /** Whether the patch installed the callback; the Tweaks selector only applies live when it did. */
    public static boolean isInstalled() {
        return installed;
    }

    /** Applies the saved rate to the activity behind this context, if any. */
    public static void applyNow(Context context) {
        apply(Activities.of(context));
    }

    /** Applies the saved rate to one activity; safe to call on every resume. */
    public static void apply(Activity activity) {
        if (activity == null || activity.isFinishing()) return;

        int fps = RefreshRateSettings.fps(activity);
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            WindowManager.LayoutParams attributes = window.getAttributes();
            float requested = fps > 0 ? (float) fps : 0f;
            if (attributes.preferredRefreshRate != requested) {
                attributes.preferredRefreshRate = requested;
                window.setAttributes(attributes);
                Debug.print("refresh rate: " + (fps > 0 ? fps + " fps" : "default"));
            }
        } catch (Throwable t) {
            Debug.print("refresh rate: " + t);
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle state) {}

        @Override
        public void onActivityStarted(@NonNull Activity activity) {}

        @Override
        public void onActivityResumed(@NonNull Activity activity) {
            RefreshRate.apply(activity);
        }

        @Override
        public void onActivityPaused(@NonNull Activity activity) {}

        @Override
        public void onActivityStopped(@NonNull Activity activity) {}

        @Override
        public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle state) {}

        @Override
        public void onActivityDestroyed(@NonNull Activity activity) {}
    }
}
