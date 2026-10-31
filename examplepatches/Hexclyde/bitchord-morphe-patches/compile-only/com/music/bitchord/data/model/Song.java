package com.music.bitchord.data.model;

/** Compile-only host signature; verified against every patched APK. Never packaged. */
public final class Song {
    public final String videoId, title, artist, durationText;

    private Song() {
        videoId = title = artist = durationText = null;
    }
}
