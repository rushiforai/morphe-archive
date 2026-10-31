package androidx.media3.common;

/** Compile-only host signature; never bundled in the extension. */
public final class PlaybackParameters {
    // Not a constant, so reads of it aren't folded in at compile time.
    public final float speed;

    public PlaybackParameters(float speed) {
        this.speed = speed;
    }
}
