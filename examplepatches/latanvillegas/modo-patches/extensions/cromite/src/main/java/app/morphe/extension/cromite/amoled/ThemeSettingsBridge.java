package app.morphe.extension.cromite.amoled;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Version-specific adapter for Cromite 153.0.8010.37.
 * Uses reflection because the extension compiles against Android, not Chromium.
 * Called only after ThemeSettingsFragment has inflated its preference XML.
 */
public final class ThemeSettingsBridge {
    private static final String TAG = "MorpheAmoledTheme";
    private static final String KEY = "morphe_amoled_brightness";

    private ThemeSettingsBridge() {}

    public static void install(Object fragment) {
        if (fragment == null) return;
        try {
            ClassLoader loader = fragment.getClass().getClassLoader();
            Class<?> preferenceClass = Class.forName("androidx.preference.Preference", false, loader);
            Class<?> listenerClass = Class.forName("aoa", false, loader);
            Object screen = fragment.getClass().getMethod("Z1").invoke(fragment);
            if (screen == null) return;

            // Y1 returns a matching preference or null; do not add duplicates.
            Object existing = fragment.getClass().getMethod("Y1", CharSequence.class)
                    .invoke(fragment, KEY);
            if (existing != null) return;

            Object host = fragment.getClass().getMethod("K1").invoke(fragment);
            if (!(host instanceof Activity)) return;
            Activity activity = (Activity) host;
            Constructor<?> constructor = preferenceClass.getConstructor(Context.class);
            Object preference = constructor.newInstance(activity);
            preferenceClass.getMethod("R", String.class).invoke(preference, KEY);
            preferenceClass.getMethod("X", CharSequence.class)
                    .invoke(preference, "AMOLED y brillo");

            Object listener = Proxy.newProxyInstance(loader, new Class<?>[]{listenerClass},
                    (proxy, method, args) -> {
                        if ("m0".equals(method.getName())) {
                            AmoledBrightnessController.showSettings(activity);
                            return true;
                        }
                        if ("toString".equals(method.getName())) return TAG;
                        if ("hashCode".equals(method.getName()))
                            return System.identityHashCode(proxy);
                        if ("equals".equals(method.getName()))
                            return proxy == (args == null ? null : args[0]);
                        return null;
                    });
            Field clickListener = preferenceClass.getField("w");
            clickListener.set(preference, listener);

            Class<?> groupClass = Class.forName("noa", false, loader);
            groupClass.getMethod("f0", preferenceClass).invoke(screen, preference);
            Log.i(TAG, "AMOLED preference installed in Theme settings");
        } catch (ReflectiveOperationException | RuntimeException error) {
            // A changed obfuscated API must not crash Chromium settings.
            Log.e(TAG, "Could not install AMOLED preference", error);
        }
    }
}
