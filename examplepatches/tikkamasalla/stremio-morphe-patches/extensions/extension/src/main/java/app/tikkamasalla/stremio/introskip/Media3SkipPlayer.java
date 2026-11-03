package app.tikkamasalla.stremio.introskip;

import android.net.Uri;
import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.ForwardingPlayer;
import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaMetadata;
import androidx.media3.common.Player;
import androidx.media3.common.Tracks;
import androidx.media3.common.text.Cue;
import androidx.media3.common.text.CueGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Media3/ExoPlayer implementation of {@link SkipPlayer}: the only class that touches androidx.media3. */
public final class Media3SkipPlayer implements SkipPlayer {

    private final Player player;
    private SkipPlayer.Logger logger;

    private SkipPlayer.Listener currentListener;

    private boolean exoLookedUp;
    private Object exoInternal;
    private Method exoSetSeek;
    private Object exoExact;
    private Object exoOriginal;

    /** A proxy (see {@link Media3Listeners}): no desugared Player$Listener$-CC reference. */
    private final Player.Listener media3Listener = Media3Listeners.create(new Media3Listeners.Sink() {
        @Override
        public void onEvent(String name, Object[] args) {
            if (currentListener == null) return;
            if ("onPositionDiscontinuity".equals(name) && args.length == 3
                    && args[0] instanceof Player.PositionInfo && args[1] instanceof Player.PositionInfo) {
                int reason = ((Integer) args[2]).intValue();
                if (reason == Player.DISCONTINUITY_REASON_SEEK || reason == Player.DISCONTINUITY_REASON_SEEK_ADJUSTMENT) {
                    boolean adjusted = (reason == Player.DISCONTINUITY_REASON_SEEK_ADJUSTMENT);
                    currentListener.onSeekLanding(adjusted, ((Player.PositionInfo) args[0]).positionMs,
                            ((Player.PositionInfo) args[1]).positionMs);
                }
            } else if ("onTracksChanged".equals(name) && args.length == 1) {
                currentListener.onTracksChanged();
            } else if ("onCues".equals(name) && args.length == 1 && args[0] instanceof CueGroup) {
                CueGroup cueGroup = (CueGroup) args[0];
                List<CharSequence> texts = new ArrayList<CharSequence>();
                if (cueGroup.cues != null) {
                    for (Object item : cueGroup.cues) {
                        if (item instanceof Cue) {
                            CharSequence text = ((Cue) item).text;
                            if (text != null) {
                                texts.add(text);
                            }
                        }
                    }
                }
                currentListener.onCueTexts(texts);
            } else if ("onRenderedFirstFrame".equals(name)) {
                currentListener.onFirstFrameRendered();
            } else if ("onIsPlayingChanged".equals(name) && args.length == 1 && args[0] instanceof Boolean) {
                currentListener.onIsPlayingChanged(((Boolean) args[0]).booleanValue());
            } else if ("onPlaybackStateChanged".equals(name) && args.length == 1 && args[0] instanceof Integer) {
                currentListener.onPlaybackStateChanged(((Integer) args[0]).intValue());
            }
        }
    });

    public Media3SkipPlayer(Player player) {
        this.player = player;
    }

    @Override
    public void setLogger(SkipPlayer.Logger logger) {
        this.logger = logger;
    }

    @Override
    public void setListener(SkipPlayer.Listener listener) {
        if (this.currentListener != null) {
            player.removeListener(media3Listener);
        }
        this.currentListener = listener;
        if (this.currentListener != null) {
            player.addListener(media3Listener);
        }
    }

    @Override
    public int playbackState() {
        return player.getPlaybackState();
    }

