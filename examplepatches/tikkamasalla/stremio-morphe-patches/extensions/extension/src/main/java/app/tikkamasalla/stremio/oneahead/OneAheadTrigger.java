package app.tikkamasalla.stremio.oneahead;

import android.content.Context;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.introskip.IntroSkipPrefs;
import app.tikkamasalla.stremio.introskip.NextPrep;
import app.tikkamasalla.stremio.introskip.StreamRanker;
import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;
import app.tikkamasalla.stremio.oneahead.demux.TrackChooser;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Android glue of the one-ahead wiring: joins "next episode prepared" (NextPrep)
 * with "skip lookup for it finished" (IntroSkipBridge prefetch). The checks that need the
 * app's own state run on a background thread here; the job itself (candidates, reads, decoding,
 * detection) runs in the worker process, so a native crash there cannot touch playback.
 * Every hook is fail-soft and none does IO on the caller's thread; resultsFor
 * is the one deliberate exception (a small synchronous store read for the player).
 * Links live only in memory; logs and the diary carry ids and counts, never a URL.
 */
public final class OneAheadTrigger {
    private static final String TAG = "OneAhead";
    private static final int HEAD_BYTES = 16 * 1024;
    private static final long STALE_MS = 10_000L, RECENT_MS = 3_000L;
    /** Enough for the planner's floor when the file playing now is a finale and cannot vote. */
    private static final int MAX_STREAM_QUERIES = 3;
    /** Hard bound on asks per job, answered or not, so a dead addon cannot spin. */
    private static final int MAX_STREAM_ASKS = 6;

    /** Another episode may be asked while fewer than 3 asks have returned rows and fewer than 6 were made in all. */
    static boolean mayAsk(int usableAsks, int totalAsks) {
        return usableAsks < MAX_STREAM_QUERIES && totalAsks < MAX_STREAM_ASKS;
    }

    private OneAheadTrigger() {}

    // ---- player snapshot (written on the main thread, read by the guard) ------
    private static volatile int playerState;
    private static volatile long playerAtMs, sessionStartMs, lastSeekMs;
    private static volatile boolean internalActive;
    // In the worker process the app's setting arrives with the player state: preferences do not cross processes.
    private static volatile Boolean workerEnabled;
    private static volatile Boolean workerBorrow;

    private static boolean oneAheadOn(Context ctx) {
        Boolean w = workerEnabled;
        return w != null ? w : IntroSkipPrefs.isOneAheadEnabled(ctx);
    }

    private static boolean borrowOn(Context ctx) {
        Boolean w = workerBorrow;
        return w != null ? w : IntroSkipPrefs.isBorrowEnabled(ctx);
    }

    private static boolean settingOn(Context ctx) {
        return oneAheadOn(ctx) || borrowOn(ctx);
    }

    /** The app side: what the worker's guard needs, sent once a second while a job runs. */
    private static android.os.Bundle playerStateBundle(Context ctx) {
        android.os.Bundle b = new android.os.Bundle();
        b.putInt("pState", playerState);
        b.putLong("pAt", playerAtMs);
        b.putLong("pSession", sessionStartMs);
        b.putLong("pSeek", lastSeekMs);
        b.putBoolean("pActive", internalActive);
        b.putBoolean("pEnabled", IntroSkipPrefs.isOneAheadEnabled(ctx));
        b.putBoolean("pBorrow", IntroSkipPrefs.isBorrowEnabled(ctx));
        return b;
    }

    /** The worker side of playerStateBundle. */
    static void applyPlayerState(android.os.Bundle b) {
        if (b == null || !b.containsKey("pEnabled")) return;
        playerState = b.getInt("pState");
        playerAtMs = b.getLong("pAt");
        sessionStartMs = b.getLong("pSession");
        lastSeekMs = b.getLong("pSeek");
        internalActive = b.getBoolean("pActive");
        workerEnabled = b.getBoolean("pEnabled");
        workerBorrow = b.containsKey("pBorrow") ? b.getBoolean("pBorrow") : null;
    }

    public static void notePlayer(int state, boolean playing) {
        try {
            long now = System.currentTimeMillis();
            if (sessionStartMs == 0) sessionStartMs = now;
            playerState = state; playerAtMs = now; internalActive = true;
        } catch (Throwable ignored) { /* diagnostics only */ }
    }

    public static void noteSeek() {
        try { lastSeekMs = System.currentTimeMillis(); } catch (Throwable ignored) { /* diagnostics only */ }
    }

    /** The player session is gone. A running job goes on; the next session's start pauses it again. */
    public static void notePlayerGone() {
        try { internalActive = false; sessionStartMs = 0; } catch (Throwable ignored) { /* diagnostics only */ }
    }

    /**
     * A job outlives player sessions: it yields while any player needs the machine, and only the
     * setting going off or a heap under the floor stops it.
     */
    private static PlaybackGuard guard(final Context ctx) {
        return new PlaybackGuard() {
            @Override public boolean shouldPause() {
                if (!internalActive) return false;
                long now = System.currentTimeMillis();
                if (now - playerAtMs > STALE_MS) return false; // no live player report to wait on
                // Buffered-ahead is not exposed by the player interface, so the
                // buffered <15s / >20s rule is left out rather than invented.
                return playerState == 2 /* BUFFERING */
                        || now - sessionStartMs < RECENT_MS
                        || (lastSeekMs > 0 && now - lastSeekMs < RECENT_MS);
            }
            @Override public boolean isCancelled() {
                return !settingOn(ctx) || HeapGate.belowFloor();
            }
        };
    }

    // ---- join of prepared + lookup ---------------------------------------------
    private static final class Pending {
        String videoId, type, metaId, url, fileName, transport, metaTransport, curId, curUrl;
        boolean cached, external, hasIntro, hasCredits, preparedDone, lookupDone, started;
        long sizeBytes;
        double curDurSec;
        /** Audio of the file playing now (ISO 639-2 + channels), read off the player's selected track. */
        String curAudioLang = "";
        int curAudioChannels;
        /** How curAudioLang was learned: TrackChooser.SELECTED (player), PREVIOUS (last episode) or UNKNOWN. */
        String curAudioSource = TrackChooser.UNKNOWN;
    }

