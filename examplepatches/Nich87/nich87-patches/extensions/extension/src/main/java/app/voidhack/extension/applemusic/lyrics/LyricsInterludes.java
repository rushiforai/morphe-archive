package app.voidhack.extension.applemusic.lyrics;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Tracks synced interlude gaps per {@code SongInfoPtr} so Apple Music's native
 * bouncing three-dot instrumental indicator appears wherever the Lyrics Editor
 * displays an interlude (including gaps shorter than the stock 7,000 ms threshold).
 */
public final class LyricsInterludes {
    public static final long NATIVE_THRESHOLD_MS = 7000L;
    /**
     * Lowest safe duration (ms) for Apple Music's 3-dot instrumental animator:
     * {@code w = duration - 800 = 1600}, {@code dotDur = round((w + 750) / 3) = 783},
     * leaving {@code dot2Dur = 1600 - 1566 = 34 ms > 0}. Giving 100 ms slack below the
     * 2,500 ms editor threshold absorbs Android Handler wakeup jitter.
     */
    public static final long EXPLICIT_THRESHOLD_MS = 2400L;
    /**
     * Apple Music's native {@code SongInfoTimeProcessor} shifts line begin/end earlier by
     * {@code suggestedLineOffset} (-500 ms for line-synced, up to -750 ms for word-synced)
     * before firing the single empty-line callback at interlude start. 1,500 ms safely
     * covers that lead offset plus audio/Dolby Atmos latency while staying well below
     * {@link #EXPLICIT_THRESHOLD_MS} so an active preceding line cannot falsely trigger dots.
     */
    private static final long LEAD_TOLERANCE_MS = 1500L;

    private static final Map<Object, long[][]> EXPLICIT =
            Collections.synchronizedMap(new WeakHashMap<Object, long[][]>());

    private static volatile WeakReference<Object> activeSongRef = new WeakReference<>(null);
    private static volatile long activePositionMs = -1L;

    private LyricsInterludes() {}

    static void remember(Object songInfoPtr, List<LyricsEditTtml.InterludeRange> ranges) {
        if (songInfoPtr == null) return;
        if (ranges == null || ranges.isEmpty()) {
            EXPLICIT.remove(songInfoPtr);
            return;
        }
        int count = 0;
        for (LyricsEditTtml.InterludeRange r : ranges) {
            if (r != null && (r.endMs - r.startMs) >= EXPLICIT_THRESHOLD_MS) {
                count++;
            }
        }
        if (count == 0) {
            EXPLICIT.remove(songInfoPtr);
            return;
        }
        long[][] packed = new long[count][2];
        int idx = 0;
        for (LyricsEditTtml.InterludeRange r : ranges) {
            if (r != null && (r.endMs - r.startMs) >= EXPLICIT_THRESHOLD_MS) {
                packed[idx][0] = r.startMs;
                packed[idx][1] = r.endMs;
                idx++;
            }
        }
        EXPLICIT.put(songInfoPtr, packed);
    }

    public static void setActiveSong(Object songInfoPtr) {
        Object prev = activeSongRef.get();
        if (prev != songInfoPtr) {
            activeSongRef = new WeakReference<>(songInfoPtr);
            activePositionMs = -1L;
        }
    }

    public static void onTick(Object songInfoPtr, long positionMs) {
        if (songInfoPtr != null) {
            activeSongRef = new WeakReference<>(songInfoPtr);
        }
        if (positionMs >= 0L) {
            activePositionMs = positionMs;
        }
    }

    public static long thresholdFor(Object songInfoPtr, long positionMs) {
        if (songInfoPtr == null) return NATIVE_THRESHOLD_MS;
        long[][] ranges = EXPLICIT.get(songInfoPtr);
        if (ranges == null || ranges.length == 0) return NATIVE_THRESHOLD_MS;
        if (positionMs < 0L) {
            for (long[] range : ranges) {
                if (range[0] <= LEAD_TOLERANCE_MS) {
                    return EXPLICIT_THRESHOLD_MS;
                }
            }
            return NATIVE_THRESHOLD_MS;
        }
        for (long[] range : ranges) {
            long start = range[0];
            long end = range[1];
            if (positionMs >= start - LEAD_TOLERANCE_MS && positionMs < end) {
                return EXPLICIT_THRESHOLD_MS;
            }
        }
        return NATIVE_THRESHOLD_MS;
    }

    public static long currentThresholdLong() {
        Object song = activeSongRef.get();
        return thresholdFor(song, activePositionMs);
    }

    public static int currentThresholdInt() {
        return (int) currentThresholdLong();
    }

    static void clearForTest() {
        EXPLICIT.clear();
        activeSongRef = new WeakReference<>(null);
        activePositionMs = -1L;
    }
}
