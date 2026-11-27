package com.music.bitchord.playback.smart;

/**
 * The JNI entry points of BitChord's libbitchord_analysis.so are bound to this class name.
 */
public final class TrackFeatures {
    private TrackFeatures() {
    }

    public static native String nativeAnalyze(float[] samples, double sampleRate, double duration);

    public static native double nativeSampleRate();

    public static native float[] nativeResample(float[] samples, double inputRate, double outputRate);
}
