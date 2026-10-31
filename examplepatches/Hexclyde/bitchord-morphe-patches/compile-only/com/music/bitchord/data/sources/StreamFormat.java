package com.music.bitchord.data.sources;

/** Compile-only host signature; verified against every patched APK. Never packaged. */
public final class StreamFormat {
    public final String codec;
    public final Integer bitDepth, kbps;

    private StreamFormat() {
        codec = null;
        bitDepth = kbps = null;
    }
}
