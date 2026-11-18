package id.ikuradachi.kageroll.extension.crunchyroll;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Stores discovered ExoPlayer video track candidates per QualityTrackSelector instance
 * and resolves synthetic resource IDs used by manual quality entries.
 */
public final class QualityHelper {

    public static final int SYNTHETIC_TITLE_BASE = 0x7e000000;
    private static final int SYNTHETIC_TITLE_MASK = 0xFFFF0000;
    private static final int SYNTHETIC_HEIGHT_MASK = 0x0000FFFF;

    private static final Object LOCK = new Object();
    private static final Map<Object, List<TrackEntry>> TRACKS_BY_SELECTOR = new WeakHashMap<>();

    private QualityHelper() {
    }

    private static final class TrackEntry {
        final Object trackGroup;
        final int trackIndex;
        final int width;
        final int height;
        final int bitrate;

        TrackEntry(Object trackGroup, int trackIndex, int width, int height, int bitrate) {
            this.trackGroup = trackGroup;
            this.trackIndex = trackIndex;
            this.width = width;
            this.height = height;
            this.bitrate = bitrate;
        }
    }

    public static Object beginDiscovery() {
        return new ArrayList<TrackEntry>();
    }

    @SuppressWarnings("unchecked")
    public static void addCandidate(
            Object collector,
            Object trackGroup,
            int trackIndex,
            int width,
            int height,
            int bitrate
    ) {
        if (!(collector instanceof List) || trackGroup == null || trackIndex < 0 || height <= 0) {
            return;
        }
        ((List<TrackEntry>) collector).add(new TrackEntry(trackGroup, trackIndex, width, height, bitrate));
    }

    @SuppressWarnings("unchecked")
    public static int[] finishDiscovery(Object selector, Object collector) {
        List<TrackEntry> entries = collector instanceof List
                ? (List<TrackEntry>) collector
                : Collections.<TrackEntry>emptyList();

        if (selector != null) {
            synchronized (LOCK) {
                TRACKS_BY_SELECTOR.put(selector, new ArrayList<>(entries));
            }
        }

        if (entries.isEmpty()) {
            return new int[0];
        }

        Map<Integer, TrackEntry> bestByHeight = new HashMap<>();
        for (TrackEntry entry : entries) {
            if (entry.height <= 0 || entry.height > SYNTHETIC_HEIGHT_MASK) {
                continue;
            }
            TrackEntry existing = bestByHeight.get(entry.height);
            if (existing == null
                    || entry.bitrate > existing.bitrate
                    || (entry.bitrate == existing.bitrate && entry.width > existing.width)) {
                bestByHeight.put(entry.height, entry);
            }
        }

        List<TrackEntry> sorted = new ArrayList<>(bestByHeight.values());
        Collections.sort(sorted, new Comparator<TrackEntry>() {
            @Override
            public int compare(TrackEntry a, TrackEntry b) {
                return Integer.compare(b.height, a.height);
            }
        });

        int[] packed = new int[sorted.size() * 3];
        for (int i = 0; i < sorted.size(); i++) {
            TrackEntry entry = sorted.get(i);
            int base = i * 3;
            packed[base] = entry.width;
            packed[base + 1] = entry.height;
            packed[base + 2] = entry.bitrate;
        }
        return packed;
    }

    public static Object findMatchingTrackGroup(Object selector, int targetHeight) {
        if (selector == null || targetHeight <= 0) {
            return null;
        }
        List<TrackEntry> entries = getEntriesSnapshot(selector);
        if (entries == null) {
            return null;
        }

        Object bestGroup = null;
        int bestBitrate = Integer.MIN_VALUE;
        for (TrackEntry entry : entries) {
            if (entry.height == targetHeight) {
                if (bestGroup == null || entry.bitrate > bestBitrate) {
                    bestGroup = entry.trackGroup;
                    bestBitrate = entry.bitrate;
                }
            }
        }
        return bestGroup;
    }

    public static List<Integer> findMatchingTrackIndices(
            Object selector,
            Object trackGroup,
            int targetHeight
    ) {
        if (selector == null || trackGroup == null || targetHeight <= 0) {
            return null;
        }
        List<TrackEntry> entries = getEntriesSnapshot(selector);
        if (entries == null) {
            return null;
        }

        List<Integer> indices = new ArrayList<>();
        for (TrackEntry entry : entries) {
            if (entry.trackGroup == trackGroup && entry.height == targetHeight) {
                indices.add(entry.trackIndex);
            }
        }
        return indices.isEmpty() ? null : indices;
    }

    public static String resolveSyntheticTitle(int resId) {
        if ((resId & SYNTHETIC_TITLE_MASK) != SYNTHETIC_TITLE_BASE) {
            return null;
        }
        int height = resId & SYNTHETIC_HEIGHT_MASK;
        return height == 0 ? "Auto" : height + "p";
    }

    public static String getTitleString(Context context, int resId) {
        String synthetic = resolveSyntheticTitle(resId);
        return synthetic != null ? synthetic : context.getString(resId);
    }

    private static List<TrackEntry> getEntriesSnapshot(Object selector) {
        synchronized (LOCK) {
            List<TrackEntry> stored = TRACKS_BY_SELECTOR.get(selector);
            return stored == null ? null : new ArrayList<>(stored);
        }
    }
}
