package dev.custom.gboardpatches.ui;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Bridge helper for managing Gboard Glide Trail preferences.
 * Uses robust reflection to handle obfuscated AndroidX Preference fields and methods.
 */
public class GlideTrailPreferences {

    public static final String PREF_MASTER_ENABLED = "pref_key_glide_trail_custom_enabled";
    public static final String PREF_RAINBOW = "pref_key_glide_trail_rainbow";
    public static final String PREF_COLOR_WHEEL = "pref_key_glide_trail_color_wheel";
    public static final String PREF_CUSTOM_COLOR = "pref_key_glide_trail_custom_color";
    public static final String PREF_SPEED_MS = "pref_key_glide_trail_speed_ms";
    public static final String PREF_WIDTH_DP = "pref_key_glide_trail_width_dp";
    public static final String PREF_LENGTH_PTS = "pref_key_glide_trail_length_pts";

    /**
     * Called from Lcdr;->aA(Landroidx/preference/Preference;)Z when a preference is clicked.
     * @return true if the click was handled by our custom dialogs, false to proceed normally.
     */
    public static boolean onPreferenceClick(Object preference) {
        if (preference == null) return false;
        try {
            String key = getKey(preference);
            if (key == null) return false;

            if (PREF_COLOR_WHEEL.equals(key)) {
                Context context = getContext(preference);
                if (context != null) {
                    ColorWheelDialog.show(context, preference);
                }
                return true;
            }

            if (PREF_SPEED_MS.equals(key) || PREF_WIDTH_DP.equals(key) || PREF_LENGTH_PTS.equals(key)) {
                Context context = getContext(preference);
                if (context != null) {
                    GlideTrailSliderDialog.show(context, preference, key);
                }
                return true;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    /**
     * Called during PreferenceGroup traversal in Ldoe;->aB to set up active summaries.
     */
    public static void initSummaries(Object preferenceGroup) {
        if (preferenceGroup == null) return;
        try {
            traverseAndInit(preferenceGroup);
        } catch (Throwable ignored) {}
    }

    private static void traverseAndInit(Object preference) {
        if (preference == null) return;
        try {
            String key = getKey(preference);
            if (key != null) {
                Context context = getContext(preference);
                if (context != null) {
                    SharedPreferences prefs = getPrefs(context);
                    if (PREF_COLOR_WHEEL.equals(key)) {
                        int color = prefs.getInt(PREF_CUSTOM_COLOR, 0);
                        if (color != 0) {
                            setSummary(preference, "Active color: " + String.format("#%06X", (0xFFFFFF & color)) + " (Tap to change)");
                        } else {
                            setSummary(preference, "Using Gboard stock dynamic theme color (Tap to set custom)");
                        }
                    } else if (PREF_SPEED_MS.equals(key)) {
                        int ms = prefs.getInt(PREF_SPEED_MS, 1000);
                        setSummary(preference, "Current: " + ms + " ms (Tap to adjust)");
                    } else if (PREF_WIDTH_DP.equals(key)) {
                        int dp = prefs.getInt(PREF_WIDTH_DP, 13);
                        setSummary(preference, "Current: " + dp + " dp (Tap to adjust)");
                    } else if (PREF_LENGTH_PTS.equals(key)) {
                        int pts = prefs.getInt(PREF_LENGTH_PTS, 20);
                        setSummary(preference, "Current: " + pts + " points (Tap to adjust)");
                    }
                }
            }

            // Check if this preference is a PreferenceGroup with children
            Method getCountMethod = findMethod(preference.getClass(), "k");
            if (getCountMethod == null) {
                getCountMethod = findMethod(preference.getClass(), "getPreferenceCount");
            }
            Method getPrefMethod = findMethod(preference.getClass(), "o", int.class);
            if (getPrefMethod == null) {
                getPrefMethod = findMethod(preference.getClass(), "getPreference", int.class);
            }

            if (getCountMethod != null && getPrefMethod != null) {
                int count = (Integer) getCountMethod.invoke(preference);
                for (int i = 0; i < count; i++) {
                    Object child = getPrefMethod.invoke(preference, i);
                    traverseAndInit(child);
                }
            }
        } catch (Throwable ignored) {}
    }

    public static String getKey(Object preference) {
        if (preference == null) return null;
        // 1. Try obfuscated field 'r'
        try {
            Field f = getField(preference.getClass(), "r");
            if (f != null) {
                f.setAccessible(true);
                Object val = f.get(preference);
                if (val instanceof String) return (String) val;
            }
        } catch (Throwable ignored) {}

        // 2. Try getKey() method
        try {
            Method m = preference.getClass().getMethod("getKey");
            Object val = m.invoke(preference);
            if (val instanceof String) return (String) val;
        } catch (Throwable ignored) {}

        return null;
    }

    public static Context getContext(Object preference) {
        if (preference == null) return null;
        // 1. Try obfuscated field 'j'
        try {
            Field f = getField(preference.getClass(), "j");
            if (f != null) {
                f.setAccessible(true);
                Object val = f.get(preference);
                if (val instanceof Context) return (Context) val;
            }
        } catch (Throwable ignored) {}

        // 2. Try getContext() method
        try {
            Method m = preference.getClass().getMethod("getContext");
            Object val = m.invoke(preference);
            if (val instanceof Context) return (Context) val;
        } catch (Throwable ignored) {}

        return null;
    }

    public static void setSummary(Object preference, CharSequence summary) {
        if (preference == null) return;
        // 1. Try obfuscated method V(CharSequence)
        try {
            Method m = findMethod(preference.getClass(), "V", CharSequence.class);
            if (m != null) {
                m.invoke(preference, summary);
                return;
            }
        } catch (Throwable ignored) {}

        // 2. Try standard setSummary(CharSequence)
        try {
            Method m = findMethod(preference.getClass(), "setSummary", CharSequence.class);
            if (m != null) {
                m.invoke(preference, summary);
                return;
            }
        } catch (Throwable ignored) {}
    }

    public static SharedPreferences getPrefs(Context context) {
        try {
            Context deContext = getDeviceProtectedContext(context);
            if (deContext != null) {
                SharedPreferences p = PreferenceManager.getDefaultSharedPreferences(deContext);
                if (p != null) return p;
            }
        } catch (Throwable ignored) {}
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    public static void saveCustomColor(Context context, int color) {
        if (context == null) return;
        savePrefInt(context, PREF_CUSTOM_COLOR, color);
        if (color != 0) {
            // Setting a custom color disables rainbow mode so the chosen color is visible
            savePrefBoolean(context, PREF_RAINBOW, false);
        }
    }

    public static void savePrefInt(Context context, String key, int value) {
        if (context == null) return;
        try {
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
            if (prefs != null) {
                prefs.edit()
                    .putInt(key, value)
                    .putBoolean(PREF_MASTER_ENABLED, true)
                    .commit();
            }
        } catch (Throwable ignored) {}

        try {
            Context deContext = getDeviceProtectedContext(context);
            if (deContext != null && deContext != context) {
                SharedPreferences dePrefs = PreferenceManager.getDefaultSharedPreferences(deContext);
                if (dePrefs != null) {
                    dePrefs.edit()
                        .putInt(key, value)
                        .putBoolean(PREF_MASTER_ENABLED, true)
                        .commit();
                }
            }
        } catch (Throwable ignored) {}
    }

    public static void savePrefBoolean(Context context, String key, boolean value) {
        if (context == null) return;
        try {
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
            if (prefs != null) {
                prefs.edit().putBoolean(key, value).commit();
            }
        } catch (Throwable ignored) {}

        try {
            Context deContext = getDeviceProtectedContext(context);
            if (deContext != null && deContext != context) {
                SharedPreferences dePrefs = PreferenceManager.getDefaultSharedPreferences(deContext);
                if (dePrefs != null) {
                    dePrefs.edit().putBoolean(key, value).commit();
                }
            }
        } catch (Throwable ignored) {}
    }

    private static Context getDeviceProtectedContext(Context context) {
        try {
            Method isDeMethod = context.getClass().getMethod("isDeviceProtectedStorage");
            Boolean isDe = (Boolean) isDeMethod.invoke(context);
            if (isDe != null && !isDe) {
                Method createDeMethod = context.getClass().getMethod("createDeviceProtectedStorageContext");
                return (Context) createDeMethod.invoke(context);
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static Field getField(Class<?> clazz, String name) {
        Class<?> cur = clazz;
        while (cur != null && cur != Object.class) {
            try {
                return cur.getDeclaredField(name);
            } catch (NoSuchFieldException e) {
                cur = cur.getSuperclass();
            }
        }
        return null;
    }

    private static Method findMethod(Class<?> clazz, String name, Class<?>... paramTypes) {
        Class<?> cur = clazz;
        while (cur != null && cur != Object.class) {
            try {
                return cur.getDeclaredMethod(name, paramTypes);
            } catch (NoSuchMethodException e) {
                cur = cur.getSuperclass();
            }
        }
        return null;
    }
}
