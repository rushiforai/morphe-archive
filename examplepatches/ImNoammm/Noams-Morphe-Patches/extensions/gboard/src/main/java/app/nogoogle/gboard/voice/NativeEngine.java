package app.nogoogle.gboard.voice;

import android.util.Log;

/** JNI entry points of libnogoogle_jni.so (whisper.cpp + slimt). */
public final class NativeEngine {
    private static volatile Boolean loaded;

    private NativeEngine() {
    }

    public static synchronized boolean load() {
        if (loaded != null) return loaded;
        try {
            System.loadLibrary("c++_shared");
            System.loadLibrary("nogoogle_jni");
            loaded = true;
        } catch (Throwable t) {
            Log.e("NoGoogle", "native library unavailable", t);
            loaded = false;
        }
        return loaded;
    }

    public static native long whisperInit(String modelPath, boolean gpu);

    /**
     * @param ctxPad encoder frames beyond the audio (50 per second) for models fine-tuned for
     *               dynamic audio context (ACFT); -1 = Whisper's full 30 s window.
     */
    public static native String whisperTranscribe(long handle, float[] pcm, String language,
                                                  int threads, int beam, boolean fast, String prompt,
                                                  int ctxPad);

    /** Silero VAD (streaming): one context per recording session. */
    public static native long vadInit(String modelPath);

    /** Speech probability per 512-sample window; state carries over between calls. */
    public static native float[] vadProbs(long handle, float[] pcm);

    public static native void vadFree(long handle);

    public static native void whisperAbort(long handle);

    /** Clears an abort; transcriptions never clear it themselves (a cancel can't be lost). */
    public static native void whisperResetAbort(long handle);

    public static native void whisperFree(long handle);

    /**
     * Converts a published q8_0 Whisper model to q4_0 (the type with fast ARM kernels), byte for
     * byte what an f16 conversion followed by whisper.cpp's quantize tool produces. Takes about a
     * minute.
     */
    public static native boolean whisperToQ4(String q8Path, String q4Path);

    public static native long translatorInit(String model, String vocab, String shortlist);

    public static native String translate(long handle, String text);

    public static native void translatorFree(long handle);
}
