package com.google.android.exoplayer2;

/**
 * Compile-time stub for ExoPlayer.
 */
public interface ExoPlayer {
    int STATE_IDLE = 1;
    int STATE_BUFFERING = 2;
    int STATE_READY = 3;
    int STATE_ENDED = 4;

    Format getVideoFormat();
    Format getAudioFormat();
    Tracks getCurrentTracks();
    boolean isPlaying();
    int getPlaybackState();
    long getTotalBufferedDuration();
    long getCurrentPosition();
    long getDuration();
}
