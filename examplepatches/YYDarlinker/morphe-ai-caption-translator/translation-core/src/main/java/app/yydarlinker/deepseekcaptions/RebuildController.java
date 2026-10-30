package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import org.json.JSONObject;

import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Generation-safe orchestration. Every block has one owner and an immutable accepted event plan.
 */
final class RebuildController {
    static final int WAITING = 0, RUNNING = 1, READY = 2, FAILED = 3;

    /** Foreground translation slots: a new landing uses the free slot without waiting. */
    static final int MAX_FOCUS_CONCURRENCY = 2;

    /** Background prefetch slots. Background work never occupies a foreground slot. */
    static final int MAX_PREFETCH_CONCURRENCY = 2;

    static final long SEEK_STORM_WINDOW_MS = 3000, SEEK_STORM_PAUSE_MS = 5000;

    /**
     * A storm pause ends early once the landing block is ready and no seek arrived for this long.
     */
    static final long SEEK_SETTLED_MS = 1500;

    /** Before the first acceptance, only a next block starting this soon is requested with it. */
    static final long BOOTSTRAP_NEXT_MS = 20000;

    /**
     * Slow retries of a block that never produced a usable plan. A deterministic rejection repeats
     * the same paid request; after this many the block is abandoned for the session instead of
     * being retried forever behind the "翻译中…" placeholder.
     */
    static final int MAX_SLOW_RETRIES = 3;

    /** Page-sized repair requests per block; each asks only for the uncovered page range. */
    static final int MAX_PAGE_REPAIRS_PER_BLOCK = 4;

    /** How long a page may wait for its block reply before the page itself is requested. */
    static final long PAGE_REPAIR_GRACE_MS = 1200;

    private static final AtomicLong IDS = new AtomicLong();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService SOURCE_IO = lane("CaptionSourceIO", 1);
    private static final ExecutorService PRIORITY_IO =
            lane("CaptionPriorityIO", MAX_FOCUS_CONCURRENCY);
    private static final ExecutorService PREFETCH_IO =
            lane("CaptionPrefetchIO", MAX_PREFETCH_CONCURRENCY);

    /**
     * Retirement work, separate from the source/translation lanes: nothing here waits on a permit.
     */
    private static final ThreadPoolExecutor CLEANUP =
            new ThreadPoolExecutor(
                    1,
                    1,
                    0L,
                    TimeUnit.MILLISECONDS,
                    new ArrayBlockingQueue<>(16),
                    runnable -> {
                        Thread thread = new Thread(runnable, "CaptionRetirementIO");
                        thread.setDaemon(true);
                        return thread;
                    },
                    new ThreadPoolExecutor.AbortPolicy());

    private static final RebuildClock CLOCK = new RebuildClock();
    private static volatile Session active;
    private static volatile String video = "";
    private static volatile long publicationEpoch;
    private static boolean tickPosted;

    private static ExecutorService lane(String name, int concurrency) {
        return Executors.newFixedThreadPool(
                concurrency,
                runnable -> {
                    Thread thread = new Thread(runnable, name);
                    thread.setDaemon(true);
                    return thread;
                });
    }

    static void dispatch(Session owner, boolean priority, Runnable work) {
        if (Thread.holdsLock(owner)) throw new IllegalStateException("submit_under_session_lock");
        (priority ? PRIORITY_IO : PREFETCH_IO).submit(work);
    }

    static final class Session {
        final long id = IDS.incrementAndGet();
        final Context context;
        final String owner, identity, target;
        final TranslationSettings config;

        /** Credential identity of this immutable session config; a hash, never the key itself. */
        final CaptionCredentialRef credential;

        final boolean sourceOnly;
        final CaptionLanguageContext languageContext;
        volatile String url;
        volatile boolean visible, cancelled, retired, loading, terminal;

        /** The source evidence kind accepted for this generation; authored cue pages use it. */
        volatile boolean authored;
        volatile long sourceRetry, position;
        final RebuildPlaybackSelection playback = new RebuildPlaybackSelection();
        volatile String status = "";
        int sourceFailures;
        volatile int generation;
        volatile long renderRevision;
        volatile long appliedRenderRevision;
        volatile long renderSubmission;
        final RebuildCache.Publication publication = new RebuildCache.Publication();
        final RebuildWorkSet work = new RebuildWorkSet();
        Job sourceJob;
        String cacheKey = "", lastShown = "";

        final RebuildPresentationSelection presentation = new RebuildPresentationSelection();
        TranslationSourceAccess.Source raw;
        RebuildSource source;
        List<RebuildPlanner.Block> blocks;

        /** Rate limit for the DISPLAY_GAP fallback record. */
        volatile long lastDisplayGapAt;

        /**
         * The single newest foreground request selected but not handed to a lane yet. It exists
         * only while both foreground slots are busy, and a later seek replaces it.
         */
        Job pendingFocus;

        final Set<HttpURLConnection> connections = Collections.synchronizedSet(new HashSet<>());

        private final AtomicBoolean cleanupScheduled = new AtomicBoolean();
        private volatile CountDownLatch cleanupDone = new CountDownLatch(1);
        private volatile String retirementFailure = "";
        private volatile boolean disconnectCaptureComplete;

        /** Connections still owed a physical disconnect after the logical set was detached. */
        private final Set<HttpURLConnection> pendingDisconnects = ConcurrentHashMap.newKeySet();

        Session(
                Context context,
                String url,
                String owner,
                String identity,
                String target,
                TranslationSettings config,
                boolean sourceOnly,
                boolean visible,
                CaptionLanguageContext languageContext) {
            this.context = context;
            this.url = url;
            this.owner = owner;
            this.identity = identity;
            this.target = target;
            this.languageContext = languageContext;
            this.config = config;
            credential = CaptionCredentialRef.of(config.apiKey);
            this.sourceOnly = sourceOnly;
            this.visible = visible;
        }

        void cancel() {
            requestRetirement(true);
        }

        /** Scope replacement allows an already sent HTTP to finish, but never to publish. */
        void retire() {
            requestRetirement(false);
        }

        private void requestRetirement(boolean stop) {
            publication.revoke(stop);
            // Only minimal state changes here; no disk, disconnect or executor calls under the
            // lock.
            synchronized (this) {
                if (!cancelled) {
                    generation++;
                    renderRevision++;
                }
                if (retired && !publication.finishSent()) {
                    cleanupDone = new CountDownLatch(1);
                    disconnectCaptureComplete = false;
                }
                cancelled = true;
                retired = publication.finishSent();
                playback.clearPause();
                pendingFocus = null;
                if (work.slots != null)
                    for (RebuildWorkSet.Slot slot : work.slots) slot.pending = null;
                sourceJob = null;
                loading = false;
            }
            if (!publication.finishSent()) {
                synchronized (connections) {
                    pendingDisconnects.addAll(connections);
                    connections.clear();
                }
                disconnectCaptureComplete = true;
            }
            requestCleanup();
            // Main returns after logical revocation; off-main also waits for the physical barrier.
            if (Looper.myLooper() != Looper.getMainLooper()) awaitRetirement();
        }

        private void requestCleanup() {
            if (cleanupDone.getCount() == 0 || !cleanupScheduled.compareAndSet(false, true)) return;
            try {
                CLEANUP.execute(this::cleanup);
            } catch (RejectedExecutionException capacity) {
                cleanupScheduled.set(false);
                // Never throw on a UI entry; an explicit await can retry.
                retirementFailure = "retirement_cleanup_capacity";
            }
        }

        private void cleanup() {
            boolean success = true;
            boolean finishSent = publication.finishSent();
            try {
                if (!finishSent)
                    for (HttpURLConnection c : new ArrayList<>(pendingDisconnects)) {
                        try {
                            c.disconnect();
                            pendingDisconnects.remove(c);
                        } catch (RuntimeException failure) {
                            success = false;
                            retirementFailure = "retirement_disconnect_failed";
                        }
                    }
                if (!success) retirementFailed();
            } catch (RuntimeException failure) {
                success = false;
                retirementFailure = "retirement_cleanup_failed";
            } finally {
                boolean escalated;
                synchronized (this) {
                    escalated = finishSent && !publication.finishSent();
                    if (success && !escalated && (finishSent || disconnectCaptureComplete))
                        cleanupDone.countDown();
                }
                cleanupScheduled.set(false);
                if (escalated) requestCleanup();
            }
        }

        private void retirementFailed() {
            TranslationRuntime.mark(
                    context,
                    "REBUILD_RETIREMENT_FAILED",
                    "session=" + id + ";reason=" + retirementFailure + ";publication_revoked=true");
        }

