package app.yydarlinker.deepseekcaptions;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import org.json.JSONArray;
import org.json.JSONObject;

import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/** Experimental locally-owned fixed-unit translation core. */
@SuppressLint("StaticFieldLeak")
final class ContextualUnitCaptionController {
    private static final int PENDING = 0;
    private static final int IN_FLIGHT = 1;
    private static final int READY = 2;
    private static final int RETRY_WAIT = 4;
    private static final int PERMANENT_FAILURE = 5;

    private static final long REALTIME_LOOKAHEAD_MS = 10_000L;
    private static final long BACKGROUND_LOW_WATER_MS = 12_000L;
    private static final long BACKGROUND_HIGH_WATER_MS = 30_000L;
    private static final long BACKGROUND_BATCH_SPAN_MS = 30_000L;
    private static final int REALTIME_MAX_UNITS = 4;
    private static final int BACKGROUND_MAX_UNITS = 3;
    private static final int CONTEXT_UNITS_PER_SIDE = 1;
    private static final int MAX_REALTIME_LOGICAL_ATTEMPTS = 2;
    private static final long FAILED_REALTIME_BACKOFF_MS = 10_000L;
    private static final long REFILL_SAFETY_MARGIN_MS = 1_500L;
    private static final long SEEK_THRESHOLD_MS = 2_900L;
    private static final long FOREIGN_TRACK_GRACE_MS = 1_500L;
    private static final long PLAYER_RESTORE_GRACE_MS = 4_000L;
    private static final long DISPLAY_TICK_MS = 80L;
    private static final long LONG_DISPLAY_THRESHOLD_MS = 5_200L;
    private static final int CACHE_FORMAT = 3;
    private static final byte[] CACHE_MARKER =
            "\n#ai-semantic-objects-134".getBytes(StandardCharsets.UTF_8);

    private static final AtomicLong SESSION_IDS = new AtomicLong();
    private static final AtomicLong THREAD_IDS = new AtomicLong();
    private static final ExecutorService SOURCES = Executors.newCachedThreadPool(
            daemonThreadFactory("AiCaptionUnitSource-")
    );
    private static final ExecutorService REALTIME = Executors.newSingleThreadExecutor(
            daemonThreadFactory("AiCaptionUnitCurrent-")
    );
    private static final ExecutorService BACKGROUND = Executors.newSingleThreadExecutor(
            daemonThreadFactory("AiCaptionUnitAhead-")
    );
    private static final Handler DISPLAY = new Handler(Looper.getMainLooper());
    private static final Runnable DISPLAY_TICK = ContextualUnitCaptionController::displayTick;
    private static final Object ACTIVE_LOCK = new Object();

    private static volatile Session active;
    private static volatile String currentVideoId = "";
    private static volatile boolean compactPlayer;
    private static volatile long restoreGraceUntilMs;
    private static final PlaybackClockEstimator PLAYBACK_CLOCK = new PlaybackClockEstimator();

    private ContextualUnitCaptionController() {}

    static boolean isVisibleActive() {
        Session session = active;
        return session != null && !session.cancelled && session.visible;
    }

    static void deactivateFromCaptionButton() {
        if (isVisibleActive()) deactivate("已通过字幕按钮关闭 AI 字幕");
    }

    static void deactivateFromNativeCaptionState() {
        if (isVisibleActive()) deactivate("原生 CC 字幕状态已关闭");
    }

    static void deactivateForCoreSwitch() {
        Session session = active;
        if (session != null && !session.cancelled) deactivate("切换字幕翻译核心");
    }

        static String activeTranslatedUrl() {
        Session session = active;
        return session == null || session.cancelled ? "" : session.translatedUrl;
    }
static void setMainActivity(Activity activity) {
        CaptionOverlay.setActivity(activity);
        Session session = active;
        if (session != null) render(session, session.currentTimeMs);
    }

    static void onPlayerType(String rawType) {
        String type = rawType == null ? "" : rawType.toUpperCase(java.util.Locale.ROOT);
        boolean compact = type.contains("MINIMIZED") || type.contains("MINIMAL") ||
                type.contains("HIDDEN") || type.contains("DISMISSED") ||
                type.contains("PICTURE_IN_PICTURE");
        if (compactPlayer && !compact) {
            restoreGraceUntilMs = SystemClock.elapsedRealtime() + PLAYER_RESTORE_GRACE_MS;
        }
        compactPlayer = compact && !CaptionSurface.isShorts();
    }

    static String restoreTargetAfterMiniplayer(String url) {
        if(!CaptionChoice.translates()) return url;
        Session session = active;
        if (session == null || session.cancelled || !session.visible) return url;
        long now = SystemClock.elapsedRealtime();
        boolean protectedRequest = compactPlayer || now <= restoreGraceUntilMs ||
                now - session.activatedAtMs <= FOREIGN_TRACK_GRACE_MS;
        if (!protectedRequest || !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) return url;
        String requestedVideo = videoIdFromUrl(url);
        if (!requestedVideo.isEmpty() && !session.videoId.isEmpty() &&
                !requestedVideo.equals(session.videoId)) return url;
        return TargetLanguage.withCode(url, session.targetLanguage.code);
    }

    static void onVideoId(String rawVideoId) {
        String videoId = rawVideoId == null ? "" : rawVideoId.trim();
        if (videoId.isEmpty()) return;
        final String previous;
        final Session session;
        boolean rejectSession = false;
        synchronized (ACTIVE_LOCK) {
            previous = currentVideoId;
            currentVideoId = videoId;
            SemanticCaptionTimeline.onVideoId(videoId);
            session = active;
            if (session != null && !session.cancelled) {
                String owner = ContextualUnitCorePolicy.bindOwnerOnVideoId(
                        session.videoId, videoId
                );
                if (owner.isEmpty()) {
                    rejectSession = true;
                } else {
                    session.videoId = owner;
                }
            }
        }
        if (!previous.isEmpty() && !previous.equals(videoId)) {
            PLAYBACK_CLOCK.reset(0L, SystemClock.elapsedRealtime(), 1f);
        }
        if (session == null || session.cancelled) return;
        if (rejectSession) {
            deactivateIfCurrent(session, "视频已切换：" + abbreviatedVideoId(videoId));
            return;
        }
    }

    static void refreshConfiguration(Context context) {
        Session session = active;
        if (session == null || session.cancelled || context == null) return;
        if (!DeepSeekConfig.load(context).enabled ||
                !DeepSeekConfig.contextualUnitCoreEnabled(context)) {
            deactivate("实验翻译核心已关闭");
            return;
        }
        String resume=session.translatedUrl;
        deactivate("配置已更新");
        if(session.sourceOnly) activateSource(context,resume); else activate(context, resume);
    }

    static void activateSource(Context context,String sourceUrl) {
        activateInternal(context,sourceUrl,true,true);
    }
    static void activate(Context context, String translatedUrl) {
        activateInternal(context, translatedUrl, true);
    }

    static void prewarm(Context context, String sourceUrl) {
        if (!CaptionChoice.isOn() || !CaptionChoice.translates() || context == null || !DeepSeekCaptionHook.isYouTubeTimedTextUrl(sourceUrl) ||
                TargetLanguage.fromUrl(sourceUrl) != null || !DeepSeekConfig.isReady(context) ||
                !DeepSeekConfig.contextualUnitCoreEnabled(context)) return;
        String code = DeepSeekConfig.defaultTargetLanguage(context);
        if (code.isEmpty()) return;
        Session current = active;
        String sourceVideo = videoIdFromUrl(sourceUrl);
        if (current != null && !current.cancelled && !current.visible &&
                current.targetLanguage.code.equalsIgnoreCase(code) &&
                (sourceVideo.isEmpty() || current.videoId.isEmpty() || sourceVideo.equals(current.videoId))) {
            return;
        }
        activateInternal(context, TargetLanguage.withCode(sourceUrl, code), false);
    }

    private static void activateInternal(Context context, String translatedUrl, boolean visible) {
        activateInternal(context,translatedUrl,visible,false);
    }
    private static void activateInternal(Context context, String translatedUrl, boolean visible, boolean sourceOnly) {
        if (context == null || translatedUrl == null) return;
        Context app = context.getApplicationContext();
        DeepSeekConfig.Snapshot config = DeepSeekConfig.load(app);
        TargetLanguage target = sourceOnly ? TargetLanguage.fromCode(CaptionChoice.language()) : TargetLanguage.fromUrl(translatedUrl);
        if (target == null) return;
        String requestKey = CaptionEngine.requestKey(app, translatedUrl) + (sourceOnly ? "|source-overlay-v1" : "|anchored-v1");
        String videoId = videoIdFromUrl(translatedUrl);
        if (videoId.isEmpty()) videoId = currentVideoId;
        if (videoId.isEmpty()) {
            CaptionDiagnostics.mark(
                    app,
                    "CONTEXTUAL_VIDEO_OWNER_UNRESOLVED",
                    "字幕源缺少可验证 video owner；拒绝创建半启动 session"
            );
            return;
        }

        final Session session;
        synchronized (ACTIVE_LOCK) {
            // Recheck ownership atomically with session creation. A Shorts swipe can happen
            // after URL/config parsing but before this lock; no half-started old session survives.
            if (!currentVideoId.isEmpty() && !videoId.equals(currentVideoId)) {
                CaptionDiagnostics.mark(app,"BACKGROUND_ACTIVATION_IGNORED","foreground_owner_preserved");
                return;
            }
            Session current = active;
            if (current != null && !current.cancelled && current.requestKey.equals(requestKey) &&
                    sameTranslationConfig(current.config, config)) {
                current.activatedAtMs = SystemClock.elapsedRealtime();
                // Same track/config, possibly a newly signed URL after network recovery.
                if(!current.translatedUrl.equals(translatedUrl)) {
                    current.translatedUrl=translatedUrl;
                    if(!current.timelineReady && current.sourceFailed) {
                        current.terminalError=false;current.error="";current.sourceRetryAtMs=0;
                    }
                }
                boolean instant = visible && !current.visible && current.firstReady;
                if (visible) current.visible = true;
                if (current.visible) render(current, current.currentTimeMs);
                if (current.terminalError) return;
                if (instant) {
                    CaptionDiagnostics.mark(app, "CONTEXTUAL_SHOWN_FROM_PREWARM",
                            "预热已完成源轨、固定单元和缓存恢复，选择后立即显示");
                }
                schedule(current);
                scheduleDisplayTick();
                return;
            }
            if (current != null) current.cancel();
            session = new Session(
                    SESSION_IDS.incrementAndGet(), app, translatedUrl, requestKey,
                    videoId, target, config
            );
            session.sourceOnly = sourceOnly;
            session.visible = visible;
            session.currentTimeMs = estimatedVideoTime(SystemClock.elapsedRealtime());
            active = session;
        }

        scheduleDisplayTick();
        if (!sourceOnly && !config.ready()) {
            session.error = "请先在 Morphe 设置中启用 AI 字幕并填写 API Key";
            session.terminalError = true;
            if (session.visible) CaptionOverlay.showStatus(session.error, overlayGuard(session, session.generation));
            CaptionDiagnostics.mark(app, "CONFIG_NOT_READY", session.error);
            return;
        }

        if (visible) CaptionOverlay.showStatus(
                target.displayName + " AI 字幕准备中…",
                overlayGuard(session, session.generation)
        );
        CaptionDiagnostics.mark(
                app,
                visible ? "CONTEXTUAL_CORE_STARTED" : "CONTEXTUAL_SOURCE_PREWARM_STARTED",
                "固定翻译单元 + 只读上下文；" +
                        (visible ? "当前单元优先" : "仅预热源轨、单元和缓存，不预翻译")
        );
        scheduleSource(session);
    }

