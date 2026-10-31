package app.xposed.extension;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import java.lang.ref.WeakReference;

/** The activity in front, for our dialogs. Compose click handlers get no context of their own. */
final class Activities {
    private static WeakReference<Activity> resumed = new WeakReference<>(null);

    private Activities() {
    }

    static void init(Application app) {
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                resumed = new WeakReference<>(activity);
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (resumed.get() == activity) resumed = new WeakReference<>(null);
            }
        });
    }

    /** The last resumed activity that is still alive, or null. Main thread. */
    static Activity current() {
        Activity a = resumed.get();
        return a == null || a.isFinishing() || a.isDestroyed() ? null : a;
    }
}
