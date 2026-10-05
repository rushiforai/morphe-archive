package app.morphe.extension.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

public final class ThemeSync {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final String USER_THEME = "user_theme";

    private static Application application;
    private static Activity currentActivity;
    private static SharedPreferences preferences;
    private static boolean initialized;

    private ThemeSync() {}

    public static synchronized void init(Context context) {
        if (initialized || context == null) return;
        Context appContext = context.getApplicationContext();
        if (!(appContext instanceof Application)) return;

        application = (Application) appContext;
        preferences = android.preference.PreferenceManager.getDefaultSharedPreferences(application);
        preferences.registerOnSharedPreferenceChangeListener(listener);
        application.registerActivityLifecycleCallbacks(lifecycleCallbacks);
        initialized = true;

        // Twitch normally initializes its ThemeManager during Application.onCreate.
        // Re-run it here so the current user_theme preference is reflected in native UI.
        applyTwitchTheme(false);
    }

    private static final SharedPreferences.OnSharedPreferenceChangeListener listener =
            (sharedPreferences, key) -> {
                if (USER_THEME.equals(key)) applyTwitchTheme(true);
            };

    private static void applyTwitchTheme(boolean recreateActivity) {
        setTwitchTheme();
        if (!recreateActivity) return;

        MAIN.postDelayed(() -> {
            Activity activity = currentActivity;
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            try {
                activity.recreate();
            } catch (Throwable ignored) {
            }
        }, 150L);
    }

    private static void setTwitchTheme() {
        Application app = application;
        if (app == null) return;

        try {
            Class<?> managerClass = Class.forName("tv.twitch.android.app.core.ThemeManager");
            java.lang.reflect.Field companionField = managerClass.getDeclaredField("Companion");
            companionField.setAccessible(true);
            Object companion = companionField.get(null);
            if (companion == null) return;

            for (java.lang.reflect.Method method : companion.getClass().getDeclaredMethods()) {
                if (!"setTheme".equals(method.getName()) || method.getParameterTypes().length != 1) continue;

                Class<?> parameter = method.getParameterTypes()[0];
                if (!parameter.isAssignableFrom(app.getClass())) continue;

                method.setAccessible(true);
                method.invoke(companion, app);
                return;
            }
        } catch (Throwable ignored) {
        }
    }

    private static final Application.ActivityLifecycleCallbacks lifecycleCallbacks =
            new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, android.os.Bundle state) { currentActivity = activity; }
                @Override public void onActivityStarted(Activity activity) { currentActivity = activity; }
                @Override public void onActivityResumed(Activity activity) { currentActivity = activity; }
                @Override public void onActivityPaused(Activity activity) {}
                @Override public void onActivityStopped(Activity activity) { if (currentActivity == activity) currentActivity = null; }
                @Override public void onActivitySaveInstanceState(Activity activity, android.os.Bundle state) {}
                @Override public void onActivityDestroyed(Activity activity) { if (currentActivity == activity) currentActivity = null; }
            };
}
