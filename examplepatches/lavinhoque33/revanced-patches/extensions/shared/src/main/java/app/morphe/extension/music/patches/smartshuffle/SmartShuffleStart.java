/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

/** A scoped user command must be followed by its own committed native playback, never merely a restored queue. */
final class SmartShuffleStart {
    final String playlistId;
    final long revision;
    private String videoId;

    SmartShuffleStart(String playlistId, long revision) {
        this.playlistId = normalize(playlistId);
        this.revision = revision;
    }

    void playbackStarted(String videoId) {
        this.videoId = videoId;
    }

    boolean matches(long revision, String playlistId, String currentVideoId) {
        return this.revision == revision && videoId != null && !videoId.isEmpty()
                && !this.playlistId.isEmpty() && !this.playlistId.startsWith("RD")
                && this.playlistId.equals(normalize(playlistId)) && videoId.equals(currentVideoId);
    }

    static String normalize(String playlistId) {
        if (playlistId == null) return "";
        return playlistId.startsWith("VL") ? playlistId.substring(2) : playlistId;
    }
}
