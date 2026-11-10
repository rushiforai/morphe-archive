package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Executes a plan on one background thread. Every failure — refusal, budget, codec,
 * playback conflict, corrupt cache — ends as NO_TIMES, never a crash. One file gets
 * at most 2 tries per day: a try that failed for a temporary reason (network or IO
 * error, link expired, rate limited, worker died, cancelled) may run once more, a
 * finished try (done or no-segments) or a second try never runs again that day.
 * The mark is written first, so a job that kills the process keeps its try.
 * Features already in the cache are reused, so a resume re-fetches only the files it lacks.
 */
public final class OneAheadRunner {
    /** Fetches and decodes one file's plan slices into features. Implemented over demux. */
    public interface FeatureFetcher {
        EpisodeFeatures fetch(OneAheadPlanner.FilePlan fp, ByteBudget budget, PlaybackGuard guard) throws DemuxException;
    }
    public interface DetectorFactory { Detector create(boolean sparse); }
    /** Detector with the measured config (at least 3 supplied, at least 2 agreeing). */
    public static DetectorFactory defaultDetectors() {
        return sparse -> {
            Detector.Config c = new Detector.Config();
            c.minRefs = 2;
            return new Detector(c);
        };
    }
    public interface Clock { String today(); }

    public enum Status { DONE, NO_TIMES, REFUSED }
    public static final class Outcome {
        public final Status status;
        public final String reason; // refusal/reason word, hash-safe, never a URL
        public final OneAheadResult result;
        public final long bytesFetched;
        public final int requests;
        Outcome(Status s, String r, OneAheadResult res, long b, int q) {
            status = s; reason = r; result = res; bytesFetched = b; requests = q;
        }
    }

    private final OneAheadPlanner planner = new OneAheadPlanner();
    private final OneAheadStores.FeatureStore features;
    private final OneAheadStores.ResultStore results;
    private final OneAheadStores.AttemptLog attempts;
    private final FeatureFetcher fetcher;
    private final DetectorFactory detectors;
    private final PlaybackGuard guard;
    private final Clock clock;
    private volatile Thread worker;
    private volatile Outcome last;
    private List<OneAheadResult.Segment> borrowed = new ArrayList<>();
    private boolean borrowedIntroWeak;
    private double borrowedDuration;
    private long borrowedBytes;
    /** Bytes one borrowing run may read, under the day's cap. */
    private static final long BORROW_CAP = 2_000_000_000L;
    private boolean cancelSeen;
    private long bytesLogged;
    private static final String TAG = "OneAhead";
    private String lastRefFailure = "none";

    public OneAheadRunner(File storeDir, FeatureFetcher fetcher, DetectorFactory detectors,
                          PlaybackGuard guard, Clock clock) {
        this.features = new OneAheadStores.FeatureStore(new File(storeDir, "features"));
        this.results = new OneAheadStores.ResultStore(new File(storeDir, "results"));
        this.attempts = new OneAheadStores.AttemptLog(storeDir);
        this.fetcher = fetcher; this.detectors = detectors;
        this.guard = guard == null ? PlaybackGuard.NONE : guard;
        this.clock = clock == null ? () -> LocalDate.now().toString() : clock;
    }

    public OneAheadStores.FeatureStore features() { return features; }
    public OneAheadStores.ResultStore results() { return results; }
    public boolean attemptedToday(String episodeId) { return attempts.attemptedToday(episodeId, clock.today()); }
    /** True when this exact file may not start another try today: finished or already tried twice. */
    public boolean attemptedToday(String episodeId, long size, long hash) {
        return attempts.blockedToday(OneAheadStores.key(episodeId, size, hash), clock.today());
    }
    public Outcome last() { return last; }

    /** Types already proved from another release: they replace what the audio run finds for them. */
    void setBorrowed(List<OneAheadResult.Segment> segments, boolean weakIntro, double fileDuration) {
        borrowed = segments;
        borrowedIntroWeak = weakIntro;
        borrowedDuration = fileDuration;
    }

