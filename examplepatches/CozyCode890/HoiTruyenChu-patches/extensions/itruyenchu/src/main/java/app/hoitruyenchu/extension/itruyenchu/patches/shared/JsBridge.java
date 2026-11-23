package app.hoitruyenchu.extension.itruyenchu.patches.shared;

import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

/**
 * Java to JS: device events sent to the scripts through the app's React context
 * (BridgelessReactContext.emitDeviceEvent). JS to Java goes through AsyncStorage
 * (see {@link HtcSettings#onStorageSet}).
 */
public final class JsBridge {
    private static final String TAG = "HTC-Bridge";

    /** Settings changed: the new values as JSON (same as the scripts' {@code __htcS}). */
    public static final String EVENT_SETTINGS = "htcSettingsChanged";
    /** A command for the scripts: {"cmd": "...", ...} as JSON. */
    public static final String EVENT_COMMAND = "htcCommand";

    private static final Object lock = new Object();
    private static WeakReference<Object> reactContext;
    private static Method emitDeviceEvent;

    private JsBridge() {
    }

    static void setContext(Object context) {
        if (context == null) return;
        synchronized (lock) {
            Object current = reactContext != null ? reactContext.get() : null;
            if (current == context) return;
            reactContext = new WeakReference<>(context);
            emitDeviceEvent = null;
        }
    }

    /** @return the React context of the running app, or null. */
    public static Object context() {
        synchronized (lock) {
            return reactContext != null ? reactContext.get() : null;
        }
    }

    /** @return true if the event was handed to the app (not that a script received it). */
    public static boolean emit(String event, String data) {
        Object context;
        Method method;
        synchronized (lock) {
            context = reactContext != null ? reactContext.get() : null;
            method = emitDeviceEvent;
        }
        if (context == null) return false;
        try {
            if (method == null) {
                method = context.getClass().getMethod("emitDeviceEvent", String.class, Object.class);
                synchronized (lock) {
                    emitDeviceEvent = method;
                }
            }
            method.invoke(context, event, data);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "could not send " + event + " to the app", t);
            return false;
        }
    }
}
