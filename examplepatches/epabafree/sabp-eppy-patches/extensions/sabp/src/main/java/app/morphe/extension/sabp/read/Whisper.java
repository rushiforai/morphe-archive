package app.morphe.extension.sabp.read;

import java.io.BufferedReader;
import java.io.FileReader;

/**
 * eppy's on-device speech engine (whisper.cpp, MIT) through libeppywhisper.so, bundled by the
 * patch. Picks the armv8.2 build (fp16 + dotprod, several times faster) when the CPU has both,
 * otherwise the baseline build. Everything here is blocking: call it from a background thread.
 */
public final class Whisper implements AutoCloseable {
    private static Boolean loaded;
    private static String loadedLib;
    private static String loadError;

    private long ctx;

    private Whisper(long ctx) {
        this.ctx = ctx;
    }

    /** Loads the native library once. False if the patch didn't bundle it or it failed to load. */
    public static synchronized boolean available() {
        if (loaded != null) return loaded;
        String[] order = fastCpu() ? new String[]{"eppywhisper_v82", "eppywhisper"} : new String[]{"eppywhisper"};
        for (String name : order) {
            try {
                System.loadLibrary(name);
                loadedLib = name;
                loaded = true;
                return true;
            } catch (Throwable t) {
                loadError = t.toString();
            }
        }
        loaded = false;
        return false;
    }

    public static String libraryName() {
        return loadedLib;
    }

    public static String loadError() {
        return loadError;
    }

    /** True when /proc/cpuinfo lists both asimdhp (fp16) and asimddp (dotprod). */
    static boolean fastCpu() {
        try (BufferedReader r = new BufferedReader(new FileReader("/proc/cpuinfo"))) {
            String line;
            while ((line = r.readLine()) != null) {
                if (line.startsWith("Features")) return line.contains(" asimdhp") && line.contains(" asimddp");
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** Opens a ggml model file, or null if it can't be read. */
    public static Whisper open(String modelPath) {
        if (!available()) return null;
        long p = nativeInit(modelPath);
        return p != 0 ? new Whisper(p) : null;
    }

    /**
     * Transcribes one window of 16 kHz mono PCM (at most 30 s works best). Returns whisper's JSON
     * ({"segments":[{t0,t1,nsp,text,tokens:[[t0,t1,text,p]]}],"ms":n}, times in ms relative to the
     * window), or null if it failed or was aborted.
     */
    public synchronized String transcribe(float[] pcm, int threads, String prompt) {
        if (ctx == 0) return null;
        return nativeTranscribe(ctx, pcm, threads, prompt, "en");
    }

    /** Stops a running transcribe() as soon as whisper checks (between decoder steps). */
    public static void abort() {
        if (available()) nativeAbort(true);
    }

    public static String systemInfo() {
        return available() ? nativeSystemInfo() : "";
    }

    @Override
    public synchronized void close() {
        if (ctx != 0) nativeFree(ctx);
        ctx = 0;
    }

    private static native long nativeInit(String model);

    private static native void nativeFree(long ctx);

    private static native void nativeAbort(boolean on);

    private static native String nativeSystemInfo();

    private static native String nativeTranscribe(long ctx, float[] pcm, int threads, String prompt, String language);
}
