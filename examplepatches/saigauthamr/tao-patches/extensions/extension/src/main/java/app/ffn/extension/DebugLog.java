package app.ffn.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Called from code injected by the "Enable debug logging" patch, and through {@link RequestHooks}. Logs to logcat under {@link #TAG}.
 * Read with: adb logcat -s FFNTao
 */
@SuppressWarnings("unused")
public final class DebugLog {
    private static final String TAG = "FFNTao";
    private static final AtomicInteger requestCount = new AtomicInteger();
    private static final Map<Object, Long> startTimes = new WeakHashMap<>();

    private DebugLog() {
    }

    /** Replacement body of the app's own log functions, which are empty in release builds. */
    public static void log(Object owner, String message) {
        Log.d(TAG, simpleName(owner) + ": " + message);
    }

    public static void requestStarted(Object request) {
        synchronized (startTimes) {
            startTimes.put(request, System.currentTimeMillis());
        }
        Log.i(TAG, "request #" + requestCount.incrementAndGet() + " " + url(request));
    }

    public static void requestFailed(Object request, Throwable error) {
        Log.w(TAG, "request FAILED after " + elapsed(request) + " " + url(request), error);
    }

    public static void requestResponded(Object request) {
        Log.i(TAG, "request responded after " + elapsed(request) + " " + url(request));
    }

    // Handler index of the app's HTTP/2 frame parser -> frame type.
    private static final String[] FRAME_TYPES =
            {"DATA", "GOAWAY", "HEADERS", "PING", "RST_STREAM", "SETTINGS", "CONTINUATION?", "WINDOW_UPDATE"};

    /** Called for every HTTP/2 frame received from the API server, before it is parsed. */
    public static void frameReceived(Object handler, Object header, byte[] payload) {
        int index = intField(handler, 0);
        String type = index >= 0 && index < FRAME_TYPES.length ? FRAME_TYPES[index] : "type" + index;
        StringBuilder line = new StringBuilder("frame <- ").append(type)
                .append(" stream=").append(longField(header))
                .append(" h=").append(intField(header, 0)).append("/").append(intField(header, 1)).append("/").append(intField(header, 2))
                .append(" len=").append(payload == null ? 0 : payload.length);
        if (payload != null && index != 0 && index != 2) {
            line.append(" payload=");
            for (int i = 0; i < Math.min(payload.length, 32); i++) {
                line.append(String.format("%02x", payload[i]));
            }
        }
        Log.v(TAG, line.toString());
    }

    /** The n-th declared int field of an obfuscated object. */
    private static int intField(Object owner, int n) {
        int seen = 0;
        for (Field field : owner.getClass().getDeclaredFields()) {
            if (field.getType() != int.class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
            if (seen++ == n) {
                try {
                    field.setAccessible(true);
                    return field.getInt(owner);
                } catch (ReflectiveOperationException e) {
                    return -1;
                }
            }
        }
        return -1;
    }

    /** The first declared long field of an obfuscated object (the frame's stream id). */
    private static long longField(Object owner) {
        for (Field field : owner.getClass().getDeclaredFields()) {
            if (field.getType() != long.class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
            try {
                field.setAccessible(true);
                return field.getLong(owner);
            } catch (ReflectiveOperationException e) {
                return -1;
            }
        }
        return -1;
    }

    private static String elapsed(Object request) {
        Long start;
        synchronized (startTimes) {
            start = startTimes.remove(request);
        }
        return start == null ? "?" : (System.currentTimeMillis() - start) + "ms";
    }

    private static String url(Object request) {
        String url = RequestHooks.url(request);
        return url == null ? "<unknown url>" : url;
    }

    private static String simpleName(Object owner) {
        return owner == null ? "null" : owner.getClass().getName();
    }
}
