package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Decides what to fetch for one target episode, or refuses with one reason word.
 * The viewer's own file is always the target; references only vote (times are read
 * on the target by Detector, never copied). All limits are enforced here and again
 * by ByteBudget in the runner, so a stale plan cannot overspend.
 */
public final class OneAheadPlanner {
    /**
     * Data is not a limit (even the cheapest debrid plan has 10 TB). Per-file cap: a 106 Mbit/s 4K remux
     * reads about 8 GB for its full windows. The day cap is only a fuse against a bug.
     */
    public static final long FILE_CAP = 10_000_000_000L;
    public static final long DAY_CAP = 100_000_000_000L;
    public static final int MAX_SHOW_EPS_PER_DAY = 24;
    public static final int MIN_REFS = 3, MAX_REFS = 5;
    /** Read pace while Stremio's own player runs, and with an external player. The stress test sets the real values. */
    public static final long PACE_INTERNAL_BPS = 4_000_000L, PACE_EXTERNAL_BPS = 2_000_000L;
    public static final int MP4_MAX_REQUESTS = 20000;
    public static final double HEAD_SEC = 360, TAIL_SEC = 240;
    public enum Container { MKV, MP4, UNKNOWN }
    /** Only full windows are read. Sparse probing exists in Detector but is not used for fetched targets. */
    public enum Mode { FULL }

    /** Refusal reasons, most actionable first (a caller can fix the top ones today). */
    public enum Refusal {
        ALREADY_ATTEMPTED, INVALID_TARGET, NO_REFS, EPISODE_BUDGET,
        SHOW_DAILY_LIMIT, DAY_BUDGET, REQUEST_BUDGET
    }

    /** One file the planner may use. urlHash only: a raw URL is never stored or logged. */
    public static final class FileRef {
        public final String episodeId, videoId, language;
        public final long urlHash, fileSize, headHash;
        public final double durationSec;
        public final Container container;
        public final boolean finale, cached;
        /** Demuxer-priced full-window bytes, or -1 when not yet priced. */
        public final long estimatedFullBytes;
        public FileRef(String episodeId, String videoId, long urlHash, long fileSize, long headHash,
                       double durationSec, Container container, boolean finale, boolean cached,
                       String language, long estimatedFullBytes) {
            this.episodeId = episodeId; this.videoId = videoId; this.urlHash = urlHash;
            this.fileSize = fileSize; this.headHash = headHash; this.durationSec = durationSec;
            this.container = container; this.finale = finale; this.cached = cached;
            this.language = language; this.estimatedFullBytes = estimatedFullBytes;
        }
        boolean sameFile(FileRef o) {
            return fileSize != 0 && fileSize == o.fileSize && headHash != 0 && headHash == o.headHash;
        }
    }

    /** Today's usage, supplied by the caller from its persistent ledger. */
    public static final class Usage {
        public int showEpisodesToday;
        public long bytesToday;
        public boolean targetAttemptedToday;
    }

    public static final class FilePlan {
        public final FileRef ref;
        public final Mode mode;
        public final List<double[]> slices; // [start,end) file-clock seconds, head then tail
        public final long estimatedBytes;
        public final int estimatedRequests;
        FilePlan(FileRef ref, Mode mode, List<double[]> slices, long est, int req) {
            this.ref = ref; this.mode = mode; this.slices = slices;
            this.estimatedBytes = est; this.estimatedRequests = req;
        }
    }

    public static final class Plan {
        public final FilePlan target;
        public final List<FilePlan> refs;
        public final long estimatedBytes;
        public final int estimatedRequests;
        Plan(FilePlan target, List<FilePlan> refs, long est, int req) {
            this.target = target; this.refs = refs; this.estimatedBytes = est; this.estimatedRequests = req;
        }
    }

    public static final class Outcome {
        public final Plan plan;
        public final Refusal refusal;
        private Outcome(Plan p, Refusal r) { plan = p; refusal = r; }
        public boolean ok() { return plan != null; }
    }

