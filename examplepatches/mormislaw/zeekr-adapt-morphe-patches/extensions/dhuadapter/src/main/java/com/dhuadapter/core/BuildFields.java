package com.dhuadapter.core;

import android.os.Build;
import android.util.Log;

/**
 * Reflection helper to overwrite static (final) android.os.Build fields.
 * Shared by root bypass (Build.TAGS → release-keys) and emulator bypass
 * (Build.* device-identity de-genericising).
 */
public final class BuildFields {

    private static final String TAG = HookEnv.TAG;

    private BuildFields() {}

    public static void setBuildField(String name, String value) {
        try {
            java.lang.reflect.Field f = Build.class.getField(name);
            java.lang.reflect.Field mod;
            try {
                mod = java.lang.reflect.Field.class.getDeclaredField("accessFlags");
            } catch (NoSuchFieldException nsf) {
                mod = java.lang.reflect.Field.class.getDeclaredField("modifiers");
            }
            f.setAccessible(true);
            mod.setAccessible(true);
            mod.setInt(f, f.getModifiers() & ~java.lang.reflect.Modifier.FINAL);
            f.set(null, value);
            Log.i(TAG, "Build." + name + " → " + value);
        } catch (Throwable t) {
            if (HookEnv.config != null && HookEnv.config.debug) {
                Log.w(TAG, "setBuildField(" + name + ") failed: " + t.getMessage());
            }
        }
    }
}