    @Override
    public boolean playerError() {
        try {
            return player.getPlayerError() != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    @Override
    public boolean isPlaying() {
        return player.isPlaying();
    }

    @Override
    public boolean playWhenReady() {
        return player.getPlayWhenReady();
    }

    @Override
    public long positionMs() {
        return player.getCurrentPosition();
    }

    @Override
    public long durationMs() {
        return player.getDuration();
    }

    @Override
    public void seekTo(long targetMs) {
        player.seekTo(targetMs);
    }

    @Override
    public boolean beginExactSeek() {
        if (!exoLookedUp) {
            exoLookedUp = true;
            try {
                Player raw = unwrapExoPlayer(player);
                Field internal = raw == null ? null : findField(raw.getClass(), "internalPlayer");
                Field params = raw == null ? null : findField(raw.getClass(), "seekParameters");
                if (internal != null && params != null) {
                    Class<?> type = params.getType();
                    exoInternal = internal.get(raw);
                    exoOriginal = params.get(raw);
                    exoExact = type.getField("EXACT").get(null);
                    exoSetSeek = exoInternal.getClass().getMethod("setSeekParameters", type);
                }
            } catch (Throwable error) {
                if (logger != null) {
                    logger.log("Exact seek unavailable: " + error);
                }
                exoInternal = null;
            }
        }
        if (exoInternal != null && exoSetSeek != null) {
            try {
                exoSetSeek.invoke(exoInternal, exoExact);
                return true;
            } catch (Throwable error) {
                return false;
            }
        }
        return false;
    }

    @Override
    public void endExactSeek() {
        if (exoInternal != null && exoSetSeek != null && exoOriginal != null) {
            try {
                exoSetSeek.invoke(exoInternal, exoOriginal);
            } catch (Throwable ignored) {
            }
        }
    }

    @Override
    public String mediaIdentity() {
        MediaItem item = player.getCurrentMediaItem();
        if (item == null) return "";
        String id = safe(item.mediaId);
        String uriStr = item.localConfiguration == null ? "" : String.valueOf(item.localConfiguration.uri);
        return id + "|" + uriStr;
    }

    @Override
    public Uri mediaUri() {
        try {
            MediaItem item = player.getCurrentMediaItem();
            if (item == null || item.localConfiguration == null) return null;
            return item.localConfiguration.uri;
        } catch (Throwable error) {
            return null;
        }
    }

    @Override
    public List<TextTrack> textTracks() {
        List<TextTrack> result = new ArrayList<TextTrack>();
        Tracks tracks = player.getCurrentTracks();
        for (Tracks.Group g : tracks.getGroups()) {
            if (g.getType() != C.TRACK_TYPE_TEXT) continue;
            for (int i = 0; i < g.length; i++) {
                Format f = g.getTrackFormat(i);
                String id = f == null ? null : f.id;
                result.add(new TextTrack(id, g.isTrackSelected(i)));
            }
        }
        return result;
    }

    @Override
    public MediaHint mediaHint() {
        MediaItem item = player.getCurrentMediaItem();
        MediaMetadata playerMetadata = player.getMediaMetadata();
        MediaMetadata itemMetadata = item == null ? null : item.mediaMetadata;
        MediaItem.LocalConfiguration local = item == null ? null : item.localConfiguration;
        MediaItem.RequestMetadata request = item == null ? null : item.requestMetadata;

        MediaHint hint = new MediaHint();
        hint.hasItem = item != null;
        hint.mediaId = item == null ? null : item.mediaId;

        hint.playerMeta = toMeta(playerMetadata);
        hint.itemMeta = toMeta(itemMetadata);

        hint.hasLocal = local != null;
        if (local != null) {
            hint.uri = local.uri;
            hint.mimeType = local.mimeType;
            hint.customCacheKey = local.customCacheKey;
            hint.tag = local.tag;
        }

        hint.hasRequest = request != null;
        if (request != null) {
            hint.requestUri = request.mediaUri;
            hint.requestSearchQuery = request.searchQuery;
            hint.requestExtras = request.extras;
        }

        hint.reflectionRoots = new Object[]{ player, item };
        return hint;
    }

    @Override
    public boolean sameAs(SkipPlayer other) {
        if (other instanceof Media3SkipPlayer) {
            return ((Media3SkipPlayer) other).player == this.player;
        }
        return false;
    }

    @Override
    public String engineName() {
        return player.getClass().getName();
    }

    private SkipPlayer.Meta toMeta(MediaMetadata mm) {
        if (mm == null) return null;
        SkipPlayer.Meta m = new SkipPlayer.Meta();
        m.title = mm.title;
        m.displayTitle = mm.displayTitle;
        m.albumTitle = mm.albumTitle;
        m.albumArtist = mm.albumArtist;
        m.artist = mm.artist;
        m.description = mm.description;
        m.subtitle = mm.subtitle;
        m.extras = mm.extras;
        m.trackNumber = mm.trackNumber;
        return m;
    }

    private static Player unwrapExoPlayer(Player root) {
        Player current = root;
        for (int depth = 0; depth < 6 && current != null; depth++) {
            if (findField(current.getClass(), "internalPlayer") != null) return current;
            if (current instanceof ForwardingPlayer) {
                Player next = ((ForwardingPlayer) current).getWrappedPlayer();
                if (next != null && next != current) {
                    current = next;
                    continue;
                }
            }
            Player found = null;
            for (Class<?> c = current.getClass(); c != null && c != Object.class && found == null; c = c.getSuperclass()) {
                try {
                    for (Field f : c.getDeclaredFields()) {
                        if (!Player.class.isAssignableFrom(f.getType())) continue;
                        f.setAccessible(true);
                        Object val = f.get(current);
                        if (val instanceof Player && val != current) {
                            found = (Player) val;
                            break;
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
            if (found != null) current = found;
            else break;
        }
        return current;
    }

    private static Field findField(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // Try the superclass.
            }
        }
        return null;
    }

    private static String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
