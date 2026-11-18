package app.afterglow.extension.sponsorblock;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Playback coordinator with generation checks for late responses and old Undo buttons. */
public final class SponsorSession {
    public static final class Skip {
        public final long generation;
        public final String videoId;
        public final SponsorSegment segment;
        private final Skip previous;
        private Skip(long generation, String videoId, SponsorSegment segment, Skip previous) {
            this.generation = generation; this.videoId = videoId; this.segment = segment; this.previous = previous;
        }
    }

    private String videoId = "";
    private long generation, revision;
    private List<SponsorSegment> segments = Collections.emptyList();
    private final Set<String> skipped = new HashSet<>();
    private Skip lastSkip;

    public synchronized long activate(String id) {
        if (id == null || id.isEmpty() || id.equals(videoId)) return generation;
        videoId = id; generation++; revision++;
        segments = Collections.emptyList(); skipped.clear(); lastSkip = null;
        return generation;
    }

    public synchronized boolean accept(String id, long token, List<SponsorSegment> values) {
        if (token != generation || !videoId.equals(id)) return false;
        List<SponsorSegment> sorted = new ArrayList<>(values);
        sorted.sort(SponsorSegment.ORDER);
        segments = Collections.unmodifiableList(sorted); revision++;
        return true;
    }

    /** Claim before seeking: a native seek can synchronously send another progress callback. */
    public synchronized Skip claim(double time, Set<SponsorCategory> enabled) {
        if (!Double.isFinite(time) || enabled.isEmpty()) return null;
        for (SponsorSegment segment : segments) {
            if (segment.start > time) break;
            if (time >= segment.end || segment.end - time <= 0.05
                    || !enabled.contains(segment.category) || skipped.contains(segment.uuid)) continue;
            skipped.add(segment.uuid);
            lastSkip = new Skip(generation, videoId, segment, lastSkip);
            return lastSkip;
        }
        return null;
    }

    /** A failed native seek must not permanently consume the segment. */
    public synchronized void reject(Skip skip) {
        if (skip == null || skip.generation != generation || !skip.videoId.equals(videoId)) return;
        skipped.remove(skip.segment.uuid);
        if (lastSkip == skip) lastSkip = skip.previous;
    }

    public synchronized Double consumeUndo(Skip skip) {
        if (skip == null || lastSkip != skip || skip.generation != generation || !skip.videoId.equals(videoId)) return null;
        lastSkip = null;
        // Keep the UUID claimed so undo can play the segment without immediately skipping again.
        return skip.segment.start;
    }

    public synchronized String videoId() { return videoId; }
    public synchronized long generation() { return generation; }
    public synchronized long revision() { return revision; }
    public synchronized List<SponsorSegment> segments() { return segments; }
}
