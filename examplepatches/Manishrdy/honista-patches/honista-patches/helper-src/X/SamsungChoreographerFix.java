package X;

import android.util.Log;
import android.view.Choreographer;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Samsung One UI 7 adds an ActivityThread reference to Choreographer that can be null,
 * causing a NPE at Choreographer.doFrame:1235 (android.app.ActivityThread.getIdsController).
 * This finds the field by type (robust across Samsung builds) and sets it if null.
 */
public final class SamsungChoreographerFix {
    private static final String TAG = "HonistaInit";

    public static void apply() {
        try {
            Choreographer choreographer = Choreographer.getInstance();
            Field field = findActivityThreadField(choreographer.getClass());
            if (field == null) return; // Not Samsung One UI 7, nothing to fix
            field.setAccessible(true);
            if (field.get(choreographer) != null) return; // Already set
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method current = atClass.getMethod("currentActivityThread");
            Object at = current.invoke(null);
            if (at == null) return;
            field.set(choreographer, at);
            Log.i(TAG, "Samsung One UI 7 Choreographer fix applied");
        } catch (Exception e) {
            Log.w(TAG, "Samsung Choreographer fix skipped: " + e);
        }
    }

    private static Field findActivityThreadField(Class<?> cls) {
        for (Class<?> c = cls; c != null; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if ("android.app.ActivityThread".equals(f.getType().getName())) return f;
            }
        }
        return null;
    }
}
