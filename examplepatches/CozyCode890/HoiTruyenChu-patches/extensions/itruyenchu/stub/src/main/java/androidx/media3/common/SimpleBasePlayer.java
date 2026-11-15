package androidx.media3.common;

import android.os.Looper;

import com.google.common.util.concurrent.ListenableFuture;

import java.util.List;

/** Compile-time stub of media3 SimpleBasePlayer, the real class is in the patched app. */
public abstract class SimpleBasePlayer implements Player {
    protected SimpleBasePlayer(Looper applicationLooper) {
        throw new UnsupportedOperationException("Stub");
    }

    @Override
    public final Looper getApplicationLooper() {
        throw new UnsupportedOperationException("Stub");
    }

    protected abstract State getState();

    protected final void invalidateState() {
        throw new UnsupportedOperationException("Stub");
    }

    protected ListenableFuture<?> handleSetPlayWhenReady(boolean playWhenReady) {
        throw new UnsupportedOperationException("Stub");
    }

    protected ListenableFuture<?> handleRelease() {
        throw new UnsupportedOperationException("Stub");
    }

    protected ListenableFuture<?> handleSeek(int mediaItemIndex, long positionMs, int seekCommand) {
        throw new UnsupportedOperationException("Stub");
    }

    public interface PositionSupplier {
        long get();
    }

    public static final class MediaItemData {
        public static final class Builder {
            public Builder(Object uid) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setMediaItem(MediaItem mediaItem) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setMediaMetadata(MediaMetadata mediaMetadata) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setDurationUs(long durationUs) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setIsSeekable(boolean isSeekable) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setIsPlaceholder(boolean isPlaceholder) {
                throw new UnsupportedOperationException("Stub");
            }

            public MediaItemData build() {
                throw new UnsupportedOperationException("Stub");
            }
        }
    }

    public static final class State {
        public static final class Builder {
            public Builder() {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setAvailableCommands(Player.Commands availableCommands) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setPlayWhenReady(boolean playWhenReady, int reason) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setPlaybackState(int playbackState) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setIsLoading(boolean isLoading) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setPlaylist(List<MediaItemData> playlist) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setCurrentMediaItemIndex(int index) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setContentPositionMs(PositionSupplier supplier) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setContentBufferedPositionMs(PositionSupplier supplier) {
                throw new UnsupportedOperationException("Stub");
            }

            public Builder setPositionDiscontinuity(int reason, long discontinuityPositionMs) {
                throw new UnsupportedOperationException("Stub");
            }

            public State build() {
                throw new UnsupportedOperationException("Stub");
            }
        }
    }
}