    public Outcome plan(FileRef target, List<FileRef> candidates, Usage usage) {
        if (usage != null && usage.targetAttemptedToday) return no(Refusal.ALREADY_ATTEMPTED);
        if (target == null || target.durationSec <= 0 || target.fileSize <= 0 || target.headHash == 0)
            return no(Refusal.INVALID_TARGET); // a result must bind to a measured file identity
        // Usable references: never a finale, never the target's file, no duplicates, language must not clash.
        List<FileRef> usable = new ArrayList<>();
        for (FileRef c : candidates == null ? Collections.<FileRef>emptyList() : candidates) {
            if (c == null || c.finale || c.durationSec <= 0) continue;
            if (c.sameFile(target)) continue;
            if (target.language != null && c.language != null && !target.language.equals(c.language)) continue;
            boolean dup = false;
            for (FileRef u : usable) // size alone already duplicates when a hash is unknown
                if (c.fileSize != 0 && c.fileSize == u.fileSize && (c.headHash == 0 || u.headHash == 0 || c.headHash == u.headHash)) { dup = true; break; }
            if (!dup) usable.add(c);
        }
        // Cached features cost no bytes and match best: first, then smaller files (cheaper to fetch).
        usable.sort(Comparator.comparing((FileRef f) -> !f.cached).thenComparingLong(f -> f.fileSize));
        // A reference is correlated in full: one whose full windows exceed the per-file cap is unusable.
        usable.removeIf(f -> !f.cached && price(f, Mode.FULL).estimatedBytes > FILE_CAP);
        if (usable.size() > MAX_REFS) usable = new ArrayList<>(usable.subList(0, MAX_REFS));
        if (usage != null && usage.showEpisodesToday >= MAX_SHOW_EPS_PER_DAY) return no(Refusal.SHOW_DAILY_LIMIT);
        long dayLeft = DAY_CAP - (usage == null ? 0 : usage.bytesToday);
        // Full windows only. Sparse targets were measured to lose half the segments and
        // produce wrong skips (J22b step 6), so a target over the per-file cap is refused.
        FilePlan tp = price(target, Mode.FULL);
        if (tp.estimatedBytes > FILE_CAP) return no(Refusal.EPISODE_BUDGET);
        if (usable.size() < MIN_REFS) return no(Refusal.NO_REFS);
        List<FilePlan> rps = new ArrayList<>();
        long total = tp.estimatedBytes;
        int reqs = tp.estimatedRequests;
        for (FileRef r : usable) {
            FilePlan rp = r.cached ? new FilePlan(r, Mode.FULL, slices(r.durationSec, Mode.FULL), 0, 0)
                    : price(r, Mode.FULL);
            rps.add(rp); total += rp.estimatedBytes; reqs += rp.estimatedRequests;
        }
        // References are smallest first: drop the largest until the plan fits the day, keeping the floor.
        while (total > dayLeft && rps.size() > MIN_REFS) {
            FilePlan dropped = rps.remove(rps.size() - 1);
            total -= dropped.estimatedBytes; reqs -= dropped.estimatedRequests;
        }
        if (total > dayLeft) return no(Refusal.DAY_BUDGET);
        boolean anyMp4 = target.container == Container.MP4;
        for (FilePlan rp : rps) anyMp4 |= rp.ref.container == Container.MP4;
        if (anyMp4 && reqs > MP4_MAX_REQUESTS) return no(Refusal.REQUEST_BUDGET);
        return new Outcome(new Plan(tp, rps, total, reqs), null);
    }

    private static Outcome no(Refusal r) { return new Outcome(null, r); }

    static FilePlan price(FileRef f, Mode mode) {
        long est = f.estimatedFullBytes >= 0 ? f.estimatedFullBytes
                : Math.round(f.fileSize * Math.min(1.0, (HEAD_SEC + TAIL_SEC) / f.durationSec));
        int winSec = (int) (HEAD_SEC + TAIL_SEC);
        // MP4 with a 256 KB gap costs at most ~4 requests per media second (measured on a real file: 1931 GETs for 600 s).
        // At that rate a full plan of 6 MP4 files stays under MP4_MAX_REQUESTS, which is left as a fuse.
        int reqs = f.container == Container.MP4 ? winSec * 4
                : (int) Math.max(4, est / 1_048_576 + 4);
        return new FilePlan(f, mode, slices(f.durationSec, mode), est, reqs);
    }

    static List<double[]> slices(double duration, Mode mode) {
        List<double[]> out = new ArrayList<>();
        double tailStart = Math.max(0, duration - TAIL_SEC);
        out.add(new double[]{0, Math.min(HEAD_SEC, duration)});
        if (tailStart > 0) out.add(new double[]{tailStart, duration});
        return out;
    }

    /** Cost of this plan's mode for one file, for reports. */
    public static long estimate(FileRef f, Mode mode) { return price(f, mode).estimatedBytes; }

    /** A file plan with explicit slices (the runner's fetcher re-prices it from the real index). */
    public static FilePlan filePlan(FileRef ref, Mode mode, List<double[]> slices) {
        FilePlan p = price(ref, mode);
        return new FilePlan(ref, mode, slices, p.estimatedBytes, p.estimatedRequests);
    }
}
