package app.template.extension.fotmob;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;

/**
 * Activity lifecycle hooks for the FotMob Patch settings features, registered once from
 * FotMobApp.onCreate (patched in right after super.onCreate()), which also seeds the "Hidden
 * countries" picker (CountryFilter.init). onActivityCreated runs inside the
 * activity's super.onCreate, after any setTheme and before its content is inflated, so the system
 * font theme overlay reaches every view of the screen.
 */
@SuppressWarnings("unused")
public final class ActivityHooks implements Application.ActivityLifecycleCallbacks {
    private static final String TAG = "Morphe-FotMob";

    private static volatile boolean registered;

    private ActivityHooks() {
    }

    /** Patched into FotMobApp.onCreate. */
    public static void register(Application application) {
        try {
            if (registered || application == null) return;
            registered = true;
            application.registerActivityLifecycleCallbacks(new ActivityHooks());
        } catch (Throwable failure) {
            Log.e(TAG, "Activity hooks not registered: " + failure.getClass().getName());
        }
        // The "Hidden countries" and "Hidden competitions" pickers (each only when its patch is in).
        CountryFilter.init(application);
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        SystemFontPatch.applyTheme(activity);
        AnimationSpeed.onActivityCreated(activity);
    }

    @Override
    public void onActivityResumed(Activity activity) {
        AnimationSpeed.onActivityResumed(activity);
    }

    @Override
    public void onActivityStarted(Activity activity) {
    }

    @Override
    public void onActivityPaused(Activity activity) {
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
}
