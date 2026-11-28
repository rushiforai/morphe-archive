package com.waze.gw;

import android.location.Location;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Reflection-only bridge into Waze's shared location flow; isolated so obfuscation drift fails safe. */
final class WazeLocationBridge {
    private static final String TAG = "WazeGW-Location";
    private static Object sink;
    private static Object deviceSource;
    private static Method publish;
    // Waze 5.24 wraps (Location, source) in one value object before handing it to the sink.
    private static Constructor<?> wrapper;
    private static boolean loggedReady;
    private static String resolvedApi;

    private WazeLocationBridge() { }

    static synchronized boolean publish(Location location) {
        if (location == null) return false;
        try {
            if (sink == null || deviceSource == null || publish == null) resolve();
            if (wrapper != null) {
                publish.invoke(sink, wrapper.newInstance(location, deviceSource));
            } else {
                publish.invoke(sink, location, deviceSource);
            }
            return true;
        } catch (Throwable error) {
            sink = null;
            deviceSource = null;
            publish = null;
            wrapper = null;
            Log.w(TAG, "Waze location bridge unavailable: "
                    + error.getClass().getSimpleName());
            return false;
        }
    }

    private static void resolve() throws Exception {
        Throwable latest = null;
        String[][] versions = {
                // Waze 5.27: sink.d(LocationUpdate(Location, WazeSource)); the DI locator moved to
                // kotlinx.coroutines.db.u(Class).
                {"com.waze.location.ah", "com.waze.location.bo", "kotlinx.coroutines.db", "u", "5.27",
                        "com.waze.location.aj"},
                // Waze 5.24: sink.d(LocationUpdate(Location, WazeSource)).
                {"com.waze.location.ae", "com.waze.location.bo", "k.z", "j", "5.24",
                        "com.waze.location.ag"},
                // Waze 5.22/5.23: LocationSource + WazeSource, resolved from the global Koin graph.
                {"com.waze.location.x", "com.waze.location.bg", "k.y", "j", "5.23"},
                // Waze 5.20 compatibility for older decoded projects that share this Java source.
                {"com.waze.location.y", "com.waze.location.bf", "com.waze.web.r", "h", "5.20"}
        };
        for (String[] version : versions) {
            try {
                resolveVersion(version);
                return;
            } catch (Throwable error) {
                latest = error;
            }
        }
        if (latest instanceof Exception) throw (Exception) latest;
        throw new IllegalStateException("no compatible Waze location API", latest);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void resolveVersion(String[] version) throws Exception {
        Class<?> sinkType = Class.forName(version[0]);
        Class<?> sourceType = Class.forName(version[1]);
        Class<?> locator = Class.forName(version[2]);
        Method get = locator.getMethod(version[3], Class.class);
        if (!Modifier.isStatic(get.getModifiers())) {
            throw new NoSuchMethodException("location locator is not static");
        }
        Object resolvedSink = get.invoke(null, sinkType);
        if (resolvedSink == null || !sinkType.isInstance(resolvedSink)) {
            throw new IllegalStateException("location sink unavailable");
        }

        Object resolvedSource;
        if (sourceType.isEnum()) {
            resolvedSource = Enum.valueOf((Class<? extends Enum>) sourceType.asSubclass(Enum.class),
                    "DEVICE");
        } else {
            // Defensive compatibility for an unusual non-enum implementation.
            Field device = sourceType.getField("c");
            resolvedSource = device.get(null);
        }
        Constructor<?> resolvedWrapper = null;
        Method resolvedPublish;
        if (version.length > 5) {
            Class<?> wrapperType = Class.forName(version[5]);
            resolvedWrapper = wrapperType.getConstructor(Location.class, sourceType);
            resolvedPublish = findWrappedPublish(sinkType, wrapperType);
        } else {
            resolvedPublish = findPublish(sinkType, sourceType);
        }

        sink = resolvedSink;
        deviceSource = resolvedSource;
        publish = resolvedPublish;
        wrapper = resolvedWrapper;
        resolvedApi = version[4];
        if (!loggedReady) {
            loggedReady = true;
            Log.i(TAG, "Waze location bridge ready api=" + resolvedApi
                    + " sink=" + sinkType.getName() + " source=" + sourceType.getName());
        }
    }

    /** Resolve by parameter contract so a method-name-only obfuscation change does not break us. */
    private static Method findPublish(Class<?> sinkType, Class<?> sourceType)
            throws NoSuchMethodException {
        for (Method method : sinkType.getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (method.getReturnType() == Void.TYPE && parameters.length == 2
                    && parameters[0] == Location.class && parameters[1] == sourceType) {
                return method;
            }
        }
        throw new NoSuchMethodException("publish(Location," + sourceType.getName() + ")");
    }

    private static Method findWrappedPublish(Class<?> sinkType, Class<?> wrapperType)
            throws NoSuchMethodException {
        for (Method method : sinkType.getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (method.getReturnType() == Void.TYPE && parameters.length == 1
                    && parameters[0] == wrapperType) {
                return method;
            }
        }
        throw new NoSuchMethodException("publish(" + wrapperType.getName() + ")");
    }
}