    private static final Map<String, Pending> PENDING = new ConcurrentHashMap<>();
    private static final Set<String> STARTED = java.util.Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private static volatile ExecutorService worker;
    private static volatile OneAheadStores.ResultStore sharedResults;

    public static void onPrepared(Context ctx, String videoId, String type, String metaId, String url,
                                  String fileName, String transport, String metaTransport,
                                  boolean cached, long sizeBytes, boolean external) {
        try {
            if (ctx == null || videoId == null || videoId.length() == 0
                    || !settingOn(ctx)) return;
            Pending p = pending(videoId);
            synchronized (p) {
                p.type = type; p.metaId = metaId; p.url = url; p.fileName = fileName;
                p.transport = transport; p.metaTransport = metaTransport;
                p.cached = cached; p.sizeBytes = sizeBytes; p.external = external;
                p.preparedDone = true;
            }
            maybeStart(ctx, p);
        } catch (Throwable t) { Log.w(TAG, "prepared " + OneAheadGate.safeReason(t)); }
    }

    public static void onLookupDone(Context ctx, String videoId, boolean hasIntro, boolean hasCredits,
                                    String curId, String curUrl, double curDurSec) {
        onLookupDone(ctx, videoId, hasIntro, hasCredits, curId, curUrl, curDurSec, "", 0);
    }

    public static void onLookupDone(Context ctx, String videoId, boolean hasIntro, boolean hasCredits,
                                    String curId, String curUrl, double curDurSec,
                                    String curAudioLang, int curAudioChannels) {
        onLookupDone(ctx, videoId, hasIntro, hasCredits, curId, curUrl, curDurSec, curAudioLang, curAudioChannels,
                curAudioLang == null || curAudioLang.isEmpty() ? TrackChooser.UNKNOWN : TrackChooser.SELECTED);
    }

    public static void onLookupDone(Context ctx, String videoId, boolean hasIntro, boolean hasCredits,
                                    String curId, String curUrl, double curDurSec,
                                    String curAudioLang, int curAudioChannels, String curAudioSource) {
        try {
            if (ctx == null || videoId == null || videoId.length() == 0
                    || !settingOn(ctx)) return;
            Pending p = pending(videoId);
            synchronized (p) {
                // Knowledge only grows: a later "nothing known" (external path)
                // never erases what an earlier lookup found or which file plays.
                p.hasIntro |= hasIntro; p.hasCredits |= hasCredits;
                if (curId != null && curId.length() > 0) p.curId = curId;
                if (curUrl != null && curUrl.length() > 0) p.curUrl = curUrl;
                if (curDurSec > 0) p.curDurSec = curDurSec;
                // The player's own track beats the previous episode's language; neither is erased by nothing.
                if (curAudioLang != null && curAudioLang.length() > 0
                        && !(TrackChooser.SELECTED.equals(p.curAudioSource) && !TrackChooser.SELECTED.equals(curAudioSource))) {
                    p.curAudioLang = curAudioLang;
                    p.curAudioChannels = curAudioChannels;
                    p.curAudioSource = curAudioSource == null ? TrackChooser.UNKNOWN : curAudioSource;
                }
                p.lookupDone = true;
            }
            maybeStart(ctx, p);
        } catch (Throwable t) { Log.w(TAG, "lookup " + OneAheadGate.safeReason(t)); }
    }

    private static Pending pending(String videoId) {
        Pending p = PENDING.get(videoId);
        if (p == null) {
            Pending fresh = new Pending();
            fresh.videoId = videoId;
            Pending old = PENDING.putIfAbsent(videoId, fresh);
            p = old != null ? old : fresh;
            // Bound memory by dropping finished joins; half-joined ones stay.
            if (PENDING.size() > 8) PENDING.values().removeIf(q -> q.started);
        }
        return p;
    }

    private static void maybeStart(final Context ctx, Pending p) {
        synchronized (p) {
            if (p.started || !p.preparedDone || !p.lookupDone) return;
            p.started = true;
        }
        if (!STARTED.add(p.videoId)) return;
        if (worker == null) {
            synchronized (OneAheadTrigger.class) {
                if (worker == null) worker = Executors.newSingleThreadExecutor(r -> {
                    Thread t = new Thread(r, "one-ahead-trigger");
                    t.setPriority(Thread.MIN_PRIORITY);
                    t.setDaemon(true);
                    return t;
                });
            }
        }
        final Pending job = p;
        worker.execute(() -> run(ctx.getApplicationContext(), job));
    }

    // Verified hand-off for the external player launch (memory only, no IO): one object, so it is never half new.
    private static final class Verified {
        final String vid, extra;
        final long urlHash;
        Verified(String vid, String extra, long urlHash) { this.vid = vid; this.extra = extra; this.urlHash = urlHash; }
    }
    private static volatile Verified verified;

    /** The launch extra for this episode and link, or null when not verified for it or the setting is off. */
    public static String handoffFor(Context ctx, String videoId, String url) {
        try {
            Verified v = verified;
            if (v == null || !v.vid.equals(videoId) || url == null || !settingOn(ctx)) return null;
            return OneAheadStores.urlHash(url) == v.urlHash ? v.extra : null;
        } catch (Throwable t) { return null; }
    }

    // A result that arrives while its episode already plays: sessions look at this once per poll.
    private static volatile String doneVid;
    private static volatile long doneSeq;

    public static long doneSeq() { return doneSeq; }
    public static String doneVid() { return doneVid; }

    /** A result file exists for this video id. No network; the only reason to read the playing link at all. */
    public static boolean hasResultFile(Context ctx, String videoId) {
        try {
            return videoId != null && settingOn(ctx) && results(ctx).has(videoId);
        } catch (Throwable t) { return false; }
    }

    /** File identity (size, head hash) of a playing link; one small head read. Null on failure. */
    public static long[] probeIdentity(Context ctx, String url) {
        try {
            if (ctx == null || url == null || !settingOn(ctx)) return null;
            return probe(url, guard(ctx.getApplicationContext()), OneAheadPlanner.PACE_INTERNAL_BPS);
        } catch (Throwable t) { return null; }
    }

