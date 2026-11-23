package app.ffn.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * Entry points injected into the app's API request class by the shared request hooks patch.
 * Feature patches switch their feature on by replacing an {@code is...Enabled()} body.
 */
@SuppressWarnings("unused")
public final class RequestHooks {
    static final String TAG = "FFNTao";

    private RequestHooks() {
    }

    // region Feature switches. A feature patch replaces the body to return true.

    private static boolean isDebugLogEnabled() {
        return false;
    }

    private static boolean isImageCacheEnabled() {
        return false;
    }

    private static boolean isMergeEnabled() {
        return false;
    }

    // endregion

    // region Placeholders. The hooks patch replaces these bodies with calls into the app's request class.

    /** Returns the request's decoded result. */
    static Object getResult(Object request) {
        throw new IllegalStateException("not patched");
    }

    /** Stores a decoded result on the request, as the app does before running its callbacks. */
    static void setResult(Object request, Object result) {
        throw new IllegalStateException("not patched");
    }

    /** Runs the request's callback pipeline with its stored result. */
    static void runCallbacks(Object request) {
        throw new IllegalStateException("not patched");
    }

    /** Sends the request to the server. */
    static void execute(Object request) {
        throw new IllegalStateException("not patched");
    }

    // endregion

    /**
     * Called when a request is about to be sent.
     *
     * @return true if the request was answered another way and must not be sent.
     */
    public static boolean beforeSend(Object request) {
        try {
            if (isDebugLogEnabled()) DebugLog.requestStarted(request);
            if (isImageCacheEnabled() && ImageCache.serve(request)) return true;
            return isMergeEnabled() && RequestDedup.shouldDefer(request);
        } catch (Throwable t) {
            Log.e(TAG, "beforeSend", t);
            return false;
        }
    }

    /** Called when a request has decoded its result, just before its callbacks run. */
    public static void onSuccess(Object request) {
        try {
            if (isDebugLogEnabled()) DebugLog.requestResponded(request);
            if (isImageCacheEnabled()) ImageCache.store(request);
            if (isMergeEnabled()) RequestDedup.onSuccess(request);
        } catch (Throwable t) {
            Log.e(TAG, "onSuccess", t);
        }
    }

    /** Called when any request fails or is cancelled. */
    public static void onFailure(Object request, Throwable error) {
        try {
            if (isDebugLogEnabled()) DebugLog.requestFailed(request, error);
            if (isMergeEnabled()) RequestDedup.onFailure(request);
        } catch (Throwable t) {
            Log.e(TAG, "onFailure", t);
        }
    }

    /** The request URL lives in an obfuscated String field; find it by its value. */
    static String url(Object request) {
        for (Class<?> c = request.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(request);
                    if (value instanceof String) {
                        String s = (String) value;
                        if (s.startsWith("/api") || s.startsWith("http")) return s;
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                }
            }
        }
        return null;
    }

    /** Whether the request decodes its response to the given class, such as android.graphics.Bitmap. */
    static boolean decodesTo(Object request, Class<?> type) {
        String marker = "class " + type.getName();
        for (Field field : request.getClass().getDeclaredFields()) {
            if (field.getType().isPrimitive() || Modifier.isStatic(field.getModifiers())) continue;
            try {
                field.setAccessible(true);
                Object value = field.get(request);
                // The decode class is stored as a Kotlin KClass, whose toString is "class <name>".
                String text = value == null || value instanceof String ? null : String.valueOf(value);
                if (text != null && (text.equals(marker) || text.startsWith(marker + " "))) {
                    return true;
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) {
            }
        }
        return false;
    }
}
