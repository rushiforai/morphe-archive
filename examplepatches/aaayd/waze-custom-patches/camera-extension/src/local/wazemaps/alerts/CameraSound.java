package local.wazemaps.alerts;

import android.util.Log;
import java.lang.reflect.Method;

public final class CameraSound {
    private static final String FIELD = "CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT";
    private static final String TAG = "MorpheCameraSound";
    private static volatile Object configObject;
    private static Object config() throws Exception {
        Object value = configObject;
        if (value == null) {
            value = Class.forName("com.waze.config.ConfigValues").getField(FIELD).get(null);
            if (value == null) throw new IllegalStateException("Camera sound config is not ready");
            configObject = value;
        }
        return value;
    }

    public static Boolean override(Object value) {
        try { return value == config() ? Boolean.TRUE : null; }
        catch (Exception error) { Log.e(TAG, "Camera sound override unavailable", error); return null; }
    }

    static synchronized void apply() throws Exception {
        if (!Boolean.TRUE.equals(Class.forName("com.waze.NativeManager").getMethod("isAppStarted").invoke(null)))
            throw new IllegalStateException("Waze is still starting");
        Object value = config();
        int id = ((Number) value.getClass().getMethod("e").invoke(value)).intValue();
        Class<?> type = Class.forName("com.waze.ConfigManager");
        Object manager = type.getMethod("getInstance").invoke(null);
        Method get = type.getMethod("getConfigValueBoolNTV", int.class);
        Method set = type.getMethod("setConfigValueBoolNTV", int.class, boolean.class);
        boolean before = (Boolean) get.invoke(manager, id);
        try {
            if (!before) set.invoke(manager, id, true);
            if (!Boolean.TRUE.equals(get.invoke(manager, id)))
                throw new IllegalStateException("Waze did not accept the camera sound setting");
        } catch (Exception error) {
            try { set.invoke(manager, id, before); } catch (Exception rollback) { error.addSuppressed(rollback); }
            throw error;
        }
        Log.i(TAG, "Speed camera sound below speed limit enabled and verified");
    }

    public static void applySaved() {
        try { apply(); }
        catch (Exception error) { Log.e(TAG, "Could not enable camera sound below speed limit", error); }
    }

    public static void scheduleApply() {
        try {
            Object accepted = Class.forName("com.waze.NativeManager").getMethod("Post", Runnable.class)
                .invoke(null, (Runnable) CameraSound::applySaved);
            if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("Native queue is unavailable");
        } catch (Exception error) { Log.e(TAG, "Could not queue camera sound setting", error); }
    }
}