    /** Read-only result lookup for the skip wiring: the result for this exact file, or null. */
    public static OneAheadResult resultsFor(Context ctx, String videoId, long fileSize, long headHash) {
        try {
            if (ctx == null || videoId == null || !settingOn(ctx)) return null;
            return results(ctx).load(videoId, fileSize, headHash);
        } catch (Throwable t) { return null; }
    }

    private static OneAheadStores.ResultStore results(Context ctx) {
        OneAheadStores.ResultStore s = sharedResults;
        if (s == null) {
            s = new OneAheadStores.ResultStore(new File(storeDir(ctx), "results"));
            sharedResults = s;
        }
        return s;
    }

    private static File storeDir(Context ctx) {
        return new File(ctx.getApplicationContext().getFilesDir(), "oneahead");
    }

    private static final class Cand {
        final OneAheadGate.Candidate gate;
        final String url;
        final boolean cachedFeat;
        final long fSize, fHash;
        Cand(OneAheadGate.Candidate g, String url, boolean cachedFeat, long fSize, long fHash) {
            this.gate = g; this.url = url; this.cachedFeat = cachedFeat; this.fSize = fSize; this.fHash = fHash;
        }
    }

    /** App process, trigger thread: the checks that need the app's own state, then the worker. */
    private static void run(Context ctx, Pending p) {
        try {
            OneAheadAndroid.lowerPriority();
            OneAheadStores.AttemptLog attempts = new OneAheadStores.AttemptLog(storeDir(ctx));
            String today = java.time.LocalDate.now().toString();

            // Cheap refusals first: no meta fetch, no probe, no stream query.
            String early = OneAheadGate.decideTarget(settingOn(ctx), "series".equals(p.type),
                    p.url, p.cached, p.hasIntro, p.hasCredits, false);
            if (early != null) {
                Log.i(TAG, "refuse " + early + " vid=" + p.videoId);
                PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", early);
                return;
            }

            // No per-episode attempt check here: one file gets its own tries, so the
            // worker probes the file identity and the runner refuses a finished file
            // or one already tried twice today.

            // Known without any media read: chapters win at playback, Own times
            // already cover the missing types. Either stops the whole fetch.
            if (OneAheadGate.containerOf(p.fileName) == OneAheadPlanner.Container.MKV
                    && app.tikkamasalla.stremio.introskip.IntroSkipBridge.chaptersCoverBoth(p.url, p.curDurSec)) {
                Log.i(TAG, "refuse chapters vid=" + p.videoId);
                PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", "chapters");
                return;
            }
            // Partial cover stops it too: an intro from the lookup plus credits
            // from chapters (or the reverse) leaves nothing for the run to find.
            if (OneAheadGate.containerOf(p.fileName) == OneAheadPlanner.Container.MKV
                    && app.tikkamasalla.stremio.introskip.IntroSkipBridge.chaptersCover(p.url, p.curDurSec, !p.hasIntro, !p.hasCredits)) {
                Log.i(TAG, "refuse chapters vid=" + p.videoId);
                PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", "chapters");
                return;
            }
            int[] se = StreamRanker.requestOf(p.videoId);
            if (se[1] > 0 && app.tikkamasalla.stremio.introskip.IntroSkipBridge.ownTimesCover(
                    p.metaId, se[0], se[1], (long) (p.curDurSec * 1000.0), !p.hasIntro, !p.hasCredits)) {
                Log.i(TAG, "refuse own-times vid=" + p.videoId);
                PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", "own-times");
                return;
            }

            // A same-quality file with its own chapters beats audio detection: swap the
            // prepared winner in the background; its chapters then stop this run.
            if (!p.hasIntro || !p.hasCredits) {
                String[] swap = NextPrep.chapterSwap(ctx, p.videoId, !p.hasIntro, !p.hasCredits, p.curDurSec);
                if (swap != null && NextPrep.isPreparedStream(p.videoId, swap[0])) {
                    long newSize = 0;
                    try { newSize = Long.parseLong(swap[2]); } catch (RuntimeException ignored) { /* unknown size */ }
                    synchronized (p) { p.url = swap[0]; p.fileName = swap[1]; p.cached = true; p.sizeBytes = newSize; }
                    Log.i(TAG, "refuse chapters vid=" + p.videoId);
                    PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", "chapters");
                    return;
                }
            }

            runInWorker(ctx, p, attempts, today, se);
        } catch (Throwable t) {
            // Fail soft: no times, one log line, never a crash into playback.
            Log.w(TAG, "failed " + OneAheadGate.safeReason(t) + " vid=" + p.videoId);
        }
    }

    /** Hands the job over and waits for its end; a dead worker counts as the day's attempt and is not retried. */
    private static void runInWorker(Context ctx, Pending p, OneAheadStores.AttemptLog attempts, String today, int[] se)
            throws InterruptedException {
        android.os.Bundle job = new android.os.Bundle();
        addDonors(job, ctx, p, se);
        job.putString("videoId", p.videoId);
        job.putString("type", p.type);
        job.putString("metaId", p.metaId);
        job.putString("url", p.url);
        job.putString("fileName", p.fileName);
        job.putString("transport", p.transport);
        job.putString("metaTransport", p.metaTransport);
        job.putString("curId", p.curId);
        job.putString("curUrl", p.curUrl);
        job.putString("curAudioLang", p.curAudioLang);
        job.putInt("curAudioChannels", p.curAudioChannels);
        job.putString("curAudioSource", p.curAudioSource);
        job.putBoolean("cached", p.cached);
        job.putBoolean("external", p.external);
        job.putBoolean("hasIntro", p.hasIntro);
        job.putBoolean("hasCredits", p.hasCredits);
        job.putLong("sizeBytes", p.sizeBytes);
        job.putDouble("curDurSec", p.curDurSec);
        OneAheadWorkerLink link = new OneAheadWorkerLink();
        OneAheadWorkerLink.End end = link.run(ctx, job, new OneAheadWorkerLink.Replies() {
            @Override public void diary(android.os.Bundle e) {
                String[] kv = e.getStringArray("kv");
                PlaybackDiary.ev(ctx, e.getString("name"), (Object[]) (kv == null ? new String[0] : kv));
            }
            @Override public android.os.Bundle playerState() { return playerStateBundle(ctx); }
        });
        if (end == OneAheadWorkerLink.End.DIED) {
            String show = p.metaId == null ? "" : p.metaId.trim();
            long pace = p.external ? OneAheadPlanner.PACE_EXTERNAL_BPS : OneAheadPlanner.PACE_INTERNAL_BPS;
            long[] id = probe(p.url, guard(ctx.getApplicationContext()), pace);
            if (id != null) {
                String key = OneAheadStores.key(p.videoId, id[0], id[1]);
                if (attempts.attemptsToday(key, today) == 0) attempts.mark(key, show, today);
            }
            Log.w(TAG, "worker died vid=" + p.videoId + ", counted as today's attempt");
            PlaybackDiary.ev(ctx, "oneahead.refuse", "vid", p.videoId, "why", "worker-died");
            return;
        }
        if (end == OneAheadWorkerLink.End.NO_START) {
            Log.w(TAG, "refuse worker-not-started vid=" + p.videoId);
            return;
        }
        android.os.Bundle f = link.finished();
        if (f == null) return;
        if (f.getBoolean("unresolvable")) {
            // A link that cannot be resolved now may resolve later: do not latch.
            STARTED.remove(p.videoId);
            synchronized (p) { p.started = false; }
            return;
        }
        String extra = f.getString("extra");
        if (extra != null) {
            // Same-file verified on the target link: offer it to an external launch.
            verified = new Verified(p.videoId, extra, f.getLong("urlHash"));
            doneVid = p.videoId;
            doneSeq++; // the trigger thread is the only writer
        }
    }

