package app.sledgesune.extension.waze;

import android.util.Log;

import java.lang.reflect.Method;

/**
 * Writes values into Waze's config store the way Waze's own settings screen does
 * ({@code ConfigManager.setConfigValue*}). That store lives in the native core, so values written here are what
 * both the native code and the app's Java code read. Values the server sends again are overwritten on each
 * config sync, because the patches call this from {@code ConfigManager.onConfigSynced*}.
 * <p>
 * ConfigManager and ConfigValues keep their real names; the value classes are obfuscated, so they are taken from
 * the {@code CONFIG_VALUE_*} fields at run time.
 */
final class WazeConfig {

    private static final String TAG = "SledgeSuneWazeConfig";

    private WazeConfig() {
    }

    static void setBoolean(String key, boolean value) {
        set(key, "Bool", boolean.class, value);
    }

    static void setLong(String key, long value) {
        set(key, "Long", long.class, value);
    }

    static void setString(String key, String value) {
        set(key, "String", String.class, value);
    }

    private static void set(String key, String kind, Class<?> valueType, Object value) {
        try {
            Object config = Class.forName("com.waze.config.ConfigValues").getField(key).get(null);
            Class<?> managerClass = Class.forName("com.waze.ConfigManager");
            Object manager = managerClass.getMethod("getInstance").invoke(null);

            Method getter = managerClass.getMethod("getConfigValue" + kind, config.getClass());
            Object current = getter.invoke(manager, config);
            // Only write changes: a write can make Waze sync config again, which calls the patches again.
            if (value.equals(current)) return;

            managerClass.getMethod("setConfigValue" + kind, config.getClass(), valueType).invoke(manager, config, value);
            Log.i(TAG, key + ": " + current + " -> " + value);
        } catch (NoSuchFieldException e) {
            Log.w(TAG, key + " doesn't exist in this Waze version");
        } catch (Throwable t) {
            Log.e(TAG, "Could not set " + key, t);
        }
    }
}
