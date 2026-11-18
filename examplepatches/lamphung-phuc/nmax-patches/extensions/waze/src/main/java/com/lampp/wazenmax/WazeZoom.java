package com.lampp.wazenmax;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Zooms Waze's maps from the dash's + / −, as Android Auto's zoom buttons do: {@code WazeMapNativeManager
 * .nativePerformZoomIn/Out(mapId, animated)}. The class and its natives keep their names (JNI binds them by name); the
 * mapId field does not, so patch.py hooks the constructor ({@link #manager}) to record each map's id.
 */
public final class WazeZoom {
    private static final String TAG = "WazeNmaxZoom";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, String> MAPS = new WeakHashMap<>();

    private WazeZoom() {
    }

    /** WazeMapNativeManager.&lt;init&gt;(mapId, dispatcher). */
    public static void manager(Object nativeManager, String mapId) {
        synchronized (MAPS) {
            MAPS.put(nativeManager, mapId);
        }
    }

    /** Binder thread. False when Waze has no map yet. */
    static boolean zoom(boolean in) {
        List<Map.Entry<Object, String>> maps;
        synchronized (MAPS) {
            maps = new ArrayList<>(MAPS.entrySet());
        }
        if (maps.isEmpty()) return false;
        MAIN.post(() -> {
            for (Map.Entry<Object, String> m : maps) {
                try {
                    Method zoom = m.getKey().getClass().getDeclaredMethod(
                            in ? "nativePerformZoomIn" : "nativePerformZoomOut", String.class, boolean.class);
                    zoom.setAccessible(true);
                    zoom.invoke(m.getKey(), m.getValue(), true);
                } catch (Throwable t) {
                    Log.w(TAG, "zoom " + (in ? "in" : "out") + " failed on map " + m.getValue(), t);
                }
            }
        });
        return true;
    }
}