    /** The streams to borrow chapters from, and which types no own chapter or Own time has. */
    private static void addDonors(android.os.Bundle job, Context ctx, Pending p, int[] se) {
        List<String[]> rows = NextPrep.borrowDonors(p.videoId, p.url);
        if (rows.isEmpty() || !OneAheadGate.isDirectHttp(p.url)) return;
        boolean needIntro = !p.hasIntro, needCredits = !p.hasCredits;
        long ms = (long) (p.curDurSec * 1000.0);
        boolean mkv = OneAheadGate.containerOf(p.fileName) == OneAheadPlanner.Container.MKV;
        if (needIntro && (app.tikkamasalla.stremio.introskip.IntroSkipBridge.ownTimesCover(p.metaId, se[0], se[1], ms, true, false)
                || mkv && app.tikkamasalla.stremio.introskip.IntroSkipBridge.chaptersCover(p.url, p.curDurSec, true, false))) needIntro = false;
        if (needCredits && (app.tikkamasalla.stremio.introskip.IntroSkipBridge.ownTimesCover(p.metaId, se[0], se[1], ms, false, true)
                || mkv && app.tikkamasalla.stremio.introskip.IntroSkipBridge.chaptersCover(p.url, p.curDurSec, false, true))) needCredits = false;
        if (!needIntro && !needCredits) return;
        ArrayList<String> urls = new ArrayList<>(), names = new ArrayList<>(), titles = new ArrayList<>();
        for (String[] d : rows) { urls.add(d[0]); names.add(d[1]); titles.add(d[2]); }
        job.putStringArrayList("dUrls", urls);
        job.putStringArrayList("dNames", names);
        job.putStringArrayList("dTitles", titles);
        job.putBoolean("needIntro", needIntro);
        job.putBoolean("needCredits", needCredits);
    }

    // ---- the job (worker process) -----------------------------------------------

    /** Worker process, its only thread for this job: everything that reads media. Never throws. */
    static void runJob(Context ctx, android.os.Bundle job, android.os.Messenger reply) {
        Pending p = new Pending();
        p.videoId = job.getString("videoId");
        p.type = job.getString("type");
        p.metaId = job.getString("metaId");
        p.url = job.getString("url");
        p.fileName = job.getString("fileName");
        p.transport = job.getString("transport");
        p.metaTransport = job.getString("metaTransport");
        p.curId = job.getString("curId");
        p.curUrl = job.getString("curUrl");
        try {
            String l = job.getString("curAudioLang");
            p.curAudioLang = l == null ? "" : l;
            p.curAudioChannels = job.getInt("curAudioChannels");
            String src = job.getString("curAudioSource");
            p.curAudioSource = src == null || src.isEmpty() ? TrackChooser.UNKNOWN : src;
        } catch (Throwable ignored) { /* older Bundle without the audio */ }
        p.cached = job.getBoolean("cached");
        p.external = job.getBoolean("external");
        p.hasIntro = job.getBoolean("hasIntro");
        p.hasCredits = job.getBoolean("hasCredits");
        p.sizeBytes = job.getLong("sizeBytes");
        p.curDurSec = job.getDouble("curDurSec");
        android.os.Bundle end = new android.os.Bundle();
        job(ctx, p, job, reply, end);
        send(reply, OneAheadWorkerService.MSG_FINISHED, end);
    }

    private static void send(android.os.Messenger to, int what, android.os.Bundle data) {
        try {
            android.os.Message m = android.os.Message.obtain(null, what);
            m.setData(data);
            to.send(m);
        } catch (android.os.RemoteException | RuntimeException gone) { /* the app is gone; this process follows */ }
    }

    /** A diary line goes through the app: the diary file has one writer. */
    private static void diary(android.os.Messenger to, String name, String... kv) {
        android.os.Bundle e = new android.os.Bundle();
        e.putString("name", name);
        e.putStringArray("kv", kv);
        send(to, OneAheadWorkerService.MSG_DIARY, e);
    }

