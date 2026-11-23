package app.jofslash.extension.booking;

import android.os.IBinder;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * Used by the GmsCore support patch. With MicroG-RE, the app's Google map is MicroG's
 * MapLibre-based GoogleMapImpl, running in the app's process.
 * <p>
 * MicroG reloads the whole map style on every setMapType / setMapStyle call. When the
 * style has finished loading, it reads the layer ids of its marker, line and fill managers
 * before those managers have moved their layers to the new style. The old style's layers
 * are already freed by then, so this reads freed native memory and the app crashes in
 * libmapbox-gl.so (SIGSEGV) on most attempts.
 * <p>
 * Booking.com sets the map type right after the map is ready (to the type it already has),
 * which is enough to crash on opening the map; switching to the satellite view and back
 * crashes too. So:
 * <ul>
 *   <li>a call that changes nothing is skipped, and</li>
 *   <li>before a real change, the managers' layers and sources are taken out of the old
 *   style. A removed layer owns its native object again, so reading its id stays safe;
 *   the managers add fresh layers to the new style themselves.</li>
 * </ul>
 * Anything unexpected leaves the call as it was. With Google Play services' own maps
 * (no MicroG) nothing here applies.
 */
@SuppressWarnings("unused")
public final class MicroGMaps {
    private static final String TAG = "BookingMicroGMaps";
    private static final int MAP_TYPE_NORMAL = 1;
    private static final String[] MANAGERS = {"symbolManager", "lineManager", "fillManager"};

    private MicroGMaps() {
    }

    /** Called at the start of IGoogleMapDelegate.setMapType. True skips the call. */
    public static boolean skipMapType(IBinder map, int type) {
        try {
            if (!isMicroG(map)) return false;
            Object current = field(map, "storedMapType");
            // -1 is "not set" in GoogleMapOptions, which MicroG draws as the normal map.
            int currentType = current instanceof Integer ? (Integer) current : Integer.MIN_VALUE;
            if (currentType == -1) currentType = MAP_TYPE_NORMAL;
            if (currentType == type) {
                Log.d(TAG, "setMapType " + type + ": unchanged, skipped");
                return true;
            }
            detachAnnotations(map);
        } catch (Throwable t) {
            Log.w(TAG, "setMapType", t);
        }
        return false;
    }

    /** Called at the start of IGoogleMapDelegate.setMapStyle. True skips the call. */
    public static boolean skipMapStyle(IBinder map, Object options) {
        try {
            if (!isMicroG(map)) return false;
            String json = options == null ? null : stringField(options);
            Object current = field(map, "mapStyle");
            String currentJson = current == null ? null : (String) current.getClass().getMethod("getJson").invoke(current);
            if (json == null ? currentJson == null : json.equals(currentJson)) {
                Log.d(TAG, "setMapStyle: unchanged, skipped");
                return true;
            }
            detachAnnotations(map);
        } catch (Throwable t) {
            Log.w(TAG, "setMapStyle", t);
        }
        return false;
    }

    private static boolean isMicroG(Object map) {
        return map != null && map.getClass().getName().startsWith("org.microg.");
    }

    /** Takes the managers' layers and sources out of the style they were added to. */
    private static void detachAnnotations(Object map) throws Exception {
        for (String name : MANAGERS) {
            Object manager = field(map, name);
            if (manager == null) continue;
            Object style = field(manager, "style");
            if (style == null) continue;
            try {
                // Layer first: a source can't be removed while a layer uses it.
                callWith(style, "removeLayer", field(manager, "layer"));
                callWith(style, "removeSource", field(manager, "geoJsonSource"));
                Log.d(TAG, "detached " + name);
            } catch (Throwable t) {
                // The style is already being replaced (a change is in progress): its
                // layers were detached by that change, or there's nothing more to do.
                Log.d(TAG, "detach " + name + ": " + t);
            }
        }
    }

    /** Calls the one-argument method [name] of [target] that takes [argument]'s type. */
    private static void callWith(Object target, String name, Object argument) throws Exception {
        if (argument == null) return;
        for (Method method : target.getClass().getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (method.getName().equals(name) && parameters.length == 1 && parameters[0].isInstance(argument)) {
                method.invoke(target, argument);
                return;
            }
        }
        throw new NoSuchMethodException(name);
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                // Look in the superclass.
            }
        }
        throw new NoSuchFieldException(name);
    }

    /** The JSON of the app's MapStyleOptions: its only String field (obfuscated name). */
    private static String stringField(Object options) throws Exception {
        for (Field field : options.getClass().getDeclaredFields()) {
            if (field.getType() == String.class && !Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                return (String) field.get(options);
            }
        }
        throw new NoSuchFieldException("MapStyleOptions json");
    }
}
