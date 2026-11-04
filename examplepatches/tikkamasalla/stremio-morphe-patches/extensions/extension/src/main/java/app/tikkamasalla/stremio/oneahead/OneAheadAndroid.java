package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.AppFfmpegDecoder;
import app.tikkamasalla.stremio.oneahead.demux.AudioDecoder;
import app.tikkamasalla.stremio.oneahead.demux.DemuxLog;
import app.tikkamasalla.stremio.oneahead.demux.HttpRangeSource;
import app.tikkamasalla.stremio.oneahead.demux.MediaCodecAudioDecoder;
import app.tikkamasalla.stremio.oneahead.demux.SoftwareDecoders;

/** The thin Android adapter: thread priority and the decoder factory. All logic stays plain Java. */
public final class OneAheadAndroid {
    private OneAheadAndroid() {}

    /** Call once on the runner thread: background priority, below the player's threads. */
    public static void lowerPriority() { MediaCodecAudioDecoder.lowerThreadPriority(); }

    /** Software decoders only: a hardware Dolby decoder the player may be using is never contended. */
    public static AudioDecoder.Factory decoders(DemuxLog log) {
        return new SoftwareDecoders(new MediaCodecAudioDecoder.Factory(false), new AppFfmpegDecoder.Factory(log));
    }

    /** One paced connection per file. The URL is used here and never logged or stored. */
    public static HttpRangeSource source(String url, app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard guard,
                                         app.tikkamasalla.stremio.oneahead.demux.ByteBudget budget) {
        return source(url, guard, budget, OneAheadPlanner.PACE_INTERNAL_BPS);
    }

    /** One paced connection per file at an explicit rate (external players get the slower pace). */
    public static HttpRangeSource source(String url, app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard guard,
                                         app.tikkamasalla.stremio.oneahead.demux.ByteBudget budget, long paceBps) {
        return new HttpRangeSource(url, guard, budget, paceBps, null, "Stremio");
    }
}