    private static void job(Context ctx, Pending p, android.os.Bundle job, android.os.Messenger reply, android.os.Bundle end) {
        long startedAt = System.currentTimeMillis();
        try {
            OneAheadAndroid.lowerPriority();
            PlaybackGuard guard = guard(ctx);
            long pace = p.external ? OneAheadPlanner.PACE_EXTERNAL_BPS : OneAheadPlanner.PACE_INTERNAL_BPS;
            Map<Long, String> urlByHash = new ConcurrentHashMap<>();
            DemuxFeatureFetcher fetcher = new DemuxFeatureFetcher(
                    (ref, budget, g) -> {
                        String u = urlByHash.get(ref.urlHash);
                        return OneAheadAndroid.source(u == null ? "" : u, g, budget, pace);
                    },
                    OneAheadAndroid.decoders(msg -> Log.i(TAG, msg)), msg -> Log.i(TAG, msg), p.curAudioSource);
            OneAheadRunner runner = new OneAheadRunner(storeDir(ctx), fetcher,
                    OneAheadRunner.defaultDetectors(), guard, null);
            boolean wantBorrow = OneAheadGate.runBorrow(borrowOn(ctx));
            boolean wantDetect = OneAheadGate.runDetect(oneAheadOn(ctx));
            Log.i(TAG, "mode borrow=" + (wantBorrow ? "on" : "off") + " oneahead=" + (wantDetect ? "on" : "off") + " vid=" + p.videoId);

            // Cheap refusals first: the target link is not read for a refused or duration-less target.
            String earlyWord = OneAheadGate.decideTarget(OneAheadGate.jobRuns(borrowOn(ctx), oneAheadOn(ctx)), "series".equals(p.type),
                    p.url, p.cached, p.hasIntro, p.hasCredits, false);
            if (earlyWord != null) {
                Log.i(TAG, "refuse " + earlyWord + " vid=" + p.videoId);
                diary(reply, "oneahead.refuse", "vid", p.videoId, "why", earlyWord);
                return;
            }

            MetaInfo meta = fetchMeta(p);
            List<String> seasonIds = meta == null ? null : meta.seasonIds;
            // Only prices the plan; the fetcher measures each file's own duration.
            double duration = meta != null && meta.runtimeSec > 0 ? meta.runtimeSec
                    : p.curDurSec > 0 ? p.curDurSec : 0;
            if (duration <= 0) { Log.i(TAG, "refuse no-duration vid=" + p.videoId); return; }

            long[] targetId = probe(p.url, guard, pace);
            if (targetId == null) {
                end.putBoolean("unresolvable", true);
                Log.i(TAG, "refuse unresolvable vid=" + p.videoId);
                return;
            }
            boolean hasResult = runner.results().load(p.videoId, targetId[0], targetId[1]) != null;
            String word = OneAheadGate.decideTarget(OneAheadGate.jobRuns(borrowOn(ctx), oneAheadOn(ctx)), "series".equals(p.type),
                    p.url, p.cached, p.hasIntro, p.hasCredits, hasResult);
            if (word != null) {
                Log.i(TAG, "refuse " + word + " vid=" + p.videoId);
                diary(reply, "oneahead.refuse", "vid", p.videoId, "why", word);
                return;
            }

            // Between online sources and audio detection: nothing else to run when it covers every missing type.
            OneAheadBorrow.Run br = wantBorrow ? borrow(p, job, runner, meta, guard, pace) : null;
            List<OneAheadResult.Segment> borrowed = br == null ? new ArrayList<>() : br.segments;
            boolean weakIntro = br != null && br.weakIntro;
            if (!borrowed.isEmpty() && covers(borrowed, job.getBoolean("needIntro"), job.getBoolean("needCredits"), weakIntro)) {
                report(runner.keepBorrowed(p.videoId, p.metaId, targetId[0], targetId[1]), p, targetId, startedAt, reply, end);
                return;
            }

            if (!wantDetect) {
                if (!borrowed.isEmpty()) {
                    report(runner.keepBorrowed(p.videoId, p.metaId, targetId[0], targetId[1]), p, targetId, startedAt, reply, end);
                } else {
                    report(new OneAheadRunner.Outcome(OneAheadRunner.Status.NO_TIMES, "borrow-empty", null, 0, 0), p, targetId, startedAt, reply, end);
                }
                return;
            }
            register(urlByHash, p.url);
            List<Cand> cands = candidates(ctx, p, runner, seasonIds, urlByHash);
            String targetGroup = OneAheadGate.releaseGroup(p.fileName);
            List<OneAheadGate.Candidate> ordered = OneAheadGate.orderCandidates(gates(cands), targetGroup);
            // Preferred picks first, the rest as probe fallbacks (a failed probe
            // must not strand the run below the planner's reference floor).
            List<OneAheadGate.Candidate> picks = OneAheadGate.capForPlanner(ordered, targetGroup);
            for (OneAheadGate.Candidate gc : ordered) if (!picks.contains(gc)) picks.add(gc);
            Map<String, Cand> byEpisode = new LinkedHashMap<>();
            for (Cand c : cands) if (!byEpisode.containsKey(c.gate.episodeId)) byEpisode.put(c.gate.episodeId, c);

            List<OneAheadPlanner.FileRef> refs = new ArrayList<>();
            String wantLang = p.curAudioLang == null ? "" : p.curAudioLang;
            for (OneAheadGate.Candidate gc : picks) {
                if (refs.size() >= OneAheadPlanner.MAX_REFS) break;
                Cand c = byEpisode.get(gc.episodeId);
                if (c == null) continue;
                boolean finale = OneAheadGate.candidateFinale(gc.episodeId, seasonIds);
                if (c.cachedFeat) {
                    refs.add(new OneAheadPlanner.FileRef(gc.episodeId, gc.episodeId,
                            c.url == null ? 0 : OneAheadStores.urlHash(c.url), c.fSize, c.fHash, duration,
                            OneAheadGate.containerOf(c.gate.fileName), finale, true, wantLang, p.curAudioChannels, 0));
                } else {
                    long[] id = probe(c.url, guard, pace);
                    if (id == null) continue; // an unresolvable link is simply not a candidate
                    register(urlByHash, c.url);
                    refs.add(new OneAheadPlanner.FileRef(gc.episodeId, gc.episodeId,
                            OneAheadStores.urlHash(c.url), id[0], id[1], duration,
                            OneAheadGate.containerOf(c.gate.fileName), finale, false, wantLang, p.curAudioChannels, -1));
                }
            }
            OneAheadPlanner.FileRef target = new OneAheadPlanner.FileRef(p.videoId, p.videoId,
                    OneAheadStores.urlHash(p.url), targetId[0], targetId[1], duration,
                    OneAheadGate.containerOf(p.fileName), OneAheadGate.isFinale(p.videoId, seasonIds),
                    false, wantLang, p.curAudioChannels, -1);
            Log.i(TAG, "start vid=" + p.videoId + " refs=" + refs.size() + " pace=" + pace
                    + " audio=" + (wantLang.isEmpty() ? "-" : wantLang + "/" + p.curAudioChannels + "ch") + " audio-src=" + p.curAudioSource);
            diary(reply, "oneahead.start", "vid", p.videoId, "refs", String.valueOf(refs.size()));
            OneAheadRunner.Outcome o = runner.runOnce(target, refs, p.metaId);
            String preReason = o.reason == null ? "" : o.reason;
            boolean canTheme = o.status == OneAheadRunner.Status.DONE
                    || (o.status == OneAheadRunner.Status.REFUSED && "NO_REFS".equals(preReason))
                    || (o.status == OneAheadRunner.Status.NO_TIMES
                        && ("refs-lost".equals(preReason) || preReason.startsWith("refs-lost:")
                            || "no-segments".equals(preReason)));
            if (o.status != OneAheadRunner.Status.DONE && !borrowed.isEmpty() && !"cancelled".equals(o.reason)) {
                o = runner.keepBorrowed(p.videoId, p.metaId, targetId[0], targetId[1]);
            }
            // Theme-song backup: only a type the audio run did not find, never an override.
            if (canTheme) o = OneAheadThemes.maybeFill(storeDir(ctx), p.videoId, p.metaId, p.url,
                    p.hasIntro, p.hasCredits, targetId[0], targetId[1],
                    runner, o, guard, pace);
            report(o, p, targetId, startedAt, reply, end);
        } catch (Throwable t) {
            // Fail soft: no times, one log line, never a crash into playback.
            Log.w(TAG, "failed " + OneAheadGate.safeReason(t) + " vid=" + p.videoId);
        }
    }

