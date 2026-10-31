package androidx.media3.common;

/** Compile-only host signature; never bundled in the extension. */
public final class Format {
    public static final int NO_VALUE = -1;

    public final String sampleMimeType;
    public final int channelCount;
    public final int channelMask;
    public final int sampleRate;
    public final int pcmEncoding;

    private Format() {
        sampleMimeType = null;
        channelCount = sampleRate = pcmEncoding = channelMask = NO_VALUE;
    }

    public Builder buildUpon() {
        throw new UnsupportedOperationException();
    }

    /** Compile-only host signature. R8 made these fields public and removed the setters. */
    public static final class Builder {
        public int channelCount;
        public int channelMask;

        public Format build() {
            throw new UnsupportedOperationException();
        }
    }
}
