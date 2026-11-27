package com.music.bitchord.playback.smart;

/**
 * The JNI entry points of BitChord's libbitchord_analysis.so are bound to this class name.
 */
public final class MelSpectrogram {
    private MelSpectrogram() {
    }

    public static native float[] nativeCompute(float[] samples, double sampleRate);

    public static native float[] nativeResample(float[] samples, double inputRate, double outputRate);

    public static native int nativeMelCount();

    public static native double nativeSampleRate();

    public static native int nativeHop();
}
