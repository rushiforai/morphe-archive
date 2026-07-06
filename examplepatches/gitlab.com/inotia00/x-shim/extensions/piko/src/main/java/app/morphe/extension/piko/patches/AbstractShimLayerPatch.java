package app.morphe.extension.piko.patches;

import android.util.Log;

import java.lang.reflect.Method;

@SuppressWarnings("unused")
public class AbstractShimLayerPatch {
    private static final String TAG = "PicoShim: AbstractShimLayerPatch";
    private static boolean initialized = false;

    /**
     * Injection point.
     */
    public static synchronized void init() {
        if (initialized) {
            return;
        }

        initialized = setField("dummy");
    }

    @SuppressWarnings("SameParameterValue")
    private static boolean setField(String type) {
        // Rest of the implementation added by patch.
        return "dummy".equals(type);
    }

    /**
     * Injection point.
     */
    public static Method findMethod(String className, String methodName) {
        try {
            Class<?> clazz = Class.forName(className);
            for (Method method : clazz.getDeclaredMethods()) {
                if (methodName.equals(method.getName())) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (ClassNotFoundException ex) {
            Log.e(TAG, "Class not found: " + className, ex);
        }

        return null;
    }

}