    private static void report(OneAheadRunner.Outcome o, Pending p, long[] targetId, long startedAt,
                               android.os.Messenger reply, android.os.Bundle end) {
        long secs = (System.currentTimeMillis() - startedAt) / 1000L;
        if (o.status == OneAheadRunner.Status.DONE) {
            end.putString("extra", OneAheadShow.encode(targetId[0], targetId[1],
                    o.result.fileDurationSec, OneAheadShow.fromResult(o.result)));
            end.putLong("urlHash", OneAheadStores.urlHash(p.url));
            Log.i(TAG, "done vid=" + p.videoId + " segs=" + o.result.segments.size()
                    + " bytes=" + o.bytesFetched + " secs=" + secs);
            diary(reply, "oneahead.done", "vid", p.videoId, "segs", String.valueOf(o.result.segments.size()),
                    "bytes", String.valueOf(o.bytesFetched), "secs", String.valueOf(secs));
        } else if (o.status == OneAheadRunner.Status.REFUSED) {
            Log.i(TAG, "refuse " + o.reason + " vid=" + p.videoId + " bytes=" + o.bytesFetched + " secs=" + secs);
            diary(reply, "oneahead.refuse", "vid", p.videoId, "why", o.reason);
        } else {
            Log.i(TAG, "notimes vid=" + p.videoId + " reason=" + o.reason
                    + " bytes=" + o.bytesFetched + " secs=" + secs);
            diary(reply, "oneahead.notimes", "vid", p.videoId, "why", o.reason);
        }
    }

    private static boolean covers(List<OneAheadResult.Segment> found, boolean intro, boolean credits, boolean weakIntro) {
        boolean i = !intro, c = !credits;
        for (OneAheadResult.Segment s : found) {
            // A weak intro covers nothing on its own: only the detector's agreement keeps it.
            if ("intro".equals(s.type) && !weakIntro) i = true;
            if ("credits".equals(s.type)) c = true;
        }
        return i && c;
    }

    /** Runs the chapter borrowing once a day per episode. Failure is simply no borrowed times. */
    private static OneAheadBorrow.Run borrow(Pending p, android.os.Bundle job, OneAheadRunner runner,
                                             MetaInfo meta, PlaybackGuard guard, long pace) {
        OneAheadBorrow.Run none = new OneAheadBorrow.Run(new ArrayList<>(), false);
        ArrayList<String> urls = job.getStringArrayList("dUrls"), names = job.getStringArrayList("dNames"),
                titles = job.getStringArrayList("dTitles");
        if (urls == null || meta == null || !runner.startBorrow(p.videoId)) return none;
        List<OneAheadBorrow.Donor> donors = new ArrayList<>();
        for (int i = 0; i < urls.size(); i++) donors.add(new OneAheadBorrow.Donor(urls.get(i), names.get(i), titles.get(i), true));
        ByteBudget budget = runner.borrowBudget();
        app.tikkamasalla.stremio.oneahead.demux.AudioDecoder.Factory decoders = OneAheadAndroid.decoders(msg -> Log.i(TAG, msg));
        final double[] runtime = {p.curDurSec};
        OneAheadBorrow.Files files = new OneAheadBorrow.Files() {
            @Override public List<OneAheadBorrow.Named> chapters(String url) {
                return app.tikkamasalla.stremio.introskip.IntroSkipBridge.chaptersToBorrow(url, runtime[0]);
            }
            @Override public OneAheadBorrow.Audio open(String url) throws app.tikkamasalla.stremio.oneahead.demux.DemuxException {
                return new HttpAudio(url, guard, budget, pace, decoders);
            }
        };
        OneAheadBorrow.Audio target = null;
        try {
            target = files.open(p.url);
            if (target.duration() > 0) runtime[0] = target.duration();
            int[] se = StreamRanker.requestOf(p.videoId);
            OneAheadBorrow.Run rb = OneAheadBorrow.run(donors, target, se[0], se[1], meta.name,
                    job.getBoolean("needIntro"), job.getBoolean("needCredits"), files, msg -> Log.i(TAG, msg));
            List<OneAheadResult.Segment> found = rb.segments;
            runner.setBorrowed(found, rb.weakIntro, target.duration());
            Log.i(TAG, "borrow done segs=" + found.size() + " bytes=" + budget.used() + " vid=" + p.videoId);
            return rb;
        } catch (Throwable t) {
            Log.i(TAG, "borrow stopped " + OneAheadGate.safeReason(t) + " vid=" + p.videoId);
            return none;
        } finally {
            if (target != null) target.release();
            runner.borrowSpent(budget.used());
        }
    }

