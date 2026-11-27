package com.music.bitchord.playback.loopmix;

/**
 * BitChord's native loop-mix renderer (libbitchord_loopmix.so, from the BitChord phone app):
 * two Signalsmith Stretch decks following beat knots, with gain / 250 Hz shelf / high-pass envelopes.
 * JNI entry points are bound to this class name.
 */
public final class LoopMixRenderer {
    public static final int OUT = 0;
    public static final int IN = 1;
    public static final int KIND_GAIN = 0;
    public static final int KIND_LOW_DB = 1;
    public static final int KIND_HIGH_PASS_HZ = 2;

    private LoopMixRenderer() {
    }

    public static native long nativeCreate(int sampleRate);

    public static native void nativeDestroy(long handle);

    public static native void nativeSetDeck(long handle, int index, float[] left, float[] right, double regionStart,
                                            long loopStart, long loopEnd, double releaseAt, double[] knotFrames,
                                            double[] knotPositions, boolean runOn, double stopAt, double preroll, float level);

    public static native void nativeSetEnvelope(long handle, int index, int kind, double[] times, float[] values, boolean exponential);

    public static native void nativePrepare(long handle);

    public static native long nativeFirstFrame(long handle);

    public static native void nativeRender(long handle, long frame, float[] interleaved, int offset, int frames);

    public static native void nativeSetFadeOut(long handle, int index, double trackSeconds);

    public static native double nativeHeard(long handle, int index);
}