    /** False when borrowing already ran today for this episode; otherwise notes that it runs now. */
    boolean startBorrow(String episodeId) {
        String day = clock.today();
        if (attempts.attemptedToday("b:" + episodeId, day)) return false;
        attempts.mark("b:" + episodeId, "", day);
        return true;
    }

    ByteBudget borrowBudget() {
        return new ByteBudget(BORROW_CAP, 0, new ByteBudget(OneAheadPlanner.DAY_CAP, attempts.bytesToday(clock.today()), null));
    }

    /** One theme job reads episode windows plus a few songs, under the day's cap. */
    static final long THEME_CAP = 500_000_000L;

    ByteBudget themeBudget() {
        return new ByteBudget(THEME_CAP, 0, new ByteBudget(OneAheadPlanner.DAY_CAP, attempts.bytesToday(clock.today()), null));
    }

    void borrowSpent(long bytes) {
        borrowedBytes = bytes;
        attempts.addBytes(clock.today(), bytes);
    }

    void themeSpent(long bytes) {
        attempts.addBytes(clock.today(), bytes);
    }

    /** Records the file attempt for a theme run on a file the planner refused. */
    void markThemed(String episodeId, long size, long hash, String showId) {
        String day = clock.today();
        String key = OneAheadStores.key(episodeId, size, hash);
        attempts.mark(key, showId == null ? "" : showId.trim(), day);
    }

    /** Borrowed times alone are the result: nothing is left for the audio run to find. */
    Outcome keepBorrowed(String videoId, String showId, long size, long hash) throws IOException {
        OneAheadResult r = new OneAheadResult(videoId, size, hash, OneAheadResult.DETECTOR_VERSION);
        r.fileDurationSec = borrowedDuration;
        for (OneAheadResult.Segment s : borrowed) {
            // A weak intro stands only with the detector's intro behind it: without an audio
            // run there is nothing to agree with, so it is dropped here, never kept alone.
            if ("intro".equals(s.type) && borrowedIntroWeak) continue;
            r.segments.add(s);
        }
        if (r.segments.isEmpty()) return new Outcome(Status.NO_TIMES, "borrow-empty", null, borrowedBytes, 0);
        results.save(r);
        String day = clock.today();
        String key = OneAheadStores.key(videoId, size, hash);
        attempts.mark(key, showId == null ? "" : showId.trim(), day);
        attempts.markDone(key, day);
        return new Outcome(Status.DONE, "ok", r, borrowedBytes, 0);
    }

    /** Starts the single background worker; a second call while running is ignored. */
    public synchronized void start(final OneAheadPlanner.FileRef target,
                                   final List<OneAheadPlanner.FileRef> refs, final String showId) {
        if (worker != null && worker.isAlive()) return;
        worker = new Thread(() -> { last = runOnce(target, refs, showId); }, "one-ahead");
        worker.setPriority(Thread.MIN_PRIORITY);
        worker.setDaemon(true);
        worker.start();
    }
    public void join() throws InterruptedException { Thread w = worker; if (w != null) w.join(); }

