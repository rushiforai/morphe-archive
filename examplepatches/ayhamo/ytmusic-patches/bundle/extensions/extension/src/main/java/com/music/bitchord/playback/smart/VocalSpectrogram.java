package com.music.bitchord.playback.smart;

/**
 * The open-unmix STFT front end of BitChord's libbitchord_analysis.so (JNI bound to this class name).
 * nativeCompute returns bin-major [channel][bin][frame] magnitudes, the model's [1, 2, bins, frames] layout.
 */
public final class VocalSpectrogram {
    private VocalSpectrogram() {
    }

    public static native float[] nativeCompute(float[] left, float[] right, double rate);

    public static native int nativeBins();

    public static native double nativeSampleRate();

    public static native int nativeHop();

    public static native int nativeFftSize();
}
