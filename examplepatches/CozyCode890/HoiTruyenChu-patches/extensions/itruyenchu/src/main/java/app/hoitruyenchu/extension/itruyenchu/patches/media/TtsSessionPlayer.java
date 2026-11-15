package app.hoitruyenchu.extension.itruyenchu.patches.media;

import android.graphics.Bitmap;
import android.os.Handler;
import android.util.Log;

import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaMetadata;
import androidx.media3.common.Player;
import androidx.media3.common.SimpleBasePlayer;

import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;

import app.hoitruyenchu.extension.itruyenchu.patches.tts.ReadingProgress;
import app.hoitruyenchu.extension.itruyenchu.patches.tts.TtsController;

/** A media3 player that shows the TTS reading instead of the silent file of the voice bar. */
final class TtsSessionPlayer extends SimpleBasePlayer {
    private static final String MEDIA_ID = "itruyenchu-tts";
    /** MediaMetadata.PICTURE_TYPE_FRONT_COVER */
    private static final int PICTURE_TYPE_FRONT_COVER = 3;

    private final Object service;
    private final Handler handler;
    private volatile boolean released;

    private int reportedSerial = -1;

    // Cached artwork conversion.
    private Bitmap artworkBitmap;
    private byte[] artworkBytes;

    TtsSessionPlayer(Object service, Player inner) {
        super(inner.getApplicationLooper());
        this.service = service;
        this.handler = new Handler(inner.getApplicationLooper());
    }

    boolean isReleased() {
        return released;
    }

    /** Re-reads the state; may be called from any thread. */
    void refresh() {
        if (released) return;
        handler.post(() -> {
            if (released) return;
            try {
                invalidateState();
            } catch (Throwable t) {
                Log.w(TtsMediaSession.TAG, "invalidateState failed", t);
            }
        });
    }

    @Override
    protected State getState() {
        boolean playing = TtsMediaSession.displayedPlaying(TtsController.isReading());
        long durationMs = ReadingProgress.durationMs();
        MediaMetadata metadata = buildMetadata();
        MediaItem item = new MediaItem.Builder()
                .setMediaId(MEDIA_ID)
                .setMediaMetadata(metadata)
                .build();
        MediaItemData data = new MediaItemData.Builder(MEDIA_ID)
                .setMediaItem(item)
                .setMediaMetadata(metadata)
                .setDurationUs(durationMs > 0 ? durationMs * 1000 : ReadingProgress.TIME_UNSET)
                .setIsSeekable(false)
                .setIsPlaceholder(false)
                .build();
        Player.Commands commands = new Player.Commands.Builder()
                .add(Player.COMMAND_PLAY_PAUSE)
                .add(Player.COMMAND_SEEK_TO_PREVIOUS)
                .add(Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)
                .add(Player.COMMAND_SEEK_TO_NEXT)
                .add(Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM)
                .add(Player.COMMAND_GET_CURRENT_MEDIA_ITEM)
                .add(Player.COMMAND_GET_TIMELINE)
                .add(Player.COMMAND_GET_METADATA)
                .add(Player.COMMAND_RELEASE)
                .build();
        PositionSupplier position = ReadingProgress::positionMs;
        State.Builder state = new State.Builder()
                .setAvailableCommands(commands)
                .setPlaylist(Collections.singletonList(data))
                .setCurrentMediaItemIndex(0)
                .setPlayWhenReady(playing, Player.PLAY_WHEN_READY_CHANGE_REASON_USER_REQUEST)
                .setPlaybackState(Player.STATE_READY)
                .setIsLoading(false)
                .setContentPositionMs(position)
                .setContentBufferedPositionMs(position);
        // A new line: the estimated position may jump, make the widget take the new one.
        int serial = ReadingProgress.serial();
        if (serial != reportedSerial) {
            reportedSerial = serial;
            state.setPositionDiscontinuity(Player.DISCONTINUITY_REASON_INTERNAL, ReadingProgress.positionMs());
        }
        return state.build();
    }

    @Override
    protected ListenableFuture<?> handleSetPlayWhenReady(boolean playWhenReady) {
        try {
            TtsMediaSession.onPlayPause(playWhenReady);
        } catch (Throwable t) {
            Log.w(TtsMediaSession.TAG, "play/pause failed", t);
        }
        return Futures.immediateVoidFuture();
    }

    /**
     * Next / previous buttons. With a single item media3 still calls this (index -1 when there is
     * nothing to seek to), the command tells which button it was.
     */
    @Override
    protected ListenableFuture<?> handleSeek(int mediaItemIndex, long positionMs, int seekCommand) {
        try {
            switch (seekCommand) {
                case Player.COMMAND_SEEK_TO_NEXT:
                case Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM:
                    TtsMediaSession.onSkip(true);
                    break;
                case Player.COMMAND_SEEK_TO_PREVIOUS:
                case Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM:
                    TtsMediaSession.onSkip(false);
                    break;
                default:
                    break;
            }
        } catch (Throwable t) {
            Log.w(TtsMediaSession.TAG, "seek failed", t);
        }
        return Futures.immediateVoidFuture();
    }

    @Override
    protected ListenableFuture<?> handleRelease() {
        released = true;
        return Futures.immediateVoidFuture();
    }

    // ---------------------------------------------------------------------------------------------
    // Title / artwork set by the app through setActiveForLockScreen(metadata)

    private static Field metadataField;
    private static Field artworkField;

    private MediaMetadata buildMetadata() {
        String title = null;
        String book = null;
        Bitmap artwork = null;
        try {
            Class<?> cls = service.getClass();
            if (metadataField == null) {
                metadataField = cls.getDeclaredField("currentMetadata");
                metadataField.setAccessible(true);
            }
            if (artworkField == null) {
                artworkField = cls.getDeclaredField("currentArtwork");
                artworkField.setAccessible(true);
            }
            Object metadata = metadataField.get(service);
            if (metadata != null) {
                title = call(metadata, "getTitle");
                book = call(metadata, "getAlbumTitle");
                if (book == null) book = call(metadata, "getArtist");
            }
            Object bitmap = artworkField.get(service);
            if (bitmap instanceof Bitmap) artwork = (Bitmap) bitmap;
        } catch (Throwable t) {
            // Show the reading without title.
        }

        String subtitle = book;
        int[] line = ReadingProgress.lineInfo();
        if (line != null) {
            String progress = "Dòng " + line[0] + "/" + line[1];
            subtitle = subtitle == null || subtitle.isEmpty() ? progress : subtitle + " · " + progress;
        }

        MediaMetadata.Builder builder = new MediaMetadata.Builder();
        if (title != null) builder.setTitle(title).setDisplayTitle(title);
        if (subtitle != null) builder.setArtist(subtitle);
        if (book != null) builder.setAlbumTitle(book);
        byte[] art = artworkBytes(artwork);
        if (art != null) builder.setArtworkData(art, PICTURE_TYPE_FRONT_COVER);
        return builder.build();
    }

    private byte[] artworkBytes(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled()) return null;
        if (bitmap != artworkBitmap) {
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, 90, out);
                artworkBytes = out.toByteArray();
            } catch (Throwable t) {
                artworkBytes = null;
            }
            artworkBitmap = bitmap;
        }
        return artworkBytes;
    }

    private static String call(Object target, String getter) {
        try {
            Method m = target.getClass().getMethod(getter);
            Object value = m.invoke(target);
            return value != null ? value.toString() : null;
        } catch (Throwable t) {
            return null;
        }
    }
}
