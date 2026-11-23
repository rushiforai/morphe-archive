package com.lampp.wazenmax;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * Ends Waze's trip for NmaxConnect (the app that lost the dash under Auto), as Waze's own navbar and Google Assistant do:
 * {@code NativeManager.stopNavigationNTV()} on the main thread. The native keeps its name (JNI binds it); the instance
 * comes from {@code getInstance()}, or the static NativeManager field if R8 renames that.
 */
public final class WazeStop {
    private static final String TAG = "WazeNmaxStop";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private WazeStop() {
    }

    /** Binder thread. False when Waze's NativeManager is not up yet. */
    static boolean stop() {
        final Object manager;
        final Method stop;
        try {
            Class<?> cls = Class.forName("com.waze.NativeManager");
            manager = instance(cls);
            if (manager == null) return false;
            stop = cls.getDeclaredMethod("stopNavigationNTV");
            stop.setAccessible(true);
        } catch (Throwable t) {
            Log.w(TAG, "Waze's NativeManager not found", t);
            return false;
        }
        MAIN.post(() -> {
            try {
                stop.invoke(manager);
            } catch (Throwable t) {
                Log.w(TAG, "stopNavigationNTV failed", t);
            }
        });
        return true;
    }

    private static Object instance(Class<?> cls) throws ReflectiveOperationException {
        try {
            return cls.getMethod("getInstance").invoke(null);
        } catch (NoSuchMethodException renamed) {
            for (Field f : cls.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) && f.getType() == cls) {
                    f.setAccessible(true);
                    return f.get(null);
                }
            }
            return null;
        }
    }
}
