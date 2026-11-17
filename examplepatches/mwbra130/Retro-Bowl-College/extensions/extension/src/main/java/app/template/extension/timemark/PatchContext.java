package app.template.extension.timemark;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.view.View;

/**
 * Tracks the host app's context and resumed activity, following the
 * PatchContext pattern from hxreborn's Morphe patches: attach() is called from
 * the host Application's onCreate (inserted by the Timemark settings patch)
 * and registers ActivityLifecycleCallbacks so the patch settings can be opened
 * from the currently resumed activity. openSettings is also reachable directly
 * from the settings-row click, using the clicked view's own context.
 */
public final class PatchContext {

    private static volatile Context appContext;

    private static volatile Activity resumedActivity;

    private static volatile boolean attached;

    private PatchContext() {
    }

    public static void attach(Application application) {
        if (application == null) {
            return;
        }
        appContext = application.getApplicationContext();
        if (attached) {
            return;
        }
        attached = true;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                resumedActivity = activity;
            }

            @Override
            public void onActivityPaused(Activity activity) {
                if (resumedActivity == activity) {
                    resumedActivity = null;
                }
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
            }
        });
    }

    static Context context() {
        return appContext;
    }

    static void ensureContext(Context context) {
        if (appContext == null && context != null) {
            appContext = context.getApplicationContext();
        }
    }

    /**
     * Opens the patch settings screen. Called from the Timemark settings-row
     * click with the clicked item view; falls back to the tracked resumed
     * activity. The settings UI is a full-screen dialog hosted by that
     * activity (see PatchesSettingsDialog for why it is not an Activity).
     */
    public static void openSettings(Object view) {
        try {
            Activity activity = null;
            if (view instanceof View) {
                Context context = ((View) view).getContext();
                while (context instanceof ContextWrapper) {
                    if (context instanceof Activity) {
                        activity = (Activity) context;
                        break;
                    }
                    context = ((ContextWrapper) context).getBaseContext();
                }
            }
            if (activity == null) {
                activity = resumedActivity;
            }
            if (activity == null) {
                return;
            }
            ensureContext(activity);
            PatchesSettingsDialog.show(activity);
        } catch (Throwable ignored) {
        }
    }
}
