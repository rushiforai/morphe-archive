package app.tikkamasalla.stremio.introskip;

import android.net.Uri;
import android.os.Bundle;

import java.util.List;

/**
 * The only door the skip engine (IntroSkipBridge.Session) uses to reach a player. One
 * implementation per engine family: {@link Media3SkipPlayer} wraps today's Media3/ExoPlayer
 * access (Stremio TV 1.6.12 .. 1.10.x); other engines implement the same contract.
 *
 * <p>All methods are called on the main thread, may throw (the caller treats any Throwable as
 * "player gone"), and must not block. Positions and durations are milliseconds; the duration is
 * {@code <= 0} (Media3: TIME_UNSET) while unknown. Playback states use the Media3 numbering.
 */
public interface SkipPlayer {
    int STATE_IDLE = 1;
    int STATE_BUFFERING = 2;
    int STATE_READY = 3;
    int STATE_ENDED = 4;

    /** Receives engine events; called on the main thread. */
    interface Listener {
        /** A seek landed: {@code adjusted} when the engine moved it to a keyframe near the target. */
        void onSeekLanding(boolean adjusted, long fromMs, long toMs);

        /** The available or selected tracks changed. */
        void onTracksChanged();

        /** The subtitle cues currently on screen (never null; entries without text are dropped). */
        void onCueTexts(List<CharSequence> texts);

        /** The first frame of the current media reached the surface (engines that cannot say never call it). */
        void onFirstFrameRendered();

        /** Playback of moving picture started or stopped (engines that cannot say never call it). */
        void onIsPlayingChanged(boolean isPlaying);

        /** The playback state changed to one of the STATE_* values (engines that cannot say never call it). */
        void onPlaybackStateChanged(int state);
    }

    /** Diagnostics sink for the implementation (same log as the session). */
    interface Logger {
        void log(String message);
    }

    /** A text track whose id may be a subtitle URL. */
    final class TextTrack {
        public final String id;
        public final boolean selected;

        public TextTrack(String id, boolean selected) {
            this.id = id;
            this.selected = selected;
        }
    }

    /** A MediaMetadata-like snapshot; any field may be null. */
    final class Meta {
        public CharSequence title;
        public CharSequence displayTitle;
        public CharSequence albumTitle;
        public CharSequence albumArtist;
        public CharSequence artist;
        public CharSequence description;
        public CharSequence subtitle;
        public Bundle extras;
        public Integer trackNumber;
    }

    /** What the engine knows about the current media (metadata, ids, uris), for title/episode guessing. */
    final class MediaHint {
        /** False when the player has no current media item (all the item fields below are then null/false). */
        public boolean hasItem;
        public String mediaId;
        /** The player-level and the item-level metadata. */
        public Meta playerMeta;
        public Meta itemMeta;
        /** The item has a playback configuration (uri, mime type, cache key, tag). */
        public boolean hasLocal;
        public Uri uri;
        public String mimeType;
        public String customCacheKey;
        public Object tag;
        /** The item has request metadata. */
        public boolean hasRequest;
        public Uri requestUri;
        public String requestSearchQuery;
        public Bundle requestExtras;
        /** Objects whose fields the engine-agnostic reflection scan may walk (player, item). */
        public Object[] reflectionRoots;
    }

    /** Sets the diagnostics sink (the session installs its log before use); null silences it. */
    void setLogger(Logger logger);

    /** Installs the listener, replacing any earlier one; null removes it. */
    void setListener(Listener listener);

    /** One of the STATE_* values. */
    int playbackState();

    /** True while the engine holds a playback error for the current media (engines that cannot say return false). */
    boolean playerError();

    boolean isPlaying();

    boolean playWhenReady();

    long positionMs();

    long durationMs();

    /** Seeks to the position; the engine's own seek mode applies. */
    void seekTo(long targetMs);

    /**
     * Asks the engine to make the NEXT {@link #seekTo} frame-exact (Media3: SeekParameters.EXACT
     * on the playback thread). Returns false when the engine cannot, and then the seek is the
     * engine's default. After a true result the caller must call {@link #endExactSeek()} once the
     * seek has landed.
     */
    boolean beginExactSeek();

    /** Restores the seek mode that {@link #beginExactSeek()} replaced; harmless when nothing changed. */
    void endExactSeek();

    /**
     * "id|uri" of the current media, empty when there is none; changes when the media changes.
     * The id is trimmed, the uri part is empty without a playback configuration.
     */
    String mediaIdentity();

    /** The current media's uri (for reading the file's chapters), or null. */
    Uri mediaUri();

    /** The text tracks of the current media, in the engine's order. */
    List<TextTrack> textTracks();

    /** A snapshot of the current media's metadata. */
    MediaHint mediaHint();

    /** True when both wrap the same underlying player. */
    boolean sameAs(SkipPlayer other);

    /** Class name of the underlying player, for logs and the hook priority. */
    String engineName();
}
