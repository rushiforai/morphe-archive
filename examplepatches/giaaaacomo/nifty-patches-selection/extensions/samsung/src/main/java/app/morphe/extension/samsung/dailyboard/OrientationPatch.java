/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.service.dreams.DreamService;
import android.view.Window;
import android.view.WindowManager;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;

public final class OrientationPatch {
    private static final String PREFERENCES = "morphe_daily_board";
    private static final String KEY_MODE = "morphe_orientation_mode";
    private static final String KEY_AUTO_ROTATE = "morphe_auto_rotate";
    private static final String KEY_DREAM_ANGLE = "morphe_dream_angle";
    private static final String KEY_DREAM_ANGLE_INITIALIZED =
            "morphe_dream_angle_initialized_v3";
    private static final String KEY_DREAM_ANGLE_RANGE = "morphe_dream_angle_range";
    private static final String KEY_ANGLE_DIAGNOSTICS = "morphe_angle_diagnostics";
    private static final String MODE_SYSTEM = "system";
    private static final String MODE_PORTRAIT = "portrait";
    private static final String MODE_LANDSCAPE = "landscape";

    private OrientationPatch() {
    }

    public static void installOrientationPreferences(Object fragment) {
        try {
            ClassLoader loader = fragment.getClass().getClassLoader();
            Class<?> preferenceClass = loader.loadClass("androidx.preference.Preference");
            Class<?> listPreferenceClass = loader.loadClass("androidx.preference.ListPreference");
            Class<?> switchPreferenceClass = loader.loadClass(
                    "androidx.preference.SwitchPreferenceCompat"
            );
            Class<?> changeListenerClass = loader.loadClass(
                    "androidx.preference.Preference$OnPreferenceChangeListener"
            );
            Class<?> clickListenerClass = loader.loadClass(
                    "androidx.preference.Preference$OnPreferenceClickListener"
            );

            Object existing = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    KEY_MODE
            );
            if (existing != null) return;

            Context context = (Context) invoke(fragment, "requireContext", new Class<?>[0]);
            SharedPreferences preferences = preferences(context);
            boolean italian = isItalian();
            String mode = normalizedMode(preferences.getString(KEY_MODE, MODE_SYSTEM));
            boolean autoRotate = preferences.getBoolean(KEY_AUTO_ROTATE, false);

            Constructor<?> listConstructor = listPreferenceClass.getConstructor(Context.class);
            Object modePreference = listConstructor.newInstance(context);
            configurePreference(
                    modePreference,
                    KEY_MODE,
                    italian ? "Orientamento predefinito" : "Default orientation",
                    modeLabel(mode, italian),
                    4
            );
            invoke(
                    modePreference,
                    "setEntries",
                    new Class<?>[]{CharSequence[].class},
                    (Object) new CharSequence[]{
                            italian ? "Sistema" : "System",
                            "Portrait",
                            "Landscape"
                    }
            );
            invoke(
                    modePreference,
                    "setEntryValues",
                    new Class<?>[]{CharSequence[].class},
                    (Object) new CharSequence[]{MODE_SYSTEM, MODE_PORTRAIT, MODE_LANDSCAPE}
            );
            invoke(modePreference, "setValue", new Class<?>[]{String.class}, mode);
            invoke(modePreference, "setEnabled", new Class<?>[]{boolean.class}, !autoRotate);

            Object autoRotatePreference = switchPreferenceClass
                    .getConstructor(Context.class)
                    .newInstance(context);
            configurePreference(
                    autoRotatePreference,
                    KEY_AUTO_ROTATE,
                    italian ? "Rotazione automatica" : "Automatic rotation",
                    italian
                            ? "Segui il sensore anche se la rotazione di sistema è bloccata"
                            : "Follow the sensor even when system rotation is locked",
                    5
            );
            invoke(
                    autoRotatePreference,
                    "setChecked",
                    new Class<?>[]{boolean.class},
                    autoRotate
            );

            Object modeListener = listener(changeListenerClass, value -> {
                String selectedMode = normalizedMode(String.valueOf(value));
                preferences.edit().putString(KEY_MODE, selectedMode).apply();
                invokeQuietly(
                        modePreference,
                        "setSummary",
                        new Class<?>[]{CharSequence.class},
                        modeLabel(selectedMode, italian)
                );
                applyToFragmentActivity(fragment);
                return true;
            });
            Object autoRotateListener = listener(changeListenerClass, value -> {
                boolean enabled = Boolean.TRUE.equals(value);
                preferences.edit().putBoolean(KEY_AUTO_ROTATE, enabled).apply();
                invokeQuietly(
                        modePreference,
                        "setEnabled",
                        new Class<?>[]{boolean.class},
                        !enabled
                );
                applyToFragmentActivity(fragment);
                return true;
            });
            invoke(
                    modePreference,
                    "setOnPreferenceChangeListener",
                    new Class<?>[]{changeListenerClass},
                    modeListener
            );
            invoke(
                    autoRotatePreference,
                    "setOnPreferenceChangeListener",
                    new Class<?>[]{changeListenerClass},
                    autoRotateListener
            );

            Object category = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    "category_general_settings"
            );
            if (category == null) {
                category = invoke(fragment, "getPreferenceScreen", new Class<?>[0]);
            }
            Method addPreference = category.getClass().getMethod("addPreference", preferenceClass);
            addPreference.invoke(category, modePreference);
            addPreference.invoke(category, autoRotatePreference);

        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The settings fragment may be detached during configuration changes.
        }
    }

    public static void installScreenSaverPreferences(Object fragment) {
        try {
            ClassLoader loader = fragment.getClass().getClassLoader();
            Class<?> preferenceClass = loader.loadClass("androidx.preference.Preference");
            Class<?> listPreferenceClass = loader.loadClass("androidx.preference.ListPreference");
            Class<?> switchPreferenceClass = loader.loadClass(
                    "androidx.preference.SwitchPreferenceCompat"
            );
            Class<?> changeListenerClass = loader.loadClass(
                    "androidx.preference.Preference$OnPreferenceChangeListener"
            );
            Class<?> clickListenerClass = loader.loadClass(
                    "androidx.preference.Preference$OnPreferenceClickListener"
            );

            Object existing = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    KEY_DREAM_ANGLE
            );
            if (existing != null) return;

            Context context = (Context) invoke(fragment, "requireContext", new Class<?>[0]);
            SharedPreferences preferences = preferences(context);
            boolean italian = isItalian();

            Object category = invoke(fragment, "getPreferenceScreen", new Class<?>[0]);
            boolean angleEnabled = isDreamAngleEnabled(context);
            Object anglePreference = switchPreferenceClass
                    .getConstructor(Context.class)
                    .newInstance(context);
            configurePreference(
                    anglePreference,
                    KEY_DREAM_ANGLE,
                    italian
                            ? "Limita lo screensaver per inclinazione"
                            : "Limit screen saver by angle",
                    italian
                            ? "Avvialo solo quando il telefono è nell'intervallo impostato"
                            : "Start it only when the phone is within the configured range",
                    7
            );
            invoke(
                    anglePreference,
                    "setChecked",
                    new Class<?>[]{boolean.class},
                    angleEnabled
            );

            Object angleRangePreference = preferenceClass
                    .getConstructor(Context.class)
                    .newInstance(context);
            configurePreference(
                    angleRangePreference,
                    KEY_DREAM_ANGLE_RANGE,
                    italian ? "Intervallo di inclinazione" : "Angle range",
                    angleRangeSummary(loader, italian),
                    8
            );
            invoke(
                    angleRangePreference,
                    "setEnabled",
                    new Class<?>[]{boolean.class},
                    angleEnabled
            );

            Object angleDiagnosticsPreference = preferenceClass
                    .getConstructor(Context.class)
                    .newInstance(context);
            configurePreference(
                    angleDiagnosticsPreference,
                    KEY_ANGLE_DIAGNOSTICS,
                    italian ? "Diagnostica inclinazione" : "Angle diagnostics",
                    italian
                            ? "Controlla in tempo reale se lo screensaver verrebbe mostrato"
                            : "Check in real time whether the screen saver would be shown",
                    9
            );

            Object angleListener = listener(changeListenerClass, value -> {
                boolean enabled = Boolean.TRUE.equals(value);
                preferences.edit()
                        .putBoolean(KEY_DREAM_ANGLE, enabled)
                        .putBoolean(KEY_DREAM_ANGLE_INITIALIZED, true)
                        .apply();
                if (enabled) setSamsungAngleEnabled(loader, true);
                invokeQuietly(
                        angleRangePreference,
                        "setEnabled",
                        new Class<?>[]{boolean.class},
                        enabled
                );
                return true;
            });
            Object angleRangeListener = clickListener(clickListenerClass, () -> {
                setSamsungAngleEnabled(loader, true);
                Intent intent = new Intent("com.samsung.android.homemode.settings.dockangle")
                        .setClassName(
                                context,
                                "com.samsung.android.homemode.ui.activity.setting.DockAngleActivity"
                        );
                context.startActivity(intent);
                return true;
            });
            Object angleDiagnosticsListener = clickListener(clickListenerClass, () -> {
                try {
                    Object activity = invoke(fragment, "requireActivity", new Class<?>[0]);
                    if (activity instanceof Activity) {
                        AngleDiagnosticsPatch.show((Activity) activity);
                    }
                } catch (ReflectiveOperationException ignored) {
                    // The settings fragment may already be detached.
                }
                return true;
            });
            invoke(
                    anglePreference,
                    "setOnPreferenceChangeListener",
                    new Class<?>[]{changeListenerClass},
                    angleListener
            );
            invoke(
                    angleRangePreference,
                    "setOnPreferenceClickListener",
                    new Class<?>[]{clickListenerClass},
                    angleRangeListener
            );
            invoke(
                    angleDiagnosticsPreference,
                    "setOnPreferenceClickListener",
                    new Class<?>[]{clickListenerClass},
                    angleDiagnosticsListener
            );

            Object activationCategory = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    "category_auto_start_settings"
            );
            if (activationCategory == null) activationCategory = category;
            Method addActivationPreference = activationCategory.getClass()
                    .getMethod("addPreference", preferenceClass);
            addActivationPreference.invoke(activationCategory, anglePreference);
            addActivationPreference.invoke(activationCategory, angleRangePreference);
            addActivationPreference.invoke(activationCategory, angleDiagnosticsPreference);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The patch fingerprints pin this bridge to the supported Daily Board version.
        }
    }

    public static void refreshPreferences(Object fragment) {
        try {
            ClassLoader loader = fragment.getClass().getClassLoader();
            Context context = (Context) invoke(fragment, "requireContext", new Class<?>[0]);
            boolean enabled = isDreamAngleEnabled(context);
            Object anglePreference = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    KEY_DREAM_ANGLE
            );
            Object rangePreference = invoke(
                    fragment,
                    "findPreference",
                    new Class<?>[]{CharSequence.class},
                    KEY_DREAM_ANGLE_RANGE
            );
            if (anglePreference != null) {
                invoke(
                        anglePreference,
                        "setChecked",
                        new Class<?>[]{boolean.class},
                        enabled
                );
            }
            if (rangePreference != null) {
                invoke(
                        rangePreference,
                        "setEnabled",
                        new Class<?>[]{boolean.class},
                        enabled
                );
                invoke(
                        rangePreference,
                        "setSummary",
                        new Class<?>[]{CharSequence.class},
                        angleRangeSummary(loader, isItalian())
                );
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The controls are refreshed the next time the settings screen is created.
        }
    }

    public static void applyToActivity(Activity activity) {
        int orientation = requestedOrientation(activity);
        if (activity.getRequestedOrientation() == orientation) return;
        try {
            activity.setRequestedOrientation(orientation);
        } catch (RuntimeException ignored) {
            // Multi-window and vendor compatibility modes can reject orientation requests.
        }
    }

    public static void applyToDream(DreamService service) {
        try {
            Window window = service.getWindow();
            if (window == null) return;
            Activity dreamActivity = findActivity(window.getContext());
            if (dreamActivity != null) applyToActivity(dreamActivity);
            WindowManager.LayoutParams attributes = window.getAttributes();
            int orientation = requestedOrientation(service);
            if (attributes.screenOrientation == orientation) return;
            attributes.screenOrientation = orientation;
            window.setAttributes(attributes);
        } catch (RuntimeException ignored) {
            // A dream without an attached window will retry on its next activation.
        }
    }

    static int effectiveConfigurationOrientation(Context context) {
        if (preferences(context).getBoolean(KEY_AUTO_ROTATE, false)) {
            return context.getResources().getConfiguration().orientation;
        }
        String mode = normalizedMode(preferences(context).getString(KEY_MODE, MODE_SYSTEM));
        if (MODE_PORTRAIT.equals(mode)) return Configuration.ORIENTATION_PORTRAIT;
        if (MODE_LANDSCAPE.equals(mode)) return Configuration.ORIENTATION_LANDSCAPE;
        return context.getResources().getConfiguration().orientation;
    }

    static boolean isDreamAngleEnabled(Context context) {
        SharedPreferences preferences = preferences(context);
        if (preferences.getBoolean(KEY_DREAM_ANGLE_INITIALIZED, false)) {
            return preferences.getBoolean(KEY_DREAM_ANGLE, false);
        }
        ClassLoader loader = context.getClassLoader();
        boolean inherited = preferences.getBoolean(KEY_DREAM_ANGLE, false) ||
                samsungAngleEnabled(loader) ||
                samsungAngleConfigured(loader) ||
                samsungAngleRangeCustomized(loader);
        preferences.edit()
                .putBoolean(KEY_DREAM_ANGLE, inherited)
                .putBoolean(KEY_DREAM_ANGLE_INITIALIZED, true)
                .apply();
        return inherited;
    }

    private static int requestedOrientation(Context context) {
        SharedPreferences preferences = preferences(context);
        if (preferences.getBoolean(KEY_AUTO_ROTATE, false)) {
            return ActivityInfo.SCREEN_ORIENTATION_SENSOR;
        }
        String mode = normalizedMode(preferences.getString(KEY_MODE, MODE_SYSTEM));
        if (MODE_PORTRAIT.equals(mode)) return ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
        if (MODE_LANDSCAPE.equals(mode)) return ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;
        return ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static void applyToFragmentActivity(Object fragment) {
        try {
            Object activity = invoke(fragment, "getActivity", new Class<?>[0]);
            if (activity instanceof Activity) applyToActivity((Activity) activity);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The selected mode is applied when Daily Board next resumes.
        }
    }

    private static void configurePreference(
            Object preference,
            String key,
            String title,
            String summary,
            int order
    ) throws ReflectiveOperationException {
        invoke(preference, "setKey", new Class<?>[]{String.class}, key);
        invoke(preference, "setTitle", new Class<?>[]{CharSequence.class}, title);
        invoke(preference, "setSummary", new Class<?>[]{CharSequence.class}, summary);
        invoke(preference, "setOrder", new Class<?>[]{int.class}, order);
        invoke(preference, "setPersistent", new Class<?>[]{boolean.class}, false);
    }

    private static Object listener(Class<?> listenerClass, ChangeHandler handler) {
        return Proxy.newProxyInstance(
                listenerClass.getClassLoader(),
                new Class<?>[]{listenerClass},
                (proxy, method, arguments) -> {
                    if ("onPreferenceChange".equals(method.getName())) {
                        return handler.onChange(arguments[1]);
                    }
                    if ("hashCode".equals(method.getName())) {
                        return System.identityHashCode(proxy);
                    }
                    if ("equals".equals(method.getName())) {
                        return proxy == arguments[0];
                    }
                    return "Daily Board orientation preference listener";
                }
        );
    }

    private static Object clickListener(Class<?> listenerClass, ClickHandler handler) {
        return Proxy.newProxyInstance(
                listenerClass.getClassLoader(),
                new Class<?>[]{listenerClass},
                (proxy, method, arguments) -> {
                    if ("onPreferenceClick".equals(method.getName())) {
                        return handler.onClick();
                    }
                    if ("hashCode".equals(method.getName())) {
                        return System.identityHashCode(proxy);
                    }
                    if ("equals".equals(method.getName())) {
                        return proxy == arguments[0];
                    }
                    return "Daily Board angle preference listener";
                }
        );
    }

    private static boolean samsungAngleEnabled(ClassLoader loader) {
        try {
            Class<?> settings = loader.loadClass("s1.b");
            return (Boolean) settings.getDeclaredMethod("s").invoke(null);
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return false;
        }
    }

    private static boolean setSamsungAngleEnabled(ClassLoader loader, boolean enabled) {
        try {
            Class<?> settings = loader.loadClass("s1.b");
            settings.getDeclaredMethod("L", boolean.class).invoke(null, enabled);
            return true;
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }

    private static boolean samsungAngleConfigured(ClassLoader loader) {
        try {
            Class<?> settings = loader.loadClass("s1.b");
            return (Boolean) settings.getDeclaredMethod("t").invoke(null);
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return false;
        }
    }

    private static boolean samsungAngleRangeCustomized(ClassLoader loader) {
        try {
            Class<?> settings = loader.loadClass("s1.b");
            float minimum = (Float) settings.getDeclaredMethod("c").invoke(null);
            float maximum = (Float) settings.getDeclaredMethod("b").invoke(null);
            return Math.abs(minimum - 90.0f) > 0.1f ||
                    Math.abs(maximum - 180.0f) > 0.1f;
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return false;
        }
    }

    private static String angleRangeSummary(ClassLoader loader, boolean italian) {
        try {
            Class<?> settings = loader.loadClass("s1.b");
            float minimum = (Float) settings.getDeclaredMethod("c").invoke(null);
            float maximum = (Float) settings.getDeclaredMethod("b").invoke(null);
            String range = Math.round(minimum) + " - " + Math.round(maximum) + " " +
                    (italian ? "gradi" : "degrees");
            return italian ? "Intervallo attuale: " + range : "Current range: " + range;
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return italian ? "Configura l'intervallo" : "Configure the range";
        }
    }

    private static Object invoke(
            Object target,
            String methodName,
            Class<?>[] parameterTypes,
            Object... arguments
    ) throws ReflectiveOperationException {
        return target.getClass().getMethod(methodName, parameterTypes).invoke(target, arguments);
    }

    private static void invokeQuietly(
            Object target,
            String methodName,
            Class<?>[] parameterTypes,
            Object... arguments
    ) {
        try {
            invoke(target, methodName, parameterTypes, arguments);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // A summary refresh is cosmetic; the setting itself is already persisted.
        }
    }

    private static String normalizedMode(String mode) {
        if (MODE_PORTRAIT.equals(mode) || MODE_LANDSCAPE.equals(mode)) return mode;
        return MODE_SYSTEM;
    }

    private static String modeLabel(String mode, boolean italian) {
        if (MODE_PORTRAIT.equals(mode)) return "Portrait";
        if (MODE_LANDSCAPE.equals(mode)) return "Landscape";
        return italian ? "Sistema" : "System";
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) return (Activity) current;
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) break;
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static boolean isItalian() {
        return Locale.ITALIAN.getLanguage().equals(Locale.getDefault().getLanguage());
    }

    private interface ChangeHandler {
        boolean onChange(Object value);
    }

    private interface ClickHandler {
        boolean onClick();
    }
}