    /** A file's audio over the same paced, budgeted reader the audio run uses. */
    private static final class HttpAudio implements OneAheadBorrow.Audio {
        private final app.tikkamasalla.stremio.oneahead.demux.HttpRangeSource source;
        private final app.tikkamasalla.stremio.oneahead.demux.AudioDecoder.Factory decoders;
        private final PlaybackGuard guard;
        private final ByteBudget budget;
        private app.tikkamasalla.stremio.oneahead.demux.AudioWindowReader reader;
        private boolean selected;
        private String language = "";
        private final double duration;
        private final List<String> languages = new ArrayList<>();

        HttpAudio(String url, PlaybackGuard guard, ByteBudget budget, long pace,
                  app.tikkamasalla.stremio.oneahead.demux.AudioDecoder.Factory decoders)
                throws app.tikkamasalla.stremio.oneahead.demux.DemuxException {
            this.source = OneAheadAndroid.source(url, guard, budget, pace);
            this.decoders = decoders; this.guard = guard; this.budget = budget;
            reader = new app.tikkamasalla.stremio.oneahead.demux.AudioWindowReader(source, decoders, guard, budget, Track.SR, msg -> { });
            List<app.tikkamasalla.stremio.oneahead.demux.TrackInfo> tracks = reader.tracks();
            duration = reader.demuxer().durationSec();
            for (app.tikkamasalla.stremio.oneahead.demux.TrackInfo t : tracks) {
                String name = t.name.toLowerCase(java.util.Locale.ROOT);
                if (t.unreadable || t.commentary || t.visualImpaired || name.contains("commentary") || name.contains("descri")) continue;
                String l = app.tikkamasalla.stremio.oneahead.demux.TrackChooser.normalize(t.language);
                if (t.isDefault) languages.add(0, l); else languages.add(l);
            }
        }

        @Override public double duration() { return duration; }
        @Override public List<String> languages() { return languages; }

        @Override public void use(String lang) throws app.tikkamasalla.stremio.oneahead.demux.DemuxException {
            if (selected && lang.equals(language)) return;
            if (selected) {
                selected = false;
                reader.release();
                reader = new app.tikkamasalla.stremio.oneahead.demux.AudioWindowReader(source, decoders, guard, budget, Track.SR, msg -> { });
            }
            reader.prepare(new app.tikkamasalla.stremio.oneahead.demux.TrackChooser.Request(lang, 0));
            selected = true;
            language = lang;
        }

        @Override public float[] window(double start, double length) throws app.tikkamasalla.stremio.oneahead.demux.DemuxException {
            final float[] out = new float[(int) (length * Track.SR)];
            final int[] last = {0};
            final double base = start;
            app.tikkamasalla.stremio.oneahead.demux.AudioWindowReader.SliceResult r = reader.read(start, start + length, (mono, n, sr, ptsUs) -> {
                int at = (int) Math.round(ptsUs / 1e6 * Track.SR - base * Track.SR);
                for (int i = 0; i < n; i++) {
                    int j = at + i;
                    if (j >= 0 && j < out.length) { out[j] = mono[i] / 32768f; if (j >= last[0]) last[0] = j + 1; }
                }
            });
            // A window running into the end of the file ends early; anything else untrusted is no window.
            return r.ok() || (start + length >= duration - 1 && last[0] > 0) ? java.util.Arrays.copyOf(out, last[0]) : null;
        }

        @Override public void release() { reader.release(); }
    }

    private static List<OneAheadGate.Candidate> gates(List<Cand> cands) {
        List<OneAheadGate.Candidate> out = new ArrayList<>();
        for (Cand c : cands) out.add(c.gate);
        return out;
    }

    private static void register(Map<Long, String> urlByHash, String url) {
        if (url != null && url.length() > 0) urlByHash.put(OneAheadStores.urlHash(url), url);
    }

    /** References in order of preference: cached features, the file playing now, later episodes' cached links. */
    private static List<Cand> candidates(Context ctx, Pending p, OneAheadRunner runner,
                                         List<String> seasonIds, Map<Long, String> urlByHash) {
        List<Cand> out = new ArrayList<>();
        java.util.Set<String> seen = new java.util.HashSet<>();
        Log.i(TAG, "season eps=" + (seasonIds == null ? 0 : seasonIds.size())
                + " haveList=" + (seasonIds != null) + " vid=" + p.videoId);
        if (seasonIds != null) {
            for (String epId : seasonIds) {
                if (epId == null || epId.equals(p.videoId)) continue;
                String key = runner.features().keyForEpisode(epId);
                if (key != null && seen.add(epId)) out.add(new Cand(new OneAheadGate.Candidate(epId, "",
                        OneAheadGate.KIND_CACHED_FEATURES, OneAheadStores.keySize(key)),
                        null, true, OneAheadStores.keySize(key), OneAheadStores.keyHash(key)));
            }
        }
        if (p.curId != null && p.curId.length() > 0 && !p.curId.equals(p.videoId) && seen.add(p.curId)
                && OneAheadGate.isDirectHttp(p.curUrl)) {
            register(urlByHash, p.curUrl);
            out.add(new Cand(new OneAheadGate.Candidate(p.curId, nameFromUrl(p.curUrl),
                    OneAheadGate.KIND_NOW_PLAYING, 0), p.curUrl, false, 0, 0));
        }
        if (seasonIds != null && p.transport != null && p.transport.length() > 0) {
            String targetGroup = OneAheadGate.releaseGroup(p.fileName);
            int asked = 0, usableAsks = 0;
            List<String> order = OneAheadGate.queryOrder(seasonIds, p.videoId);
            String firstEp = seasonIds.isEmpty() ? null : seasonIds.get(0);
            for (String epId : order) {
                // the season's first episode is asked even when the stored features already fill the references
                if (!mayAsk(usableAsks, asked) || (out.size() >= OneAheadPlanner.MAX_REFS && !epId.equals(firstEp))) break;
                if (seen.contains(epId)) continue; // already a candidate; save the query
                asked++;
                List<String[]> rows = NextPrep.queryEpisodeStreams(p.type, epId, p.transport);
                if (!rows.isEmpty()) usableAsks++;
                String[] pick = OneAheadGate.pickReference(rows, targetGroup);
                int cached = 0;
                for (String[] row : rows) if (row != null && row.length > 2 && "1".equals(row[2])) cached++;
                String why = pick != null ? "picked" : rows.isEmpty() ? "no-rows" : cached == 0 ? "no-cached" : "no-pick";
                Log.i(TAG, "query ep=" + epId + " rows=" + rows.size() + " cached=" + cached
                        + " picked=" + (pick != null) + " why=" + why + " ask=" + asked + " usable=" + usableAsks + " via=" + NextPrep.shortAddon(p.transport));
                if (pick != null && seen.add(epId)) {
                    register(urlByHash, pick[0]);
                    long size = 0;
                    try { size = Long.parseLong(pick[3]); } catch (RuntimeException ignored) { /* unknown size */ }
                    out.add(new Cand(new OneAheadGate.Candidate(epId, pick[1],
                            OneAheadGate.KIND_STREAM, size), pick[0], false, 0, 0));
                }
            }
        }
        int stored = 0, playing = 0, queried = 0;
        for (Cand c : out) {
            if (c.gate.kind == OneAheadGate.KIND_CACHED_FEATURES) stored++;
            else if (c.gate.kind == OneAheadGate.KIND_NOW_PLAYING) playing++;
            else if (c.gate.kind == OneAheadGate.KIND_STREAM) queried++;
        }
        Log.i(TAG, "refs total=" + out.size() + " stored=" + stored + " playing=" + playing + " query=" + queried
                + " vid=" + p.videoId);
        return out;
    }