    /** Synchronous execution (the worker and tests call this directly). Never throws. */
    public Outcome runOnce(OneAheadPlanner.FileRef target, List<OneAheadPlanner.FileRef> candidates, String showId) {
        if (target == null) return new Outcome(Status.REFUSED, OneAheadPlanner.Refusal.INVALID_TARGET.name(), null, 0, 0);
        showId = showId == null ? "" : showId.trim();
        String day = clock.today();
        String attemptKey = OneAheadStores.key(target.episodeId, target.fileSize, target.headHash);
        cancelSeen = false;
        bytesLogged = 0;
        lastRefFailure = "none";
        try {
            OneAheadPlanner.Usage usage = new OneAheadPlanner.Usage();
            usage.targetAttemptsToday = attempts.attemptsToday(attemptKey, day);
            usage.targetFinishedToday = attempts.finishedToday(attemptKey, day);
            usage.targetAttemptedToday = usage.targetFinishedToday || usage.targetAttemptsToday >= 2;
            usage.showEpisodesToday = attempts.showEpisodesToday(showId == null ? "" : showId, day);
            usage.bytesToday = attempts.bytesToday(day);
            OneAheadPlanner.Outcome planned = planner.plan(target, candidates, usage);
            if (!planned.ok()) return new Outcome(Status.REFUSED, planned.refusal.name(), null, 0, 0);
            OneAheadPlanner.Plan plan = planned.plan;
            attempts.mark(attemptKey, showId == null ? "" : showId, day); // one of at most 2 tries
            ByteBudget dayBudget = new ByteBudget(OneAheadPlanner.DAY_CAP, usage.bytesToday, null);
            // Per-file budgets under the shared day cap: each file may fetch up to FILE_CAP.
            List<ByteBudget> fileBudgets = new ArrayList<>();
            List<String> pins = new ArrayList<>();
            try {
                EpisodeFeatures t = obtain(plan.target, newFileBudget(dayBudget, fileBudgets), pins);
                logBytes(day, fileBudgets);
                if (t == null) {
                    Outcome o = noTimes("target-unavailable", fileBudgets);
                    finishIfDone(attemptKey, day, o);
                    return o;
                }
                List<EpisodeFeatures> refs = new ArrayList<>();
                boolean refTempSeen = false;
                // Every planned reference (up to MAX_REFS = 5, already priced against the day cap).
                // The detector's composite, replay and edge guards were validated at five references;
                // at three they fall silent (bench, 5 rotations of 3: 370 s of story cut on tuned
                // shows, Mouse replays and the Mandalorian echo return; 0 s at five).
                for (OneAheadPlanner.FilePlan rp : storedFirst(plan.refs)) {
                    if (refs.size() >= OneAheadPlanner.MAX_REFS) break;
                    long b0 = used(fileBudgets);
                    long t0 = System.currentTimeMillis();
                    EpisodeFeatures r = obtain(rp, newFileBudget(dayBudget, fileBudgets), pins);
                    logBytes(day, fileBudgets);
                    long secs = (System.currentTimeMillis() - t0) / 1000L;
                    String why = r != null ? "ok" : lastRefFailure;
                    if (r == null && lastRefTemporary()) refTempSeen = true;
                    safeLog("ref ep=" + rp.ref.episodeId + " bytes=" + (used(fileBudgets) - b0)
                            + " secs=" + secs + " reason=" + why + " cont=" + rp.ref.container
                            + " size=" + rp.ref.fileSize);
                    if (cancelSeen) return noTimes("cancelled", fileBudgets);
                    if (r != null) refs.add(r);
                }
                if (refs.size() < 2) {
                    if (refTempSeen) return noTimes("refs-lost:" + lastRefFailure, fileBudgets);
                    Outcome o = noTimes("refs-lost:" + lastRefFailure, fileBudgets);
                    finishIfDone(attemptKey, day, o);
                    return o;
                }
                awaitPlayback();
                if (guard.isCancelled() || !HeapGate.fits(HeapGate.DETECT_BYTES)) return noTimes("cancelled", fileBudgets);
                java.util.Map<String, double[]> hints = hintPass(t, refs);
                Detector.Result found = detectors.create(false).detect(t, refs, hints);
                OneAheadResult result = OneAheadResult.fromDetector(target.videoId, t, found);
                if (result.segments.isEmpty()) {
                    Outcome o = noTimes("no-segments", fileBudgets);
                    attempts.markDone(attemptKey, day);
                    return o;
                }
                for (OneAheadResult.Segment b : borrowed) {
                    // A weak intro replaces the detector's only when they agree: without the
                    // detector's intro behind it the weak name is dropped, never kept alone.
                    if ("intro".equals(b.type) && borrowedIntroWeak && !detectorAgrees(result.segments, b)) continue;
                    result.segments.removeIf(s -> s.type.equals(b.type));
                    result.segments.add(b);
                }
                results.save(result);
                attempts.markDone(attemptKey, day);
                return new Outcome(Status.DONE, "ok", result, used(fileBudgets), 0);
            } finally {
                logBytes(day, fileBudgets);
                for (String k : pins) features.unpin(k);
            }
        } catch (IOException | RuntimeException | OutOfMemoryError e) {
            Outcome o = new Outcome(Status.NO_TIMES, e.getClass().getSimpleName(), null, 0, 0);
            if (!(e instanceof IOException)) attempts.markDone(attemptKey, day);
            return o;
        }
    }

