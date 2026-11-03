package app.tikkamasalla.stremio.introskip;

import android.net.Uri;

import java.util.Collections;
import java.util.List;

/**
 * {@link SkipPlayer} for the Compose builds (TV 1.10.x / 1.12.x): the app's own player interface
 * (Exo, mpv, LibVLC, YouTube engines; all report milliseconds) through the stubs the patch generates
 * in {@link PortHooks}, plus the core's load/model events for identity and metadata. No Media3 type.
 */
public final class PortSkipPlayer implements SkipPlayer {
    private static final long MAX_TIME_MS = 100L * 24 * 60 * 60 * 1000; // 100 days
    private static final long TIME_UNSET = Long.MIN_VALUE + 1;

    private final Object engine;
    private Listener listener;
    private Logger logger;

    public PortSkipPlayer(Object engine) {
        this.engine = engine;
    }

    public Object engine() {
        return engine;
    }

    @Override
    public void setLogger(Logger logger) {
        this.logger = logger;
    }

    @Override
    public void setListener(Listener listener) {
        this.listener = listener;
    }

    @Override
    public int playbackState() {
        if (!PortHooks.isLoaded()) {
            return STATE_IDLE;
        }
        if (durationMs() > 0) {
            return STATE_READY;
        }
        return STATE_BUFFERING;
    }

    @Override
    public boolean playerError() {
        // The generated player stubs expose no error state, so a dead stream is caught by the timer only.
        return false;
    }

    @Override
    public boolean isPlaying() {
        return playbackState() == STATE_READY && playWhenReady() && !PortHooks.corePaused();
    }

    @Override
    public boolean playWhenReady() {
        if (PortHooks.hasPlayingStub()) {
            return PortHooks.playingImpl(engine);
        }
        return !PortHooks.corePaused();
    }

    @Override
    public long positionMs() {
        long t = PortHooks.timeImpl(engine);
        if (t >= 0 && t != TIME_UNSET && t < MAX_TIME_MS) {
            return t;
        }
        long coreEst = PortHooks.coreTimeEstimateMs();
        if (coreEst >= 0 && coreEst < MAX_TIME_MS) {
            return coreEst;
        }
        return 0;
    }

    @Override
    public long durationMs() {
        long d = PortHooks.durationImpl(engine);
        if (d > 0 && d < MAX_TIME_MS) {
            return d;
        }
        long coreD = PortHooks.coreDurationMs();
        if (coreD > 0) {
            return coreD;
        }
        return -1;
    }

    @Override
    public void seekTo(long targetMs) {
        long clampedMs = Math.max(0, targetMs);
        if (!PortHooks.seekImpl(engine, clampedMs)) {
            throw new IllegalStateException("no seek on this engine");
        }
    }

    @Override
    public boolean beginExactSeek() {
        return false;
    }

    @Override
    public void endExactSeek() {
        // Frame-exact seek is not portable to the renamed engines.
    }

    @Override
    public String mediaIdentity() {
        if (!PortHooks.isLoaded()) {
            return "";
        }
        String type = PortHooks.streamType();
        String id = PortHooks.streamId();
        String url = PortHooks.streamUrl();

        type = (type != null) ? type : "";
        id = (id != null) ? id.trim() : "";
        url = (url != null) ? url : "";

        return type + ":" + id + "|" + url;
    }

    @Override
    public Uri mediaUri() {
        String url = PortHooks.streamUrl();
        if (url != null && (url.startsWith("http://") || url.startsWith("https://"))) {
            return Uri.parse(url);
        }
        return null;
    }

    @Override
    public List<TextTrack> textTracks() {
        return Collections.emptyList();
    }

    @Override
    public MediaHint mediaHint() {
        MediaHint hint = new MediaHint();
        String id = PortHooks.streamId();

        hint.hasItem = PortHooks.isLoaded() && id != null && !id.isEmpty();
        hint.mediaId = id;

        hint.playerMeta = new Meta();
        hint.playerMeta.title = PortHooks.metaTitle();

        hint.itemMeta = new Meta();
        String vTitle = PortHooks.videoTitle();
        hint.itemMeta.title = (vTitle != null && vTitle.isEmpty()) ? null : vTitle;

        Uri uri = mediaUri();
        hint.hasLocal = (uri != null);
        hint.uri = uri;
        hint.mimeType = null;
        hint.hasRequest = false;
        hint.reflectionRoots = null;

        return hint;
    }

    @Override
    public boolean sameAs(SkipPlayer other) {
        if (other instanceof PortSkipPlayer) {
            return ((PortSkipPlayer) other).engine == this.engine;
        }
        return false;
    }

    @Override
    public String engineName() {
        return engine.getClass().getName();
    }
}