        /** Explicit off-main barrier: all admitted file work and queued disconnects finished. */
        void awaitRetirement() {
            if (Looper.myLooper() == Looper.getMainLooper())
                throw new IllegalStateException("retirement_barrier_on_main");
            if (publication.isOpen()) throw new IllegalStateException("retirement_not_requested");
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            requestCleanup();
            try {
                publication.drain(deadline);
                if (!cleanupDone.await(
                        Math.max(0, deadline - System.nanoTime()), TimeUnit.NANOSECONDS))
                    throw new IllegalStateException("retirement_cleanup_timeout");
                retirementFailure = "";
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                retirementFailure = "publication_commit_interrupted";
                throw new IllegalStateException(retirementFailure, interrupted);
            } catch (IllegalStateException failure) {
                retirementFailure = failure.getMessage();
                boolean interrupted = Thread.currentThread().isInterrupted();
                try {
                    retirementFailed();
                } finally {
                    if (interrupted) Thread.currentThread().interrupt();
                }
                throw failure;
            }
        }

    }

    static final class Job implements DeepSeekApiClient.RequestControl, RebuildStream.Early {
        final long traceId = IDS.incrementAndGet();
        final Session session;
        final CaptionLanguageContext languageContext;
        final RebuildWorkSet.Attempt attempt;

        private long httpStartedAt;

        Job(Session session, int index, boolean priority) {
            this(session, new RebuildWorkSet.Attempt(index, priority));
        }

        Job(Session session, RebuildWorkSet.Attempt attempt) {
            this.session = session;
            languageContext = session.languageContext;
            this.attempt = attempt;
        }

        @Override
        public boolean tryBeginAttempt() {
            // current's Publication.isOpen check orders admission against revoke. No I/O or
            // permit is held here: overlapping retirement may still stop an unsent transport.
            return !attempt.cancelled && current(session);
        }

        @Override
        public boolean isCancelled() {
            return attempt.cancelled || (!current(session) && !(attempt.sent && session.publication.finishSent()));
        }

        @Override
        public void onConnection(HttpURLConnection c) {
            if (attempt.connection != null) session.connections.remove(attempt.connection);
            attempt.connection = c;
            if (c != null) {
                session.connections.add(c);
                if (isCancelled()) {
                    session.connections.remove(c);
                    c.disconnect();
                }
            }
        }

        @Override
        public void onRequestBodySent() {
            attempt.sent = true;
        }

        /** A longer validated prefix of this job's streaming reply. Display only; never cached. */
        @Override
        public void onProvisional(RebuildProtocol.Plan prefix) {
            Session s = session;
            synchronized (s) {
                if (!current(s) || attempt.cancelled || s.work.slots == null) return;
                RebuildWorkSet.Slot slot = s.work.slots[attempt.index];
                if (slot.attempt != attempt || slot.accepted != null) return;
                slot.provisional = prefix;
            }
            render(s);
        }

        void trace(String stage, String detail) {
            if (stage.equals("REBUILD_HTTP_BEGIN")) httpStartedAt = SystemClock.elapsedRealtime();
            if (stage.equals("REBUILD_HTTP_RESPONSE") || stage.equals("REBUILD_HTTP_FAILURE"))
                detail +=
                        ";network_round_trip_ms=" + (SystemClock.elapsedRealtime() - httpStartedAt);
            TranslationRuntime.mark(
                    session.context,
                    stage,
                    "session="
                            + session.id
                            + ";request="
                            + traceId
                            + ";block="
                            + attempt.index
                            + ";"
                            + detail,
                    session.credential);
        }

        @Override
        public void onQualityEvidence(JSONObject source, String response, String metadata) {
            if (!TranslationRuntime.debugEnabled(session.context)) return;
            TranslationRuntime.record(
                    session.context,
                    session.config.apiKey,
                    traceId,
                    source,
                    response,
                    metadata + ";session=" + session.id + ";block=" + attempt.index);
        }
    }

    static boolean current(Session s) {
        String owner = video;
        return s != null
                && active == s
                && s.publication.isOpen()
                && !s.cancelled
                && (owner.isEmpty() || owner.equals(s.owner));
    }

    static boolean visible() {
        Session s = active;
        return current(s) && s.visible;
    }

    static boolean ownsNativeTrack() {
        Session s = active;
        return current(s) && !s.sourceOnly;
    }

    static void activity(Context ignored) {
        tick();
    }

    static void video(String id) {
        if (id == null || id.trim().isEmpty()) return;
        id = id.trim();
        boolean changed;
        Session previous = null;
        long epoch;
        synchronized (RebuildController.class) {
            changed = !id.equals(video);
            video = id;
            if (changed && active != null && !id.equals(active.owner)) {
                previous = active;
                previous.publication.revoke(true);
                active = null;
                publicationEpoch++;
            }
            epoch = publicationEpoch;
        }
        if (previous != null) {
            clear(epoch);
            previous.cancel();
            TranslationRuntime.suppressNative(false);
        }
        if (changed) CLOCK.reset(SystemClock.elapsedRealtime());
    }

