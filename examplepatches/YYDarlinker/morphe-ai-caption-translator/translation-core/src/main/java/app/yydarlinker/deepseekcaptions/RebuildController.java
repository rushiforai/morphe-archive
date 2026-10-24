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
import java.util.function.Predicate;

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

    /**
     * Display guarantee (N52): a speech instant may never render an empty box. When no unit covers
     * the instant, the last translated page is held for at most this long, then the neutral
     * placeholder stands in while the page itself is requested.
     */
    static final long DISPLAY_HOLD_MS = 4000;

    /** Quantization of the held/placeholder window, so the render signature changes rarely. */
    static final long DISPLAY_QUANTUM_MS = 500;

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
    private static volatile boolean compact;
    private static long restoreUntil;

    private static ExecutorService lane(String name, int concurrency) {
        return Executors.newFixedThreadPool(
                concurrency,
                runnable -> {
                    Thread thread = new Thread(runnable, name);
                    thread.setDaemon(true);
                    return thread;
                });
    }

    static void dispatch(boolean priority, Runnable work) {
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
        volatile long sourceRetry, position, providerRetry;
        long lastSeekAt = -1, prefetchPausedUntil;
        volatile long pausedDisplayPosition = -1;
        private PlaybackState pausedHookState;
        private long pauseOwnerEpoch = -1, pauseClockEpoch = -1;
        private String pauseSource = "";
        volatile RebuildClock.Observation observation;
        private long observedSeekSerial = -1;
        volatile String status = "";
        int sourceFailures, repairCount;
        volatile int generation;
        volatile long renderRevision;
        volatile long appliedRenderRevision;
        volatile long renderSubmission;
        final RebuildCache.Publication publication = new RebuildCache.Publication();
        boolean[] cacheReading;
        Job sourceJob;
        String cacheKey = "", lastShown = "";
        boolean everReady;

        /** What reached the screen in this generation; reset on every seek. */
        final RebuildDisplayGroups.Cursor display = new RebuildDisplayGroups.Cursor();

        DisplayLayout[] displayLayouts;
        TranslationSourceAccess.Source raw;
        RebuildSource source;

        /** Local reading pages of the video's own captions (source-only display). */
        List<RebuildSource.TimedWindow> readingPages;

        RebuildSource readingFor;
        List<RebuildPlanner.Block> blocks;
        RebuildProtocol.Plan[] plans, pendingPlans;

        /** Leading events of a reply still streaming in; shown only while the block has no plan. */
        RebuildProtocol.Plan[] provisional;

        int[] states, attempts;
        long[] retryAt;
        String[] reasons;
        Job[] jobs;
        boolean[] cacheChecked;

        /** Slow retries spent on a block that never produced a usable plan; capped per session. */
        int[] slowRetries;

        /** Page ranges already asked for as a repair in this generation, and the per-block count. */
        final Set<String> pageRepairs = Collections.synchronizedSet(new HashSet<>());

        int[] pageRepairCount;

        /** When the current page of a block first had no translation in this generation. */
        long[] uncoveredSince;

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
                pausedDisplayPosition = -1;
                pausedHookState = null;
                pendingFocus = null;
                if (pendingPlans != null) Arrays.fill(pendingPlans, null);
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

        /** Seeks arriving in quick succession pause look-ahead; the caller holds the lock. */
        void noteSeek(long now) {
            if (lastSeekAt >= 0 && now - lastSeekAt <= SEEK_STORM_WINDOW_MS)
                prefetchPausedUntil = now + SEEK_STORM_PAUSE_MS;
            lastSeekAt = now;
        }
    }

    static final class Job implements DeepSeekApiClient.RequestControl, RebuildStream.Early {
        final long traceId = IDS.incrementAndGet();
        final Session session;
        final CaptionLanguageContext languageContext;
        final int index;
        final boolean priority;
        volatile HttpURLConnection connection;

        /**
         * {@code dispatched}: the job holds a lane slot. {@code sent}: the provider request body is
         * written. Only dispatched jobs count against the translation budget, and only the
         * not-yet-sent newest foreground job may be replaced by a later seek.
         */
        volatile boolean cancelled, sent, dispatched;

        /** This attempt is a paid semantic/structural repair, not a transient retry. */
        boolean repair;

        private long httpStartedAt;

        Job(Session session, int index, boolean priority) {
            this.session = session;
            languageContext = session.languageContext;
            this.index = index;
            this.priority = priority;
        }

        @Override
        public boolean isCancelled() {
            return cancelled || (!current(session) && !(sent && session.publication.finishSent()));
        }

        @Override
        public void onConnection(HttpURLConnection c) {
            if (connection != null) session.connections.remove(connection);
            connection = c;
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
            sent = true;
        }

        /** A longer validated prefix of this job's streaming reply. Display only; never cached. */
        @Override
        public void onProvisional(RebuildProtocol.Plan prefix) {
            Session s = session;
            synchronized (s) {
                if (!current(s)
                        || cancelled
                        || s.jobs == null
                        || s.jobs[index] != this
                        || s.plans[index] != null
                        || s.provisional == null) return;
                s.provisional[index] = prefix;
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
                            + index
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
                    metadata + ";session=" + session.id + ";block=" + index);
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

    static String activeUrl() {
        Session s = active;
        return current(s) ? s.url : "";
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
        if (s != null && s.plans != null) {
            int complete = 0, partial = 0, failed = 0, holes = 0;
            for (int i = 0; i < s.plans.length; i++) {
                RebuildProtocol.Plan plan = s.plans[i];
                if (plan != null) {
                    if (plan.partial) {
                        partial++;
                        holes += plan.holes.size();
                    } else complete++;
                } else if (s.states != null && s.states[i] == FAILED) failed++;
            }
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_COVERAGE_REPORT",
                    "session="
                            + s.id
                            + ";blocks="
                            + s.plans.length
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
        CLEANUP.execute(
                () -> {
                    try {
                        if (previous != null) previous.awaitRetirement();
                        RebuildCache.clear(context);
                        TranslationRuntime.host().clearSourceCache(context);
                        MAIN.post(
                                () -> {
                                    if (publicationEpoch != epoch || active != null) return;
                                    if (!selected.isEmpty())
                                        activate(context, selected, original, show);
                                });
                    } catch (RuntimeException failure) {
                        TranslationRuntime.mark(
                                context,
                                "TRANSLATION_CACHE_CLEAR_FAILED",
                                failure.getClass().getSimpleName());
                    }
                });
    }

    static void player(String type) {
        // The authority records the player type and derives display permission; this only tracks
        // the short URL-restoration window that a compact excursion opens.
        String t = type == null ? "" : type.toUpperCase(Locale.ROOT);
        boolean small = TranslationRuntime.isCompactType(t) && !TranslationRuntime.isShorts();
        if (compact && !small) restoreUntil = SystemClock.elapsedRealtime() + 3000;
        compact = small;
    }

    static String restore(String url) {
        Session s = active;
        if (!current(s)
                || s.sourceOnly
                || !s.visible
                || !TranslationRuntime.translates()
                || (!compact
                        && !TranslationRuntime.authoritativeType()
                        && SystemClock.elapsedRealtime() > restoreUntil)) return url;
        String owner = CaptionUrls.videoId(url);
        return CaptionUrls.isTimedText(url) && (owner.isEmpty() || owner.equals(s.owner))
                ? TargetLanguage.withCode(url, s.target)
                : url;
    }

    static void refresh(Context c) {
        Session s = active;
        if (s == null) return;
        boolean show = s.visible, original = s.sourceOnly;
        String url = s.url;
        stop();
        if (TranslationRuntime.settings(c).enabled) activate(c, url, original, show);
    }

    /**
     * Starts the source fetch without waiting for any native CC observation. The only authority is
     * the user's intent: no caption-known/CC state is consulted, so a session that already has a
     * target is warmed as soon as its signed source url is available.
     */
    static void prewarm(Context c, String url) {
        if (c == null
                || !TranslationRuntime.translates()
                || !TranslationRuntime.settings(c).ready()
                || active != null) return;
        String target = TranslationRuntime.target();
        if (!target.isEmpty()) activate(c, TargetLanguage.withCode(url, target), false, false);
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
                        || s.observedSeekSerial >= 0 && s.observedSeekSerial != CLOCK.seekSerial();
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
            freeze(s, selected, state, true, ms);
            presentation =
                    s.pausedDisplayPosition >= 0 ? s.pausedDisplayPosition : selected.position;
            s.position = presentation;
            if (seek) {
                s.noteSeek(now);
                resetDisplay(s);
                if (s.jobs != null)
                    for (Job j : s.jobs)
                        if (j != null
                                && !j.sent
                                && s.blocks != null
                                && !covers(s.blocks.get(j.index), presentation)) {
                            j.cancelled = true;
                            if (j.connection != null) disconnect.add(j.connection);
                        }
            }
            s.observedSeekSerial = CLOCK.seekSerial();
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
        s.display.reset();
        s.pageRepairs.clear();
        if (s.pageRepairCount != null) java.util.Arrays.fill(s.pageRepairCount, 0);
        if (s.uncoveredSince != null) java.util.Arrays.fill(s.uncoveredSince, 0);
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
            freeze(s, selected, state, false, 0);
            return s.pausedDisplayPosition >= 0 ? s.pausedDisplayPosition : selected.position;
        }
    }

    /**
     * Native/media queries may discover a seek before its hook acknowledgement. Consume it once.
     */
    private static void observeSeek(Session s, RebuildClock.Observation selected, long now) {
        long serial = CLOCK.seekSerial();
        if (s.observedSeekSerial >= 0 && s.observedSeekSerial != serial && current(s)) {
            s.noteSeek(now);
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
        s.observedSeekSerial = serial;
    }

    /** One owner/session/seek-bound freeze, derived only from the winning observation. */
    private static void freeze(
            Session s,
            RebuildClock.Observation selected,
            PlaybackState raw,
            boolean hook,
            long hookPosition) {
        s.observation = selected;
        long owner = TranslationRuntime.ownerEpoch();
        if (!selected.paused()) {
            s.pausedDisplayPosition = -1;
            s.pausedHookState = null;
            s.pauseSource = "";
            s.pauseOwnerEpoch = owner;
            s.pauseClockEpoch = selected.epoch;
            return;
        }
        long donor = selected.position;
        boolean changed =
                s.pausedDisplayPosition < 0
                        || s.pauseOwnerEpoch != owner
                        || s.pauseClockEpoch != selected.epoch
                        || !s.pauseSource.equals(selected.source);
        if (RebuildClock.OFFICIAL_PLAYER_QUERY.equals(selected.source)) {
            // A currently queried paused native position is authoritative, including a real
            // rewind. Repeated +/-16 ms reports are jitter; a matching explicit callback may
            // confirm a tiny seek.
            changed |=
                    Math.abs(donor - s.pausedDisplayPosition) > 16
                            || hook && hookPosition == donor && donor != s.pausedDisplayPosition;
            s.pausedHookState = null;
        } else {
            boolean oldHook =
                    raw != null
                            && s.pausedHookState != null
                            && raw.getPosition() == s.pausedHookState.getPosition()
                            && raw.getLastPositionUpdateTime()
                                    == s.pausedHookState.getLastPositionUpdateTime();
            if (hook) {
                // Native unavailable: keep the explicit hook-seek fallback. Its old MediaSession
                // acknowledgement cannot restore the pre-seek position on the next read.
                donor = Math.max(0, hookPosition);
                changed = true;
                s.pausedHookState = raw;
            } else if (!oldHook && Math.abs(donor - s.pausedDisplayPosition) > 1500) {
                changed = true;
                s.pausedHookState = null;
            }
        }
        if (changed) {
            s.pausedDisplayPosition = donor;
            s.pauseOwnerEpoch = owner;
            s.pauseClockEpoch = selected.epoch;
            s.pauseSource = selected.source;
        }
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
                freeze(s, selected, null, false, 0);
            }
        }
        if (s.pausedDisplayPosition >= 0) return s.pausedDisplayPosition;
        long now = SystemClock.elapsedRealtime(), live = CLOCK.current(now);
        if (!CLOCK.fresh(now)) return s.position;
        return live - s.position >= 8 ? live : s.position;
    }

    private static boolean paused() {
        Session s = active;
        if (!current(s)) return false;
        position(s); // A scheduler-only entry still selects the current position/state pair.
        return s.observation != null && s.observation.paused();
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
                    TranslationSourceAccess.load(s.context, s.url, false, !s.sourceOnly, control);
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
            RebuildSource source = RebuildSource.read(raw.body, raw.document, !s.sourceOnly);
            // A coarse automatic track is exactly the case that needs a finer ASR reference. The
            // old gate required native words first, so a completely coarse primary never tried the
            // reference at all. A manually authored track keeps its cue-level timing and needs no
            // second download.
            boolean authoredTrack = authored(s);
            if (!s.sourceOnly
                    && !authoredTrack
                    && source.nativeWordCount() < source.words.size())
                source = alignedToReference(s, source, control);
            else if (!s.sourceOnly && !authoredTrack)
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_SOURCE_REFERENCE_SKIPPED",
                        "session="
                                + s.id
                                + ";native_words="
                                + source.nativeWordCount()
                                + ";words="
                                + source.words.size()
                                + ";reason=all_words_native");
            // A manually authored track keeps its own segmentation: every authored cue is a display
            // boundary, while consecutive cues may share one request block so the model sees the
            // sentence around a fragment. Automatic tracks keep the sentence-sized blocks.
            List<RebuildPlanner.Block> blocks =
                    authoredTrack
                            ? RebuildPlanner.planAuthored(source, s.languageContext)
                            : RebuildPlanner.plan(source, s.languageContext);
            String key =
                    RebuildCache.identity(
                            source, s.config, s.target, s.languageContext, authoredTrack);
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
            String[] reasons = new String[blocks.size()];
            Arrays.fill(reasons, "");
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
                s.plans = plans;
                s.pendingPlans = new RebuildProtocol.Plan[plans.length];
                s.displayLayouts = new DisplayLayout[plans.length];
                s.provisional = new RebuildProtocol.Plan[plans.length];
                s.states = states;
                s.attempts = new int[blocks.size()];
                s.retryAt = new long[blocks.size()];
                s.reasons = reasons;
                s.jobs = new Job[blocks.size()];
                s.cacheChecked = checked;
                s.slowRetries = new int[blocks.size()];
                s.pageRepairCount = new int[blocks.size()];
                s.uncoveredSince = new long[blocks.size()];
                s.pageRepairs.clear();
                s.loading = false;
                s.sourceJob = null;
                s.status = "";
                s.everReady = focusIndex < plans.length && plans[focusIndex] != null;
                s.blocks = blocks;
                s.position = readyPosition;
            }
            int precise = 0;
            for (RebuildSource.Word w : source.words)
                if (w.precision != RebuildSource.Precision.ESTIMATED) precise++;
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_SOURCE_READY",
                    "words="
                            + source.words.size()
                            + ";measured_or_aligned="
                            + precise
                            + ";estimated="
                            + (source.words.size() - precise)
                            + ";coarse_reconstructed="
                            + source.coarseCueReconstructed
                            + ";coarse_cues="
                            + source.coarseCueCount
                            + ";blocks="
                            + blocks.size()
                            + ";cache_hits="
                            + restored
                            + ";precision="
                            + source.precisionEvidence());
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
                        SystemClock.elapsedRealtime()
                                + SourceRecoveryPolicy.delay(s.sourceFailures, f.retryAfterMs);
                s.status = failureStatus;
                failureCount = s.sourceFailures;
            }
            TranslationRuntime.mark(
                    s.context, "REBUILD_SOURCE_ERROR", f.category + ";attempt=" + failureCount);
            render(s);
        }
    }

    /** The source with a reference track's timing adopted; unchanged when none is available. */
    private static RebuildSource alignedToReference(Session s, RebuildSource source, Job control)
            throws InterruptedException {
        try {
            TranslationSourceAccess.Source ref =
                    TranslationSourceAccess.reference(s.context, s.url, source, control);
            if (ref == null) return source;
            RebuildSource evidence =
                    ref.timingEvidence != null
                            ? ref.timingEvidence
                            : RebuildSource.read(ref.body, ref.document, !s.sourceOnly);
            String profile = ";profile=" + ref.timingProfile + ";quality=" + ref.timingQuality;
            RebuildSource aligned =
                    source.align(
                            evidence,
                            detail ->
                                    TranslationRuntime.mark(
                                            s.context,
                                            "REBUILD_SOURCE_ALIGNMENT",
                                            "session=" + s.id + profile + ";" + detail));
            TranslationRuntime.mark(
                    s.context,
                    "REBUILD_SOURCE_REFERENCE_APPLIED",
                    "session="
                            + s.id
                            + profile
                            + ";before="
                            + source.precisionEvidence()
                            + ";after="
                            + aligned.precisionEvidence());
            return aligned;
        } catch (Exception failure) {
            TranslationSourceAccess.checkActive(control);
            TranslationRuntime.mark(
                    s.context,
                    "ASR_REFERENCE_FETCH_FAILED",
                    "session=" + s.id + ";reason=" + TranslationRuntime.errorDetail(failure));
            return source;
        }
    }

    private static int blockAt(Session s, long time) {
        if (s.blocks == null) return -1;
        int lo = 0, hi = s.blocks.size() - 1;
        while (lo <= hi) {
            int m = (lo + hi) >>> 1;
            if (s.blocks.get(m).start <= time) lo = m + 1;
            else hi = m - 1;
        }
        return hi;
    }

    private static boolean covers(RebuildPlanner.Block b, long time) {
        return time >= b.start && time < b.end;
    }

    /** The block the user is on right now, with the same rounding the planner already used. */
    private static int currentIndex(Session s) {
        int index = blockAt(s, s.position);
        if (index < 0) return 0;
        if (!covers(s.blocks.get(index), s.position) && index + 1 < s.blocks.size()) index++;
        return index;
    }

    /** Jobs that hold a lane slot and have not finished yet. Unsent pending work is excluded. */
    private static int dispatched(Session s, boolean focus) {
        int count = 0;
        if (s.jobs != null)
            for (Job j : s.jobs) if (j != null && j.dispatched && j.priority == focus) count++;
        return count;
    }

    /**
     * Hands a selected job to its lane. Attempt and repair accounting happens exactly here, so a
     * job replaced before it is dispatched never consumes a translation attempt or a repair.
     */
    private static void markDispatched(Session s, Job job) {
        if (job.repair) s.repairCount++;
        s.attempts[job.index]++;
        s.states[job.index] = RUNNING;
        job.dispatched = true;
    }

    /**
     * Drops the retained newest foreground request without dispatching it: the block goes back to
     * WAITING so the next landing can reuse it, and no attempt or repair quota is charged.
     */
    private static void retirePendingFocus(Session s) {
        Job pending = s.pendingFocus;
        if (pending == null) return;
        s.pendingFocus = null;
        if (s.jobs[pending.index] == pending) s.jobs[pending.index] = null;
        if (s.states[pending.index] == RUNNING) {
            s.states[pending.index] = WAITING;
            s.retryAt[pending.index] = SystemClock.elapsedRealtime() + 500;
        }
    }

    private static final class CacheLookup {
        final int generation;
        final RebuildSource source;
        final RebuildPlanner.Block block;
        final String key;
        final Job job;
        final boolean bootstrap;
        final boolean[] reading;

        CacheLookup(Session s, RebuildPlanner.Block block, boolean bootstrap) {
            generation = s.generation;
            source = s.source;
            key = s.cacheKey;
            this.block = block;
            job = s.jobs[block.index];
            this.bootstrap = bootstrap;
            reading = s.cacheReading;
        }

        /** Is the session still the one this lookup was reserved for? */
        boolean valid(Session s) {
            return current(s)
                    && s.generation == generation
                    && s.source == source
                    && s.cacheKey.equals(key)
                    && s.jobs[block.index] == job;
        }
    }

    /** A seek storm pauses look-ahead until scrubbing stops and the landing block is ready. */
    private static boolean prefetchPaused(Session s, int index, long now) {
        return now < s.prefetchPausedUntil
                && !(s.plans[index] != null
                        && s.lastSeekAt >= 0
                        && now - s.lastSeekAt >= SEEK_SETTLED_MS);
    }

    /** The first accepted plan of this session: the engine has proven it can deliver. */
    private static void markEverReady(Session s, int index) {
        if (!s.everReady && s.plans[index] != null && s.states[index] == READY) s.everReady = true;
    }

    private static void restoreCandidates(Session s, long now, boolean playbackAhead) {
        List<CacheLookup> lookups = new ArrayList<>();
        synchronized (s) {
            if (!current(s)
                    || s.blocks == null
                    || s.blocks.isEmpty()
                    || s.cacheChecked == null
                    || now < s.providerRetry) return;
            if (s.cacheReading == null) s.cacheReading = new boolean[s.blocks.size()];
            int index = currentIndex(s);
            markEverReady(s, index);
            boolean ahead =
                    playbackAhead
                            && !prefetchPaused(s, index, now)
                            && (s.plans[index] != null
                                    || s.states[index] == FAILED
                                    || s.jobs[index] != null && s.jobs[index].sent);
            boolean bootstrap =
                    !s.everReady
                            && s.source != null
                            && !s.sourceOnly
                            && s.jobs[index] != null
                            && s.jobs[index].sent;
            int prefetch = dispatched(s, false);
            for (int i = index; i < s.blocks.size(); i++) {
                RebuildPlanner.Block b = s.blocks.get(i);
                if (b.start > s.position + 30000
                        || i > index
                                && (!ahead
                                        || !s.everReady && (!bootstrap || i != index + 1)
                                        || prefetch >= MAX_PREFETCH_CONCURRENCY)) break;
                if (s.states[i] == WAITING
                        && s.retryAt[i] <= now
                        && s.plans[i] == null
                        && !s.cacheChecked[i]
                        && !s.cacheReading[i]) {
                    s.cacheReading[i] = true;
                    lookups.add(new CacheLookup(s, b, !s.everReady && i == index + 1));
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
                if (s.cacheReading == lookup.reading) s.cacheReading[index] = false;
                return;
            }
        }
        RebuildProtocol.Plan cached =
                RebuildCache.read(
                        s.context, lookup.key, lookup.source, lookup.block, s.languageContext);
        boolean admitted = false, valid;
        synchronized (s) {
            if (s.cacheReading == lookup.reading) s.cacheReading[index] = false;
            valid = lookup.valid(s);
            if (valid) {
                s.cacheChecked[index] = true;
                if (cached != null) {
                    s.plans[index] = cached;
                    s.states[index] = READY;
                    if (!lookup.bootstrap || s.plans[currentIndex(s)] != null) s.everReady = true;
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
        boolean playbackAhead = !paused() && (CLOCK.fresh(now) || s.everReady);
        restoreCandidates(s, now, playbackAhead);
        synchronized (s) {
            if (!current(s) || s.blocks == null || s.blocks.isEmpty() || now < s.providerRetry)
                return;
            int index = currentIndex(s);
            markEverReady(s, index);
            int focusDispatched = dispatched(s, true);
            int prefetchDispatched = dispatched(s, false);
            // A retained pending request is only valid for the landing it was chosen for.
            if (s.pendingFocus != null
                    && (s.pendingFocus.cancelled || s.pendingFocus.index != index))
                retirePendingFocus(s);
            // The newest landing takes the free foreground slot immediately when one exists.
            if (s.pendingFocus != null && focusDispatched < MAX_FOCUS_CONCURRENCY) {
                Job promote = s.pendingFocus;
                s.pendingFocus = null;
                markDispatched(s, promote);
                start.add(promote);
                focusDispatched++;
            }
            boolean focusUnderWay =
                    s.plans[index] != null
                            || s.states[index] == FAILED
                            || (s.jobs[index] != null && s.jobs[index].sent);
            // The prefetch budget, not the mere existence of another job, bounds look-ahead.
            boolean allowAhead = focusUnderWay && !prefetchPaused(s, index, now) && playbackAhead;
            for (int i = index; i < s.blocks.size(); i++) {
                RebuildPlanner.Block b = s.blocks.get(i);
                if (b.start > s.position + 30000) break;
                if (i > index && !allowAhead) break;
                if (i > index && prefetchDispatched >= MAX_PREFETCH_CONCURRENCY) break;
                boolean focus = i == index;
                // Before the first acceptance only the imminent next block is requested, alongside
                // the already sent landing block: a slow provider then has both ready in time.
                if (!focus
                        && !s.everReady
                        && (i != index + 1 || b.start > s.position + BOOTSTRAP_NEXT_MS)) break;
                // An existing job for this block is reused, whichever lane it came from.
                if (s.states[i] != WAITING || s.retryAt[i] > now) continue;
                // Disk candidates are reserved and read outside the monitor before a lane is
                // charged.
                if (s.cacheReading != null && s.cacheReading[i]
                        || s.cacheChecked != null && !s.cacheChecked[i]) continue;
                int maxAttempts =
                        RebuildReview.hasSemanticRepairRisk(s.plans[i])
                                ? RebuildReview.MAX_SEMANTIC_ATTEMPTS
                                : s.attempts[i] == 2
                                                && s.plans[i] == null
                                                && RebuildReview.structuralRetry(s.reasons[i])
                                                && s.repairCount < RebuildReview.MAX_SESSION_REPAIRS
                                        ? 3
                                        : 2;
                boolean slowRetry = false;
                if (s.attempts[i] >= maxAttempts
                        || s.attempts[i] > 0
                                && s.plans[i] != null
                                && s.repairCount >= RebuildReview.MAX_SESSION_REPAIRS) {
                    if (s.plans[i] != null) {
                        s.states[i] = READY;
                        continue;
                    }
                    // A block that never produced anything keeps a slow, bounded-rate retry
                    // while it is still in front of the viewer, instead of disappearing for good.
                    // A deterministic rejection repeats the same paid request, so the retries are
                    // capped: after MAX_SLOW_RETRIES the block is abandoned for this session.
                    if (now < s.retryAt[i]) continue;
                    if (s.slowRetries != null && s.slowRetries[i] >= MAX_SLOW_RETRIES) {
                        s.states[i] = FAILED;
                        TranslationRuntime.mark(
                                s.context,
                                "REBUILD_BLOCK_ABANDONED",
                                "session="
                                        + s.id
                                        + ";block="
                                        + b.index
                                        + ";reason="
                                        + s.reasons[i]
                                        + ";slow_retries="
                                        + s.slowRetries[i]
                                        + ";position="
                                        + s.position);
                        continue;
                    }
                    if (s.slowRetries != null) s.slowRetries[i]++;
                    s.attempts[i] = Math.max(0, maxAttempts - 1);
                    slowRetry = true;
                }
                Job job = new Job(s, i, focus);
                job.repair =
                        !slowRetry
                                && s.attempts[i] > 0
                                && (s.plans[i] != null
                                        || RebuildReview.structuralRetry(s.reasons[i]));
                s.jobs[i] = job;
                if (focus && focusDispatched >= MAX_FOCUS_CONCURRENCY) {
                    // Both foreground slots are busy: keep only this newest landing.
                    retirePendingFocus(s);
                    s.states[i] = RUNNING;
                    s.pendingFocus = job;
                    break;
                }
                markDispatched(s, job);
                start.add(job);
                if (focus) focusDispatched++;
                else prefetchDispatched++;
            }
        }
        for (Job j : start) {
            RebuildPlanner.Block b = s.blocks.get(j.index);
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
                            + (j.priority ? "focus" : "prefetch")
                            + ";position="
                            + s.position
                            + ";range="
                            + b.start
                            + "-"
                            + b.end);
            dispatch(j.priority, () -> translate(j));
        }
    }

    /**
     * Releases a job that will not produce a plan. Unsent work returns its attempt and repair
     * quota; sent work keeps the attempt it spent but still goes back to WAITING to be requested
     * again.
     */
    private static void finishCancelled(Session s, Job job) {
        s.jobs[job.index] = null;
        if (s.provisional != null) s.provisional[job.index] = null;
        if (!job.sent) {
            if (s.attempts[job.index] > 1) s.repairCount = Math.max(0, s.repairCount - 1);
            s.attempts[job.index] = Math.max(0, s.attempts[job.index] - 1);
        }
        s.states[job.index] = WAITING;
        s.retryAt[job.index] = SystemClock.elapsedRealtime() + 500;
    }

    private static void translate(Job job) {
        Session s = job.session;
        RebuildPlanner.Block b = s.blocks.get(job.index);
        RebuildCache.Prepared prepared = null;
        RebuildCache.Permit permit = null;
        try {
            TranslationSourceAccess.checkActive(job);
            RebuildProtocol.Plan candidate =
                    RebuildApi.translate(
                            s.source,
                            b,
                            s.config,
                            s.target,
                            job,
                            job.priority,
                            s.reasons[job.index],
                            job.languageContext);
            RebuildProtocol.Plan accepted, old;
            boolean cacheable;
            int generation;
            for (; ; ) {
                synchronized (s) {
                    if (!current(s) || s.jobs[job.index] != job) return;
                    if (job.cancelled) {
                        finishCancelled(s, job);
                        return;
                    }
                    old = s.plans[job.index];
                    generation = s.generation;
                }
                accepted =
                        RebuildReview.accept(
                                old, candidate, s.source, b, job.languageContext);
                if (prepared != null) {
                    prepared.close();
                    prepared = null;
                }
                cacheable = !accepted.partial && RebuildReview.score(accepted.issues) == 0;
                if (cacheable)
                    prepared =
                            RebuildCache.prepare(
                                    s.context,
                                    s.cacheKey,
                                    s.source,
                                    b,
                                    accepted,
                                    job.languageContext);
                synchronized (s) {
                    if (!current(s) || s.jobs[job.index] != job) return;
                    if (job.cancelled) {
                        finishCancelled(s, job);
                        return;
                    }
                    if (s.generation != generation || s.plans[job.index] != old) continue;
                    permit = s.publication.reserve();
                    if (permit == null) return;
                }
                break;
            }
            // Preparation/fsync is outside all lifecycle monitors. Admission and revoke share one
            // CAS.
            boolean durable = prepared != null && prepared.commit();
            synchronized (s) {
                if (!current(s) || s.jobs[job.index] != job) return;
                if (job.cancelled || s.generation != generation) {
                    finishCancelled(s, job);
                    if (s.cacheChecked != null) s.cacheChecked[job.index] = false;
                    return;
                }
                // Once text of this block reached the screen, a differently segmented repair waits
                // until render reaches a boundary it shares with what was shown, so no text is
                // shown twice.
                if (old != null && accepted != old && s.display.shownIn(job.index))
                    s.pendingPlans[job.index] = accepted;
                else s.plans[job.index] = accepted;
                if (s.provisional != null) s.provisional[job.index] = null;
                boolean review =
                        !accepted.partial
                                && RebuildReview.shouldRepair(
                                        accepted,
                                        s.attempts[job.index],
                                        s.repairCount,
                                        s.position,
                                        b.end);
                s.states[job.index] = review ? WAITING : READY;
                if (review) {
                    s.reasons[job.index] = RebuildReview.repair(accepted.issues);
                    s.retryAt[job.index] = SystemClock.elapsedRealtime() + 1200;
                }
                s.jobs[job.index] = null;
                s.everReady = true;
            }
            permit.close();
            permit = null;
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
                            + s.attempts[b.index]
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
                                + s.reasons[b.index]);
            }
            if (accepted.partial
                    && !accepted.holes.isEmpty()
                    && s.slowRetries != null
                    && s.slowRetries[job.index] < 1
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
     * shown text, and never fails the parent block: a failed sub-request just leaves the hole.
     */
    private static void fillHoles(
            Session s, Job job, RebuildPlanner.Block parent, RebuildProtocol.Plan plan) {
        int[] hole = largestHole(plan.holes);
        if (hole == null) return;
        RebuildPlanner.Block range = holeBlock(parent, s.source, hole);
        if (range == null) return;
        synchronized (s) {
            if (!current(s)
                    || s.plans[parent.index] != plan
                    || s.slowRetries == null) return;
            s.slowRetries[parent.index]++;
        }
        RebuildProtocol.Plan candidate;
        try {
            candidate =
                    RebuildApi.translate(
                            s.source,
                            range,
                            s.config,
                            s.target,
                            job,
                            true,
                            "Translate only this missing source range. Keep its complete meaning"
                                    + " and return the complete range.",
                            job.languageContext);
        } catch (Exception failed) {
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
        RebuildProtocol.Plan merged;
        synchronized (s) {
            if (!current(s) || s.plans[parent.index] != plan) return;
            merged = RebuildReview.mergeInto(plan, candidate, parent);
            if (merged == plan) return;
            s.plans[parent.index] = merged;
            s.states[parent.index] = READY;
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

    private static int[] largestHole(List<int[]> holes) {
        int[] best = null;
        for (int[] hole : holes)
            if (best == null || hole[1] - hole[0] > best[1] - best[0]) best = hole;
        return best;
    }

    /**
     * The request block of one hole. Authored holes are whole cue groups; a hole that does not
     * match one cue exactly is not requested (a partial cue must never become a page).
     */
    private static RebuildPlanner.Block holeBlock(
            RebuildPlanner.Block parent, RebuildSource source, int[] hole) {
        int from = hole[0], to = hole[1];
        if (source == null
                || from < parent.from
                || to > parent.to
                || to < from
                || from >= source.words.size()
                || to >= source.words.size()) return null;
        if (!parent.authored) return new RebuildPlanner.Block(parent.index, from, to, source);
        for (RebuildPlanner.Block.CueRange cue : parent.cues)
            if (cue.from == from && cue.to == to)
                return new RebuildPlanner.Block(
                        parent.index, from, to, source, Collections.singletonList(cue));
        return null;
    }

    /** A failed request: schedules the retry (or gives the block up) and records the reason. */
    private static void rejected(Session s, Job job, RebuildPlanner.Block b, Exception e) {
        RebuildApi.Failure failure =
                e instanceof RebuildApi.Failure ? (RebuildApi.Failure) e : null;
        RebuildProtocol.Invalid invalid =
                e instanceof RebuildProtocol.Invalid ? (RebuildProtocol.Invalid) e : null;
        String code =
                invalid != null
                        ? invalid.code
                        : failure != null
                                ? failure.code
                                : e instanceof RebuildApi.TransportFailure
                                        ? ((RebuildApi.TransportFailure) e).reason
                                        : e.getClass().getSimpleName();
        boolean fatal = failure != null && failure.configuration;
        String rejection =
                code + (invalid != null && !invalid.detail.isEmpty() ? "; " + invalid.detail : "");
        String mark = null;
        synchronized (s) {
            if (!current(s) || s.jobs[job.index] != job) return;
            if (job.cancelled) {
                finishCancelled(s, job);
                return;
            }
            s.jobs[job.index] = null;
            if (s.provisional != null) s.provisional[job.index] = null;
            s.reasons[job.index] = rejection;
            if (fatal) {
                s.terminal = true;
                s.status =
                        String.format(
                                Locale.ROOT,
                                TranslationRuntime.message(s.context, "api_config_error"),
                                code);
            }
            boolean filtered = failure != null && "content_filter".equals(failure.code);
            // Only a provider refusal or a configuration error ends a block for good. Network,
            // timeout, malformed-output and structural failures stay retryable; the view falls
            // back to the source line while a slow retry keeps trying.
            s.states[job.index] = fatal || filtered ? FAILED : WAITING;
            long delay = failure != null ? failure.delay : 0;
            long backoff =
                    s.attempts[job.index] >= 3
                            ? 15000
                            : s.attempts[job.index] >= 2 ? 5000 : 1200;
            s.retryAt[job.index] = SystemClock.elapsedRealtime() + Math.max(backoff, delay);
            if (code.equals("http_429") || code.startsWith("http_5"))
                s.providerRetry =
                        Math.max(
                                s.providerRetry,
                                SystemClock.elapsedRealtime() + Math.max(5000, delay));
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
                            + s.attempts[b.index]
                            + ";session_repairs="
                            + s.repairCount;
            // A malformed repair must not destroy an already structurally validated candidate.
            if (s.plans[job.index] != null && !fatal) s.states[job.index] = READY;
        }
        TranslationRuntime.mark(s.context, "REBUILD_EVENTS_REJECTED", mark);
    }

    private static CaptionDocument.Cue originalCue(Session s, long time) {
        // Before the source is accepted the raw parsed cue is the only trustworthy window. Once it
        // is, derive the same window from source words so ready/pending/gap rendering cannot split
        // across two timelines.
        if (s.source != null) {
            RebuildSource.TimedWindow window = s.source.windowAt(time);
            if (window != null)
                return new CaptionDocument.Cue(
                        window.start, window.end, s.source.text(window.from, window.to));
        }
        if (s.raw == null) return null;
        CaptionDocument.Cue latest = null;
        for (CaptionDocument.Cue c : s.raw.document.cues())
            if (time >= c.startMs
                    && time < c.endMs
                    && (latest == null || c.startMs >= latest.startMs)) latest = c;
        return latest;
    }

    /**
     * The authored cue exactly as uploaded: its own line breaks (a romanisation row above a
     * translation row, a speaker line) and its own pages, held through a short pause.
     */
    private static CaptionDocument.Cue authoredCue(Session s, long time) {
        if (s.raw == null) return originalCue(s, time);
        CaptionDocument.Cue current = null, next = null;
        for (CaptionDocument.Cue c : s.raw.document.cues()) {
            if (time >= c.startMs && time < c.endMs) {
                if (current == null || c.startMs >= current.startMs) current = c;
            } else if (c.startMs > time && (next == null || c.startMs < next.startMs)) next = c;
        }
        CaptionDocument.Cue shown = current;
        if (shown == null && next != null) {
            CaptionDocument.Cue before = null;
            for (CaptionDocument.Cue c : s.raw.document.cues())
                if (c.endMs <= time && (before == null || c.endMs > before.endMs)) before = c;
            if (before != null && next.startMs - before.endMs < RebuildDisplayGroups.HOLD_MS)
                shown = before;
        }
        if (shown == null) return null;
        String text = shown.text.replaceAll("[\u200B\u2060\uFEFF]", "").trim();
        return text.isEmpty() ? null : new CaptionDocument.Cue(shown.startMs, shown.endMs, text);
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

    /** Source-only display: the cue (or reading page) to show, held through a short pause. */
    private static CaptionDocument.Cue sourceCue(Session s, long time) {
        if (s.source == null) return originalCue(s, time);
        if (!machineMade(s)) return authoredCue(s, time);
        if (s.readingPages == null || s.readingFor != s.source) {
            s.readingPages =
                    SourceReadingWindows.build(
                            s.source, s.languageContext.renderSpec, s.languageContext);
            s.readingFor = s.source;
        }
        RebuildSource.TimedWindow page = SourceReadingWindows.at(s.readingPages, time);
        if (page == null) {
            RebuildSource.TimedWindow before = SourceReadingWindows.before(s.readingPages, time);
            RebuildSource.TimedWindow next = SourceReadingWindows.after(s.readingPages, time);
            if (before != null
                    && next != null
                    && next.start - before.end < RebuildDisplayGroups.HOLD_MS) page = before;
        }
        return page == null
                ? null
                : new CaptionDocument.Cue(page.start, page.end, s.source.text(page.from, page.to));
    }

    /**
     * Display units of one plan at the current measured geometry; recomputed only when it changes.
     */
    private static final class DisplayLayout {
        final RebuildProtocol.Plan plan;
        final String geometry;
        final List<RebuildDisplayGroups.Unit> units;

        DisplayLayout(
                RebuildProtocol.Plan plan, String geometry, List<RebuildDisplayGroups.Unit> units) {
            this.plan = plan;
            this.geometry = geometry;
            this.units = units;
        }
    }

    /** True when the source track is manually authored rather than machine generated. */
    private static boolean authored(Session s) {
        return TranslationRuntime.authoredTrack(s.url);
    }

    /**
     * Pages for an authored plan. The projection keeps the author's cue where the reply tiles it
     * exactly and publishes the remaining events as their own pages, so a sentence that crosses a
     * cue boundary is displayed instead of being withheld.
     */
    private static RebuildCueProjection.Result authoredProjection(
            Session s, int index, RebuildProtocol.Plan plan) {
        return RebuildCueProjection.project(
                index,
                s.source,
                s.blocks.get(index),
                plan.events,
                s.languageContext);
    }

    /** Diagnostic view of the authored cue contract: cue count and events per cue. */
    private static String authoredSummary(
            RebuildSource source, RebuildPlanner.Block block, RebuildProtocol.Plan plan) {
        return RebuildCueContract.summary(source, block, plan.events);
    }

    /**
     * Real speech boundaries inside one display unit: a word end followed by a pause or a clause
     * mark. Page turns use these instead of character counts when the source has word timing.
     */
    private static long[] pageAnchors(Session s, RebuildDisplayGroups.Unit unit) {
        if (s == null || s.source == null || unit == null || unit.end <= unit.start) return null;
        java.util.List<Long> anchors = new java.util.ArrayList<>();
        int from = Math.max(0, unit.from), to = Math.min(s.source.words.size() - 1, unit.to);
        long last = -1;
        for (int i = from; i <= to && anchors.size() < 64; i++) {
            RebuildSource.Word word = s.source.words.get(i);
            boolean pause =
                    i > from && word.start - s.source.words.get(i - 1).end >= 220;
            boolean clause = word.text != null && endsClauseMark(word.text.trim());
            if (!pause && !clause) continue;
            long at = word.end;
            if (at <= unit.start + RebuildPageLayout.MIN_PAGE_MS
                    || at >= unit.end - RebuildPageLayout.MIN_PAGE_MS
                    || at <= last + 80) continue;
            anchors.add(at);
            last = at;
        }
        if (anchors.isEmpty()) return null;
        long[] out = new long[anchors.size()];
        for (int i = 0; i < out.length; i++) out[i] = anchors.get(i);
        return out;
    }

    private static boolean endsClauseMark(String text) {
        if (text == null || text.isEmpty()) return false;
        char last = text.charAt(text.length() - 1);
        return "，。！？；：,!?;:".indexOf(last) >= 0 || RebuildSource.terminal(text);
    }

    private static List<RebuildDisplayGroups.Unit> displayUnits(
            Session s, int index, RebuildProtocol.Plan plan) {
        CaptionRenderSpec spec = s.languageContext.renderSpec;
        TranslationBudget budget = TranslationOutput.budget();
        CaptionRenderSpec measured =
                budget != null
                                && budget.renderSpec != null
                                && budget.renderSpec.targetCode.equals(spec.targetCode)
                        ? budget.renderSpec
                        : spec;
        String geometry =
                budget == null
                        ? ""
                        : budget.width
                                + ":"
                                + Float.floatToIntBits(budget.preferredPx)
                                + ":"
                                + measured.measurementKey();
        DisplayLayout cached = s.displayLayouts[index];
        if (cached != null && cached.plan == plan && cached.geometry.equals(geometry))
            return cached.units;
        // An authored track prefers the author's cue pages and falls back to event pages for any
        // cue the reply does not tile exactly; text that arrived is never withheld for alignment.
        boolean authoredTrack = s.blocks.get(index).authored;
        if (authoredTrack) {
            boolean partial = s.provisional != null && s.provisional[index] == plan;
            RebuildCueProjection.Result projection = authoredProjection(s, index, plan);
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
            if (!units.isEmpty()) s.displayLayouts[index] = new DisplayLayout(plan, geometry, units);
            return units;
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
        // A joined unit may use the two lines the box has, so a fragment the model cut in half can
        // be completed inside one unit; the page planner still shows it as one-line clauses.
        Predicate<String> fits =
                budget == null
                        ? null
                        : value -> measured.fits(value, budget.preferredPx, budget.width, 2);
        // Advisory concerns are logged, not a reason to withhold a complete translation.
        List<RebuildDisplayGroups.Unit> units =
                RebuildDisplayGroups.partition(
                        index, plan.events, s.source, s.languageContext, fits, null);
        s.displayLayouts[index] = new DisplayLayout(plan, geometry, units);
        return units;
    }

    /**
     * A repaired plan replaces the shown one only where it continues exactly after the shown text.
     */
    private static void adoptPendingPlan(Session s, int index, long position) {
        RebuildProtocol.Plan pending = s.pendingPlans == null ? null : s.pendingPlans[index];
        if (pending == null) return;
        boolean visible =
                s.display.onScreen(index, position) && !s.display.keepsShown(index, pending);
        if (visible || !s.display.continues(index, pending)) return;
        s.plans[index] = pending;
        s.pendingPlans[index] = null;
    }

    /** Why a block has no text yet: a retry is still the same unresolved caption. */
    private static String unresolvedPhase(int state, String reason) {
        if (state == READY) return "";
        return state == FAILED ? "failed:" + reason : "pending_translation";
    }

    /** Neutral text for a source range a salvaged plan could not translate. Never source text. */
    private static final String UNAVAILABLE_MARKER = "\u2026";

    /** The source window of the salvaged-plan hole covering [time], or null. */
    private static long[] holeWindow(
            Session s, RebuildProtocol.Plan plan, long time) {
        if (s.source == null || plan == null || !plan.partial || plan.holes.isEmpty()) return null;
        int size = s.source.words.size();
        for (int[] hole : plan.holes) {
            int from = Math.max(0, Math.min(hole[0], size - 1));
            int to = Math.max(0, Math.min(hole[1], size - 1));
            if (to < from) continue;
            long start = s.source.words.get(from).start;
            long end = s.source.words.get(to).end;
            if (time >= start && time < end) return new long[] {start, end};
        }
        return null;
    }

    /** True when [time] is inside a source window that carries speech. */
    private static boolean speechAt(Session s, long time) {
        if (s.source == null) return false;
        RebuildSource.TimedWindow window = s.source.windowAt(time);
        return window != null && !RebuildSource.nonSpeech(s.source.text(window.from, window.to));
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
    private static void requestPageRepair(Session s, int index, long time) {
        RebuildSource source = s.source;
        if (source == null || s.blocks == null || index < 0 || index >= s.blocks.size()) return;
        RebuildPlanner.Block parent = s.blocks.get(index);
        int[] range = pageRange(parent, source, time);
        if (range == null) return;
        int from = range[0], to = range[1];
        String key = s.generation + ":" + index + ":" + from + "-" + to;
        synchronized (s) {
            if (!current(s) || s.pageRepairs == null) return;
            if (s.terminal) return;
            // A reply that is still arriving is the cheapest source of this page; a provisional
            // prefix is already text for it, and an in-flight block request must not be duplicated.
            if (s.provisional != null && s.provisional[index] != null) return;
            if (s.jobs != null && s.jobs[index] != null) return;
            if (s.pageRepairs.contains(key)) return;
            if (s.pageRepairCount != null
                    && s.pageRepairCount[index] >= MAX_PAGE_REPAIRS_PER_BLOCK) return;
            RebuildProtocol.Plan plan = s.plans[index];
            if (plan != null && covered(plan, from, to)) return;
            // While the block reply is still in flight, give it a short grace first: a pending
            // block is usually cheaper than a second request. A hole or a failed block is repaired
            // immediately.
            if (plan == null && s.uncoveredSince != null && index < s.uncoveredSince.length) {
                long since = s.uncoveredSince[index];
                if (since > 0
                        && SystemClock.elapsedRealtime() - since < PAGE_REPAIR_GRACE_MS) return;
            }
            if (s.pageRepairs.size() > 128) s.pageRepairs.clear();
            s.pageRepairs.add(key);
            if (s.pageRepairCount != null) s.pageRepairCount[index]++;
        }
        markDisplayGap(s, index, "repair");
        final long generation = s.generation;
        dispatch(true, () -> repairPage(s, index, from, to, generation));
    }

    /** The source range of the page at [time]: one authored cue group, or one source window. */
    private static int[] pageRange(RebuildPlanner.Block parent, RebuildSource source, long time) {
        if (parent.authored) {
            for (RebuildPlanner.Block.CueRange group : RebuildCueContract.groups(source, parent))
                if (time >= group.start && time < group.end)
                    return new int[] {group.from, group.to};
            return null;
        }
        RebuildSource.TimedWindow window = source.windowAt(time);
        if (window == null) return null;
        int from = Math.max(parent.from, window.from);
        int to = Math.min(parent.to, window.to);
        return to < from ? null : new int[] {from, to};
    }

    /** True when one event already covers the whole page range. */
    private static boolean covered(RebuildProtocol.Plan plan, int from, int to) {
        for (RebuildProtocol.Event event : plan.events)
            if (event.from <= from && event.to >= to) return true;
        return false;
    }

    /**
     * One page-sized request. When the block has no plan at all, a degraded plan (every token a
     * hole) is published first, so the repair has somewhere to merge into and the renderer stops
     * treating the block as a hard failure.
     */
    private static void repairPage(Session s, int index, int from, int to, long generation) {
        RebuildPlanner.Block parent;
        RebuildPlanner.Block page;
        synchronized (s) {
            if (!current(s) || s.generation != generation || s.blocks == null) return;
            parent = s.blocks.get(index);
            page = pageBlock(parent, s.source, from, to);
            if (page == null) return;
            if (s.plans[index] == null) {
                s.plans[index] = RebuildProtocol.degraded(parent);
                s.states[index] = READY;
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_BLOCK_DEGRADED",
                        "session="
                                + s.id
                                + ";block="
                                + index
                                + ";reason=no_plan;range="
                                + from
                                + "-"
                                + to);
            }
        }
        Job job = new Job(s, index, true);
        RebuildProtocol.Plan candidate;
        try {
            candidate =
                    RebuildApi.translate(
                            s.source,
                            page,
                            s.config,
                            s.target,
                            job,
                            true,
                            "Translate only this uncovered source range. Keep its complete meaning"
                                    + " and return the complete range.",
                            s.languageContext);
        } catch (Exception failed) {
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
        synchronized (s) {
            if (!current(s) || s.generation != generation) return;
            RebuildProtocol.Plan current = s.plans[index];
            if (current == null) current = RebuildProtocol.degraded(parent);
            merged = RebuildReview.mergeInto(current, candidate, parent);
            if (merged == current) {
                TranslationRuntime.mark(
                        s.context,
                        "REBUILD_PAGE_REPAIR_EMPTY",
                        "session="
                                + s.id
                                + ";block="
                                + index
                                + ";range="
                                + from
                                + "-"
                                + to);
                return;
            }
            s.plans[index] = merged;
            s.states[index] = READY;
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

    /** The request block of one page: an automatic window, or exactly one authored cue group. */
    private static RebuildPlanner.Block pageBlock(
            RebuildPlanner.Block parent, RebuildSource source, int from, int to) {
        if (source == null
                || from < parent.from
                || to > parent.to
                || to < from
                || from >= source.words.size()
                || to >= source.words.size()) return null;
        if (!parent.authored) return new RebuildPlanner.Block(parent.index, from, to, source);
        for (RebuildPlanner.Block.CueRange group : RebuildCueContract.groups(source, parent))
            if (group.from == from && group.to == to)
                return new RebuildPlanner.Block(
                        parent.index, from, to, source, Collections.singletonList(group));
        return null;
    }

    private static void render(Session s) {
        if (!current(s) || !s.visible) return;
        String translating = TranslationRuntime.message(s.context, "caption_translating");
        String text = "", fallbackReason = "", displayEmptyReason = "", eventId = "none";
        boolean status = false;
        int guaranteeIndex = -1;
        int generation;
        long revision, submission, selectedAt, observedAt;
        long eventStart = -1, eventEnd = -1;
        long[] eventAnchors = null;
        synchronized (s) {
            if (!current(s) || !s.visible) return;
            generation = s.generation;
            observedAt = s.position;
            selectedAt = displayPosition(s);
            if (s.source == null && !s.status.isEmpty()) {
                text = s.status;
                status = true;
            } else if (s.sourceOnly) {
                CaptionDocument.Cue cue = sourceCue(s, selectedAt);
                if (cue != null) {
                    text = cue.text;
                    eventId = "source:" + cue.startMs + "_" + cue.endMs;
                }
            } else if (s.source == null && s.raw != null && !s.terminal) {
                CaptionDocument.Cue cue = originalCue(s, selectedAt);
                if (cue != null) {
                    text = translating;
                    eventId = "source:raw:" + cue.startMs + "_" + cue.endMs;
                    eventStart = cue.startMs;
                    eventEnd = cue.endMs;
                    fallbackReason = "pending_engine";
                }
            } else if (s.source == null) {
                text = s.status.isEmpty() ? translating : s.status;
                status = true;
            } else if (s.terminal) {
                text = s.status;
                status = true;
            } else {
                int i = blockAt(s, selectedAt);
                guaranteeIndex = i;
                // A page held across the short pause after its block stays until the next speaks.
                if (i >= 0
                        && (covers(s.blocks.get(i), selectedAt)
                                || s.display.onScreen(i, selectedAt))) {
                    adoptPendingPlan(s, i, selectedAt);
                    RebuildProtocol.Plan p = s.plans[i];
                    // Until the reply is complete, its validated leading events show as they
                    // arrive.
                    boolean provisional =
                            p == null && s.provisional != null && s.provisional[i] != null;
                    if (provisional) p = s.provisional[i];
                    RebuildDisplayGroups.Unit unit =
                            p == null
                                    ? null
                                    : s.display.select(
                                            i, p.events, displayUnits(s, i, p), selectedAt);
                    if (unit != null) {
                        eventId = unit.id();
                        eventStart = unit.start;
                        eventEnd = unit.end;
                        eventAnchors = pageAnchors(s, unit);
                        text = unit.text;
                        if (text.isEmpty()) displayEmptyReason = "non_speech";
                        if (!text.isEmpty()) {
                            s.display.shown(unit);
                            if (s.uncoveredSince != null) s.uncoveredSince[i] = 0;
                        }
                    } else if (p == null || provisional) {
                        fallbackReason = unresolvedPhase(s.states[i], s.reasons[i]);
                        // Waiting displays keep each source cue's own window, so a block-wide
                        // placeholder never announces a later cue before its onset. The video's own
                        // line is never a substitute for a translation: only the neutral placeholder
                        // may stand in while a reply can still arrive.
                        CaptionDocument.Cue cue = originalCue(s, selectedAt);
                        RebuildPlanner.Block block = s.blocks.get(i);
                        if (fallbackReason.equals("pending_translation")
                                && cue != null
                                && cue.startMs < block.end
                                && cue.endMs > block.start) {
                            eventStart = Math.max(cue.startMs, block.start);
                            eventEnd = Math.min(cue.endMs, block.end);
                            if (eventStart <= selectedAt && selectedAt < eventEnd) {
                                text = translating;
                                eventId = "waiting:" + i + ":" + eventStart + "_" + eventEnd;
                            }
                        }
                        // A block abandoned after bounded retries (or refused by the provider)
                        // gets the same neutral marker: never the video's own line, never an
                        // unexplained blank for a speech range.
                        if (text.isEmpty()
                                && s.states != null
                                && s.states[i] == FAILED
                                && cue != null
                                && cue.startMs < block.end
                                && cue.endMs > block.start) {
                            eventStart = Math.max(cue.startMs, block.start);
                            eventEnd = Math.min(cue.endMs, block.end);
                            if (eventStart <= selectedAt && selectedAt < eventEnd) {
                                text = UNAVAILABLE_MARKER;
                                eventId =
                                        "unavailable:failed:"
                                                + i
                                                + ":"
                                                + eventStart
                                                + "_"
                                                + eventEnd;
                            }
                        }
                    } else {
                        // The plan is ready but this instant falls outside every display unit.
                        // A salvaged plan knows which source ranges it could not translate; show a
                        // neutral marker instead of an unexplained blank. A plain estimated gap
                        // (no hole) stays empty: there is no speech there to stand in for.
                        long[] hole = holeWindow(s, p, selectedAt);
                        if (hole != null) {
                            eventStart = hole[0];
                            eventEnd = hole[1];
                            text = UNAVAILABLE_MARKER;
                            eventId =
                                    "unavailable:" + i + ":" + eventStart + "_" + eventEnd;
                        }
                        fallbackReason = "";
                    }
                }
            }
            // N52 display guarantee: speech never renders an empty box. The screen follows the
            // source timeline, not a block's plan: an uncovered speech instant holds the last
            // translated page (bounded) or shows the neutral placeholder, and the uncovered page
            // itself is requested once, at page size. No gate may turn a missing page into a
            // silent caption box.
            if (!status
                    && !s.sourceOnly
                    && (text.isEmpty()
                            || UNAVAILABLE_MARKER.equals(text)
                            || fallbackReason.equals("pending_translation"))
                    && speechAt(s, selectedAt)) {
                if (s.uncoveredSince != null
                        && guaranteeIndex >= 0
                        && s.uncoveredSince[guaranteeIndex] == 0)
                    s.uncoveredSince[guaranteeIndex] = SystemClock.elapsedRealtime();
                boolean uncovered = text.isEmpty() || UNAVAILABLE_MARKER.equals(text);
                RebuildDisplayGroups.Unit held = s.display.shown();
                boolean holdable =
                        held != null
                                && !held.text.trim().isEmpty()
                                && selectedAt < held.end + DISPLAY_HOLD_MS;
                if (uncovered) {
                    if (holdable) {
                        long until =
                                Math.max(
                                        selectedAt + DISPLAY_QUANTUM_MS,
                                        ((selectedAt / DISPLAY_QUANTUM_MS) + 1) * DISPLAY_QUANTUM_MS);
                        text = held.text;
                        eventStart = held.start;
                        eventEnd = Math.max(until, held.end);
                        // The quantum is part of the identity: the window itself is not part of
                        // the render signature, so the held page must be re-issued as it grows.
                        eventId =
                                "hold:"
                                        + guaranteeIndex
                                        + ":"
                                        + held.from
                                        + "-"
                                        + held.to
                                        + ":"
                                        + (eventEnd / DISPLAY_QUANTUM_MS);
                        fallbackReason = "";
                        displayEmptyReason = "";
                        markDisplayGap(s, guaranteeIndex, "hold");
                    } else if (text.isEmpty()) {
                        RebuildSource.TimedWindow window = s.source.windowAt(selectedAt);
                        eventStart = window == null ? selectedAt : Math.max(window.start, selectedAt);
                        eventEnd = window == null ? selectedAt + DISPLAY_QUANTUM_MS : window.end;
                        if (eventEnd <= eventStart) eventEnd = eventStart + DISPLAY_QUANTUM_MS;
                        text = translating;
                        fallbackReason = "pending_translation";
                        eventId =
                                "ensure:" + guaranteeIndex + ":" + (selectedAt / DISPLAY_QUANTUM_MS);
                        markDisplayGap(s, guaranteeIndex, "placeholder");
                    } else {
                        // Nothing to hold yet: keep the neutral marker, but still ask for this page.
                        markDisplayGap(s, guaranteeIndex, "marker");
                    }
                }
                if (guaranteeIndex >= 0) requestPageRepair(s, guaranteeIndex, selectedAt);
            }
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
                    eventAnchors);
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
