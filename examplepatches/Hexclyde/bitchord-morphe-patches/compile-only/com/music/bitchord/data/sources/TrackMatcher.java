package com.music.bitchord.data.sources;

/** Compile-only host signature; verified against every patched APK. Never packaged. */
public final class TrackMatcher {
    /** Compile-only host signature. */
    public static final class Target {
        public final String title, artist;
        public final Integer durationSec;

        private Target() {
            title = artist = null;
            durationSec = null;
        }
    }
}
