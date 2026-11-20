package androidx.media3.common;

/** Compile-time signatures only. The bundled Media3 provides these methods at runtime. */
public interface Player {
    int getPlaybackState();
    boolean getPlayWhenReady();
    int getPlaybackSuppressionReason();
    long getCurrentPosition();
    long getBufferedPosition();

    class Events {
        public boolean containsAny(int... events) { throw new AssertionError(); }
    }
}