    /** A finished try blocks any retry today; a temporary failure leaves its one retry. */
    private void finishIfDone(String attemptKey, String day, Outcome o) {
        if (o == null || o.status != Status.NO_TIMES) return;
        if ("no-segments".equals(o.reason)) { attempts.markDone(attemptKey, day); return; }
        if (!isTemporary(o.reason)) attempts.markDone(attemptKey, day);
    }

    private boolean isTemporary(String reason) {
        if (reason == null) return false;
        if ("cancelled".equals(reason)) return true;
        if ("target-unavailable".equals(reason)) return lastRefTemporary();
        if (reason.startsWith("refs-lost:")) return lastRefTemporary();
        if ("IOException".equals(reason)) return true;
        return reason.endsWith("Exception") && (reason.contains("Socket")
                || reason.contains("Timeout") || reason.contains("Connect") || reason.contains("Host"));
    }

    private boolean lastRefTemporary() {
        if (lastRefFailure == null) return false;
        return lastRefFailure.startsWith("IO:") || lastRefFailure.startsWith("LINK_EXPIRED:")
                || lastRefFailure.startsWith("RATE_LIMITED:") || lastRefFailure.startsWith("CANCELLED:")
                || "IOException".equals(lastRefFailure) || lastRefFailure.contains("Socket")
                || lastRefFailure.contains("Timeout") || lastRefFailure.contains("Connect")
                || lastRefFailure.contains("Host");
    }

    /** The detector's intro within 15 s at both edges: what a weak borrowed intro needs behind it. */
    private static boolean detectorAgrees(List<OneAheadResult.Segment> found, OneAheadResult.Segment borrowed) {
        for (OneAheadResult.Segment s : found) {
            if ("intro".equals(s.type) && Math.abs(s.start - borrowed.start) <= OneAheadBorrow.DETECTOR_AGREE_S
                    && Math.abs(s.end - borrowed.end) <= OneAheadBorrow.DETECTOR_AGREE_S) return true;
        }
        return false;
    }

    /** Pass 1 for the premiere-context replay veto: the earliest episode's intro, ranked by
     * refcount only. All features are already in memory; no fetching. Null when unknown. */
    private java.util.Map<String, double[]> hintPass(EpisodeFeatures t, List<EpisodeFeatures> refs) {
        java.util.Map<String, double[]> hints = new java.util.HashMap<>();
        try {
            List<EpisodeFeatures> all = new java.util.ArrayList<>(refs);
            all.add(t);
            EpisodeFeatures earliest = all.get(0);
            for (EpisodeFeatures e : all) {
                int[] a = Detector.epOrder(e.id), b = Detector.epOrder(earliest.id);
                if (a[0] < b[0] || (a[0] == b[0] && a[1] < b[1])) earliest = e;
            }
            List<EpisodeFeatures> others = new java.util.ArrayList<>(all);
            others.remove(earliest);
            if (others.size() < 2) return hints;
            Detector.Result r = Detector.hintDetector().detect(earliest, others, null);
            for (Detector.Segment s : r.segments) {
                if ("intro".equals(s.type)) {
                    hints.put(earliest.id, new double[]{s.start, s.end});
                    break;
                }
            }
        } catch (RuntimeException | OutOfMemoryError e) {
            hints.clear();
        }
        return hints;
    }

