package androidx.media3.common;

/** Compile-only host signatures; verified against every patched APK. */
public interface Player {
    int STATE_BUFFERING = 2;
    int STATE_READY = 3;

    MediaItem getCurrentMediaItem();

    boolean isPlaying();

    long getDuration();

    long getCurrentPosition();

    void replaceMediaItem(int index, MediaItem mediaItem);

    void seekTo(int mediaItemIndex, long positionMs);

    void prepare();

    int getCurrentMediaItemIndex();

    android.os.Looper getApplicationLooper();

    PlaybackParameters getPlaybackParameters();

    int getPlaybackState();
}