    static void observeTimedTextUrl(String url) {
        if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) return;
        Session session = active;
        if (session == null || session.cancelled) return;
        if (compactPlayer || SystemClock.elapsedRealtime() <= restoreGraceUntilMs) return;
        if (!session.visible && TargetLanguage.fromUrl(url) == null) return;
        String requestedVideo = videoIdFromUrl(url);
        if (!requestedVideo.isEmpty() && !session.videoId.isEmpty() &&
                !requestedVideo.equals(session.videoId)) {
            deactivateIfCurrent(session, "检测到新视频字幕轨");
            return;
        }
        String target = query(url, "tlang");
        long age = SystemClock.elapsedRealtime() - session.activatedAtMs;
        if ((target != null && !target.trim().isEmpty()) || age > FOREIGN_TRACK_GRACE_MS) {
            deactivateIfCurrent(session, "已切换到其他字幕轨");
        }
    }

    static void onVideoTime(long timeMs) {
        long clean = Math.max(0L, timeMs);
        long now = SystemClock.elapsedRealtime();
        PlaybackClockEstimator.Update clock = PLAYBACK_CLOCK.update(clean, now, SEEK_THRESHOLD_MS);
        boolean seek = clock.seek;
        if(seek)MediaPlaybackClock.seek(clean);

        Session session = active;
        if (session == null || session.cancelled) return;
        session.currentTimeMs = estimatedVideoTime(now);
        boolean debounceStartupSeek = false;
        boolean logStartupDebounce = false;
        if (seek) {
            synchronized (session.lock) {
                debounceStartupSeek = shouldDebounceStartupSeekLocked(session, clean, now);
                if (debounceStartupSeek && !session.startupSeekDebounceLogged) {
                    session.startupSeekDebounceLogged = true;
                    logStartupDebounce = true;
                }
            }
        }
        if (logStartupDebounce) {
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_STARTUP_SEEK_DEBOUNCED",
                    "首屏请求仍覆盖新的播放锚点；忽略启动阶段时间校正"
            );
        }
        if (ContextualUnitCorePolicy.shouldReprioritizeSeek(seek, debounceStartupSeek)) {
            reprioritizeAfterSeek(session, clean);
        }
        render(session, session.currentTimeMs);
        schedule(session);
        scheduleDisplayTick();
    }

    private static boolean shouldDebounceStartupSeekLocked(
            Session session,
            long timeMs,
            long now
    ) {
        Request request = session.realtimeRequest;
        if (request == null || session.units.isEmpty() || request.indices.isEmpty()) return false;
        int newAnchor = anchor(session.units, timeMs);
        int from = request.indices.get(0);
        int to = request.indices.get(request.indices.size() - 1) + 1;
        boolean debounce = ContextualUnitCorePolicy.shouldDebounceStartupSeek(
                session.startupSeekDebounceConsumed,
                session.firstReady,
                session.timelineReady,
                session.timelineStartedAtMs,
                now,
                session.startupAnchorTimeMs,
                timeMs,
                session.startupAnchorIndex,
                newAnchor,
                from,
                to
        );
        if (debounce) session.startupSeekDebounceConsumed = true;
        return debounce;
    }

    private static void displayTick() {
        MediaPlaybackClock.refresh();
        CaptionOverlay.refreshSurface();
        Session session = active;
        if (session == null || session.cancelled) return;
        long time = estimatedVideoTime(SystemClock.elapsedRealtime());
        session.currentTimeMs = time;
        render(session, time);
        schedule(session);
        scheduleDisplayTick();
    }

    private static void scheduleDisplayTick() {
        DISPLAY.removeCallbacks(DISPLAY_TICK);
        Session session = active;
        if (session != null && !session.cancelled) DISPLAY.postDelayed(DISPLAY_TICK, DISPLAY_TICK_MS);
    }

    private static void markPreprocessStage(Session session, String stage, long started) {
        CaptionDiagnostics.mark(session.context, "CONTEXTUAL_PREPROCESS_STAGE",
                stage + "；用时 " + Math.max(0L, SystemClock.elapsedRealtime() - started) + " ms");
    }

    private static void scheduleSource(Session session) {
        synchronized(session.lock) {
            if(!isCurrent(session)||session.cancelled||session.timelineReady||session.terminalError||session.sourceLoading||
                    session.sourceRetryAtMs>SystemClock.elapsedRealtime()||(!session.visible&&session.sourceFailures>0))return;
            session.sourceLoading=true;
            session.sourceTask=SOURCES.submit(()->loadAndStart(session));
        }
    }

    private static void loadAndStart(Session session) {
        long started=SystemClock.elapsedRealtime();
        String attemptUrl=session.translatedUrl;
        try {
            RawCaptionSource.Source source = RawCaptionSource.load(session.context, attemptUrl, false, !session.sourceOnly,
                    new DeepSeekApiClient.RequestControl(){
                        public boolean isCancelled(){return session.cancelled||!isCurrent(session);}
                        public void onConnection(HttpURLConnection connection){
                            session.sourceConnection=connection;
                            if(connection!=null&&isCancelled())connection.disconnect();
                        }
                    });
            markPreprocessStage(session,"source fetch + timing",started);
            if (!isCurrent(session) || session.cancelled) return;
            long stageStarted = SystemClock.elapsedRealtime();
            int appendEvents = SourceAtomTimeline.countAppendEvents(source.body);
            markPreprocessStage(session, "countAppendEvents", stageStarted);
            if (appendEvents > 0) {
                CaptionDiagnostics.mark(
                        session.context,
                        "CONTEXTUAL_JSON3_APPEND_OBSERVED",
                        "检测到 " + appendEvents + " 个 aAppend events；保留含正文的追加事件；空换行事件不生成字幕"
                );
            }
            stageStarted = SystemClock.elapsedRealtime();
            SourceAtomTimeline.Result atomized = source.alignedAtoms != null ? source.alignedAtoms : SourceAtomTimeline.build(source.body, source.document);
            if(!session.sourceOnly) atomized=ModelNameProtection.protect(atomized);
            markPreprocessStage(session, "SourceAtomTimeline.build", stageStarted);
            CaptionDiagnostics.mark(session.context, "ANCHORED_TIMING_PROVENANCE",
                    "native="+atomized.nativeTimedAtoms+";estimated="+atomized.estimatedAtoms+
                    "; nativeRatio="+atomized.preciseRatio());
            if (!sessionMayContinue(session)) return;
            stageStarted = SystemClock.elapsedRealtime();
            TranslationUnitTimeline.Result timeline = session.sourceOnly ? NativeSourcePlan.build(source.document) : SemanticTaskPlanner.build(atomized);
            markPreprocessStage(session, "SemanticTaskPlanner.build", stageStarted);
            if (!sessionMayContinue(session)) return;
            if (timeline.units.isEmpty()) {
                failSession(session, "这个视频没有可用的本地翻译单元");
                return;
            }

            int high = 0;
            int medium = 0;
            int low = 0;
            int suppressedNonSpeech = 0;
            for (TranslationUnitTimeline.Unit unit : timeline.units) {
                if (unit.confidence == TranslationUnitTimeline.Confidence.HIGH) high++;
                else if (unit.confidence == TranslationUnitTimeline.Confidence.MEDIUM) medium++;
                else low++;
            }
            List<CaptionDocument.Cue> sharedCues = SourceAtomTimeline.asCues(timeline.atoms);
            synchronized (ACTIVE_LOCK) {
                if (!sessionMayContinueLocked(session)) return;
                if (session.videoId == null || session.videoId.trim().isEmpty()) return;
                if (!sessionMayPublishLocked(session)) return;
                SemanticCaptionTimeline.replace(session.videoId, sharedCues);
                synchronized (session.lock) {
                    if (session.cancelled || active != session) return;
                    session.cacheKey = DiskCaptionCache.key(
                            cacheIdentity(source.body, timeline.atoms), session.config, session.targetLanguage.code
                    );
                    session.atoms = timeline.atoms;
                    session.units = timeline.units;
                    int count = timeline.units.size();
                    session.translations = new String[count];
                    session.anchoredPlans = new AnchoredCaptionPlan[count];
                    session.displayGroupsByUnit = ContextualDisplayGroupPolicy.singleWindows(
                            session.units, session.atoms
                    );
                    session.displayPlans = new DisplayPlan[count];
                    session.groupWaitStartedAtMs = new long[count];
                    session.groupSuppressed = new boolean[count];
                    session.states = new int[count];
                    session.qualityRepairs=new int[count];
                    session.realtimeAttempts = new int[count];
                    session.realtimeRetryAfterMs = new long[count];
                    session.delayedRetryUsed = new boolean[count];
                    session.failureCounts = new int[count];
                    session.fallbackLogged = new boolean[count];
                    session.retryAfterMs = new long[count];
                    session.lastFailureReasons = new String[count];
                    session.isolatedRetries = new boolean[count];
                    session.suppressedBridges = new boolean[count];
                    for (int i = 0; i < count; i++) {
                        TranslationUnitTimeline.Unit unit = session.units.get(i);
                        if(session.sourceOnly) {
                            session.translations[i]=unit.sourceText;
                            session.anchoredPlans[i]=AnchoredCaptionPlan.source(unit.startMs,unit.endMs,unit.sourceText);
                            session.states[i]=READY;
                        } else if (ContextualCaptionTextPolicy.suppressWithoutTranslation(unit.sourceText)) {
                            session.translations[i] = "";
                            session.states[i] = READY;
                            suppressedNonSpeech++;
                        }
                    }
                    session.timelineStartedAtMs = SystemClock.elapsedRealtime();
                    session.startupAnchorTimeMs = session.currentTimeMs;
                    session.startupAnchorIndex = anchor(session.units, session.currentTimeMs);
                    session.startupSeekDebounceConsumed = false;
                    session.error="";session.sourceFailed=false;session.sourceRetryAtMs=0;
                }
            }

            if (!sessionMayPublish(session)) return;
            stageStarted = SystemClock.elapsedRealtime();
            int cached = session.sourceOnly ? 0 : restoreCache(session);
            markPreprocessStage(session, "cache restore", stageStarted);
            boolean currentCacheHit;
            synchronized (session.lock) {
                // Keep independently translated windows separate; no cross-window semantic evidence.
                int current = anchor(session.units, session.currentTimeMs);
                if(session.cancelled || !isCurrent(session))return;
                session.firstReady = isReadyLocked(session, current);
                currentCacheHit = session.firstReady;
                // Display ticks cannot race cache restoration and send a duplicate paid request.
                session.timelineReady=true;
            }
            TokenCostAudit.recordUnitCacheOutcome(
                    timeline.units.size(), cached, currentCacheHit
            );
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_UNIT_TIMELINE_READY",
                    timeline.sourceKind + "：" + atomized.rawCueCount + " cues → " +
                            timeline.atoms.size() + " 本地 lexical atoms → " + timeline.units.size() +
                            " immutable units；置信度 H/M/L=" + high + "/" + medium + "/" + low +
                            (timeline.rejectionSummary().isEmpty() ? "" :
                                    "；边界拒绝 " + timeline.rejectionSummary()) +
                            (suppressedNonSpeech > 0 ? "；抑制非语音 " + suppressedNonSpeech : "") +
                            (cached > 0 ? "；缓存恢复 " + cached : "")
            );
            if (session.visible) {
                render(session, session.currentTimeMs);
                schedule(session);
            }
        } catch (Throwable failure) {
            if (!session.cancelled && isCurrent(session)) {
                SourceRecoveryPolicy.Failure reason=SourceRecoveryPolicy.classify(failure);
                boolean descriptorChanged=!attemptUrl.equals(session.translatedUrl);
                if((reason.retryable || descriptorChanged) && !session.timelineReady) {
                    long delay;
                    synchronized(session.lock) {
                        session.sourceFailed=true;session.sourceFailures++;
                        delay=descriptorChanged?0:SourceRecoveryPolicy.delay(session.sourceFailures,reason.retryAfterMs);
                        session.sourceRetryAtMs=SystemClock.elapsedRealtime()+delay;
                        session.error=CaptionStrings.settings(session.context,"source_retry");
                    }
                    CaptionDiagnostics.mark(session.context,"SOURCE_RETRY_SCHEDULED",
                            "category="+reason.category+";attempt="+session.sourceFailures+";delay_ms="+delay+
                            ";source_get_only=true;elapsed_ms="+(SystemClock.elapsedRealtime()-started));
                    render(session,session.currentTimeMs);
                } else {
                    session.sourceFailed=true;
                    CaptionDiagnostics.mark(session.context,"SOURCE_LOAD_FAILED","category="+reason.category);
                    failSession(session,CaptionStrings.settings(session.context,"source_unavailable"));
                }
            }
        } finally {
            synchronized(session.lock){session.sourceLoading=false;}
        }
    }

    private static void schedule(Session session) {
        if(!session.timelineReady){scheduleSource(session);return;}
        if (!isCurrent(session) || session.cancelled || session.sourceOnly || session.terminalError || !session.timelineReady || !session.visible) return;
        Request cancelBackground = null;
        Request startRealtime = null;
        Request startBackground = null;
        boolean promotionSkipped = false;
        boolean concurrentRescue = false;
        int stableBridges = 0;
        long bufferAhead = 0L;
        long wallClockRunway = Long.MAX_VALUE;
        synchronized (session.lock) {
            stableBridges = resolveStableBridgesLocked(session);
            int current = anchor(session.units, session.currentTimeMs);
            if (current < 0 || current >= session.states.length) return;

            if (session.realtimeRequest == null && !isReadyLocked(session, current)) {
                Request background = session.backgroundRequest;
                boolean backgroundOwnsCurrent = background != null && background.contains(current);
                if (backgroundOwnsCurrent && background.bodySent) {
                    // The sent request may already incur provider work: await its bounded timeout,
                    // never pay for a speculative concurrent copy of the same source window.
                    if (session.lastPromotionSkippedSequence != background.sequence) {
                        session.lastPromotionSkippedSequence = background.sequence;
                        promotionSkipped = true;
                    }
                } else {
                    if (backgroundOwnsCurrent) {
                        background.cancelled = true;
                        cancelBackground = background;
                        resetRequestLocked(session, background, PENDING);
                        session.backgroundRequest = null;
                    }
                    startRealtime = buildRealtimeLocked(session, current);
                    if (startRealtime != null) {
                        session.realtimeRequest = startRealtime;
                        background = session.backgroundRequest;
                        if (background != null && !background.bodySent) {
                            background.cancelled = true;
                            cancelBackground = background;
                            resetRequestLocked(session, background, PENDING);
                            session.backgroundRequest = null;
                        }
                    }
                }
            }

            bufferAhead = bufferAheadMsLocked(session);
            wallClockRunway = wallClockRunwayMsLocked(session, bufferAhead);
            long refillDeadline = Math.max(
                    2_000L,
                    session.recentBackgroundLatencyMs + REFILL_SAFETY_MARGIN_MS
            );
            boolean refillDue = bufferAhead < BACKGROUND_LOW_WATER_MS ||
                    wallClockRunway <= refillDeadline;
            boolean refillEligible = ContextualUnitCorePolicy.refillEligible(
                    session.firstReady, hasReadyInventoryAtOrAheadLocked(session, current)
            );
            if (session.realtimeRequest == null && session.backgroundRequest == null &&
                    refillEligible && refillDue) {
                startBackground = buildBackgroundLocked(session, current);
                if (startBackground != null) session.backgroundRequest = startBackground;
            }
        }

        if (cancelBackground != null) cancelBackground.cancel();
        if (stableBridges > 0) {
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_SOURCE_BRIDGE_STABILIZED",
                    "抑制 " + stableBridges + " 个相邻重复/回卷 bridge units，避免复制整段译文"
            );
            persistCacheAsync(session);
        }
        if (promotionSkipped) {
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_BACKGROUND_PROMOTION_SKIPPED",
                    "后台请求已发送 body，播放头追上时保留在途结果，避免重复支付"
            );
        }
        if (startRealtime != null) {
            CaptionDiagnostics.mark(
                    session.context,
                    concurrentRescue ? "CONTEXTUAL_BODY_SENT_RESCUE" : "CONTEXTUAL_REALTIME_REQUEST",
                    "当前 unit #" + startRealtime.focus + "；目标 " + startRealtime.indices.size() +
                            " units；只读上下文 " +
                            (startRealtime.contextBefore.size() + startRealtime.contextAfter.size()) + " units"
            );
            submit(session, startRealtime, REALTIME);
        }
        if (startBackground != null) {
            float rate = PLAYBACK_CLOCK.playbackRate();
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_BACKGROUND_REQUEST",
                    "前方固定批次：" + startBackground.indices.size() + " units；跨度约 " +
                            requestSpanMs(startBackground) + " ms；buffer=" + bufferAhead +
                            " ms；runway=" + (wallClockRunway == Long.MAX_VALUE ? "paused" : wallClockRunway) +
                            " ms；rate=" + rate
            );
            submit(session, startBackground, BACKGROUND);
        }
    }

    private static int resolveStableBridgesLocked(Session session) {
        // De-rolling belongs to the source parser. Real repeated speech must still be translated.
        return 0;
    }

    private static boolean hasReadyInventoryAtOrAheadLocked(Session session, int current) {
        long highWater = session.currentTimeMs + BACKGROUND_HIGH_WATER_MS;
        for (int i = Math.max(0, current); i < session.units.size(); i++) {
            if (session.units.get(i).startMs > highWater) break;
            if (session.states[i] == READY) return true;
        }
        return false;
    }

    private static Request buildRealtimeLocked(Session session, int current) {
        if (current < 0 || current >= session.states.length ||
                session.states[current] == IN_FLIGHT ||
                session.states[current] == READY ||
                session.states[current] == PERMANENT_FAILURE) return null;
        long now = SystemClock.elapsedRealtime();
        if (session.states[current] == RETRY_WAIT && session.retryAfterMs[current] > now) {
            session.retryAfterMs[current] = ContextualUnitCorePolicy.promoteDemandedRepairAt(
                    now, session.retryAfterMs[current], session.failureCounts[current]
            );
            if (session.retryAfterMs[current] > now) return null;
        }
        if (session.realtimeAttempts[current] >= MAX_REALTIME_LOGICAL_ATTEMPTS) {
            if (session.realtimeRetryAfterMs[current] > now) return null;
            if (session.delayedRetryUsed[current] && BackgroundPauseGovernor.snapshot().held) return null;
            // A bounded current-only retry remains available while the unit is demanded by playback.
            session.realtimeAttempts[current] = MAX_REALTIME_LOGICAL_ATTEMPTS - 1;
        }
        int maximum = ContextualUnitCorePolicy.requestUnitLimit(
                session.realtimeAttempts[current] > 0 || session.isolatedRetries[current],
                REALTIME_MAX_UNITS
        );
        maximum=StartupCaptionPolicy.targetLimit(session.firstReady,maximum); // No startup-only reduction of the normal translation batch.
        long horizon = session.currentTimeMs + REALTIME_LOOKAHEAD_MS;
        List<Integer> indices = new ArrayList<>();
        for (int i = current; i < session.units.size() && indices.size() < maximum; i++) {
            TranslationUnitTimeline.Unit unit = session.units.get(i);
            if (i > current && (unit.startMs > horizon || unit.endMs-session.units.get(current).startMs>BACKGROUND_BATCH_SPAN_MS)) break;
            int state = session.states[i];
            if (state == READY || state == IN_FLIGHT || state == PERMANENT_FAILURE) {
                if (i == current) return null;
                break;
            }
            if (state == RETRY_WAIT && session.retryAfterMs[i] > now) {
                if (i == current) return null;
                break;
            }
            if (session.realtimeAttempts[i] >= MAX_REALTIME_LOGICAL_ATTEMPTS) {
                if (i == current) return null;
                break;
            }
            indices.add(i);
        }
        if (indices.isEmpty()) return null;
        for (int index : indices) session.states[index] = IN_FLIGHT;
        session.realtimeAttempts[current]++;
        return requestForIndicesLocked(
                session,
                indices,
                current,
                true,
                indices.size() > 1 && session.realtimeAttempts[current] == 1,
                false
        );
    }

    private static Request buildConcurrentCurrentRescueLocked(Session session, int current) {
        if (current < 0 || current >= session.units.size() ||
                session.states[current] == READY ||
                session.realtimeAttempts[current] >= MAX_REALTIME_LOGICAL_ATTEMPTS) return null;
        session.realtimeAttempts[current]++;
        return requestForIndicesLocked(
                session,
                Collections.singletonList(current),
                current,
                true,
                false,
                true
        );
    }

    private static Request buildBackgroundLocked(Session session, int current) {
        long now = SystemClock.elapsedRealtime();
        long highWater = session.currentTimeMs + BACKGROUND_HIGH_WATER_MS;
        int first = -1;
        for (int i = Math.max(0, current); i < session.units.size(); i++) {
            TranslationUnitTimeline.Unit unit = session.units.get(i);
            if (unit.startMs > highWater) break;
            int state = session.states[i];
            if (state == READY || state == PERMANENT_FAILURE) continue;
            if (state == IN_FLIGHT) return null;
            if (state == RETRY_WAIT && session.retryAfterMs[i] > now) continue;
            first = i;
            break;
        }
        if (first < 0) return null;

        if (session.isolatedRetries[first]) {
            session.states[first] = IN_FLIGHT;
            return requestForIndicesLocked(
                    session, Collections.singletonList(first), first, false, false, false
            );
        }

        long batchStart = session.units.get(first).startMs;
        List<Integer> indices = new ArrayList<>();
        for (int i = first; i < session.units.size() && indices.size() < BACKGROUND_MAX_UNITS; i++) {
            TranslationUnitTimeline.Unit unit = session.units.get(i);
            if (unit.startMs > highWater || unit.endMs - batchStart > BACKGROUND_BATCH_SPAN_MS) break;
            int state = session.states[i];
            if (state == PERMANENT_FAILURE || state == IN_FLIGHT) break;
            if (state == RETRY_WAIT && session.retryAfterMs[i] > now) break;
            if (state != PENDING && state != RETRY_WAIT) break;
            indices.add(i);
        }
        if (indices.isEmpty()) return null;
        for (int index : indices) session.states[index] = IN_FLIGHT;
        return requestForIndicesLocked(session, indices, first, false, false, false);
    }
    private static Request requestForIndicesLocked(
            Session session,
            List<Integer> indices,
            int focus,
            boolean priority,
            boolean fallbackAllowed,
            boolean concurrentRescue
    ) {
        List<TranslationUnitTimeline.Unit> targets = new ArrayList<>(indices.size());
        for (int index : indices) targets.add(session.units.get(index));
        int first = indices.get(0);
        int last = indices.get(indices.size() - 1);
        List<String> before = sourceContext(
                session.units,
                Math.max(0, first - CONTEXT_UNITS_PER_SIDE),
                first
        );
        List<String> after = sourceContext(
                session.units,
                last + 1,
                Math.min(session.units.size(), last + 1 + CONTEXT_UNITS_PER_SIDE)
        );
        if (session.requestSequence == 0L && !session.firstReady) {
            session.startupAnchorTimeMs = session.currentTimeMs;
            session.startupAnchorIndex = focus;
        }
        return new Request(
                Collections.unmodifiableList(new ArrayList<>(indices)),
                Collections.unmodifiableList(targets),
                before,
                after,
                focus,
                priority,
                fallbackAllowed,
                concurrentRescue,
                session.generation,
                ++session.requestSequence
        );
    }

    private static List<String> sourceContext(
            List<TranslationUnitTimeline.Unit> units,
            int from,
            int to
    ) {
        if (from >= to) return Collections.emptyList();
        List<String> out = new ArrayList<>(to - from);
        for (int i = from; i < to; i++) out.add(units.get(i).sourceText);
        return Collections.unmodifiableList(out);
    }

    private static void submit(Session session, Request request, ExecutorService executor) {
        request.future = executor.submit(() -> translateBatch(session, request));
    }

    private static void translateBatch(Session session, Request request) {
        if(!CaptionModePolicy.mayCallApi(session.sourceOnly,session.terminalError,session.cancelled)) return;
        long started = SystemClock.elapsedRealtime();
        try {
            java.util.Map<String,String> repairs=new java.util.HashMap<>();
            synchronized(session.lock) { for(int index:request.indices) {
                String reason=session.lastFailureReasons[index];
                if(reason!=null && !reason.isEmpty()) repairs.put(session.units.get(index).id,reason);
            } }
            ContextualBatchApiClient.Result result = ContextualBatchApiClient.translate(
                    request.targets,
                    session.atoms,
                    request.contextBefore,
                    request.contextAfter,
                    session.config,
                    session.targetLanguage,
                    new DeepSeekApiClient.RequestControl() {
                        @Override public boolean isCancelled() {
                            return request.cancelled || session.cancelled || !isCurrent(session);
                        }

                        @Override public void onConnection(HttpURLConnection connection) {
                            request.connection = connection;
                            if (connection != null &&
                                    (request.cancelled || session.cancelled || !isCurrent(session))) {
                                connection.disconnect();
                            }
                        }

                        @Override public void onQualityEvidence(JSONObject source,String response,String metadata) {
                            if(!isCancelled())CaptionQualityTrace.record(session.context,session.config.apiKey,request.sequence,source,response,
                                    "session="+session.id+";owner_sha256="+CaptionQualityTrace.digest(session.videoId)+";"+metadata);
                        }

                        @Override public void onRequestBodySent() {
                            request.bodySent = true;
                            request.bodySentAtMs = SystemClock.elapsedRealtime();
                            if (!request.priority) {
                                CaptionDiagnostics.mark(
                                        session.context,
                                        "CONTEXTUAL_BACKGROUND_BODY_SENT",
                                        "request=" + request.sequence + ";units=" + request.indices.size()
                                );
                            }
                        }
                    },
                    request.priority, repairs
            );
            finishBatch(session, request, result, started);
        } catch (Throwable failure) {
            if(failure instanceof ContextualBatchApiClient.PermanentException &&
                    !"content_filter".equals(ContextualBatchApiClient.failureCategory(failure))) {
                synchronized(session.lock) {
                    if(!ContextualUnitCorePolicy.acceptsRequestResult(isCurrent(session),session.cancelled,request.cancelled,
                            request.generation,session.generation))return;
                    detachRequestLocked(session,request);
                    failSession(session,failure.getMessage());
                }
                return;
            }
            failBatch(session, request, failure, started);
        }
    }

    private static void finishBatch(
            Session session,
            Request request,
            ContextualBatchApiClient.Result result,
            long started
    ) {
        boolean firstReadyNow = false;
        int applied = 0;
        int stabilized = 0;
        int retryable = 0;
        int permanent = 0;
        boolean deferredToBackground = false;
        long took = Math.max(0L, SystemClock.elapsedRealtime() - started);
        synchronized (session.lock) {
            if (!ContextualUnitCorePolicy.acceptsRequestResult(
                    isCurrent(session), session.cancelled, request.cancelled,
                    request.generation, session.generation
            )) {
                detachRequestLocked(session, request);
                CaptionDiagnostics.mark(
                        session.context,
                        "CONTEXTUAL_STALE_RESULT_DROPPED",
                        "丢弃旧 generation 的 batch result；request=" + request.sequence
                );
                return;
            }
            detachRequestLocked(session, request);
            for (int index : request.indices) {
                if (index < 0 || index >= session.states.length ||
                        session.states[index] == READY) continue;
                String id = session.units.get(index).id;
                String text = result == null ? "" : result.translationsById.get(id);
                if (text != null && !text.trim().isEmpty()) {
                    String clean = ContextualCaptionTextPolicy.translationForDisplay(text);
                    if (clean.isEmpty()) {
                        text = "";
                    } else {
                        text = clean;
                    }
                }
                boolean silentPlan=text!=null && text.trim().isEmpty() && result!=null && result.plansById.containsKey(id)
                        && ContextualCaptionTextPolicy.sourceForTranslation(session.units.get(index).sourceText).isEmpty();
                if (text != null && (!text.trim().isEmpty() || silentPlan)) {
                    AnchoredCaptionPlan candidate=result.plansById.get(id);
                    if(candidate!=null)for(AnchoredCaptionPlan.Segment seg:candidate.segments){
                        String issue=CaptionPresentationPolicy.issue(seg.text,seg.endMs-seg.startMs);
                        if(!issue.isEmpty()) CaptionDiagnostics.mark(session.context,"PRESENTATION_LIMIT", "unit="+index+";reason="+issue+";ms="+(seg.endMs-seg.startMs)+";chars="+CaptionPresentationPolicy.visible(seg.text));
                    }
                    if(ProtocolRecovery.wholeText(session.lastFailureReasons[index]))
                        CaptionDiagnostics.mark(session.context,"TRANSLATION_PROTOCOL_RECOVERED","unit="+index+";no_extra_retry_allowance=true");
                    session.translations[index] = text;
                    session.anchoredPlans[index] = result.plansById.get(id);
                    session.states[index] = READY;
                    resetUnitRecoveryLocked(session, index);
                    applied++;
                } else {
                    Request background = session.backgroundRequest;
                    if (request.concurrentRescue && background != null &&
                            background != request && background.contains(index)) {
                        // The original body-sent background request still owns this unit. A failed
                        // speculative rescue must not roll its IN_FLIGHT state backward.
                        deferredToBackground = true;
                        continue;
                    }
                    String rejection=result==null ? "missing_response" : result.rejectionReasons.get(id);
                    CaptionDiagnostics.mark(session.context,"ANCHOR_RESPONSE_REJECTED",
                            "unit="+index+";reason="+(rejection==null ? "missing_id" : rejection));
                    scheduleRetryLocked(
                            session,
                            index,
                            request.priority && index == request.focus,
                            rejection==null ? "missing_id" : rejection,
                            ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL
                    );
                    if (session.states[index] == PERMANENT_FAILURE) permanent++;
                    else retryable++;
                }
            }
            if (request.priority && request.fallbackAllowed &&
                    request.focus >= 0 && request.focus < session.states.length &&
                    session.states[request.focus] != READY &&
                    session.states[request.focus] != PERMANENT_FAILURE &&
                    session.realtimeAttempts[request.focus] < MAX_REALTIME_LOGICAL_ATTEMPTS) {
                session.states[request.focus] = PENDING;
                session.retryAfterMs[request.focus] = 0L;
            }
            // No timing-only cross-window merge.
            stabilized = resolveStableBridgesLocked(session);
            int current = anchor(session.units, session.currentTimeMs);
            if (isReadyLocked(session, current) && !session.firstReady) {
                session.firstReady = true;
                firstReadyNow = true;
            }
            if (!request.priority) {
                session.recentBackgroundLatencyMs = ewma(
                        session.recentBackgroundLatencyMs, took
                );
            }
        }

        request.connection = null;
        if (applied > 0) session.error = "";
        if (result != null && !result.invalidIds.isEmpty()) {
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_UNIT_QUALITY_REJECTED",
                    "本地质量门拒绝 " + result.invalidIds.size() +
                            " 个时间锚/结构/质量不合格的 unit；具体原因见 ANCHOR_RESPONSE_REJECTED"
            );
        }
        long buffer = bufferAheadMs(session);
        String stage;
        if (firstReadyNow) stage = "FIRST_AI_READY";
        else if (deferredToBackground) stage = "CONTEXTUAL_RESCUE_DEFERRED";
        else if (retryable > 0 || permanent > 0) stage = "CONTEXTUAL_PARTIAL_COMMIT";
        else stage = request.priority ? "CONTEXTUAL_REALTIME_READY" : "CONTEXTUAL_BACKGROUND_READY";
        CaptionDiagnostics.mark(
                session.context,
                stage,
                "接受 " + applied + "/" + request.indices.size() +
                        (stabilized > 0 ? "；稳定 bridge=" + stabilized : "") +
                        " units；retry=" + retryable + "；permanent=" + permanent +
                        "；用时 " + took + " ms；前方库存 " + buffer + " ms" +
                        (firstReadyNow ? ";startup_total_ms=" + Math.max(0L,SystemClock.elapsedRealtime()-session.createdAtMs) : "")
        );
        render(session, session.currentTimeMs);
        if (applied > 0 || stabilized > 0) persistCacheAsync(session);
        markCompleteIfNeeded(session);
        schedule(session);
    }

    private static void prepareBoundaryGroupsLocked(Session session) {
        if(session.sourceOnly)return;
        for(int i=0;i+1<session.units.size();i++) {
            if(session.states[i]!=READY || session.states[i+1]!=READY ||
                session.displayPlans[i]!=null || session.displayPlans[i+1]!=null)continue;
            ContextualDisplayGroupPolicy.Group ga=session.displayGroupsByUnit[i],gb=session.displayGroupsByUnit[i+1];
            if(ga==null || gb==null || ga.firstUnit!=ga.lastUnit || gb.firstUnit!=gb.lastUnit)continue;
            TranslationUnitTimeline.Unit a=session.units.get(i),b=session.units.get(i+1);
            if(b.sourceText.trim().startsWith(">"))continue;
            List<AnchoredCaptionPlan.Segment> joined=CrossWindowReadability.merge(session.anchoredPlans[i],session.anchoredPlans[i+1],
                a.fromAtom,b.fromAtom,session.currentTimeMs);
            if(joined.isEmpty())continue;
            List<DisplaySlice> slices=new ArrayList<>();StringBuilder text=new StringBuilder();
            for(AnchoredCaptionPlan.Segment segment:joined){slices.add(new DisplaySlice(segment.startMs,segment.endMs,segment.text));
                if(text.length()>0)text.append(' ');text.append(segment.text);}
            ContextualDisplayGroupPolicy.Group group=new ContextualDisplayGroupPolicy.Group(i,i+1,a.fromAtom,b.toAtom,
                a.startMs,b.endMs,a.sourceText+" "+b.sourceText);
            session.displayGroupsByUnit[i]=group;session.displayGroupsByUnit[i+1]=group;
            session.displayPlans[i]=new DisplayPlan(Collections.unmodifiableList(slices),"readable_boundary_join","",i,i+1,group.sourceText,text.toString());
        }
    }

    private static DisplayPlan buildDisplayPlan(
            Session session,
            ContextualDisplayGroupPolicy.Group group,
            String canonical
    ) {
        AnchoredCaptionPlan anchored=session.anchoredPlans[group.firstUnit];
        List<DisplaySlice> slices=new ArrayList<>();
        if(anchored!=null) {
            for(AnchoredCaptionPlan.Segment segment:anchored.segments)
                slices.add(new DisplaySlice(segment.startMs,segment.endMs,segment.text));
        }
        return new DisplayPlan(Collections.unmodifiableList(slices), "source_anchored_joint",
                "", group.firstUnit, group.lastUnit, group.sourceText, canonical);
    }

    private static void failBatch(
            Session session,
            Request request,
            Throwable failure,
            long started
    ) {
        boolean fallback = false;
        boolean deferredToBackground = false;
        boolean isolationScheduled = false;
        int retryable = 0;
        int permanent = 0;
        ContextualUnitCorePolicy.FailureKind failureKind =
                ContextualBatchApiClient.failureKind(failure);
        String failureCategory = ContextualBatchApiClient.failureCategory(failure);
        long took = Math.max(0L, SystemClock.elapsedRealtime() - started);
        synchronized (session.lock) {
            if (!ContextualUnitCorePolicy.acceptsRequestResult(
                    isCurrent(session), session.cancelled, request.cancelled,
                    request.generation, session.generation
            )) {
                detachRequestLocked(session, request);
                CaptionDiagnostics.mark(
                        session.context,
                        "CONTEXTUAL_STALE_RESULT_DROPPED",
                        "丢弃已取消或旧 generation 的 failure；request=" + request.sequence
                );
                return;
            }
            detachRequestLocked(session, request);
            Request owningBackground = session.backgroundRequest;
            if (ContextualUnitCorePolicy.shouldIsolateBatch(
                    ContextualBatchApiClient.requiresBatchIsolation(failure),
                    request.indices.size()
            )) {
                long now = SystemClock.elapsedRealtime();
                int ordinal = 0;
                for (int index : request.indices) {
                    if (index < 0 || index >= session.states.length ||
                            session.states[index] == READY) continue;
                    recordFailureLocked(session, index, failureCategory);
                    session.isolatedRetries[index] = true;
                    long delay = ContextualUnitCorePolicy.isolatedRetryDelayMs(
                            request.priority && index == request.focus, ordinal
                    );
                    session.retryAfterMs[index] = now + delay;
                    session.states[index] = delay == 0L ? PENDING : RETRY_WAIT;
                    if (request.priority && index == request.focus) {
                        session.realtimeRetryAfterMs[index] = now;
                    }
                    retryable++;
                    ordinal++;
                }
                isolationScheduled = retryable > 0;
            } else if (request.concurrentRescue && owningBackground != null &&
                    owningBackground != request && owningBackground.contains(request.focus)) {
                deferredToBackground = true;
            } else if (failureKind != ContextualUnitCorePolicy.FailureKind.PERMANENT &&
                    request.priority && request.fallbackAllowed &&
                    request.focus >= 0 && request.focus < session.states.length &&
                    session.realtimeAttempts[request.focus] < MAX_REALTIME_LOGICAL_ATTEMPTS) {
                for (int index : request.indices) {
                    if (index < 0 || index >= session.states.length ||
                            session.states[index] == READY) continue;
                    if (index == request.focus) {
                        recordFailureLocked(session, index, failureCategory);
                        session.states[index] = PENDING;
                        session.retryAfterMs[index] = 0L;
                    } else {
                        scheduleRetryLocked(
                                session, index, false, failureCategory, failureKind
                        );
                        if (session.states[index] == PERMANENT_FAILURE) permanent++;
                        else retryable++;
                    }
                }
                fallback = true;
            } else {
                for (int index : request.indices) {
                    if (index < 0 || index >= session.states.length ||
                            session.states[index] == READY) continue;
                    scheduleRetryLocked(
                            session,
                            index,
                            request.priority && index == request.focus,
                            failureCategory,
                            failureKind
                    );
                    if (session.states[index] == PERMANENT_FAILURE) permanent++;
                    else retryable++;
                }
            }
            if (!request.priority) {
                session.recentBackgroundLatencyMs = ewma(
                        session.recentBackgroundLatencyMs, took
                );
            }
        }
        request.connection = null;
        CaptionDiagnostics.mark(
                session.context,
                isolationScheduled ? "CONTEXTUAL_BATCH_ISOLATION" :
                        deferredToBackground ? "CONTEXTUAL_RESCUE_DEFERRED" :
                        fallback ? "CONTEXTUAL_CURRENT_ONLY_FALLBACK" : "CONTEXTUAL_BATCH_FAILED",
                (isolationScheduled
                        ? "provider 拒绝多 unit 请求；改为有界单 unit 隔离，不永久封死整批；"
                        : deferredToBackground
                        ? "current rescue 未产出；保留原 body-sent background ownership；"
                        : fallback
                        ? "多 unit batch 失败；当前 unit 保留 current-only retry；"
                        : "固定单元 batch 失败，未来 units 继续保持可补货；") +
                        "category=" + failureCategory +
                        "；retry=" + retryable + "；permanent=" + permanent +
                        "；用时 " + took + " ms"
        );
        render(session, session.currentTimeMs);
        schedule(session);
    }
    private static void scheduleRetryLocked(
            Session session,
            int index,
            boolean priority,
            String reason,
            ContextualUnitCorePolicy.FailureKind failureKind
    ) {
        if (index < 0 || index >= session.states.length ||
                session.states[index] == READY) return;
        recordFailureLocked(session, index, reason);
        int failures = session.failureCounts[index];
        if(CaptionQualityPolicy.failure(reason)) {
            int priorTaskRepairs=session.qualityRepairs[index]++;
            // At most one quality-only repair per task and four per playback session. Other
            // errors still share the existing three-failure budget; no speculative duplicate.
            if(!CaptionRepairBudget.allow(priorTaskRepairs,session.qualityRepairCount,failures)) {
                session.states[index]=PERMANENT_FAILURE;session.retryAfterMs[index]=Long.MAX_VALUE;
                CaptionDiagnostics.mark(session.context,"CAPTION_QUALITY_FALLBACK","unit="+index+";quality_repair_budget_exhausted=true");
                return;
            }
            session.qualityRepairCount++;
            session.isolatedRetries[index]=true;
            CaptionDiagnostics.mark(session.context,"CAPTION_QUALITY_REPAIR","unit="+index+";session_repairs="+session.qualityRepairCount+";limit="+CaptionRepairBudget.SESSION_QUALITY_REPAIRS+";shared_failure_count="+failures);
        }
        ContextualUnitCorePolicy.RetryDecision decision =
                AnchoredRetryPolicy.decide(failureKind, failures, priority);
        if (decision.permanent) {
            session.states[index] = PERMANENT_FAILURE;
            session.retryAfterMs[index] = Long.MAX_VALUE;
            return;
        }
        session.retryAfterMs[index] = SystemClock.elapsedRealtime() + decision.delayMs;
        session.states[index] = RETRY_WAIT;
        if (priority) {
            session.realtimeRetryAfterMs[index] = session.retryAfterMs[index];
            session.delayedRetryUsed[index] = decision.delayedRepair;
        }
    }

    private static void recordFailureLocked(Session session, int index, String reason) {
        if (index < 0 || index >= session.states.length) return;
        session.failureCounts[index]++;
        session.lastFailureReasons[index] = reason == null ? "unknown" : reason;
    }

    private static void resetUnitRecoveryLocked(Session session, int index) {
        if (index < 0 || index >= session.states.length) return;
        session.failureCounts[index] = 0;
        session.retryAfterMs[index] = 0L;
        session.lastFailureReasons[index] = "";
        session.realtimeRetryAfterMs[index] = 0L;
        session.delayedRetryUsed[index] = false;
        session.isolatedRetries[index] = false;
        session.suppressedBridges[index] = false;
    }

    private static long wallClockRunwayMsLocked(Session session, long bufferAheadMs) {
        if (bufferAheadMs <= 0L) return 0L;
        float rate = PLAYBACK_CLOCK.playbackRate();
        if (rate <= 0f) return Long.MAX_VALUE;
        rate = Math.max(0.25f, Math.min(3f, rate));
        return Math.max(1L, Math.round(bufferAheadMs / rate));
    }

    private static long ewma(long previous, long sample) {
        long clean = Math.max(1L, sample);
        if (previous <= 0L) return clean;
        return Math.max(1L, Math.round(previous * 0.65d + clean * 0.35d));
    }
    private static void reprioritizeAfterSeek(Session session, long timeMs) {
        Request cancelRealtime=null,cancelBackground=null;
        int preserved=0;
        synchronized (session.lock) {
            if (session.units.isEmpty() || session.terminalError) return;
            int current = anchor(session.units, timeMs);
            session.generation++;
            session.lastRenderSignature = "";
            Request realtime=session.realtimeRequest,background=session.backgroundRequest;
            if(realtime!=null) {
                if(realtime.contains(current)){realtime.generation=session.generation;preserved++;}
                else {realtime.cancelled=true;cancelRealtime=realtime;session.realtimeRequest=null;resetRequestLocked(session,realtime,PENDING);}
            }
            if(background!=null) {
                if(background.bodySent || background.contains(current)){background.generation=session.generation;preserved++;}
                else {background.cancelled=true;cancelBackground=background;session.backgroundRequest=null;resetRequestLocked(session,background,PENDING);}
            }
            // A revisit only reopens the demanded window. Do not reset the entire future retry budget.
            if(current>=0 && current<session.states.length && session.states[current]!=READY && session.states[current]!=IN_FLIGHT) {
                session.states[current]=PENDING;
                session.realtimeAttempts[current]=0;
                resetUnitRecoveryLocked(session,current);
                session.fallbackLogged[current]=false;
            }
        }
        if(cancelRealtime!=null)cancelRealtime.cancel();
        if(cancelBackground!=null)cancelBackground.cancel();
        CaptionDiagnostics.mark(session.context,"CONTEXTUAL_SEEK_REPRIORITIZED",
                "current_only=true;preserved_requests="+preserved+";ready_cache_preserved=true");
        schedule(session);
    }

    private static void resetRequestLocked(Session session, Request request, int nextState) {
        if (request == null) return;
        for (int index : request.indices) {
            if (index >= 0 && index < session.states.length && session.states[index] == IN_FLIGHT) {
                session.states[index] = nextState;
            }
        }
    }

    private static void detachRequestLocked(Session session, Request request) {
        if (session.realtimeRequest == request) session.realtimeRequest = null;
        if (session.backgroundRequest == request) session.backgroundRequest = null;
    }

    private static void render(Session session, long timeMs) {
        if (!isCurrent(session) || session.cancelled || !session.visible) return;
        String text = "";
        boolean status = false;
        int selectedIndex = -1;
        int selectedGroupFirst = -1;
        int selectedGroupLast = -1;
        int selectedSlice = -1;
        int selectedSliceCount = 0;
        String selectedBoundaryReason = "";
        String selectedRejectionSummary = "";
        String selectedSourceText = "";
        String selectedCanonicalText = "";
        int selectedRetryCount = 0;
        String selectedFailureCategory = "";
        String missReason = "";
        String suppressionReason = "";
        long renderGeneration;
        synchronized (session.lock) {
            renderGeneration = session.generation;
            if (session.terminalError || !session.timelineReady || session.units.isEmpty()) {
                text = session.error.isEmpty()
                        ? session.targetLanguage.displayName + " AI 字幕准备中…"
                        : session.error;
                status = true;
            } else {
                int index = indexAtOrBefore(session.units, timeMs);
                selectedIndex = index;
                if (index < 0) {
                    missReason = "before_first_unit";
                } else {
                    TranslationUnitTimeline.Unit unit = session.units.get(index);
                    ContextualDisplayGroupPolicy.Group displayGroup=session.displayGroupsByUnit[index];
                    long displayEnd=displayGroup==null ? unit.endMs : displayGroup.endMs;
                    if (timeMs < unit.startMs || timeMs >= displayEnd) {
                        missReason = index==session.units.size()-1 && timeMs>=unit.endMs ? "source_track_ended" : "source_timeline_gap";
                    } else {
                        ContextualDisplayGroupPolicy.Group group =
                                index < session.displayGroupsByUnit.length
                                        ? session.displayGroupsByUnit[index] : null;
                        if (group == null) {
                            missReason = "display_group_missing";
                        } else {
                            selectedGroupFirst = group.firstUnit;
                            selectedGroupLast = group.lastUnit;
                            DisplayPlan plan = session.displayPlans[group.firstUnit];
                            boolean grouped = group.firstUnit != group.lastUnit;
                            if (plan == null && ContextualDisplayGroupPolicy.allReady(
                                    session.states, group, READY
                            )) {
                                String canonical = ContextualDisplayGroupPolicy.joinCanonical(
                                        Arrays.asList(session.translations),
                                        group.firstUnit,
                                        group.lastUnit
                                );
                                plan = buildDisplayPlan(session, group, canonical);
                                session.displayPlans[group.firstUnit] = plan;
                            }
                            if (plan == null && !grouped) {
                                boolean repairingQuality=CaptionQualityPolicy.failure(session.lastFailureReasons[index]) &&
                                        (session.states[index]==RETRY_WAIT || session.states[index]==IN_FLIGHT);
                                if(session.states[index] == PERMANENT_FAILURE || repairingQuality) {
                                    text = CaptionFailureFallback.text(session.atoms,unit,timeMs);
                                    if(!text.isEmpty() && !session.fallbackLogged[index]){
                                        session.fallbackLogged[index]=true;
                                        CaptionDiagnostics.mark(session.context,"TRANSLATION_SOURCE_FALLBACK", "unit="+index+";failures="+session.failureCounts[index]+";reason="+session.lastFailureReasons[index]);
                                    }
                                    selectedBoundaryReason=repairingQuality?"quality_repair_original":"translation_failed_source_fallback";
                                    selectedSourceText=unit.sourceText;
                                    selectedRejectionSummary=session.lastFailureReasons[index];
                                }
                                missReason = "unit_state_" + unitStateName(session.states[index]);
                                selectedRetryCount = session.failureCounts[index];
                                selectedFailureCategory = session.lastFailureReasons[index] == null
                                        ? "" : session.lastFailureReasons[index];
                            } else if (plan == null) {
                                long now = SystemClock.elapsedRealtime();
                                if (session.groupWaitStartedAtMs[group.firstUnit] <= 0L) {
                                    session.groupWaitStartedAtMs[group.firstUnit] = now;
                                }
                                ContextualDisplayGroupPolicy.WaitDecision decision =
                                        ContextualDisplayGroupPolicy.waitDecision(
                                                false,
                                                ContextualDisplayGroupPolicy.anyPermanentFailure(
                                                        session.states, group, PERMANENT_FAILURE
                                                ),
                                                session.groupWaitStartedAtMs[group.firstUnit],
                                                now
                                        );
                                missReason = decision == ContextualDisplayGroupPolicy.WaitDecision.WAIT
                                        ? "display_group_wait"
                                        : decision == ContextualDisplayGroupPolicy.WaitDecision.PERMANENT_FAILURE
                                        ? "display_group_member_permanent_failure"
                                        : "display_group_wait_timeout";
                                for (int i = group.firstUnit; i <= group.lastUnit; i++) {
                                    selectedRetryCount += session.failureCounts[i];
                                    if (selectedFailureCategory.isEmpty() &&
                                            session.lastFailureReasons[i] != null) {
                                        selectedFailureCategory = session.lastFailureReasons[i];
                                    }
                                }
                                if (decision != ContextualDisplayGroupPolicy.WaitDecision.WAIT &&
                                        !session.groupSuppressed[group.firstUnit]) {
                                    session.groupSuppressed[group.firstUnit] = true;
                                    suppressionReason = missReason;
                                }
                            }
                            if (plan != null) {
                                selectedSlice = plan.indexAt(timeMs);
                                selectedSliceCount = plan.slices.size();
                                selectedBoundaryReason = plan.boundaryReason;
                                selectedRejectionSummary = plan.rejectionSummary;
                                if(selectedSlice>=0){DisplaySlice chosen=plan.slices.get(selectedSlice);
                                    String issue=CaptionSegmentationPolicy.issue(new AnchoredCaptionPlan.Segment(0,0,chosen.startMs,chosen.endMs,chosen.text));
                                    if(!issue.isEmpty())selectedRejectionSummary="presentation_warning:"+issue;}
                                selectedSourceText = plan.sourceText;
                                selectedCanonicalText = plan.canonicalText;
                                if(selectedSlice>=0){DisplaySlice actual=plan.slices.get(selectedSlice);
                                    selectedBoundaryReason += ";start="+actual.startMs+";end="+actual.endMs+";chars="+CaptionPresentationPolicy.visible(actual.text);
                                    AnchoredCaptionPlan aligned=session.anchoredPlans[index];
                                    if(aligned!=null && selectedSlice<aligned.segments.size()){
                                        AnchoredCaptionPlan.Segment sg=aligned.segments.get(selectedSlice);
                                        selectedSourceText=SourceAtomTimeline.join(session.atoms,unit.fromAtom+sg.from,unit.fromAtom+sg.to);
                                    }
                                }
                                text = plan.textAt(timeMs);
                                if(!session.sourceOnly) text=CaptionPresentationPolicy.wrap(text);
                                if (text == null) text = "";
                                text = text.trim();
                                if (text.isEmpty()) {
                                    missReason = session.suppressedBridges[index]
                                            ? "duplicate_bridge_suppressed"
                                            : plan.canonicalText.trim().isEmpty()
                                            ? "suppressed_non_speech"
                                            : plan.slices.isEmpty() &&
                                                    "display_group_capacity_no_safe_cut".equals(
                                                            plan.boundaryReason
                                                    )
                                            ? "display_group_capacity_no_safe_cut"
                                            : "display_plan_gap";
                                    if ("display_group_capacity_no_safe_cut".equals(missReason) &&
                                            !session.groupSuppressed[group.firstUnit]) {
                                        session.groupSuppressed[group.firstUnit] = true;
                                        suppressionReason = missReason;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        if (!suppressionReason.isEmpty()) {
            CaptionDiagnostics.mark(
                    session.context,
                    "CONTEXTUAL_DISPLAY_SUPPRESSED",
                    "group=" + selectedGroupFirst + "-" + selectedGroupLast +
                            ";reason=" + suppressionReason
            );
        }
        boolean displayTextDebug = DeepSeekConfig.displayTextDebugEnabled(session.context);
        String signature = status ? "S|" + text : text.isEmpty()
                ? "H|" + selectedIndex + '|' + selectedGroupFirst + '-' + selectedGroupLast + '|' +
                        missReason + '|' + selectedRetryCount + '|' + selectedFailureCategory
                : "C|" + selectedGroupFirst + '-' + selectedGroupLast + '|' + selectedSlice + '|' +
                        displayTextDebug + '|' + text;
        synchronized (session.lock) {
            if (signature.equals(session.lastRenderSignature)) return;
            session.lastRenderSignature = signature;
        }
        CaptionDiagnostics.mark(
                session.context,
                text.isEmpty() ? "CONTEXTUAL_DISPLAY_MISS" : "CONTEXTUAL_DISPLAY_SELECTED",
                "mediaSignalPresent="+MediaPlaybackClock.available()+";unit=" + selectedIndex + ";group=" + selectedGroupFirst + "-" + selectedGroupLast +
                        ";slice=" + selectedSlice + ";time=" + timeMs +
                        (text.isEmpty() ? ";reason=" + missReason +
                                (selectedRetryCount > 0 ? ";retry=" + selectedRetryCount : "") +
                                (selectedFailureCategory.isEmpty() ? "" :
                                        ";failure=" + selectedFailureCategory) :
                                ";slices=" + selectedSliceCount +
                                        ";boundary=" + selectedBoundaryReason +
                                        (displayTextDebug
                                                ? ";display=" + diagnosticText(text,120) + ";source=" + diagnosticText(selectedSourceText, 72) +
                                                        ";canonical=" + diagnosticText(
                                                                selectedCanonicalText, 72
                                                        )
                                                : "") +
                                        (selectedRejectionSummary.isEmpty() ? "" :
                                                ";rejected=" + selectedRejectionSummary))
        );
        CaptionOverlay.RenderGuard guard = overlayGuard(session, renderGeneration);
        if (text.isEmpty()) CaptionOverlay.hide(guard);
        else if (status) CaptionOverlay.showStatus(text, guard);
        else CaptionOverlay.showCaption(text, guard, () -> overflowSource(session,timeMs,renderGeneration));
    }

    private static String diagnosticText(String value, int maxChars) {
        String clean = value == null ? "" : value.replace('\r', ' ').replace('\n', ' ')
                .replace("\\", "\\\\").replace(";", "\\;").replace("=", "\\=").trim();
        if (clean.length() <= maxChars) return clean;
        return maxChars <= 1 ? clean.substring(0, maxChars) :
                clean.substring(0, maxChars - 1) + "…";
    }

    private static String unitStateName(int state) {
        switch (state) {
            case PENDING: return "pending";
            case IN_FLIGHT: return "in_flight";
            case READY: return "ready";
            case RETRY_WAIT: return "retry_wait";
            case PERMANENT_FAILURE: return "permanent_failure";
            default: return "unknown_" + state;
        }
    }

    private static long bufferAheadMs(Session session) {
        synchronized (session.lock) {
            return bufferAheadMsLocked(session);
        }
    }

    private static long bufferAheadMsLocked(Session session) {
        if (!session.timelineReady || session.units.isEmpty()) return 0L;
        int current = anchor(session.units, session.currentTimeMs);
        if (!isReadyLocked(session, current)) return 0L;
        long end = session.units.get(current).endMs;
        for (int i = current + 1; i < session.states.length; i++) {
            if (session.states[i] != READY) break;
            end = Math.max(end, session.units.get(i).endMs);
        }
        return Math.max(0L, end - session.currentTimeMs);
    }

    private static String overflowSource(Session session,long timeMs,long generation) {
        synchronized(session.lock) {
            if(!isCurrent(session)||session.cancelled||session.generation!=generation)return "";
            long current=session.currentTimeMs;
            int i=anchor(session.units,current);if(i<0||i>=session.units.size())return "";
            return CaptionFailureFallback.compactText(session.atoms,session.units.get(i),current);
        }
    }

    private static boolean isReadyLocked(Session session, int index) {
        return index >= 0 && index < session.states.length && session.states[index] == READY;
    }

    private static int restoreCache(Session session) {
        byte[] data = DiskCaptionCache.get(session.context, session.cacheKey);
        if (data == null) return 0;
        try {
            JSONObject root = new JSONObject(new String(data, StandardCharsets.UTF_8));
            if (root.optInt("format", -1) != CACHE_FORMAT ||
                    root.optInt("unit_count", -1) != session.units.size()) return 0;
            JSONArray entries = root.optJSONArray("translations");
            if (entries == null) return 0;
            int restored = 0;
            synchronized (session.lock) {
                for (int i = 0; i < entries.length(); i++) {
                    JSONObject value = entries.optJSONObject(i);
                    if (value == null) continue;
                    Object rawId = value.opt("id");
                    Object rawText = value.opt("text");
                    boolean suppressed = value.optBoolean("suppressed", false);
                    if (!(rawId instanceof String)) continue;
                    String id = ((String) rawId).trim();
                    int index = value.optInt("index", -1);
                    if (index < 0 || index >= session.units.size() ||
                            !session.units.get(index).id.equals(id) ||
                            session.states[index] == READY) continue;
                    if (suppressed) {
                        session.translations[index] = "";
                        session.states[index] = READY;
                        session.suppressedBridges[index] = true;
                        restored++;
                        continue;
                    }
                    AnchoredCaptionPlan restoredPlan;
                    try { restoredPlan=AnchoredCaptionPlan.parse(value.optJSONArray("segments"),
                            session.atoms,session.units.get(index)); }
                    catch(Exception invalidPlan) { continue; }
                    if (!(rawText instanceof String)) continue;
                    String text = ContextualCaptionTextPolicy.translationForDisplay(
                            (String) rawText
                    );
                    if (text.isEmpty() || !ContextualCaptionTextPolicy.adequateTranslation(
                            session.units.get(index).sourceText, text
                    )) continue;
                    session.translations[index] = restoredPlan.canonical;
                    session.anchoredPlans[index] = restoredPlan;
                    session.states[index] = READY;
                    restored++;
                }
            }
            return restored;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static void persistCacheAsync(Session session) {
        SOURCES.execute(() -> persistCache(session));
    }

    private static void persistCache(Session session) {
        if (session.cacheKey == null || session.cacheKey.isEmpty()) return;
        synchronized (session.cacheWriteLock) {
            try {
                JSONArray values = new JSONArray();
                synchronized (session.lock) {
                    for (int i = 0; i < session.states.length; i++) {
                        if (session.states[i] != READY) continue;
                        JSONObject entry = new JSONObject()
                                .put("index", i)
                                .put("id", session.units.get(i).id);
                        if (session.suppressedBridges[i]) {
                            entry.put("suppressed", true);
                        } else {
                            if (session.translations[i] == null) continue;
                            if(session.anchoredPlans[i]==null) continue;
                            entry.put("text", session.translations[i]);
                            entry.put("segments", session.anchoredPlans[i].toJson());
                        }
                        values.put(entry);
                    }
                }
                JSONObject root = new JSONObject()
                        .put("format", CACHE_FORMAT)
                        .put("unit_count", session.units.size())
                        .put("translations", values);
                DiskCaptionCache.put(
                        session.context,
                        session.cacheKey,
                        root.toString().getBytes(StandardCharsets.UTF_8)
                );
            } catch (Throwable ignored) {
            }
        }
    }

    private static void markCompleteIfNeeded(Session session) {
        synchronized (session.lock) {
            if (session.completeLogged) return;
            for (int state : session.states) if (state != READY) return;
            session.completeLogged = true;
        }
        CaptionDiagnostics.mark(
                session.context,
                "CONTEXTUAL_TRANSLATION_COMPLETE",
                "整条视频的 immutable translation units 已全部翻译"
        );
    }

    private static long requestSpanMs(Request request) {
        if (request == null || request.targets.isEmpty()) return 0L;
        return Math.max(0L,
                request.targets.get(request.targets.size() - 1).endMs - request.targets.get(0).startMs);
    }

    private static int anchor(List<TranslationUnitTimeline.Unit> units, long timeMs) {
        if (units.isEmpty()) return -1;
        int index = indexAtOrBefore(units, timeMs);
        if (index < 0) return 0;
        if (timeMs >= units.get(index).endMs && index + 1 < units.size()) return index + 1;
        return index;
    }

    private static int indexAtOrBefore(List<TranslationUnitTimeline.Unit> units, long timeMs) {
        if (units.isEmpty()) return -1;
        int low = 0;
        int high = units.size();
        while (low < high) {
            int middle = (low + high) >>> 1;
            if (units.get(middle).startMs <= timeMs) low = middle + 1;
            else high = middle;
        }
        return low - 1;
    }

    private static long estimatedVideoTime(long realtimeMs) {
        return MediaPlaybackClock.position(PLAYBACK_CLOCK.confirmedPosition(),realtimeMs);
    }

    private static byte[] cacheIdentity(byte[] body, List<SourceAtomTimeline.Atom> atoms) {
        byte[] source = body == null ? new byte[0] : body;
        byte[] result = Arrays.copyOf(source, source.length + CACHE_MARKER.length + atoms.size()*16);
        java.nio.ByteBuffer times=java.nio.ByteBuffer.wrap(result);
        times.position(source.length + CACHE_MARKER.length);
        for(SourceAtomTimeline.Atom atom:atoms){times.putLong(atom.startMs);times.putLong(atom.endMs);}
        System.arraycopy(CACHE_MARKER, 0, result, source.length, CACHE_MARKER.length);
        return result;
    }

    private static boolean sameTranslationConfig(
            DeepSeekConfig.Snapshot first,
            DeepSeekConfig.Snapshot second
    ) {
        return first.fingerprint().equals(second.fingerprint()) &&
                first.apiKey.equals(second.apiKey) && first.enabled == second.enabled;
    }

    private static boolean isCurrent(Session session) {
        return active == session;
    }

    private static boolean sessionMayContinue(Session session) {
        synchronized (ACTIVE_LOCK) {
            return sessionMayContinueLocked(session);
        }
    }

    private static boolean sessionMayContinueLocked(Session session) {
        return session != null && ContextualUnitCorePolicy.mayContinue(
                active == session, session.cancelled, session.videoId, currentVideoId
        );
    }

    private static boolean sessionMayPublish(Session session) {
        synchronized (ACTIVE_LOCK) {
            return sessionMayPublishLocked(session);
        }
    }

    private static boolean sessionMayPublishLocked(Session session) {
        return session != null && ContextualUnitCorePolicy.mayPublish(
                active == session, session.cancelled, session.videoId, currentVideoId
        );
    }

    private static CaptionOverlay.RenderGuard overlayGuard(Session session, long generation) {
        return () -> active == session && !session.cancelled && session.visible &&
                session.generation == generation;
    }

    private static void failSession(Session session, String detail) {
        if (!isCurrent(session) || session.cancelled) return;
        session.error = detail == null || detail.trim().isEmpty() ? "AI 字幕不可用" : detail.trim();
        session.terminalError = true;
        synchronized(session.lock) {
            if(session.realtimeRequest!=null) session.realtimeRequest.cancel();
            if(session.backgroundRequest!=null) session.backgroundRequest.cancel();
            session.realtimeRequest=null;session.backgroundRequest=null;
        }
        if (session.visible) CaptionOverlay.showStatus(session.error, overlayGuard(session, session.generation));
        CaptionDiagnostics.mark(session.context, "CONTEXTUAL_CORE_ERROR", session.error);
    }

    private static void deactivateIfCurrent(Session expected, String reason) {
        if (expected == null) return;
        Session previous;
        synchronized (ACTIVE_LOCK) {
            if (active != expected || expected.cancelled) return;
            previous = active;
            active = null;
        }
        previous.cancel();
        CaptionDiagnostics.mark(previous.context,
                "CONTEXTUAL_CORE_STOPPED", reason);
        CaptionOverlay.clear();
        DISPLAY.removeCallbacks(DISPLAY_TICK);
    }
    private static void deactivate(String reason) {
        Session previous;
        synchronized (ACTIVE_LOCK) {
            previous = active;
            active = null;
        }
        if (previous != null) {
            previous.cancel();
            CaptionDiagnostics.mark(previous.context, "CONTEXTUAL_CORE_STOPPED", reason);
        }
        CaptionOverlay.clear();
        DISPLAY.removeCallbacks(DISPLAY_TICK);
    }

    private static String videoIdFromUrl(String url) {
        String value = query(url, "v");
        if (value == null || value.isEmpty()) value = query(url, "video_id");
        return value == null ? "" : value;
    }

    private static String abbreviatedVideoId(String videoId) {
        if (videoId == null || videoId.length() <= 16) return videoId == null ? "" : videoId;
        return videoId.substring(0, 16);
    }

    private static String query(String url, String name) {
        if (url == null || name == null) return null;
        try {
            return Uri.parse(url).getQueryParameter(name);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static ThreadFactory daemonThreadFactory(String prefix) {
        return runnable -> {
            Thread thread = new Thread(runnable, prefix + THREAD_IDS.incrementAndGet());
            thread.setDaemon(true);
            return thread;
        };
    }

    private static final class Request {
        final List<Integer> indices;
        final List<TranslationUnitTimeline.Unit> targets;
        final List<String> contextBefore;
        final List<String> contextAfter;
        final int focus;
        final boolean priority;
        final boolean fallbackAllowed;
        final boolean concurrentRescue;
        volatile long generation; // A same-video request that still covers a seek stays useful.
        final long sequence;
        volatile boolean sourceOnly;
        volatile boolean cancelled;
        volatile boolean bodySent;
        volatile long bodySentAtMs;
        volatile HttpURLConnection connection;
        volatile Future<?> future;

        Request(
                List<Integer> indices,
                List<TranslationUnitTimeline.Unit> targets,
                List<String> contextBefore,
                List<String> contextAfter,
                int focus,
                boolean priority,
                boolean fallbackAllowed,
                boolean concurrentRescue,
                long generation,
                long sequence
        ) {
            this.indices = indices;
            this.targets = targets;
            this.contextBefore = contextBefore;
            this.contextAfter = contextAfter;
            this.focus = focus;
            this.priority = priority;
            this.fallbackAllowed = fallbackAllowed;
            this.concurrentRescue = concurrentRescue;
            this.generation = generation;
            this.sequence = sequence;
        }

        boolean contains(int index) {
            return indices.contains(index);
        }

        void cancel() {
            cancelled = true;
            HttpURLConnection current = connection;
            if (current != null) current.disconnect();
            Future<?> task = future;
            if (task != null) task.cancel(true);
        }
    }

    static final class DisplaySlice {
        final long startMs;
        final long endMs;
        final String text;

        DisplaySlice(long startMs, long endMs, String text) {
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.text = text == null ? "" : text;
        }
    }

    static final class DisplayPlan {
        final List<DisplaySlice> slices;
        final String boundaryReason;
        final String rejectionSummary;
        final int firstUnit;
        final int lastUnit;
        final String sourceText;
        final String canonicalText;

        DisplayPlan(
                List<DisplaySlice> slices,
                String boundaryReason,
                String rejectionSummary,
                int firstUnit,
                int lastUnit,
                String sourceText,
                String canonicalText
        ) {
            this.slices = slices == null ? Collections.emptyList() : slices;
            this.boundaryReason = boundaryReason == null ? "whole_sentence" : boundaryReason;
            this.rejectionSummary = rejectionSummary == null ? "" : rejectionSummary;
            this.firstUnit = firstUnit;
            this.lastUnit = lastUnit;
            this.sourceText = sourceText == null ? "" : sourceText;
            this.canonicalText = canonicalText == null ? "" : canonicalText;
        }

        int indexAt(long timeMs) {
            for (int i = 0; i < slices.size(); i++) {
                DisplaySlice slice = slices.get(i);
                if (timeMs >= slice.startMs && timeMs < slice.endMs) return i;
            }
            return -1;
        }

        String textAt(long timeMs) {
            int index = indexAt(timeMs);
            return index < 0 ? "" : slices.get(index).text;
        }
    }

    private static final class Session {
        final long id;
        final long createdAtMs = SystemClock.elapsedRealtime();
        final Context context;
        volatile String translatedUrl;
        final String requestKey;
        volatile String videoId;
        final TargetLanguage targetLanguage;
        final DeepSeekConfig.Snapshot config;
        final Object lock = new Object();
        final Object cacheWriteLock = new Object();

        volatile boolean sourceOnly;
        volatile boolean cancelled;
        volatile boolean visible;
        volatile boolean timelineReady;
        volatile boolean terminalError;
        volatile boolean firstReady;
        volatile boolean completeLogged;
        volatile long generation = 1L;
        volatile long currentTimeMs;
        volatile long activatedAtMs = SystemClock.elapsedRealtime();
        volatile long timelineStartedAtMs;
        volatile long requestSequence;
        volatile long recentBackgroundLatencyMs = 4_000L;
        volatile long lastPromotionSkippedSequence = -1L;
        volatile boolean startupSeekDebounceLogged;
        volatile boolean startupSeekDebounceConsumed;
        volatile long startupAnchorTimeMs;
        volatile int startupAnchorIndex = -1;
        volatile String error = "";
        volatile String cacheKey = "";
        int qualityRepairCount;
        int[] qualityRepairs=new int[0];
        boolean[] fallbackLogged=new boolean[0];
        volatile String lastRenderSignature = "";
        volatile Future<?> sourceTask;
        volatile HttpURLConnection sourceConnection;
        volatile boolean sourceLoading,sourceFailed;
        volatile int sourceFailures;
        volatile long sourceRetryAtMs;
        volatile Request realtimeRequest;
        volatile Request backgroundRequest;

        List<SourceAtomTimeline.Atom> atoms = Collections.emptyList();
        List<TranslationUnitTimeline.Unit> units = Collections.emptyList();
        AnchoredCaptionPlan[] anchoredPlans = new AnchoredCaptionPlan[0];
        String[] translations = new String[0];
        ContextualDisplayGroupPolicy.Group[] displayGroupsByUnit =
                new ContextualDisplayGroupPolicy.Group[0];
        DisplayPlan[] displayPlans = new DisplayPlan[0];
        long[] groupWaitStartedAtMs = new long[0];
        boolean[] groupSuppressed = new boolean[0];
        int[] states = new int[0];
        int[] realtimeAttempts = new int[0];
        long[] realtimeRetryAfterMs = new long[0];
        boolean[] delayedRetryUsed = new boolean[0];
        int[] failureCounts = new int[0];
        long[] retryAfterMs = new long[0];
        String[] lastFailureReasons = new String[0];
        boolean[] isolatedRetries = new boolean[0];
        boolean[] suppressedBridges = new boolean[0];

        Session(
                long id,
                Context context,
                String translatedUrl,
                String requestKey,
                String videoId,
                TargetLanguage targetLanguage,
                DeepSeekConfig.Snapshot config
        ) {
            this.id = id;
            this.context = context;
            this.translatedUrl = translatedUrl;
            this.requestKey = requestKey;
            this.videoId = videoId == null ? "" : videoId;
            this.targetLanguage = targetLanguage;
            this.config = config;
        }

        void cancel() {
            Future<?> source;
            Request current;
            Request ahead;
            synchronized (lock) {
                cancelled = true;
                generation++;
                source = sourceTask;
                current = realtimeRequest;
                ahead = backgroundRequest;
                if (current != null) current.cancelled = true;
                if (ahead != null) ahead.cancelled = true;
                realtimeRequest = null;
                backgroundRequest = null;
            }
            if (source != null) source.cancel(true);
            HttpURLConnection sourceHttp=sourceConnection;
            if(sourceHttp!=null)sourceHttp.disconnect();
            if (current != null) current.cancel();
            if (ahead != null) ahead.cancel();
        }
    }
}