    /** Stored features first, so a run stops before any lengthy fetch it does not need. */
    private List<OneAheadPlanner.FilePlan> storedFirst(List<OneAheadPlanner.FilePlan> in) {
        List<OneAheadPlanner.FilePlan> hit = new ArrayList<>(), miss = new ArrayList<>();
        for (OneAheadPlanner.FilePlan rp : in) {
            String k = OneAheadStores.key(rp.ref.episodeId, rp.ref.fileSize, rp.ref.headHash);
            (features.has(k) ? hit : miss).add(rp);
        }
        hit.addAll(miss);
        return hit;
    }

    private static ByteBudget newFileBudget(ByteBudget day, List<ByteBudget> all) {
        ByteBudget b = new ByteBudget(OneAheadPlanner.FILE_CAP, 0, day);
        all.add(b);
        return b;
    }

    private static long used(List<ByteBudget> all) {
        long s = 0;
        for (ByteBudget b : all) s += b.used();
        return s;
    }

    /** Written after every file: a killed process keeps what it already spent on the day's count. */
    private void logBytes(String day, List<ByteBudget> budgets) {
        long now = used(budgets);
        attempts.addBytes(day, now - bytesLogged);
        bytesLogged = now;
    }

    private Outcome noTimes(String reason, List<ByteBudget> budgets) {
        if ("cancelled".equals(reason)) cancelSeen = true;
        return new Outcome(Status.NO_TIMES, cancelSeen ? "cancelled" : reason, null, used(budgets), 0);
    }

    /** Cached features win; otherwise fetch, then cache. A fetch failure is null, not an exception. */
    private EpisodeFeatures obtain(OneAheadPlanner.FilePlan fp, ByteBudget budget, List<String> pins) {
        String k = OneAheadStores.key(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash);
        features.pin(k); pins.add(k);
        EpisodeFeatures cached = features.load(k);
        if (cached != null) {
            // Identity is part of the key, but never trust a file that disagrees with the plan.
            if (cached.fileSize == fp.ref.fileSize && (fp.ref.headHash == 0 || cached.headHash == fp.ref.headHash))
                return withFinale(cached, fp.ref);
            lastRefFailure = "cache-mismatch";
            return null;
        }
        try {
            EpisodeFeatures fresh = fetcher.fetch(fp, budget, guard);
            if (fresh == null) { lastRefFailure = "fetch-null"; return null; }
            features.save(k, fresh);
            return fresh;
        } catch (DemuxException e) {
            if (e.kind == DemuxException.Kind.CANCELLED) cancelSeen = true;
            // Messages never contain a URL (see DemuxException): kind plus detail names the failure.
            String detail = e.getMessage() == null ? "" : e.getMessage().replace('\n', ' ').replace('\r', ' ');
            if (detail.length() > 80) detail = detail.substring(0, 80);
            lastRefFailure = (e.kind == null ? "DemuxException" : e.kind.name()) + ":" + detail;
            return null;
        } catch (IOException | RuntimeException | OutOfMemoryError e) {
            lastRefFailure = e.getClass().getSimpleName();
            return null;
        }
    }

    private static void safeLog(String msg) {
        try { android.util.Log.i(TAG, msg); } catch (Throwable ignored) { /* PC tests have no Log */ }
    }

    private static EpisodeFeatures withFinale(EpisodeFeatures e, OneAheadPlanner.FileRef ref) {
        // The caller's finale flag for this episode wins over whatever the cache recorded.
        if (e.finale == ref.finale && e.language != null && (ref.language == null || ref.language.equals(e.language))) return e;
        return new EpisodeFeatures(e.id, e.fileSize, e.headHash,
                e.language != null ? e.language : ref.language, e.duration, e.audioEnd, ref.finale, e.head, e.tail);
    }

    /** Pause rule: yield while the player needs the machine; cancellation aborts. */
    private void awaitPlayback() {
        while (guard.shouldPause() && !guard.isCancelled()) {
            try { Thread.sleep(250); } catch (InterruptedException e) { Thread.currentThread().interrupt(); return; }
        }
    }
}
