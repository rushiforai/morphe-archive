package com.google.android.exoplayer2;

/**
 * Compile-time stub for ExoPlayer Format.
 */
public final class Format {
    public static final int NO_VALUE = -1;

    public final String id;
    public final String label;
    public final String language;
    public final int averageBitrate;
    public final int peakBitrate;
    public final int bitrate;
    public final String codecs;
    public final String sampleMimeType;
    public final int width;
    public final int height;
    public final float frameRate;

    public Format(
            String id,
            String label,
            String language,
            int width,
            int height,
            float frameRate,
            int bitrate,
            String codecs,
            String sampleMimeType) {
        this.id = id;
        this.label = label;
        this.language = language;
        this.averageBitrate = bitrate;
        this.peakBitrate = bitrate;
        this.bitrate = bitrate;
        this.codecs = codecs;
        this.sampleMimeType = sampleMimeType;
        this.width = width;
        this.height = height;
        this.frameRate = frameRate;
    }

    private Format() {
        this(null, null, null, NO_VALUE, NO_VALUE, NO_VALUE, NO_VALUE, null, null);
    }
}
