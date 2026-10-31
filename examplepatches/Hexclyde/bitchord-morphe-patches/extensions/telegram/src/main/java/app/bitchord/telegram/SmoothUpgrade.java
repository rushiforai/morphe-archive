package app.bitchord.telegram;

import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;

import com.music.bitchord.playback.PlaybackService;

import java.util.Collections;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * BitChord switches to a better copy of the playing song (say, your Telegram FLAC replacing the
 * YouTube stream) by swapping the source under the live player, which leaves a gap. This hands the
 * switch to BitChord's own two-player version swap instead: the new copy is loaded on the standby
 * player while the current one keeps playing, then crossfaded in at the same position. When that
 * can't run (Automix mid-blend, no standby player), the original swap is used.
 *
 * <p>The two copies rarely start at the same instant, and BitChord takes the offset between two
 * copies of the same song as zero. For a Telegram copy, {@link VersionAlign} measures it first, and
 * the swap starts the new copy that much later or earlier, so nothing repeats or is skipped.
 *
 * <p>Starting the new copy still takes a moment, so before the crossfade it's held back until it
 * plays in step with the old one (see {@link #settled}).
 */
public final class SmoothUpgrade {
    private SmoothUpgrade() {}

    static volatile boolean enabled = true;
    private static final Set<Object> handedOver =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    // The offset measured for the swap about to start, and when: {offsetMs, millis}.
    private static volatile double[] aligned;

    /** How long the new copy may be held back before the crossfade, and listened to at most. */
    static final long SETTLE_MS = 2400, LISTEN_MS = 1500;

    /** Close enough; and the most cut to catch up, more being sought instead. */
    static final double CLOSE_MS = 0.5, MOST_CUT_MS = 150;

    private static volatile Settling settling;

    /** Replaces the upgrade's replaceMediaItem call. */
    public static void replace(Object service, Player player, int index, MediaItem item) {
        handedOver.remove(player);
        if (enabled) {
            String playing = mediaId(player.getCurrentMediaItem());
            boolean measuring = false;
            try {
                measuring =
                        VersionAlign.measure(
                                player,
                                item,
                                offset -> {
                                    // The song may have changed while it was measured.
                                    if (player.getCurrentMediaItemIndex() != index
                                            || !Objects.equals(
                                                    playing, mediaId(player.getCurrentMediaItem())))
                                        return;
                                    aligned =
                                            offset == null
                                                    ? null
                                                    : new double[] {
                                                        offset, System.currentTimeMillis()
                                                    };
                                    if (swap(service, player, index, item)) return;
                                    aligned = null;
                                    long at =
                                            player.getCurrentPosition()
                                                    + (offset == null ? 0 : Math.round(offset));
                                    player.replaceMediaItem(index, item);
                                    player.seekTo(index, Math.max(0, at));
                                    player.prepare();
                                });
            } catch (Throwable ignored) {
                // Not measured: swapped as before.
            }
            if (measuring || swap(service, player, index, item)) {
                handedOver.add(player);
                return;
            }
        }
        player.replaceMediaItem(index, item);
    }

    private static boolean swap(Object service, Player player, int index, MediaItem item) {
        try {
            if (!PlaybackService.bitchordSmoothSwap(service, player, index, item)) return false;
            settling = new Settling(player);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String mediaId(MediaItem item) {
        return item == null ? null : item.mediaId;
    }

    /**
     * Called first in BitChord's version alignment: the offset measured for the upgrade being
     * swapped in, once, or null to let BitChord measure as it does.
     */
    public static Long alignedOffset() {
        double[] found = aligned;
        aligned = null;
        return found != null && System.currentTimeMillis() - found[1] < 10_000
                ? Math.round(found[0])
                : null;
    }

    /** One upgrade's swap, from launch until the new copy plays in step. */
    static final class Settling {
        final Player main;
        final long created = now();
        long began, looked;
        int seeks;
        double first = Double.NaN, cut;
        VersionAlign.Heard catching;
        java.util.concurrent.Future<double[]> measuring;

        Settling(Player main) {
            this.main = main;
        }
    }

    private static long now() {
        return System.nanoTime() / 1_000_000;
    }

    /**
     * Replaces the playback state BitChord's swap waits on before the crossfade, which it gives up
     * on after a while. The new copy has just been sought to the old one's position, but starting
     * takes a moment, so it plays a little behind. Until it's in step this says it's still
     * buffering: it's listened to (see {@link VersionAlign#lag}) and leaves out what it's behind
     * by, or is sought again when that's more than a cut should be.
     */
    public static int settled(Player spare) {
        int state = spare.getPlaybackState();
        Settling s = settling;
        if (s == null || state != Player.STATE_READY || spare == s.main) return state;
        try {
            return step(s, spare) ? state : Player.STATE_BUFFERING;
        } catch (Throwable e) {
            settling = null;
            return state;
        }
    }

    private static boolean step(Settling s, Player spare) throws Exception {
        long now = now();
        if (s.began == 0) {
            if (now - s.created > 15_000) return done(s, "", spare); // not this swap's
            s.began = now;
        }
        if (now - s.began > SETTLE_MS) return done(s, "ran out of time", spare);
        if (s.catching != null) return s.catching.caughtUp() ? done(s, null, spare) : false;
        float speed = s.main.getPlaybackParameters().speed;
        if (s.measuring == null) {
            if (now - s.looked < 50) return false;
            s.looked = now;
            s.measuring = VersionAlign.lagLater(speed, 300, 600);
            return false;
        }
        if (!s.measuring.isDone()) return false;
        double[] found;
        try {
            found = s.measuring.get();
        } finally {
            s.measuring = null;
        }
        if (found == null)
            return now - s.began > LISTEN_MS ? done(s, "couldn't hear both copies", spare) : false;
        double lag = found[0];
        if (Double.isNaN(s.first)) s.first = lag;
        if (Math.abs(lag) <= CLOSE_MS) return done(s, null, spare);
        VersionAlign.Heard fresh = VersionAlign.newest();
        if (lag > 0 && lag <= MOST_CUT_MS && fresh != null) {
            s.cut += lag;
            fresh.catchUp(lag * speed * 1000);
            s.catching = fresh;
            return false;
        }
        if (s.seeks >= 2) return done(s, "too far apart", spare);
        // Sought a little short, so it's behind and the rest is cut.
        s.seeks++;
        spare.seekTo(
                spare.getCurrentMediaItemIndex(),
                Math.max(0, spare.getCurrentPosition() + Math.round((lag - 20) * speed)));
        return false;
    }

    private static boolean done(Settling s, String trouble, Player spare) {
        settling = null;
        if ("".equals(trouble)) return true;
        HostLog.d(
                String.format(
                        java.util.Locale.US,
                        "Unofficial Telegram settled the upgrade: the Telegram copy started"
                                + " %s ms behind; cut %.2f ms, sought %d times%s",
                        Double.isNaN(s.first)
                                ? "?"
                                : String.format(java.util.Locale.US, "%+.2f", s.first),
                        s.cut,
                        s.seeks,
                        trouble == null ? "" : "; " + trouble));
        if (trouble == null && s.catching != null) checkLater(spare, s.main);
        return true;
    }

    /** Logs how far apart the two copies are partway into the crossfade. */
    private static void checkLater(Player spare, Player main) {
        try {
            float speed = main.getPlaybackParameters().speed;
            new android.os.Handler(spare.getApplicationLooper())
                    .postDelayed(
                            () -> {
                                double[] left = VersionAlign.lag(speed, 100, 400);
                                if (left != null)
                                    HostLog.d(
                                            String.format(
                                                    java.util.Locale.US,
                                                    "Unofficial Telegram upgrade in step: %+.2f ms"
                                                            + " apart (waveform match %.2f)",
                                                    left[0],
                                                    left[1]));
                            },
                            450);
        } catch (Throwable ignored) {
            // Only a log line.
        }
    }

    /** Replaces the upgrade's seekTo call; the smooth swap keeps its own position. */
    public static void seekTo(Player player, int index, long positionMs) {
        if (!handedOver.contains(player)) player.seekTo(index, positionMs);
    }

    /** Replaces the upgrade's prepare call. */
    public static void prepare(Player player) {
        if (!handedOver.remove(player)) player.prepare();
    }
}
