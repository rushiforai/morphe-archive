package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Field;

public final class GboardLatinGlobeKeyIgnoreIntervalRuntime {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-latin-globe] ";
    private static final String GLOBE_KEY_IGNORE_INTERVAL_FIELD = "h";

    private static volatile Field globeKeyIgnoreIntervalField;
    private static volatile Context applicationContext;

    private GboardLatinGlobeKeyIgnoreIntervalRuntime() {
    }

    public static Object applyOverride(Object runtimeParams) {
        try {
            Context context = resolveContext();
            if (context == null || runtimeParams == null) {
                return runtimeParams;
            }
            SharedPreferences preferences =
                    GboardLatinGlobeKeyIgnoreIntervalSettings.preferences(context);
            GboardLatinGlobeKeyIgnoreIntervalSettings.ensureDefaults(preferences);
            if (!GboardLatinGlobeKeyIgnoreIntervalSettings.readEnabled(preferences)) {
                return runtimeParams;
            }
            int intervalMs =
                    GboardLatinGlobeKeyIgnoreIntervalSettings.readIntervalMs(preferences);
            if (forceGlobeKeyIgnoreInterval(runtimeParams, intervalMs)) {
                Log.i(TAG, LOG_PREFIX + "forced LatinIme.U() globe key ignore interval to "
                        + intervalMs + "ms");
            }
            return runtimeParams;
        } catch (Throwable throwable) {
            Log.w(TAG, LOG_PREFIX + "failed to override Latin globe key ignore interval",
                    throwable);
            return runtimeParams;
        }
    }

    static boolean forceGlobeKeyIgnoreInterval(Object runtimeParams, int intervalMs)
            throws IllegalAccessException {
        if (runtimeParams == null) {
            return false;
        }
        float configuredIntervalMs =
                (float) GboardLatinGlobeKeyIgnoreIntervalSettings.sanitizeIntervalMs(intervalMs);

        Field field = globeKeyIgnoreIntervalField;
        if (field == null || !field.getDeclaringClass().isInstance(runtimeParams)) {
            field = findDeclaredFieldInHierarchy(
                    runtimeParams.getClass(), GLOBE_KEY_IGNORE_INTERVAL_FIELD);
            if (field == null) {
                return false;
            }
            Class<?> fieldType = field.getType();
            if (fieldType != Float.TYPE && fieldType != Float.class) {
                return false;
            }
            globeKeyIgnoreIntervalField = field;
        }

        float currentValue = field.getType() == Float.TYPE
                ? field.getFloat(runtimeParams)
                : readBoxedFloat(field, runtimeParams);
        if (Float.compare(currentValue, configuredIntervalMs) == 0) {
            return false;
        }

        if (field.getType() == Float.TYPE) {
            field.setFloat(runtimeParams, configuredIntervalMs);
        } else {
            field.set(runtimeParams, Float.valueOf(configuredIntervalMs));
        }
        return true;
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }
        Context reflected = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        reflected = reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        return null;
    }

    private static float readBoxedFloat(Field field, Object runtimeParams)
            throws IllegalAccessException {
        Object value = field.get(runtimeParams);
        return value instanceof Number number ? number.floatValue() : Float.NaN;
    }

    private static Field findDeclaredFieldInHierarchy(Class<?> type, String fieldName) {
        Class<?> current = type;
        while (current != null) {
            try {
                Field field = current.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Object application = owner.getMethod(methodName).invoke(null);
            if (!(application instanceof Context context)) {
                return null;
            }
            Context resolvedContext = context.getApplicationContext();
            return resolvedContext != null ? resolvedContext : context;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
