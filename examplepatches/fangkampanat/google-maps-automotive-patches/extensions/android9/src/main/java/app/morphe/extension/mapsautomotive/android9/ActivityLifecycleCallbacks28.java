package app.morphe.extension.mapsautomotive.android9;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;

/**
 * Calls of Android 10's pre/post lifecycle events (patch "Android 9 (API 28)"): Android 10 and newer call the method;
 * Android 9, whose interface lacks it, calls the callback's own implementation if its class has one (LifecycleBridge).
 */
public final class ActivityLifecycleCallbacks28 {
    public static final String OWNER = "Landroid/app/Application$ActivityLifecycleCallbacks;";

    private ActivityLifecycleCallbacks28() {
    }

    public static void onActivityPreCreated(Application.ActivityLifecycleCallbacks callback, Activity activity, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreCreated(activity, bundle);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_CREATED, activity, bundle);
    }

    public static void onActivityPostCreated(Application.ActivityLifecycleCallbacks callback, Activity activity, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostCreated(activity, bundle);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_CREATED, activity, bundle);
    }

    public static void onActivityPreStarted(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreStarted(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_STARTED, activity);
    }

    public static void onActivityPostStarted(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostStarted(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_STARTED, activity);
    }

    public static void onActivityPreResumed(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreResumed(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_RESUMED, activity);
    }

    public static void onActivityPostResumed(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostResumed(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_RESUMED, activity);
    }

    public static void onActivityPrePaused(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPrePaused(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_PAUSED, activity);
    }

    public static void onActivityPostPaused(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostPaused(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_PAUSED, activity);
    }

    public static void onActivityPreStopped(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreStopped(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_STOPPED, activity);
    }

    public static void onActivityPostStopped(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostStopped(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_STOPPED, activity);
    }

    public static void onActivityPreSaveInstanceState(Application.ActivityLifecycleCallbacks callback, Activity activity, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreSaveInstanceState(activity, bundle);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_SAVE, activity, bundle);
    }

    public static void onActivityPostSaveInstanceState(Application.ActivityLifecycleCallbacks callback, Activity activity, Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostSaveInstanceState(activity, bundle);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_SAVE, activity, bundle);
    }

    public static void onActivityPreDestroyed(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPreDestroyed(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.PRE_DESTROYED, activity);
    }

    public static void onActivityPostDestroyed(Application.ActivityLifecycleCallbacks callback, Activity activity) {
        if (Build.VERSION.SDK_INT >= 29) callback.onActivityPostDestroyed(activity);
        else LifecycleBridge.dispatch(callback, LifecycleBridge.POST_DESTROYED, activity);
    }
}