    private static String nameFromUrl(String url) {
        try {
            String s = url == null ? "" : url;
            int q = s.indexOf('?'); if (q >= 0) s = s.substring(0, q);
            int slash = s.lastIndexOf('/');
            s = slash >= 0 ? s.substring(slash + 1) : s;
            try { return java.net.URLDecoder.decode(s, "UTF-8"); } catch (Throwable bad) { return s; }
        } catch (Throwable t) { return ""; }
    }

    /** Size + head hash from the reader's own open: one small range read at offset 0. */
    private static long[] probe(String url, PlaybackGuard guard, long pace) {
        try {
            if (!OneAheadGate.isDirectHttp(url) || guard.isCancelled()) return null;
            app.tikkamasalla.stremio.oneahead.demux.HttpRangeSource source =
                    OneAheadAndroid.source(url, guard, new ByteBudget(4_000_000L), pace);
            byte[] buf = new byte[HEAD_BYTES];
            int n = 0;
            while (n < buf.length) {
                int got = source.read(n, buf, n, buf.length - n);
                if (got <= 0) break;
                n += got;
            }
            // A partial head would bind results to the wrong identity: refuse it.
            if (n <= 0 || source.length() <= 0 || guard.isCancelled()) return null;
            if (n < Math.min((long) HEAD_BYTES, source.length())) return null;
            return new long[]{source.length(), OneAheadGate.headHash(buf, 0, n)};
        } catch (Throwable t) { return null; }
    }

    // ---- meta (season list + runtime) ----------------------------------------------

    private static final class MetaInfo {
        final List<String> seasonIds;
        final double runtimeSec;
        final String name;
        MetaInfo(List<String> s, double r, String n) { seasonIds = s; runtimeSec = r; name = n; }
    }

    /** The episode after this one on the show's meta, or "" when it cannot be told. One small request. */
    public static String nextEpisodeId(String type, String metaId, String metaTransport, String videoId) {
        try {
            Pending p = new Pending();
            p.videoId = videoId; p.type = type; p.metaId = metaId; p.metaTransport = metaTransport;
            MetaInfo m = fetchMeta(p);
            if (m == null) return "";
            int at = m.seasonIds.indexOf(videoId);
            return at >= 0 && at + 1 < m.seasonIds.size() ? m.seasonIds.get(at + 1) : "";
        } catch (Throwable t) { return ""; }
    }

    /** The season's episode ids in order, or null when the list cannot be had (target then counts as finale). */
    private static MetaInfo fetchMeta(Pending p) {
        HttpURLConnection conn = null;
        try {
            if (p.metaTransport == null || p.metaTransport.length() == 0
                    || p.metaId == null || p.metaId.length() == 0) return null;
            String base = p.metaTransport;
            int query = base.indexOf('?');
            if (query >= 0) base = base.substring(0, query);
            if (base.endsWith("/manifest.json")) base = base.substring(0, base.length() - "/manifest.json".length());
            while (base.endsWith("/")) base = base.substring(0, base.length() - 1);
            String type = p.type == null || p.type.length() == 0 ? "series" : p.type;
            URL u = new URL(base + "/meta/" + type + "/" + URLEncoder.encode(p.metaId, "UTF-8") + ".json");
            conn = (HttpURLConnection) u.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(10000);
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() != 200) return null;
            InputStream in = conn.getInputStream();
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) { bos.write(buf, 0, n); if (bos.size() > 2 * 1024 * 1024) return null; }
            in.close();
            JSONObject meta = new JSONObject(bos.toString("UTF-8")).optJSONObject("meta");
            if (meta == null) return null;
            JSONArray videos = meta.optJSONArray("videos");
            if (videos == null) return null;
            int[] req = StreamRanker.requestOf(p.videoId);
            List<Object[]> eps = new ArrayList<>();
            for (int i = 0; i < videos.length(); i++) {
                JSONObject v = videos.optJSONObject(i);
                if (v == null) continue;
                String id = v.optString("id", "");
                int season = v.optInt("season", -1), episode = v.optInt("episode", v.optInt("number", -1));
                if (id.length() == 0 || episode < 0) continue;
                if (req[0] > 0 && season >= 0 && season != req[0]) continue; // specials are not the season
                eps.add(new Object[]{episode, id});
            }
            eps.sort((a, b) -> Integer.compare((Integer) a[0], (Integer) b[0]));
            List<String> ids = new ArrayList<>();
            for (Object[] e : eps) ids.add((String) e[1]);
            return ids.isEmpty() ? null : new MetaInfo(ids, OneAheadGate.runtimeSec(meta.optString("runtime", "")), meta.optString("name", ""));
        } catch (Throwable t) { return null; }
        finally { if (conn != null) try { conn.disconnect(); } catch (Throwable ignored) { /* closed */ } }
    }
}
