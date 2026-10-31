package com.music.bitchord.data;

/** Public fields verified in the optimized BitChord 1.8.1 APK. Never packaged. */
public final class NerdStats {
    /** The format the chosen stream declared for a song, or null. */
    public static com.music.bitchord.data.sources.StreamFormat declaredFormat(String mediaId) {
        return null;
    }

    public static final class Snapshot {
        public final String mimeType, sourceName;
        public final Integer bitrateKbps;

        public Snapshot(String mime, Integer bitrate, String source) {
            mimeType = mime;
            bitrateKbps = bitrate;
            sourceName = source;
        }
    }
}
