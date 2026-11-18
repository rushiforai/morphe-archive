package app.afterglow.extension.sponsorblock;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

/** The iOS marker layout: clamp to duration, sort, then use the first non-overlapping lane. */
public final class SponsorMarkerLayout {
    public static final class Marker {
        public final double startFraction, endFraction;
        public final int lane;
        public final SponsorCategory category;
        public final String uuid;
        private Marker(double start, double end, int lane, SponsorSegment segment) {
            startFraction = start; endFraction = end; this.lane = lane;
            category = segment.category; uuid = segment.uuid;
        }
    }
    private static final class Candidate {
        final double start, end;
        final SponsorSegment segment;
        Candidate(SponsorSegment segment, double duration) {
            this.segment = segment;
            start = Math.max(0, Math.min(duration, segment.start));
            end = Math.max(0, Math.min(duration, segment.end));
        }
    }
    private SponsorMarkerLayout() {}

    public static List<Marker> layout(List<SponsorSegment> segments, double duration, Set<SponsorCategory> visible) {
        if (!Double.isFinite(duration) || duration <= 0 || segments.isEmpty() || visible.isEmpty())
            return Collections.emptyList();
        List<Candidate> candidates = new ArrayList<>();
        for (SponsorSegment segment : segments) {
            if (!visible.contains(segment.category)) continue;
            Candidate candidate = new Candidate(segment, duration);
            if (candidate.end > candidate.start) candidates.add(candidate);
        }
        candidates.sort(Comparator.comparingDouble((Candidate c) -> c.start)
                .thenComparingDouble(c -> c.end).thenComparing(c -> c.segment.uuid));
        List<Double> ends = new ArrayList<>();
        List<Marker> markers = new ArrayList<>();
        for (Candidate candidate : candidates) {
            int lane = 0;
            while (lane < ends.size() && ends.get(lane) > candidate.start) lane++;
            if (lane == ends.size()) ends.add(candidate.end); else ends.set(lane, candidate.end);
            markers.add(new Marker(candidate.start / duration, candidate.end / duration, lane, candidate.segment));
        }
        return Collections.unmodifiableList(markers);
    }

    public static float laneOffset(int lane) {
        if (lane <= 0) return 0;
        float distance = ((lane + 1) / 2) * 4f;
        return lane % 2 == 1 ? -distance : distance;
    }

    public static int outlineColor(int color) {
        double luma = (0.2126 * ((color >>> 16) & 255) + 0.7152 * ((color >>> 8) & 255)
                + 0.0722 * (color & 255)) / 255.0;
        return luma > 0.58 ? 0xE6000000 : 0xF2FFFFFF;
    }
}