    /**
     * Main: revocation/old UI invalidation only. Off-main: also the five-second physical barrier.
     */
    static void stop() {
        Session s;
        long epoch;
        synchronized (RebuildController.class) {
            s = active;
            if (s != null) s.publication.revoke(true);
            active = null;
            epoch = ++publicationEpoch;
        }
        clear(epoch);
        if (s != null && s.work.slots != null) {
            int complete = 0, partial = 0, failed = 0, holes = 0;
            for (int i = 0; i < s.work.slots.length; i++) {
                RebuildProtocol.Plan plan = s.work.slots[i].accepted;
                if (plan != null) {
                    if (plan.partial) {
                        partial++;
                        holes += plan.holes.size();
                    } else complete++;
                } else if (s.work.slots != null && s.work.slots[i].state == FAILED) failed++;
            }
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_COVERAGE_REPORT",
                    "session="
                            + s.id
                            + ";blocks="
                            + s.work.slots.length
                            + ";complete="
                            + complete
                            + ";partial="
                            + partial
                            + ";failed="
                            + failed
                            + ";holes="
                            + holes
                            + ";position="
                            + s.position);
        }
        // A stopped engine has no display owner: the authority returns to the safe UNKNOWN state.
        TranslationRuntime.stopped();
        // A stopped session must not donate a media snapshot to the next same-video session.
        CLOCK.reset(SystemClock.elapsedRealtime());
        if (s != null) s.cancel();
        TranslationRuntime.suppressNative(false);
    }

    private static void clear(long epoch) {
        TranslationOutput.clear(
                () -> publicationEpoch == epoch && (active == null || active.renderRevision == 0));
    }

    /** Revoke first, drain admitted publication off-main, then restart only the unchanged owner. */
    static void clearCache(Context context) {
        Session previous = active;
        String selected = previous == null ? "" : previous.url;
        boolean original = previous != null && previous.sourceOnly;
        boolean show = previous != null && previous.visible;
        stop();
        long epoch = publicationEpoch;
        try {
            CLEANUP.execute(
                () -> {
                    try {
                        if (previous != null) previous.awaitRetirement();
                        RebuildCache.clear(context);
                        TranslationRuntime.host().clearSourceCache(context);
                        MAIN.post(
                                () -> {
                                    TranslationRuntime.host().cacheClearFinished(context, true);
                                    if (publicationEpoch != epoch || active != null) return;
                                    if (!selected.isEmpty())
                                        activate(context, selected, original, show);
                                });
                    } catch (RuntimeException failure) {
                        TranslationRuntime.mark(
                                context,
                                "TRANSLATION_CACHE_CLEAR_FAILED",
                                failure.getClass().getSimpleName());
                        MAIN.post(() -> TranslationRuntime.host().cacheClearFinished(context, false));
                    }
                });
        } catch (RejectedExecutionException capacity) {
            TranslationRuntime.mark(context, "TRANSLATION_CACHE_CLEAR_FAILED", "cleanup_capacity");
            MAIN.post(() -> TranslationRuntime.host().cacheClearFinished(context, false));
        }
    }

    static void refresh(Context c) {
        Session s = active;
        if (s == null) return;
        boolean show = s.visible, original = s.sourceOnly;
        String url = s.url;
        stop();
        if (TranslationRuntime.settings(c).enabled) activate(c, url, original, show);
    }

    static void activate(Context c, String url, boolean original, boolean show) {
        if (c == null || !CaptionUrls.isTimedText(url)) return;
        TranslationSettings cfg = TranslationRuntime.settings(c);
        if (!cfg.enabled) return;
        String owner = CaptionUrls.videoId(url);
        if (owner.isEmpty()) owner = video;
        if (owner.isEmpty() || !video.isEmpty() && !owner.equals(video)) return;
        TargetLanguage language =
                original
                        ? TargetLanguage.fromCode(TranslationRuntime.target())
                        : TargetLanguage.fromUrl(url);
        String target = language == null ? "" : language.code;
        if (target.isEmpty()) return;
        CaptionLanguageContext languageContext = CaptionLanguageContext.observe(url, target);
        if (!original && languageContext.targetCode.equals("UNKNOWN")) return;
        // Track identity is the cache identity, not an expiring signature.
        String key =
                TranslationRuntime.sourceKey(CaptionUrls.sourceCaptionUrl(url))
                        + "|"
                        + languageContext.fingerprint(cfg)
                        + "|"
                        + RebuildCache.hash(cfg.apiKey)
                        + "|"
                        + target
                        + "|"
                        + original;
        if (!languageContext.canApplyEnglishToChinese) key += "|" + languageContext.scope();
        Session candidate =
                new Session(
                        c.getApplicationContext(),
                        url,
                        owner,
                        key,
                        target,
                        cfg,
                        original,
                        show,
                        languageContext);
        boolean unavailable = !original && !cfg.ready();
        String unavailableStatus =
                unavailable ? TranslationRuntime.message(c, "configure_api") : "";
        Session s, previous = null;
        long epoch;
        synchronized (RebuildController.class) {
            if (!video.isEmpty() && !video.equals(owner)) return;
            Session prev = active;
            if (current(prev)
                    && prev.identity.equals(key)
                    && prev.languageContext.scope().equals(languageContext.scope())) {
                s = prev;
            } else {
                previous = prev;
                if (prev != null) prev.publication.revoke(false);
                s = candidate;
                active = s;
                publicationEpoch++;
            }
            epoch = publicationEpoch;
        }
        if (previous != null) previous.retire();
        long initialPosition = position(s);
        synchronized (s) {
            if (!current(s)) return;
            s.url = url;
            s.visible |= show;
            if (s.source == null && s.sourceFailures > 0) {
                s.terminal = false;
                s.sourceRetry = 0;
            }
            s.position = initialPosition;
            if (unavailable) {
                s.terminal = true;
                s.status = unavailableStatus;
            }
        }
        if (s == candidate) {
            // A new engine session re-opens the player authority as unproven rather than
            // inheriting a closed or quarantined state from the previous session.
            TranslationRuntime.sessionOpened();
            TranslationRuntime.mark(
                    s.context,
                    "LANGUAGE_PROFILE_BOUND",
                    "session=" + s.id + ";" + s.languageContext.diagnosticFields());
            CaptionLanguageProfile profile = s.languageContext.profile;
            int script = CaptionScript.primary(s.languageContext.targetCode);
            TranslationRuntime.mark(
                    s.context,
                    "LANGUAGE_PROFILE",
                    "session="
                            + s.id
                            + ";target="
                            + s.languageContext.targetCode
                            + ";profile="
                            + profile.id
                            + ";origin="
                            + (profile.id.startsWith("generic") ? "generic_fallback" : "named")
                            + ";script="
                            + (script < 0 ? "?" : android.icu.lang.UScript.getShortName(script))
                            + ";direction="
                            + profile.direction
                            + ";cps="
                            + profile.referenceCps
                            + ";cpl="
                            + profile.referenceCpl
                            + ";line_counter="
                            + profile.lineCounterId());
            clear(epoch);
        }
        TranslationRuntime.mark(
                c,
                "CAPTION_REBUILD",
                "engine="
                        + RebuildProtocol.VERSION
                        + ";session="
                        + s.id
                        + ";video="
                        + s.owner
                        + ";"
                        + (original
                                ? "source_passthrough"
                                : "single_pass_events;source_owned_time;no_legacy_core"));
        TranslationRuntime.suppressNative(true);
        kick(s);
        scheduleTick();
    }

    static void time(long ms) {
        long now = SystemClock.elapsedRealtime();
        Session s = active;
        if (!current(s)) {
            CLOCK.updateHook(ms, now);
            return;
        }
        TranslationRuntime.ClockSample nativeSample = TranslationRuntime.clock(s.owner);
        RebuildClock.Update nativeUpdate =
                nativeSample.available
                        ? CLOCK.acceptNative(
                                nativeSample.videoId,
                                nativeSample.position,
                                now,
                                nativeSample.state,
                                nativeSample.speed)
                        : new RebuildClock.Update(false, 0, "unavailable");
        PlaybackState state = TranslationRuntime.playbackState();
        if (state == null) CLOCK.discardMedia(now);
        long projectedBeforeHook = CLOCK.current(now);
        RebuildClock.Update hookUpdate = CLOCK.updateHook(ms, now);
        boolean seek =
                nativeUpdate.seek
                        || (!nativeSample.available && hookUpdate.seek)
                        || s.playback.hasNewSeek(CLOCK.seekSerial());
        long presentation =
                nativeSample.available
                        ? CLOCK.current(now)
                        : CLOCK.position(
                                now,
                                state == null ? -1 : state.getPosition(),
                                state == null ? 0 : state.getLastPositionUpdateTime(),
                                state == null ? 0 : state.getPlaybackSpeed(),
                                state == null ? 0 : state.getState());
        if (!nativeSample.available && state == null && !hookUpdate.seek) {
            presentation = Math.max(projectedBeforeHook, presentation);
            CLOCK.preserveHookProjection(presentation);
        }
        List<HttpURLConnection> disconnect = new ArrayList<>();
        String seekMark = null;
        int generation;
        synchronized (s) {
            if (!current(s)) return;
            if (seek)
                seekMark =
                        "session="
                                + s.id
                                + ";from="
                                + s.position
                                + ";to="
                                + presentation
                                + ";clock_source="
                                + CLOCK.source();
            RebuildClock.Observation selected = CLOCK.observation(now);
            presentation = s.playback.select(selected, state, TranslationRuntime.ownerEpoch(), true, ms);
            s.position = presentation;
            if (seek) {
                s.work.noteSeek(now);
                resetDisplay(s);
                if (s.work.slots != null)
                    for (RebuildWorkSet.Slot slot : s.work.slots) {
                        RebuildWorkSet.Attempt attempt = slot.attempt;
                        if (attempt != null
                                && !attempt.sent
                                && s.blocks != null
                                && !RebuildPresentationSelection.covers(s.blocks.get(attempt.index), presentation)) {
                            attempt.cancelled = true;
                            if (attempt.connection != null) disconnect.add(attempt.connection);
                        }
                    }
            }
            s.playback.consumeSeek(CLOCK.seekSerial());
            generation = s.generation;
        }
        if (seekMark != null) TranslationRuntime.mark(s.context, "REBUILD_SEEK", seekMark);
        for (HttpURLConnection c : disconnect) c.disconnect();
        if (seek) TranslationOutput.hide(() -> current(s) && s.generation == generation);
        TranslationOutput.position(displayPosition(s), positionGuard(s));
        kick(s);
        scheduleTick();
    }

    /** A seek starts a new generation: nothing shown before it constrains what comes next. */
    private static void resetDisplay(Session s) {
        s.generation++;
        s.lastShown = "";
        s.presentation.reset();
        s.work.resetDisplay();
    }

    private static TranslationOutput.RenderGuard positionGuard(Session s) {
        int epoch = s.generation;
        return new TranslationOutput.RenderGuard() {
            @Override
            public boolean isValid() {
                return current(s) && s.generation == epoch;
            }

            @Override
            public long displayPosition(long supplied) {
                return RebuildController.displayPosition(s);
            }

            @Override
            public CaptionCredentialRef credential() {
                return s.credential;
            }
        };
    }

    private static long position(Session s) {
        long now = SystemClock.elapsedRealtime();
        TranslationRuntime.ClockSample nativeSample =
                TranslationRuntime.clock(s == null ? video : s.owner);
        if (nativeSample.available)
            CLOCK.acceptNative(
                    nativeSample.videoId,
                    nativeSample.position,
                    nativeSample.readElapsed,
                    nativeSample.state,
                    nativeSample.speed);
        PlaybackState state = TranslationRuntime.playbackState();
        if (state != null)
            CLOCK.acceptMedia(
                    state.getPosition(),
                    state.getLastPositionUpdateTime(),
                    now,
                    state.getPlaybackSpeed(),
                    state.getState());
        else CLOCK.discardMedia(now);
        RebuildClock.Observation selected = CLOCK.observation(now);
        if (s == null) return selected.position;
        synchronized (s) {
            observeSeek(s, selected, now);
            return s.playback.select(selected, state, TranslationRuntime.ownerEpoch(), false, 0);
        }
    }

    /**
     * Native/media queries may discover a seek before its hook acknowledgement. Consume it once.
     */
    private static void observeSeek(Session s, RebuildClock.Observation selected, long now) {
        long serial = CLOCK.seekSerial();
        if (s.playback.hasNewSeek(serial) && current(s)) {
            s.work.noteSeek(now);
            resetDisplay(s);
            s.position = selected.position;
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_SEEK",
                    "session="
                            + s.id
                            + ";to="
                            + selected.position
                            + ";clock_source="
                            + selected.source,
                    s.credential);
        }
        s.playback.consumeSeek(serial);
    }

    private static long displayPosition(Session s) {
        // A current native query can expose a real paused seek after layout. Without it, project
        // only the already-selected clock; never use raw MediaSession as a second display donor.
        TranslationRuntime.ClockSample sample = TranslationRuntime.clock(s.owner);
        if (sample.available) {
            CLOCK.acceptNative(
                    sample.videoId,
                    sample.position,
                    sample.readElapsed,
                    sample.state,
                    sample.speed);
            synchronized (s) {
                RebuildClock.Observation selected = CLOCK.observation(sample.readElapsed);
                observeSeek(s, selected, sample.readElapsed);
                s.playback.select(selected, null, TranslationRuntime.ownerEpoch(), false, 0);
            }
        }
        if (s.playback.frozenPosition() >= 0) return s.playback.frozenPosition();
        long now = SystemClock.elapsedRealtime(), live = CLOCK.current(now);
        if (!CLOCK.fresh(now)) return s.position;
        return live - s.position >= 8 ? live : s.position;
    }

    private static boolean paused() {
        Session s = active;
        if (!current(s)) return false;
        position(s); // A scheduler-only entry still selects the current position/state pair.
        return s.playback.paused();
    }

    private static void scheduleTick() {
        synchronized (RebuildController.class) {
            if (tickPosted || active == null) return;
            tickPosted = true;
        }
        MAIN.postDelayed(RebuildController::tick, 80);
    }

    private static void tick() {
        synchronized (RebuildController.class) {
            tickPosted = false;
        }
        Session s = active;
        if (!current(s)) return;
        // A player transition owns the surface: no geometry scan, overlay render or session kick
        // may run while the transition coordinator is still observing, so nothing reflows.
        if (TranslationRuntime.transitioning()) {
            scheduleTick();
            return;
        }
        // Surface detection must also run while a former miniplayer has hidden the overlay.
        TranslationOutput.refreshSurface();
        long observed = position(s);
        synchronized (s) {
            if (!current(s)) return;
            s.position = observed;
        }
        TranslationOutput.position(displayPosition(s), positionGuard(s));
        kick(s);
        scheduleTick();
    }

    private static void kick(Session s) {
        if (!current(s)) return;
        TranslationRuntime.suppressNative(false);
        boolean load = false;
        synchronized (s) {
            if (!current(s)) return;
            if (s.source == null
                    && !s.loading
                    && !s.terminal
                    && SystemClock.elapsedRealtime() >= s.sourceRetry) {
                s.loading = true;
                s.sourceJob = new Job(s, -1, false);
                load = true;
            }
        }
        if (load) SOURCE_IO.submit(() -> load(s));
        if (s.blocks != null && !s.terminal && !s.sourceOnly && s.visible) schedule(s);
        resumeHoles(s);
        render(s);
    }

    private static void load(Session s) {
        Job control;
        synchronized (s) {
            if (!current(s) || s.sourceJob == null) return;
            control = s.sourceJob;
        }
        try {
            TranslationSourceAccess.Source raw =
                    TranslationSourceAccess.load(s.context, s.url, !s.sourceOnly, control);
            if (!current(s)) return;
            long availablePosition = position(s);
            synchronized (s) {
                if (!current(s) || s.sourceJob != control) return;
                s.raw = raw;
                s.position = availablePosition;
            }
            // The parsed cues are already time-bounded: show the current one while rebuilding and
            // planning run. Translation requests still wait for the full plan.
            render(s);
            RebuildSourcePreparation.Built built =
                    RebuildSourcePreparation.build(
                            s.context, raw, s.sourceOnly, s.config, s.target, s.languageContext,
                            s.id, () -> s.url, control,
                            (stage, detail) -> TranslationRuntime.mark(s.context, stage, detail));
            RebuildSource source = built.source;
            boolean authoredTrack = built.authored;
            List<RebuildPlanner.Block> blocks = built.blocks;
            String key = built.key;
            RebuildProtocol.Plan[] plans = new RebuildProtocol.Plan[blocks.size()];
            int[] states = new int[blocks.size()];
            boolean[] checked = new boolean[blocks.size()];
            int cacheGeneration = s.generation;
            long focus = position(null);
            int focusIndex = 0;
            for (RebuildPlanner.Block b : blocks) if (b.start <= focus) focusIndex = b.index;
            int restored = 0;
            // Only the landing block and its successor are read before the engine is declared
            // ready.
            for (RebuildPlanner.Block b : blocks) {
                if (b.index != focusIndex && b.index != focusIndex + 1) continue;
                checked[b.index] = true;
                if (!current(s)) return;
                plans[b.index] =
                        s.sourceOnly
                                ? null
                                : RebuildCache.read(s.context, key, source, b, s.languageContext);
                if (plans[b.index] != null) {
                    states[b.index] = READY;
                    restored++;
                }
            }
            long readyPosition = position(s);
            synchronized (s) {
                if (!current(s) || s.sourceJob != control) return;
                if (cacheGeneration != s.generation) {
                    Arrays.fill(plans, null);
                    Arrays.fill(states, WAITING);
                    Arrays.fill(checked, false);
                    restored = 0;
                }
                s.source = source;
                s.authored = authoredTrack;
                s.cacheKey = key;
                s.presentation.configure(source, blocks, s.languageContext);
                s.work.initialize(blocks.size());
                for (int i = 0; i < blocks.size(); i++) {
                    RebuildWorkSet.Slot slot = s.work.slots[i];
                    slot.accepted = plans[i];
                    slot.state = states[i];
                    slot.cacheChecked = checked[i];
                }
                s.work.pageRepairs.clear();
                s.work.queuedPages.clear();
                s.loading = false;
                s.sourceJob = null;
                s.status = "";
                s.work.everReady = focusIndex < plans.length && plans[focusIndex] != null;
                s.blocks = blocks;
                s.position = readyPosition;
            }
            TranslationRuntime.mark(s.context, "REBUILD_SOURCE_READY", built.readyDetail(restored));
            TranslationAudit.recordUnitCacheOutcome(
                    Math.min(2, blocks.size() - focusIndex), restored);
            render(s);
            kick(s);
        } catch (Exception e) {
            if (!current(s)) return;
            SourceRecoveryPolicy.Failure f = SourceRecoveryPolicy.classify(e);
            String failureStatus =
                    TranslationRuntime.message(
                            s.context, !f.retryable ? "source_unavailable" : "source_retry");
            int failureCount;
            synchronized (s) {
                if (!current(s) || s.sourceJob != control) return;
                s.loading = false;
                s.sourceJob = null;
                s.sourceFailures++;
                s.terminal = !f.retryable;
                s.sourceRetry =
                        RetryAfter.after(
                                SystemClock.elapsedRealtime(),
                                SourceRecoveryPolicy.delay(s.sourceFailures, f.retryAfterMs));
                s.status = failureStatus;
                failureCount = s.sourceFailures;
            }
            TranslationRuntime.mark(
                    s.context, "REBUILD_SOURCE_ERROR", f.category + ";attempt=" + failureCount);
            render(s);
        }
    }

    /** The block the user is on right now, with the same rounding the planner already used. */
    private static int currentIndex(Session s) {
        int index = RebuildPresentationSelection.blockAt(s.blocks, s.position);
        if (index < 0) return 0;
        if (!RebuildPresentationSelection.covers(s.blocks.get(index), s.position) && index + 1 < s.blocks.size()) index++;
        return index;
    }

    /**
     * Drops the retained newest foreground request without dispatching it: the block goes back to
     * WAITING so the next landing can reuse it, and no attempt or repair quota is charged.
     */
    private static void retirePendingFocus(Session s) {
        Job pending = s.pendingFocus;
        if (pending == null) return;
        s.pendingFocus = null;
        s.work.retirePending(pending.attempt, SystemClock.elapsedRealtime());
    }

    private static final class CacheLookup {
        final int generation;
        final RebuildSource source;
        final RebuildPlanner.Block block;
        final String key;
        final RebuildWorkSet.Attempt attempt;
        final RebuildWorkSet.Slot slot;
        final boolean bootstrap;

        CacheLookup(Session s, RebuildPlanner.Block block, boolean bootstrap) {
            generation = s.generation;
            source = s.source;
            key = s.cacheKey;
            this.block = block;
            slot = s.work.slots[block.index];
            attempt = slot.attempt;
            this.bootstrap = bootstrap;
        }

        /** Is the session still the one this lookup was reserved for? */
        boolean valid(Session s) {
            return current(s)
                    && s.generation == generation
                    && s.source == source
                    && s.cacheKey.equals(key)
                    && sameSlot(s)
                    && slot.attempt == attempt;
        }

        boolean sameSlot(Session s) {
            return s.work.slots != null
                    && block.index < s.work.slots.length
                    && s.work.slots[block.index] == slot;
        }
    }

    private static void restoreCandidates(Session s, long now, boolean playbackAhead) {
        List<CacheLookup> lookups = new ArrayList<>();
        synchronized (s) {
            if (!current(s)
                    || s.blocks == null
                    || s.blocks.isEmpty()
                    || s.work.slots == null
                    || now < s.work.providerRetry) return;
            int index = currentIndex(s);
            s.work.markEverReady(index);
            boolean ahead =
                    playbackAhead
                            && !s.work.prefetchPaused(index, now)
                            && (s.work.slots[index].accepted != null
                                    || s.work.slots[index].state == FAILED
                                    || s.work.slots[index].attempt != null && s.work.slots[index].attempt.sent);
            boolean bootstrap =
                    !s.work.everReady
                            && s.source != null
                            && !s.sourceOnly
                            && s.work.slots[index].attempt != null
                            && s.work.slots[index].attempt.sent;
            int prefetch = s.work.dispatched(false);
            for (int i = index; i < s.blocks.size(); i++) {
                RebuildPlanner.Block b = s.blocks.get(i);
                if (b.start > s.position + 30000
                        || i > index
                                && (!ahead
                                        || !s.work.everReady && (!bootstrap || i != index + 1)
                                        || prefetch >= MAX_PREFETCH_CONCURRENCY)) break;
                if (s.work.slots[i].state == WAITING
                        && s.work.slots[i].retryAt <= now
                        && s.work.slots[i].accepted == null
                        && !s.work.slots[i].cacheChecked
                        && !s.work.slots[i].cacheReading) {
                    s.work.slots[i].cacheReading = true;
                    lookups.add(new CacheLookup(s, b, !s.work.everReady && i == index + 1));
                }
            }
        }
        for (CacheLookup lookup : lookups) {
            if (lookup.bootstrap) {
                // One reservation per block on the source lane: no main-thread disk wait.
                SOURCE_IO.submit(
                        () -> {
                            restoreCandidate(s, lookup);
                            if (current(s)) schedule(s);
                        });
            } else restoreCandidate(s, lookup);
        }
    }

    private static void restoreCandidate(Session s, CacheLookup lookup) {
        int index = lookup.block.index;
        synchronized (s) {
            if (!lookup.valid(s)) {
                if (lookup.sameSlot(s)) lookup.slot.cacheReading = false;
                return;
            }
        }
        RebuildProtocol.Plan cached =
                RebuildCache.read(
                        s.context, lookup.key, lookup.source, lookup.block, s.languageContext);
        boolean admitted = false, valid;
        synchronized (s) {
            if (lookup.sameSlot(s)) lookup.slot.cacheReading = false;
            valid = lookup.valid(s);
            if (valid) {
                s.work.slots[index].cacheChecked = true;
                if (cached != null) {
                    s.work.slots[index].accepted = cached;
                    s.work.slots[index].state = READY;
                    if (!lookup.bootstrap || s.work.slots[currentIndex(s)].accepted != null) s.work.everReady = true;
                    admitted = true;
                }
            }
        }
        if (!valid) return; // A departed scope must not publish cache outcomes.
        TranslationAudit.recordUnitCacheOutcome(1, admitted ? 1 : 0);
        if (admitted)
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_CACHE_RESTORED",
                    "session=" + s.id + ";block=" + index + ";network_calls=0");
    }

    private static void schedule(Session s) {
        List<Job> start = new ArrayList<>();
        long now = SystemClock.elapsedRealtime();
        boolean playbackAhead = !paused() && (CLOCK.fresh(now) || s.work.everReady);
        restoreCandidates(s, now, playbackAhead);
        synchronized (s) {
            if (current(s) && s.pendingFocus != null
                    && !modelEligible(s, s.pendingFocus.attempt.index, now))
                releaseGatedJob(s, s.pendingFocus);
            if (!current(s) || s.sourceOnly || s.terminal || s.blocks == null
                    || s.blocks.isEmpty() || now < s.work.providerRetry) return;
            int index = currentIndex(s);
            s.work.markEverReady(index);
            int focusDispatched = s.work.dispatched(true);
            int prefetchDispatched = s.work.dispatched(false);
            // A retained pending request is only valid for the landing it was chosen for.
            if (s.pendingFocus != null
                    && (s.pendingFocus.attempt.cancelled || s.pendingFocus.attempt.index != index))
                retirePendingFocus(s);
            // The newest landing takes the free foreground slot immediately when one exists.
            if (s.pendingFocus != null
                    && modelEligible(s, s.pendingFocus.attempt.index, now)
                    && focusDispatched < MAX_FOCUS_CONCURRENCY) {
                Job promote = s.pendingFocus;
                s.pendingFocus = null;
                s.work.markDispatched(promote.attempt);
                start.add(promote);
                focusDispatched++;
            }
            RebuildWorkSet.Selection selected = s.work.select(
                    s.blocks, index, s.position, now, playbackAhead, focusDispatched, prefetchDispatched);
            for (int abandoned : selected.abandoned) {
                RebuildWorkSet.Slot slot = s.work.slots[abandoned];
                TranslationRuntime.mark(s.context, "REBUILD_BLOCK_ABANDONED",
                        "session=" + s.id + ";block=" + s.blocks.get(abandoned).index + ";reason=" + slot.reason
                                + ";slow_retries=" + slot.slowRetries + ";position=" + s.position);
            }
            for (RebuildWorkSet.Attempt attempt : selected.starts) start.add(new Job(s, attempt));
            if (selected.pending != null) {
                retirePendingFocus(s);
                s.pendingFocus = new Job(s, selected.pending);
            }
        }
        for (Job j : start) {
            RebuildPlanner.Block b = s.blocks.get(j.attempt.index);
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_REQUEST",
                    "session="
                            + s.id
                            + ";request="
                            + j.traceId
                            + ";block="
                            + b.id()
                            + ";purpose="
                            + (j.attempt.priority ? "focus" : "prefetch")
                            + ";position="
                            + s.position
                            + ";range="
                            + b.start
                            + "-"
                            + b.end);
            dispatch(s, j.attempt.priority, () -> translate(j));
        }
    }

    /** Called under the Session monitor, also used by failure updates to order logical admission.
     * Once admitted, a call keeps its existing negotiation rules; M5c checks every physical attempt.
     */
    private static boolean modelEligible(Session s, int index, long now) {
        return current(s) && !s.sourceOnly && !s.terminal && s.work.eligible(index, now);
    }

    /** An executor queue reservation refused before logical admission spent no request quota. */
    private static void releaseGatedJob(Session s, Job job) {
        if (s.work.slots[job.attempt.index].attempt != job.attempt) return;
        if (s.pendingFocus == job) s.pendingFocus = null;
        s.work.releaseGated(job.attempt, s.terminal);
    }

    /**
     * Releases a job that will not produce a plan. Unsent work returns its attempt and repair
     * quota; sent work keeps the attempt it spent but still goes back to WAITING to be requested
     * again.
     */
    private static void finishCancelled(Session s, Job job) {
        s.work.finishCancelled(job.attempt, SystemClock.elapsedRealtime());
    }

    /** Called under the Session monitor; an asynchronous reply never owns lifecycle authority. */
    private static boolean replyCurrent(Session s, Job job, RebuildSource source,
                                        RebuildPlanner.Block block, String cacheKey) {
        int index = job.attempt.index;
        return current(s) && s.source == source && s.cacheKey.equals(cacheKey)
                && s.blocks != null && index >= 0 && index < s.blocks.size()
                && s.blocks.get(index) == block && s.work.slots != null
                && index < s.work.slots.length && s.work.slots[index].attempt == job.attempt;
    }

    private static void translate(Job job) {
        Session s = job.session;
        RebuildPlanner.Block b = s.blocks.get(job.attempt.index);
        RebuildCache.Prepared prepared = null;
        RebuildCache.Permit permit = null;
        try {
            RebuildSource requestSource;
            String requestKey, requestReason;
            synchronized (s) {
                if (!current(s) || s.work.slots[job.attempt.index].attempt != job.attempt) return;
                if (!modelEligible(s, job.attempt.index, SystemClock.elapsedRealtime())) {
                    releaseGatedJob(s, job);
                    return;
                }
                requestSource = s.source;
                requestKey = s.cacheKey;
                requestReason = s.work.slots[job.attempt.index].reason;
            }
            TranslationSourceAccess.checkActive(job);
            RebuildProtocol.Plan candidate = RebuildApi.translate(
                    requestSource, b, s.config, s.target, job, job.attempt.priority,
                    requestReason, job.languageContext);
            RebuildProtocol.Plan accepted, old;
            boolean cacheable, durable;
            int generation;
            for (;;) {
                synchronized (s) {
                    if (!replyCurrent(s, job, requestSource, b, requestKey)) return;
                    if (job.attempt.cancelled) {
                        finishCancelled(s, job);
                        return;
                    }
                    old = s.work.slots[job.attempt.index].accepted;
                    generation = s.generation;
                }
                RebuildReplyPreparation.Evaluation evaluation = RebuildReplyPreparation.evaluate(
                        s.context, requestKey, requestSource, b, job.languageContext,
                        old, candidate, prepared);
                accepted = evaluation.accepted;
                cacheable = evaluation.cacheable;
                prepared = evaluation.prepared;
                synchronized (s) {
                    if (!replyCurrent(s, job, requestSource, b, requestKey)) return;
                    if (job.attempt.cancelled) {
                        finishCancelled(s, job);
                        return;
                    }
                    if (s.generation != generation || s.work.slots[job.attempt.index].accepted != old) continue;
                    permit = s.publication.reserve();
                    if (permit == null) return;
                }
                // Preparation/fsync and the physical move run outside the lifecycle monitor.
                durable = prepared != null && prepared.commit();
                boolean recheck;
                synchronized (s) {
                    if (!replyCurrent(s, job, requestSource, b, requestKey)) return;
                    if (job.attempt.cancelled || s.generation != generation) {
                        finishCancelled(s, job);
                        s.work.slots[job.attempt.index].cacheChecked = false;
                        return;
                    }
                    recheck = s.work.slots[job.attempt.index].accepted != old;
                    if (!recheck) {
                        // A differently segmented repair waits for a boundary shared with displayed text.
                        if (old != null && accepted != old && s.presentation.shownIn(job.attempt.index))
                            s.work.slots[job.attempt.index].pending = accepted;
                        else s.work.slots[job.attempt.index].accepted = accepted;
                        s.work.slots[job.attempt.index].provisional = null;
                        boolean review = !accepted.partial && RebuildReview.shouldRepair(
                                accepted, s.work.slots[job.attempt.index].attempts,
                                s.work.repairCount, s.position, b.end);
                        s.work.slots[job.attempt.index].state = review ? WAITING : READY;
                        if (review) {
                            s.work.slots[job.attempt.index].reason = RebuildReview.repair(accepted.issues);
                            s.work.deferRetry(job.attempt.index, SystemClock.elapsedRealtime(), 1200);
                        }
                        s.work.slots[job.attempt.index].attempt = null;
                        s.work.everReady = true;
                    }
                }
                permit.close();
                permit = null;
                if (!recheck) break;
                // Another accepted plan won while the move ran; re-review this reply, without HTTP.
            }
            if (cacheable) {
                if (!durable)
                    TranslationRuntime.mark(
                            s.context,
                            "REBUILD_CACHE_WRITE_FAILED",
                            "session=" + s.id + ";block=" + b.index);
                else RebuildCache.trim(s.context);
            }
            for (RebuildReview.Issue issue : accepted.issues)
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_QUALITY_WARNING",
                        "session="
                                + s.id
                                + ";request="
                                + job.traceId
                                + ";block="
                                + b.index
                                + ";advisory=true;repair_candidate="
                                + issue.repair
                                + ";"
                                + issue.describe());
            if (!current(s)) return;
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_EVENTS_ACCEPTED",
                    "block="
                            + b.index
                            + ";events="
                            + accepted.events.size()
                            + ";session="
                            + s.id
                            + ";request="
                            + job.traceId
                            + ";review_risks="
                            + RebuildReview.score(accepted.issues)
                            + ";attempts="
                            + s.work.slots[b.index].attempts
                            + ";partial="
                            + accepted.partial
                            + ";holes="
                            + accepted.holes.size()
                            + (accepted.partial
                                    ? ";covered_tokens="
                                            + accepted.coveredTokens()
                                            + ";tokens="
                                            + (b.to - b.from + 1)
                                    : "")
                            + (b.authored
                                    ? ";" + RebuildCueContract.summary(s.source, b, accepted.events)
                                    : ""));
            if (accepted.partial) {
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_PARTIAL_ACCEPTED",
                        "session="
                                + s.id
                                + ";block="
                                + b.index
                                + ";block_id="
                                + b.id()
                                + ";events="
                                + accepted.events.size()
                                + ";holes="
                                + accepted.holes.size()
                                + ";covered_tokens="
                                + accepted.coveredTokens()
                                + ";tokens="
                                + (b.to - b.from + 1));
                StringBuilder ranges = new StringBuilder();
                for (int[] hole : accepted.holes) {
                    if (ranges.length() > 0) ranges.append(',');
                    ranges.append(hole[0]).append('-').append(hole[1]);
                }
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_COVERAGE",
                        "session="
                                + s.id
                                + ";block="
                                + b.index
                                + ";events="
                                + accepted.events.size()
                                + ";covered_tokens="
                                + accepted.coveredTokens()
                                + ";tokens="
                                + (b.to - b.from + 1)
                                + ";holes="
                                + ranges
                                + ";reason="
                                + s.work.slots[b.index].reason);
            }
            if (accepted.partial
                    && !accepted.holes.isEmpty()
                    && s.work.slots != null
                    && s.work.slots[job.attempt.index].slowRetries < 1
                    && s.position < b.end) fillHoles(s, job, b, accepted);
        } catch (Exception e) {
            if (!current(s)) return;
            rejected(s, job, b, e);
        } finally {
            if (permit != null) permit.close();
            if (prepared != null) prepared.close();
            if (current(s)) kick(s);
        }
    }

    /**
     * One bounded sub-request for the largest hole of a salvaged plan. It asks only for that token
     * range (not the whole block), merges the reply into the published plan without replacing any
     * shown text. A failure leaves the hole and establishes the parent's waiting/stopping gates.
     */
    private static void fillHoles(
            Session s, Job job, RebuildPlanner.Block parent, RebuildProtocol.Plan plan) {
        fillHoles(s, job, parent, plan, s.generation);
    }

    private static void fillHoles(
            Session s, Job job, RebuildPlanner.Block parent, RebuildProtocol.Plan plan,
            int expectedGeneration) {
        int[] hole = RebuildWorkSet.largestHole(plan.holes);
        if (hole == null) return;
        RebuildSource requestSource = s.source;
        RebuildPlanner.Block range = RebuildReplyPreparation.holeBlock(parent, requestSource, hole);
        if (range == null) return;
        final int generation;
        synchronized (s) {
            if (!current(s) || s.generation != expectedGeneration || s.source != requestSource
                    || job.attempt.cancelled || s.work.slots == null
                    || s.work.slots[parent.index].accepted != plan
                    || s.work.slots[parent.index].slowRetries >= 1) return;
            if (!s.work.admitHole(parent.index,
                    modelEligible(s, parent.index, SystemClock.elapsedRealtime()),
                    !s.sourceOnly && !s.terminal && !s.work.filteredBlocks.contains(parent.index))) return;
            generation = s.generation;
        }
        // The parent already completed and no longer owns s.work.slots[index].attempt. This child owns only
        // its transport, not another ordinary job's slot, provisional output or cleanup.
        Job child = new Job(s, parent.index, true);
        RebuildProtocol.Plan candidate;
        try {
            candidate =
                    RebuildApi.translate(
                            requestSource,
                            range,
                            s.config,
                            s.target,
                            child,
                            true,
                            "Translate only this missing source range. Keep its complete meaning"
                                    + " and return the complete range.",
                            job.languageContext);
        } catch (Exception failed) {
            repairRejected(s, child, failed);
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_HOLE_FAILED",
                    "session="
                            + s.id
                            + ";block="
                            + parent.index
                            + ";range="
                            + hole[0]
                            + "-"
                            + hole[1]
                            + ";reason="
                            + (failed instanceof RebuildProtocol.Invalid
                                    ? ((RebuildProtocol.Invalid) failed).code
                                    : failed.getClass().getSimpleName()));
            return;
        }
        RebuildProtocol.Plan merged = RebuildReview.mergeInto(plan, candidate, parent);
        synchronized (s) {
            if (!current(s) || s.generation != generation || s.source != requestSource
                    || s.work.slots[parent.index].accepted != plan) return;
            if (merged == plan) return;
            s.work.slots[parent.index].accepted = merged;
            s.work.slots[parent.index].state = READY;
        }
        TranslationRuntime.mark(
                s.context,
                "REBUILD_HOLE_FILLED",
                "session="
                        + s.id
                        + ";block="
                        + parent.index
                        + ";range="
                        + hole[0]
                        + "-"
                        + hole[1]
                        + ";events="
                        + merged.events.size()
                        + ";holes="
                        + merged.holes.size());
        render(s);
    }

    /** Reserve under the session monitor; submit only after releasing it. */
    private static void resumeHoles(Session s) {
        List<RebuildWorkSet.HoleReservation> reservations;
        synchronized (s) {
            if (!current(s) || !s.visible || s.blocks == null) return;
            reservations = s.work.reservePendingHoles(s.blocks, s.position,
                    SystemClock.elapsedRealtime(), s.sourceOnly || s.terminal, s.generation);
            for (java.util.Iterator<RebuildWorkSet.HoleReservation> it = reservations.iterator(); it.hasNext();) {
                RebuildWorkSet.HoleReservation reservation = it.next();
                if (!modelEligible(s, reservation.index, SystemClock.elapsedRealtime())) {
                    s.work.queuedHoles.remove(reservation.index);
                    it.remove();
                }
            }
        }
        for (int i = 0; i < reservations.size(); i++) {
            RebuildWorkSet.HoleReservation reservation = reservations.get(i);
            try {
                dispatch(s, true, () -> {
                    try {
                        synchronized (s) {
                            if (!current(s) || s.generation != reservation.generation) return;
                        }
                        fillHoles(s, new Job(s, reservation.index, true), reservation.parent,
                                reservation.plan, reservation.generation);
                    } finally {
                        synchronized (s) { s.work.queuedHoles.remove(reservation.index); }
                    }
                });
            } catch (RuntimeException failed) {
                synchronized (s) {
                    for (int j = i; j < reservations.size(); j++)
                        s.work.queuedHoles.remove(reservations.get(j).index);
                }
                throw failed;
            }
        }
    }

    /** A failed request: schedules the retry (or gives the block up) and records the reason. */
    private static void rejected(Session s, Job job, RebuildPlanner.Block b, Exception e) {
        String code = failureCode(e);
        String rejection = failureReason(e);
        String mark = null;
        synchronized (s) {
            if (!current(s) || s.work.slots[job.attempt.index].attempt != job.attempt) return;
            if (job.attempt.cancelled) {
                finishCancelled(s, job);
                return;
            }
            RebuildWorkSet.Slot slot = s.work.slots[job.attempt.index];
            slot.attempt = null;
            slot.provisional = null;
            applyFailure(s, job, e);
            mark =
                    "block="
                            + b.index
                            + ";reason="
                            + code
                            + ";session="
                            + s.id
                            + ";request="
                            + job.traceId
                            + ";detail="
                            + TranslationRuntime.redact(rejection, s.config.apiKey, 400)
                            + ";attempts="
                            + s.work.slots[b.index].attempts
                            + ";session_repairs="
                            + s.work.repairCount;
        }
        TranslationRuntime.mark(s.context, "REBUILD_EVENTS_REJECTED", mark);
    }

    private static String failureCode(Exception e) {
        return e instanceof RebuildProtocol.Invalid ? ((RebuildProtocol.Invalid) e).code
                : e instanceof RebuildApi.Failure ? ((RebuildApi.Failure) e).code
                : e instanceof RebuildApi.TransportFailure ? ((RebuildApi.TransportFailure) e).reason
                : e.getClass().getSimpleName();
    }

    private static String failureReason(Exception e) {
        String detail = e instanceof RebuildProtocol.Invalid ? ((RebuildProtocol.Invalid) e).detail : "";
        return failureCode(e) + (detail.isEmpty() ? "" : "; " + detail);
    }

    /** Shared failure decision; caller holds s. Content and sending eligibility are independent. */
    private static void applyFailure(Session s, Job job, Exception e) {
        int index = job.attempt.index;
        RebuildApi.Failure failure = e instanceof RebuildApi.Failure ? (RebuildApi.Failure) e : null;
        String code = failureCode(e);
        boolean fatal = failure != null && failure.configuration;
        boolean filtered = failure != null && "content_filter".equals(code);
        if (fatal) {
            s.terminal = true;
            s.status = String.format(Locale.ROOT,
                    TranslationRuntime.message(s.context, "api_config_error"), code);
        }
        long delay = failure != null ? failure.delay : 0;
        long now = SystemClock.elapsedRealtime();
        s.work.applyFailure(index, code, failureReason(e), fatal, filtered, delay, now);
        // Read back the decision just applied, including any older, later gate. Accounting
        // categories are deliberately not used to infer configuration or sending eligibility.
        job.trace("REBUILD_FAILURE_DECISION",
                "reason=" + code
                        + ";configuration=" + (failure == null ? "unknown" : failure.configuration)
                        + ";failure_delay_ms=" + (failure == null ? "unknown" : failure.delay)
                        + ";state=" + (s.work.slots[index].state == READY ? "READY"
                                : s.work.slots[index].state == FAILED ? "FAILED" : "WAITING")
                        + ";terminal=" + s.terminal
                        + ";filtered=" + s.work.filteredBlocks.contains(index)
                        + ";decided_at_elapsed_ms=" + now
                        + ";retry_at_elapsed_ms=" + s.work.slots[index].retryAt
                        + ";provider_retry_at_elapsed_ms=" + s.work.providerRetry + ";");
    }

    /** A child has no ordinary slot to clear. A different job at this index remains its owner. */
    private static void repairRejected(Session s, Job child, Exception e) {
        synchronized (s) {
            // Failure eligibility belongs to the Session/parent, even if a seek reset display.
            if (!current(s) || child.attempt.cancelled) return;
            applyFailure(s, child, e);
        }
    }

    /**
     * Only machine-made (kind=asr) captions are re-paged; a person's own cues are kept as authored.
     */
    private static boolean machineMade(Session s) {
        try {
            return "asr".equals(Uri.parse(s.url).getQueryParameter("kind"));
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    /** Diagnostic view of the authored cue contract: cue count and events per cue. */
    private static String authoredSummary(
            RebuildSource source, RebuildPlanner.Block block, RebuildProtocol.Plan plan) {
        return RebuildCueContract.summary(source, block, plan.events);
    }

    private static List<RebuildDisplayGroups.Unit> displayUnits(
            Session s, int index, RebuildProtocol.Plan plan) {
        TranslationBudget budget = TranslationOutput.budget();
        RebuildDisplayPlanning.Layout layout = s.presentation.layout(index, plan, budget);
        List<RebuildDisplayGroups.Unit> cached = layout.cachedUnits();
        if (cached != null) return cached;
        if (layout.projection != null) {
            boolean partial = s.work.slots != null && s.work.slots[index].provisional == plan;
            RebuildCueProjection.Result projection = layout.projection;
            List<RebuildDisplayGroups.Unit> units = projection.units;
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_CUE_PROJECTION",
                    "session="
                            + s.id
                            + ";block="
                            + index
                            + ";groups="
                            + projection.groups
                            + ";cue_pages="
                            + projection.cuePages
                            + ";event_pages="
                            + projection.eventPages
                            + ";events="
                            + plan.events.size()
                            + ";partial="
                            + partial);
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_UNIT_MODE",
                    "session="
                            + s.id
                            + ";block="
                            + index
                            + ";authored=true;partial="
                            + partial
                            + ";units="
                            + units.size()
                            + ";cue_pages="
                            + projection.cuePages
                            + ";event_pages="
                            + projection.eventPages
                            + ";"
                            + authoredSummary(s.source, s.blocks.get(index), plan)
                            + ";url="
                            + s.url);
            return s.presentation.units(layout);
        }
        TranslationRuntime.mark(
                s.context,
                "REBUILD_UNIT_MODE",
                "session="
                        + s.id
                        + ";block="
                        + index
                        + ";authored=false;url="
                        + s.url);
        return s.presentation.units(layout);
    }

    /** Records, at most about once a second, which gate left a speech instant uncovered. */
    private static void markDisplayGap(Session s, int index, String gate) {
        long now = SystemClock.elapsedRealtime();
        synchronized (s) {
            if (now - s.lastDisplayGapAt < 900) return;
            s.lastDisplayGapAt = now;
        }
        TranslationRuntime.mark(
                s.context,
                "DISPLAY_GAP",
                "session="
                        + s.id
                        + ";block="
                        + index
                        + ";gate="
                        + gate
                        + ";position="
                        + s.position);
    }

    /**
     * Asks for exactly the page the viewer is on, once, when that page has no translation. This is
     * the general repair for any cause (failed reply, empty translation, abandoned block, hole,
     * uncovered estimated gap): the request is page-sized, so it is independent of whatever made
     * the block-wide reply unusable.
     */
    private static final class PageReservation {
        final int index, from, to, generation;
        final String key;

        PageReservation(int index, int from, int to, int generation, String key) {
            this.index = index;
            this.from = from;
            this.to = to;
            this.generation = generation;
            this.key = key;
        }
    }

    /** Caller holds the session monitor; this method never submits to an executor. */
    private static PageReservation reservePageRepair(Session s, int index, long time) {
        RebuildSource source = s.source;
        if (source == null || s.blocks == null || index < 0 || index >= s.blocks.size()) return null;
        RebuildPlanner.Block parent = s.blocks.get(index);
        int[] range = RebuildReplyPreparation.pageRange(parent, source, time);
        if (range == null || !modelEligible(s, index, SystemClock.elapsedRealtime())) return null;
        int generation = s.generation;
        String key = generation + ":" + index + ":" + range[0] + "-" + range[1];
        if (!s.work.reservePage(index, key, range[0], range[1], SystemClock.elapsedRealtime())) return null;
        return new PageReservation(index, range[0], range[1], generation, key);
    }

    private static void requestPageRepair(Session s, PageReservation reservation) {
        markDisplayGap(s, reservation.index, "repair");
        try {
            dispatch(s, true, () -> repairPage(s, reservation.index, reservation.from,
                    reservation.to, reservation.generation));
        } catch (RuntimeException failed) {
            synchronized (s) {
                if (s.generation == reservation.generation)
                    s.work.releasePage(reservation.index, reservation.key);
            }
            throw failed;
        }
    }

    /**
     * One page-sized request. When the block has no plan at all, a degraded plan (every token a
     * hole) is published first, so the repair has somewhere to merge into and the renderer stops
     * treating the block as a hard failure.
     */
    private static void repairPage(Session s, int index, int from, int to, long generation) {
        String key = generation + ":" + index + ":" + from + "-" + to;
        RebuildPlanner.Block parent;
        RebuildSource requestSource;
        synchronized (s) {
            if (!current(s) || s.generation != generation || s.blocks == null) return;
            if (!modelEligible(s, index, SystemClock.elapsedRealtime())
                    || s.work.slots[index].attempt != null
                    || s.work.slots[index].provisional != null
                    || s.work.slots[index].accepted != null
                            && RebuildWorkSet.covered(s.work.slots[index].accepted, from, to)) {
                s.work.releasePage(index, key);
                return;
            }
            parent = s.blocks.get(index);
            requestSource = s.source;
        }
        RebuildPlanner.Block page = RebuildReplyPreparation.pageBlock(parent, requestSource, from, to);
        synchronized (s) {
            if (!current(s) || s.generation != generation || s.blocks == null) return;
            if (s.source != requestSource || s.blocks.get(index) != parent || page == null
                    || !modelEligible(s, index, SystemClock.elapsedRealtime())
                    || s.work.slots[index].attempt != null || s.work.slots[index].provisional != null
                    || s.work.slots[index].accepted != null
                            && RebuildWorkSet.covered(s.work.slots[index].accepted, from, to)) {
                s.work.releasePage(index, key);
                return;
            }
            s.work.admitPage(key); // logical admission; the quota and history now stay spent
            if (s.work.slots[index].accepted == null) {
                s.work.slots[index].accepted = RebuildProtocol.degraded(parent);
                s.work.slots[index].state = READY;
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_BLOCK_DEGRADED",
                        "session=" + s.id + ";block=" + index + ";reason=no_plan;range=" + from + "-" + to);
            }
        }
        Job job = new Job(s, index, true);
        RebuildProtocol.Plan candidate;
        try {
            candidate =
                    RebuildApi.translate(
                            requestSource,
                            page,
                            s.config,
                            s.target,
                            job,
                            true,
                            "Translate only this uncovered source range. Keep its complete meaning"
                                    + " and return the complete range.",
                            s.languageContext);
        } catch (Exception failed) {
            repairRejected(s, job, failed);
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_PAGE_REPAIR_FAILED",
                    "session="
                            + s.id
                            + ";block="
                            + index
                            + ";range="
                            + from
                            + "-"
                            + to
                            + ";reason="
                            + (failed instanceof RebuildProtocol.Invalid
                                    ? ((RebuildProtocol.Invalid) failed).code
                                    : failed.getClass().getSimpleName()));
            return;
        }
        RebuildProtocol.Plan merged;
        for (;;) {
            RebuildProtocol.Plan previous, base;
            synchronized (s) {
                if (!current(s) || s.generation != generation || s.source != requestSource
                        || s.blocks == null || s.blocks.get(index) != parent) return;
                previous = s.work.slots[index].accepted;
                base = previous == null ? RebuildProtocol.degraded(parent) : previous;
            }
            merged = RebuildReview.mergeInto(base, candidate, parent);
            synchronized (s) {
                if (!current(s) || s.generation != generation || s.source != requestSource
                        || s.blocks == null || s.blocks.get(index) != parent) return;
                if (s.work.slots[index].accepted != previous) continue;
                if (merged == base) {
                    TranslationRuntime.mark(s.context, "REBUILD_PAGE_REPAIR_EMPTY",
                            "session=" + s.id + ";block=" + index + ";range=" + from + "-" + to);
                    return;
                }
                s.work.slots[index].accepted = merged;
                s.work.slots[index].state = READY;
                break;
            }
        }
        TranslationRuntime.mark(
                s.context,
                "REBUILD_PAGE_REPAIRED",
                "session="
                        + s.id
                        + ";block="
                        + index
                        + ";range="
                        + from
                        + "-"
                        + to
                        + ";events="
                        + candidate.events.size());
        render(s);
    }

    private static void render(Session s) {
        if (!current(s) || !s.visible) return;
        String translating = TranslationRuntime.message(s.context, "caption_translating");
        String text = "", fallbackReason = "", displayEmptyReason = "", eventId = "none";
        boolean status = false;
        PageReservation pageReservation = null;
        int generation;
        long revision, submission, selectedAt, observedAt;
        long eventStart = -1, eventEnd = -1;
        CaptionEventTimeline eventTimeline = null;
        synchronized (s) {
            if (!current(s) || !s.visible) return;
            generation = s.generation;
            observedAt = s.position;
            selectedAt = displayPosition(s);
            int index = s.source != null && !s.sourceOnly
                    ? RebuildPresentationSelection.blockAt(s.blocks, selectedAt) : -1;
            RebuildPresentationSelection.BlockView view = index >= 0 && s.work.slots != null
                    ? s.work.block(index) : null;
            RebuildPresentationSelection.Selected selected = s.presentation.begin(
                    s.raw, s.source, s.blocks, s.languageContext, s.sourceOnly, s.terminal, s.status,
                    s.sourceOnly && s.source != null && machineMade(s), translating, selectedAt,
                    index, view);
            if (selected.inBlock) {
                if (s.presentation.canAdopt(index, view, selectedAt)) s.work.adoptPending(index);
                RebuildProtocol.Plan plan = s.presentation.plan(view);
                List<RebuildDisplayGroups.Unit> units = plan == null ? null : displayUnits(s, index, plan);
                s.presentation.selectBlock(s.raw, s.source, s.blocks.get(index), view, plan,
                        units, selectedAt, translating);
                if (selected.clearUncovered && s.work.slots != null) s.work.clearUncovered(index);
            }
            if (s.presentation.needsGuarantee(s.source, s.sourceOnly, selectedAt)) {
                if (s.work.slots != null && selected.index >= 0
                        && s.work.slots[selected.index].uncoveredSince == 0)
                    s.work.startUncovered(selected.index, SystemClock.elapsedRealtime());
                s.presentation.guarantee(s.source, selectedAt, translating);
                if (!selected.gapGate.isEmpty()) markDisplayGap(s, selected.index, selected.gapGate);
                if (selected.repairPage) pageReservation = reservePageRepair(s, selected.index, selectedAt);
            }
            // These values, not the reusable selection object, are used by queued callbacks.
            text = selected.text;
            fallbackReason = selected.fallbackReason;
            displayEmptyReason = selected.displayEmptyReason;
            eventId = selected.eventId;
            eventStart = selected.eventStart;
            eventEnd = selected.eventEnd;
            eventTimeline = selected.timeline;
            status = selected.status;
            String signature = (status ? "status:" : "caption:") + eventId + "|" + text + "|";
            if (signature.equals(s.lastShown) && s.appliedRenderRevision == s.renderRevision) {
                revision = -1;
                submission = -1;
            } else {
                if (!signature.equals(s.lastShown)) {
                    s.lastShown = signature;
                    s.renderRevision++;
                }
                revision = s.renderRevision;
                submission = ++s.renderSubmission;
            }
        }
        if (pageReservation != null) requestPageRepair(s, pageReservation);
        if (revision < 0) return;
        String appliedIdentity = s.id + ":" + generation + ":" + eventId;
        long appliedStart = eventStart, appliedEnd = eventEnd;
        String appliedReason =
                fallbackReason.startsWith("failed:")
                        ? "translation_failed"
                        : fallbackReason.isEmpty()
                                ? (displayEmptyReason.isEmpty()
                                        ? "source_gap"
                                        : displayEmptyReason)
                                : "pending_translation";
        TranslationOutput.RenderGuard guard =
                new TranslationOutput.RenderGuard() {
                    @Override
                    public boolean isValid() {
                        return current(s)
                                && s.generation == generation
                                && s.renderRevision == revision
                                && s.renderSubmission == submission
                                && s.visible;
                    }

                    @Override
                    public String identity() {
                        return appliedIdentity;
                    }

                    @Override
                    public String session() {
                        return Long.toString(s.id);
                    }

                    @Override
                    public long windowStart() {
                        return appliedStart;
                    }

                    @Override
                    public long windowEnd() {
                        return appliedEnd;
                    }

                    @Override
                    public String blankReason() {
                        return appliedReason;
                    }

                    @Override
                    public CaptionCredentialRef credential() {
                        return s.credential;
                    }

                    @Override
                    public long displayPosition(long supplied) {
                        return RebuildController.displayPosition(s);
                    }

                    @Override
                    public void onApplied() {
                        if (isValid()) s.appliedRenderRevision = revision;
                    }
                };
        if (status) TranslationOutput.showStatus(text, guard);
        else if (text.isEmpty()) TranslationOutput.hide(guard);
        else if (fallbackReason.equals("pending_engine")
                || fallbackReason.equals("pending_translation"))
            TranslationOutput.showWaitingEvent(
                    text, guard, appliedIdentity, eventStart, eventEnd, selectedAt);
        else
            TranslationOutput.showEvent(
                    text,
                    guard,
                    appliedIdentity,
                    eventStart,
                    eventEnd,
                    selectedAt,
                    s.authored
                            ? s.languageContext.renderSpec.withAuthored()
                            : s.languageContext.renderSpec,
                    eventTimeline);
        if (TranslationRuntime.debugEnabled(s.context))
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_SELECTED",
                    "id="
                            + appliedIdentity
                            + ";time="
                            + observedAt
                            + ";range="
                            + eventStart
                            + "-"
                            + eventEnd
                            + ";text="
                            + TranslationRuntime.redact(text, s.config.apiKey, 500));
    }
}
