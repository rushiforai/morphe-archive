package app.aidan.extension.nhl.adblock;

import android.util.Log;

/**
 * JNI wrapper for the Rust adblock filter engine (libnhladblock.so).
 */
public final class NativeEngine {
    private static final String TAG = "AidanAdBlockNative";
    private static volatile boolean sLoaded = false;
    private static Throwable sLoadError = null;

    static {
        try {
            System.loadLibrary("nhladblock");
            sLoaded = true;
            Log.i(TAG, "libnhladblock.so loaded successfully");
        } catch (Throwable t) {
            sLoadError = t;
            Log.e(TAG, "Failed to load libnhladblock.so", t);
        }
    }

    private NativeEngine() {}

    public static boolean isAvailable() {
        return sLoaded;
    }

    public static Throwable getLoadError() {
        return sLoadError;
    }

    public static void ensureLoaded() {
        if (!sLoaded) {
            throw new IllegalStateException("Native adblock engine not available", sLoadError);
        }
    }

    /**
     * Compiles an engine from a list of rule file paths, using an optional binary cache path.
     * Returns an opaque 64-bit engine handle.
     */
    public static native long compile(String[] listPaths, String cachePath);

    /**
     * Matches a network request against active rules.
     * Returns 1 for block, 0 for allow.
     */
    public static native int match(
            long handle,
            String requestUrl,
            String documentUrl,
            String resourceType,
            String method);

    /**
     * Retrieves domain cosmetic resources (CSS hiding rules, exceptions, and generichide) as JSON.
     */
    public static native String cosmetics(long handle, String documentUrl);

    /**
     * Queries generic selectors for given DOM class names and element IDs.
     * Returns JSON array of selectors to hide.
     */
    public static native String genericSelectors(
            long handle,
            String documentUrl,
            String[] classes,
            String[] ids);

    /**
     * Releases an active engine handle and frees associated resources.
     */
    public static native void release(long handle);

    /**
     * Parses raw filter list content to return diagnostics summary JSON.
     */
    public static native String parseDiagnostics(String listContent);
}
