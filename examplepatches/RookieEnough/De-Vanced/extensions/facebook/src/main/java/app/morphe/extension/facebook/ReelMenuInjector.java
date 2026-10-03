package app.morphe.extension.facebook;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import java.lang.ref.WeakReference;

/** Tracks the foreground activity for native Facebook menu callbacks. */
public final class ReelMenuInjector implements Application.ActivityLifecycleCallbacks {
    private static WeakReference<Activity> currentActivity = new WeakReference<>(null);

    public static Activity getCurrentActivity() {
        return currentActivity.get();
    }

    @Override
    public void onActivityResumed(Activity activity) {
        currentActivity = new WeakReference<>(activity);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        if (currentActivity.get() == activity) currentActivity.clear();
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) {}
    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityPaused(Activity activity) {}
    @Override public void onActivityStopped(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}