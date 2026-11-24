package app.morphed.extension.twitch.diag;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * What the watched player did, worked out from samples taken a few times a second: the lines worth logging. Plain
 * values in, lines out (tested without a player).
 * <ul>
 *     <li>Its state changing, and how long a stall (BUFFERING) lasted.</li>
 *     <li>The picture frozen while the player says PLAYING: its position not moving.</li>
 *     <li>Frames dropped in bursts, and its quality changing.</li>
 *     <li>Every SUMMARY_MS a summary: quality, buffer ahead, latency, frames, bitrate.</li>
 * </ul>
 */
public final class VideoTracker {
    /** The position not moving this long while PLAYING is a frozen picture. */
    static final long STUCK_MS = 1_000;
    /** Dropped frames within one sample that count as a burst. */
    static final int DROPPED_BURST = 8;
    static final long SUMMARY_MS = 10_000;

    /** One look at the player. Times in ms; -1 where the player didn't say. */
    public static final class Sample {
        final long at;
        final String state, quality;
        final long position, buffered, latency, bandwidth;
        final int decoded, rendered, dropped, frameRate, bitrate;

        public Sample(long at, String state, String quality, long position, long buffered, long latency, long bandwidth,
                      int decoded, int rendered, int dropped, int frameRate, int bitrate) {
            this.at = at;
            this.state = state;
            this.quality = quality;
            this.position = position;
            this.buffered = buffered;
            this.latency = latency;
            this.bandwidth = bandwidth;
            this.decoded = decoded;
            this.rendered = rendered;
            this.dropped = dropped;
            this.frameRate = frameRate;
            this.bitrate = bitrate;
        }
    }

    private Sample last;
    private String state;
    private long stateSince;
    private long positionSince; // when the position last moved (while PLAYING)
    private boolean stuck;
    private long summaryAt;
    private Sample summaryFrom;

    /** A new player (another stream, or the same one loaded again): what's known of the last one is dropped. */
    public void reset() {
        last = null;
        state = null;
        stuck = false;
        summaryFrom = null;
    }

    public List<String> feed(Sample s) {
        List<String> lines = new ArrayList<>();
        if (last == null) {
            lines.add("Video: " + s.state + " " + describe(s));
            state = s.state;
            stateSince = s.at;
            positionSince = s.at;
            summaryAt = s.at;
            summaryFrom = s;
            last = s;
            return lines;
        }

        if (!s.state.equals(state)) {
            long lasted = s.at - stateSince;
            String was = state;
            lines.add("Video: " + s.state + " after " + seconds(lasted) + " " + was
                    + ("BUFFERING".equals(was) ? " (a stall)" : "") + ", " + describe(s));
            state = s.state;
            stateSince = s.at;
            positionSince = s.at;
            if (stuck) {
                stuck = false;
            }
        }

        if ("PLAYING".equals(s.state) && s.position >= 0 && last.position >= 0) {
            if (s.position != last.position) {
                if (stuck) {
                    lines.add("Video: picture moving again after " + seconds(s.at - positionSince) + " frozen, "
                            + describe(s));
                    stuck = false;
                }
                positionSince = s.at;
            } else if (!stuck && s.at - positionSince >= STUCK_MS) {
                stuck = true;
                lines.add("Video: picture frozen while PLAYING (position " + seconds(s.position)
                        + " not moving for " + seconds(s.at - positionSince) + "), " + describe(s));
            }
        }

        if (s.dropped >= 0 && last.dropped >= 0 && s.dropped - last.dropped >= DROPPED_BURST) {
            lines.add("Video: " + (s.dropped - last.dropped) + " frames dropped in " + seconds(s.at - last.at)
                    + " (decoder or screen too slow), " + describe(s));
        }

        if (s.quality != null && last.quality != null && !s.quality.equals(last.quality)) {
            lines.add("Video: quality " + last.quality + " -> " + s.quality);
        }

        if (s.at - summaryAt >= SUMMARY_MS) {
            lines.add(summary(summaryFrom, s));
            summaryAt = s.at;
            summaryFrom = s;
        }
        last = s;
        return lines;
    }

    /** The state of things now, for an event line. */
    static String describe(Sample s) {
        StringBuilder out = new StringBuilder();
        out.append(s.quality == null ? "quality unknown" : s.quality);
        if (s.buffered >= 0 && s.position >= 0) out.append(", buffer ahead ").append(seconds(s.buffered - s.position));
        if (s.latency >= 0) out.append(", latency ").append(seconds(s.latency));
        return out.toString();
    }

    /** What happened between two samples SUMMARY_MS apart. */
    static String summary(Sample from, Sample to) {
        double span = Math.max(1, to.at - from.at) / 1000.0;
        StringBuilder out = new StringBuilder("Video: ").append(to.state).append(' ').append(describe(to));
        if (to.rendered >= 0 && from.rendered >= 0) {
            out.append(String.format(Locale.US, ", %.0f fps shown", (to.rendered - from.rendered) / span));
        }
        if (to.dropped >= 0 && from.dropped >= 0) out.append(", ").append(to.dropped - from.dropped).append(" dropped");
        if (to.decoded >= 0 && from.decoded >= 0) {
            out.append(String.format(Locale.US, ", %.0f fps decoded", (to.decoded - from.decoded) / span));
        }
        if (to.bitrate > 0) out.append(String.format(Locale.US, ", video %.1f Mbps", to.bitrate / 1e6));
        if (to.bandwidth > 0) out.append(String.format(Locale.US, ", connection ~%.0f Mbps", to.bandwidth / 1e6));
        return out.toString();
    }

    static String seconds(long ms) {
        return String.format(Locale.US, "%.1f s", ms / 1000.0);
    }
}
