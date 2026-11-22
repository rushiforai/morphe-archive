package dev.supperelias2.sbs.morphe;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/** Stable entry points used by the installed mobile patches. */
@SuppressWarnings("unused")
public final class MorpheSettings {
    private static final String PREFERENCES = "dev.supperelias2.sbs.morphe.settings";
    private static final Set<String> FEATURES = new LinkedHashSet<>();
    private static volatile Context applicationContext;
    private static volatile WeakReference<Activity> currentActivity = new WeakReference<>(null);
    private static boolean lifecycleRegistered;

    private MorpheSettings() {
    }

    /** Keep only the application context so opening settings never retains an Activity. */
    public static void initialize(Context context) {
        if (context == null) return;
        if (context instanceof Activity) rememberActivity((Activity) context);
        Context application = context.getApplicationContext();
        if (application == null) return;
        applicationContext = application;
        synchronized (MorpheSettings.class) {
            if (lifecycleRegistered || !(application instanceof Application)) return;
            ((Application) application).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity activity, Bundle state) {
                    rememberActivity(activity);
                }

                @Override
                public void onActivityResumed(Activity activity) {
                    rememberActivity(activity);
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
                public void onActivitySaveInstanceState(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    if (currentActivity.get() == activity) currentActivity.clear();
                }
            });
            lifecycleRegistered = true;
        }
    }

    private static void rememberActivity(Activity activity) {
        if (!(activity instanceof MorpheSettingsActivity)) currentActivity = new WeakReference<>(activity);
    }

    public static Activity getActivity() {
        Activity activity = currentActivity.get();
        return activity == null || activity.isFinishing() || activity.isDestroyed() ? null : activity;
    }

    public static Context getContext() {
        return applicationContext;
    }

    public static SharedPreferences getPreferences() {
        Context context = applicationContext;
        return context == null ? null : context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    public static void open(Context context) {
        Context target = context != null ? context : applicationContext;
        if (target == null) return;
        initialize(target);
        Intent intent = new Intent(target, MorpheSettingsActivity.class);
        if (!(target instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        target.startActivity(intent);
    }

    /** Bridge to the app's Kotlin menu callback without bundling a second Kotlin runtime. */
    public static Object openAction() {
        try {
            ClassLoader loader = MorpheSettings.class.getClassLoader();
            Class<?> function = Class.forName("kotlin.jvm.functions.Function0", false, loader);
            return Proxy.newProxyInstance(loader, new Class<?>[]{function}, (proxy, method, arguments) -> {
                String name = method.getName();
                if ("invoke".equals(name)) {
                    open(getContext());
                    return Class.forName("kotlin.Unit", false, loader).getField("INSTANCE").get(null);
                }
                if ("toString".equals(name)) return "Morphe settings action";
                if ("hashCode".equals(name)) return System.identityHashCode(proxy);
                if ("equals".equals(name)) return arguments != null && arguments.length == 1 && proxy == arguments[0];
                return null;
            });
        } catch (ClassNotFoundException ignored) {
            return null;
        }
    }

    /** Called only by patches present in this APK; the screen shows this installed subset. */
    public static void register(String featureKey) {
        if (featureKey == null || featureKey.length() == 0) return;
        synchronized (FEATURES) {
            FEATURES.add(featureKey);
        }
    }

    public static boolean isRegistered(String featureKey) {
        synchronized (FEATURES) {
            return FEATURES.contains(featureKey);
        }
    }

    public static Set<String> getRegisteredFeatures() {
        synchronized (FEATURES) {
            return Collections.unmodifiableSet(new LinkedHashSet<>(FEATURES));
        }
    }

    public static boolean enabled(String key, boolean defaultValue) {
        SharedPreferences preferences = getPreferences();
        if (preferences == null) return defaultValue;
        try {
            return preferences.getBoolean(key, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    public static int getInt(String key, int defaultValue) {
        SharedPreferences preferences = getPreferences();
        if (preferences == null) return defaultValue;
        try {
            return preferences.getInt(key, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    public static float getFloat(String key, float defaultValue) {
        SharedPreferences preferences = getPreferences();
        if (preferences == null) return defaultValue;
        try {
            return preferences.getFloat(key, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    public static String getString(String key, String defaultValue) {
        SharedPreferences preferences = getPreferences();
        if (preferences == null) return defaultValue;
        try {
            return preferences.getString(key, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    public static void saveBoolean(String key, boolean value) {
        SharedPreferences preferences = getPreferences();
        if (preferences != null) preferences.edit().putBoolean(key, value).apply();
    }

    public static void saveInt(String key, int value) {
        SharedPreferences preferences = getPreferences();
        if (preferences != null) preferences.edit().putInt(key, value).apply();
    }

    public static void saveFloat(String key, float value) {
        SharedPreferences preferences = getPreferences();
        if (preferences != null) preferences.edit().putFloat(key, value).apply();
    }

    public static void saveString(String key, String value) {
        SharedPreferences preferences = getPreferences();
        if (preferences != null) preferences.edit().putString(key, value).apply();
    }

    public static void resetDefaults() {
        SharedPreferences preferences = getPreferences();
        if (preferences != null) preferences.edit().clear().apply();
    }

    public static void applyBingePreset() {
        SharedPreferences preferences = getPreferences();
        if (preferences == null) return;
        SharedPreferences.Editor edit = preferences.edit();
        if (isRegistered("fix_skip")) edit.putBoolean("fix_skip", true);
        if (isRegistered("auto_skip_intro")) edit.putBoolean("auto_skip_intro", true);
        if (isRegistered("auto_skip_recap")) edit.putBoolean("auto_skip_recap", true);
        if (isRegistered("disable_still_watching")) edit.putBoolean("disable_still_watching", true);
        if (isRegistered("next_episode_countdown")) {
            edit.putBoolean("next_episode_countdown_enabled", true);
            edit.putInt("next_episode_delay_seconds", 3);
        }
        edit.apply();
    }
}
