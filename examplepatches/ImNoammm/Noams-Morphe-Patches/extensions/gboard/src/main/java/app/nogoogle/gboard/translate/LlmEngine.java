package app.nogoogle.gboard.translate;

import android.util.Log;

/** JNI entry points of libnogoogle_llm.so (llama.cpp). */
public final class LlmEngine {
    private static volatile Boolean loaded;

    private LlmEngine() {
    }

    public static synchronized boolean load() {
        if (loaded != null) return loaded;
        try {
            System.loadLibrary("c++_shared");
            System.loadLibrary("nogoogle_llm");
            loaded = true;
        } catch (Throwable t) {
            Log.e("NoGoogle", "llm library unavailable", t);
            loaded = false;
        }
        return loaded;
    }

    public static native long init(String modelPath, int threads, int contextTokens);

    /** Greedy completion; null when aborted or on error. */
    public static native String generate(long handle, String prompt, int maxTokens);

    public static native void abort(long handle);

    /** Clears an abort requested before the next generate(); generate() itself never clears it. */
    public static native void resetAbort(long handle);

    public static native void free(long handle);
}
