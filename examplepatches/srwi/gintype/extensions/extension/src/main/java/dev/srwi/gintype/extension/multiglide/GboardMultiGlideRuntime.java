package dev.srwi.gintype.extension.multiglide;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;
import android.widget.TextView;
import dev.srwi.gintype.extension.thicctopbar.GboardThiccTopBarRuntime;
import dev.srwi.gintype.extension.thicctopbar.GboardThiccTopBarSettings;
import dev.srwi.gintype.extension.thicctopbar.ThiccTopBarGboardReflector;
import dev.srwi.gintype.extension.multiglide.GboardMultiGlideDictionaryManager.LanguagePack;
import dev.srwi.gintype.extension.multiglide.MultiGlideGeometry.KeySpec;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Runtime hook coordinator for MultiGlide multi-finger swipe & tap+swipe gesture typing.
 *
 * Hooked into Gboard's AbstractGestureMotionEventHandler:
 * - Single-finger taps and single-finger swipes pass through 100% untouched to Gboard's stock pipeline.
 * - Multi-finger gestures (2-finger swipe, tap+swipe, swipe+tap) and short neighbor swipes (e.g. a->s + l)
 *   are recognized with full trail rendering and decoded using the MultiGlide beam search + dual-thumb engine.
 */
public final class GboardMultiGlideRuntime {

    private static final String TAG = "GboardMultiGlide";
    private static final int TEXT_SNAPSHOT_CHARS = MultiGlideWordSession.TEXT_SNAPSHOT_CHARS;

    static final class PointerTrack extends MultiGlideWordSession.PointerTrack {
        PointerTrack(
                int pointerId,
                float x,
                float y,
                long timeMs,
                char startKeyChar,
                boolean startedOnLetter,
                int slot,
                MultiGlideGeometry geometry
        ) {
            super(pointerId, x, y, timeMs, startKeyChar, startedOnLetter, slot, geometry);
        }
    }

    private static final class HandlerSession {
        final MultiGlideWordSession core = new MultiGlideWordSession();
        volatile MultiGlideGeometry geometry = core.geometry;
        final Handler mainHandler = new Handler(Looper.getMainLooper());
        final SpacebarTimerOverlay spacebarOverlay = new SpacebarTimerOverlay();

        void updateGeometry(MultiGlideGeometry next) {
            if (next != null) {
                core.setGeometry(next);
                geometry = next;
            }
        }

        boolean geometryReady = false;
        boolean geometryFromNativeLayout = false;
        Object lastNativeLayoutObj = null;
        int lastKeyboardWidth = 0;
        int lastKeyboardHeight = 0;
        Runnable autospaceRunnable = null;
        Runnable stockSwipeAutospaceRunnable = null;
        Runnable livePreviewSettleRunnable = null;
        final KineticaDtwDecoder livePreviewDecoder = new KineticaDtwDecoder();
        final AtomicBoolean liveDecodeInFlight = new AtomicBoolean(false);
        final AtomicInteger liveDecodeGeneration = new AtomicInteger(0);
        long lastLiveDecodeDispatchMs = 0L;

        void cancelLivePreviewSettle() {
            if (livePreviewSettleRunnable != null) {
                mainHandler.removeCallbacks(livePreviewSettleRunnable);
                livePreviewSettleRunnable = null;
            }
        }

        void cancelAutospaceTimer() {
            if (autospaceRunnable != null) {
                mainHandler.removeCallbacks(autospaceRunnable);
                autospaceRunnable = null;
            }
            core.autospaceTimerPending = false;
        }

        void cancelStockSwipeAutospaceTimer() {
            if (stockSwipeAutospaceRunnable != null) {
                mainHandler.removeCallbacks(stockSwipeAutospaceRunnable);
                stockSwipeAutospaceRunnable = null;
            }
            core.stockSwipeAutospacePending = false;
        }
    }

    private static final long LIVE_PREVIEW_INTERVAL_MS = 100L;
    private static final ExecutorService LIVE_PREVIEW_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "multiglide-live-preview");
        t.setDaemon(true);
        return t;
    });

    private static final Map<Object, HandlerSession> SESSIONS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, ColorFilter> STOCK_TRAIL_FILTERS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Boolean> OVERLAY_MULTIGLIDE_ACTIVE =
            Collections.synchronizedMap(new WeakHashMap<>());

    private static volatile Field contextField;
    private static volatile Field keyboardViewField;
    private static volatile Field gestureOverlayViewField;
    private static volatile Field gestureOverlayPaintField;
    private static volatile Field hostBridgeField;
    private static volatile Method claimOwnershipMethod;
    private static volatile Method getKeyboardStateMethod;
    private static volatile Field bridgeDispatcherField;
    private static volatile Field dispatcherOwnerField;
    private static volatile Field gestureActiveFlagField;
    private static volatile Field trailManagerField;
    private static volatile Field trailActiveBoolField;
    private static volatile Field trailSparseArrayField;
    private static volatile Field trailStartIndexArrayField;
    private static volatile Field trailFadingListField;
    private static volatile Method recyclePointsMethod;
    private static volatile Field letterStartedField;
    private static volatile Field gestureResetField;
    private static volatile Field softKeyMapField;
    private static volatile Field nativeLayoutDataField;
    private static volatile Field nativeLayoutKeysArrayField;
    private static volatile Field nativeLayoutCenterXField;
    private static volatile Field nativeLayoutCenterYField;
    private static volatile Field nativeLayoutWidthArrField;
    private static volatile Field nativeLayoutHeightArrField;
    private static volatile Field softKeyViewDefField;
    private static volatile Field softKeyViewStateField;
    private static volatile Field softKeyDefLabelsField;
    private static volatile Field softKeyDefDescField;
    private static volatile Method basicHandlerTouchMethod;
    private static volatile boolean suppressingBasicCancelReplay = false;
    private static final Set<Class<?>> probedClasses = Collections.synchronizedSet(new HashSet<>());
    private static volatile Context cachedContext = null;
    private static volatile WeakReference<Object> cachedSampleKeyViewRef = null;
    private static volatile WeakReference<Object> lastGestureHandlerRef = null;
    private static volatile boolean multiGlideEnabledCached = true;
    private static volatile boolean crashHandlerInstalled = false;

    private static Object getLastGestureHandler() {
        WeakReference<Object> ref = lastGestureHandlerRef;
        return (ref != null) ? ref.get() : null;
    }

    private static void setLastGestureHandler(Object handler) {
        if (handler == null) {
            lastGestureHandlerRef = null;
            return;
        }
        WeakReference<Object> ref = lastGestureHandlerRef;
        if (ref == null || ref.get() != handler) {
            lastGestureHandlerRef = new WeakReference<>(handler);
        }
    }

    private static void cacheAppContext(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        cachedContext = (app != null) ? app : context;
    }

    static {
        installCrashHandler();
    }

    private static void installCrashHandler() {
        if (crashHandlerInstalled) return;
        synchronized (GboardMultiGlideRuntime.class) {
            if (crashHandlerInstalled) return;
            crashHandlerInstalled = true;
            try {
                final Thread.UncaughtExceptionHandler defaultHandler =
                        Thread.getDefaultUncaughtExceptionHandler();
                Thread.setDefaultUncaughtExceptionHandler((thread, throwable) -> {
                    try {
                        writeCrashToFile(thread, throwable);
                    } catch (Throwable ignored) {
                    }
                    if (defaultHandler != null) {
                        defaultHandler.uncaughtException(thread, throwable);
                    }
                });
            } catch (Throwable t) {
                Log.w(TAG, "Failed to install crash handler", t);
            }
        }
    }

    private static void writeCrashToFile(Thread thread, Throwable throwable) {
        if (cachedContext == null || !GboardMultiGlideSettings.isTraceLoggingEnabled(cachedContext)) {
            return;
        }
        try {
            java.io.StringWriter sw = new java.io.StringWriter();
            java.io.PrintWriter pw = new java.io.PrintWriter(sw);
            pw.println("=== GinType Crash Report ===");
            pw.println("Timestamp: " + new java.util.Date());
            pw.println("Thread: " + (thread != null ? thread.getName() : "unknown"));
            if (throwable != null) {
                pw.println("Exception: " + throwable.getClass().getName());
                pw.println("Message: " + throwable.getMessage());
                throwable.printStackTrace(pw);
            }
            pw.println("===================================");
            pw.flush();
            String report = sw.toString();

            java.io.File file = new java.io.File(cachedContext.getCacheDir(), "gboard_crash.txt");
            boolean append = !file.exists() || file.length() < 128 * 1024L;
            try (java.io.FileWriter fw = new java.io.FileWriter(file, append)) {
                fw.write(report);
                fw.write("\n\n");
            }
        } catch (Throwable ignored) {
        }
    }

    private static final String PREFS_NAME = "gintype_runtime_hints";
    private static final String PREF_UMLAUT_HINT_PREFIX = "umlaut_hint_";
    private static final Map<String, Boolean> UMLAUT_HINTS = new ConcurrentHashMap<>();

    private GboardMultiGlideRuntime() {}

    /**
     * Preloads the active language dictionary in the background as soon as a SoftKeyboardView
     * is inflated or becomes visible, avoiding a blocking load on the first two-finger swipe.
     */
    public static void onKeyboardViewReady(Object viewObj) {
        if (!(viewObj instanceof View)) return;
        try {
            Context context = ((View) viewObj).getContext();
            if (context == null) return;
            boolean enabled = GboardMultiGlideSettings.readEnabled(context);
            multiGlideEnabledCached = enabled;
            if (!enabled) {
                return;
            }
            if (!GboardThiccTopBarSettings.readEnabled(context)) {
                android.view.ViewGroup holder = ThiccTopBarGboardReflector.findCandidatesHolderView((View) viewObj);
                if (holder != null) {
                    GboardThiccTopBarRuntime.registerFallbackHolderView(holder);
                }
            }
            List<String> activeLangs = GboardMultiGlideDictionaryManager.detectActiveLanguages(context);
            String primaryLang = activeLangs.get(0);
            boolean hasDedicatedUmlauts = readUmlautHint(context, primaryLang);
            GboardMultiGlideDictionaryManager.getOrScheduleLoads(
                    context, activeLangs, hasDedicatedUmlauts);
        } catch (Throwable ignored) {
        }
    }

    private static boolean readUmlautHint(Context context, String lang) {
        String key = GboardMultiGlideDictionaryManager.normalizeLanguageKey(lang);
        Boolean cached = UMLAUT_HINTS.get(key);
        if (cached != null) {
            return cached;
        }
        if (context != null) {
            try {
                boolean stored = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .getBoolean(PREF_UMLAUT_HINT_PREFIX + key, false);
                UMLAUT_HINTS.put(key, stored);
                return stored;
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static void recordUmlautHint(Context context, String lang, boolean hasDedicatedUmlauts) {
        String key = GboardMultiGlideDictionaryManager.normalizeLanguageKey(lang);
        Boolean prev = UMLAUT_HINTS.put(key, hasDedicatedUmlauts);
        if (prev != null && prev == hasDedicatedUmlauts) {
            return;
        }
        if (context != null) {
            try {
                context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putBoolean(PREF_UMLAUT_HINT_PREFIX + key, hasDedicatedUmlauts)
                        .apply();
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Cancels any pending MultiGlide autospace timer and clears the active word buffer when the
     * user interacts directly with the Thicc Top Bar (selecting, swapping, or navigating words).
     */
    public static void onTopBarUserInteraction() {
        try {
            Object handler = getLastGestureHandler();
            if (handler == null) return;
            HandlerSession session = SESSIONS.get(handler);
            if (session == null) return;
            session.cancelAutospaceTimer();
            session.cancelStockSwipeAutospaceTimer();
            session.spacebarOverlay.cancelTimer();
            session.core.clearWordBuffer(null);
            session.core.passiveTapBuffer.clear();
            session.core.singleTouchCombineBuffer.clear();
            session.core.multiGlideTakeoverActive = false;
            session.core.autospaceInserted = false;
            session.core.autospaceSnapshot = null;
            session.core.pendingLeadingSpaceBeforeNextWord = false;
            session.core.lastCommittedWordUndo = null;
            session.core.pendingBackspaceTap = false;
            setMultiGlideTrailAccentActive(handler, false, cachedContext);
        } catch (Throwable ignored) {
        }
    }

    /** Returns true while a MultiGlide word is actively being composed. */
    public static boolean isMultiGlideWordActive() {
        try {
            Object handler = getLastGestureHandler();
            if (handler == null) return false;
            HandlerSession session = SESSIONS.get(handler);
            return session != null && session.core.multiGlideWordActive;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isLivePreviewTouchActive() {
        try {
            Object handler = getLastGestureHandler();
            if (handler == null) return false;
            HandlerSession session = SESSIONS.get(handler);
            return session != null
                    && !session.core.activePointers.isEmpty()
                    && session.core.isLivePreviewEligible(session.core.multiGlideThresholdPx());
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean hasActiveTouch() {
        try {
            Object handler = getLastGestureHandler();
            if (handler == null) return false;
            HandlerSession session = SESSIONS.get(handler);
            return session != null && !session.core.activePointers.isEmpty();
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Clears orphaned active touch pointers if {@code SoftKeyboardView} finished an
     * {@code ACTION_UP}/{@code ACTION_CANCEL} stream that did not reach
     * {@code AbstractGestureMotionEventHandler.g(MotionEvent)} (for example, releasing a
     * long-press popup symbol handled exclusively by {@code BasicMotionEventHandler}).
     */
    public static void clearOrphanedActiveTouches(long touchEndEventTimeMs) {
        try {
            Object handler = getLastGestureHandler();
            if (handler == null) return;
            HandlerSession session = SESSIONS.get(handler);
            if (session == null) return;
            if (session.core.clearOrphanedActiveTouches(touchEndEventTimeMs)) {
                session.cancelLivePreviewSettle();
                session.liveDecodeGeneration.incrementAndGet();
                GboardThiccTopBarRuntime.onGestureEndedForLiveGuess(true);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Injected at the start of AbstractGestureMotionEventHandler.g(MotionEvent).
     */
    public static void onGestureEventEntry(Object handler, MotionEvent event) {
        if (handler == null || event == null) return;
        try {
            setLastGestureHandler(handler);
            Context context = extractContext(handler);
            boolean enabled = (context == null) || GboardMultiGlideSettings.readEnabled(context);
            multiGlideEnabledCached = enabled;
            if (!enabled) {
                return;
            }
            if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isMultiGlideBlockedInput(context)) {
                HandlerSession existing = SESSIONS.get(handler);
                if (existing != null) {
                    existing.cancelAutospaceTimer();
                    existing.cancelStockSwipeAutospaceTimer();
                    existing.cancelLivePreviewSettle();
                    existing.core.onActionCancel(null);
                    existing.core.autospaceInserted = false;
                    existing.core.autospaceSnapshot = null;
                    existing.core.pendingLeadingSpaceBeforeNextWord = false;
                    existing.core.lastCommittedWordUndo = null;
                    existing.spacebarOverlay.clearImmediate();
                }
                return;
            }

            HandlerSession session = getOrCreateSession(handler);
            ensureGeometryUpdated(handler, session, context);

            List<String> activeLangs = GboardMultiGlideDictionaryManager.detectActiveLanguages(context);
            String activeLang = activeLangs.get(0);
            if (context != null) {
                if (session.geometry.isValid() && session.geometryFromNativeLayout) {
                    recordUmlautHint(context, activeLang, session.geometry.hasDedicatedUmlauts());
                }
                GboardMultiGlideDictionaryManager.getOrScheduleLoads(
                        context, activeLangs, session.geometry.hasDedicatedUmlauts());
            }

            probeHandlerFields(handler);
            sanitizeTrailIndices(handler);

            int actionMasked = event.getActionMasked();
            int actionIndex = event.getActionIndex();
            long eventTime = event.getEventTime();
            MultiGlideWordSession.SettingsSnapshot settings = readSettingsSnapshot(context);
            MultiGlideWordSession.EditorAdapter editor = createEditorAdapter(handler, context);
            MultiGlideWordSession.DecodePort decoder = createDecodePort(context, session, activeLangs);
            MultiGlideWordSession.LifecycleCallbacks callbacks =
                    createCallbacks(handler, session, context, activeLangs, editor);
            float multiGlideThreshold = session.core.multiGlideThresholdPx();

            switch (actionMasked) {
                case MotionEvent.ACTION_DOWN: {
                    session.cancelLivePreviewSettle();
                    session.liveDecodeGeneration.incrementAndGet();
                    session.lastLiveDecodeDispatchMs = 0L;
                    int pid = event.getPointerId(0);
                    float x = event.getX(0);
                    float y = event.getY(0);
                    MultiGlideWordSession.CapsMode capsMode = readKeyboardCapsMode(handler);
                    session.core.onActionDown(pid, x, y, eventTime, settings, editor, callbacks, capsMode);
                    break;
                }

                case MotionEvent.ACTION_POINTER_DOWN: {
                    int pid = event.getPointerId(actionIndex);
                    float x = event.getX(actionIndex);
                    float y = event.getY(actionIndex);
                    finishTrailForPointer(handler, pid, false);
                    session.core.onPointerDown(pid, x, y, eventTime);
                    if (!session.core.lastDownOnLetterArea && session.geometry.isOnLetterArea(x, y)) {
                        session.core.mergeCapsModeOnPointerDown(readKeyboardCapsMode(handler));
                    }
                    markNativeLetterStarted(handler);
                    ensureSoftKeyMapPopulated(handler, session, event);
                    maybeActivateTakeover(handler, session, multiGlideThreshold, false);
                    break;
                }

                case MotionEvent.ACTION_MOVE: {
                    if (session.core.pendingBackspaceTap && event.getPointerCount() > 0) {
                        session.core.maybeCancelPendingBackspaceTap(
                                event.getX(0), event.getY(0), eventTime, callbacks);
                    }
                    int pointerCount = event.getPointerCount();
                    int historySize = event.getHistorySize();

                    for (int p = 0; p < pointerCount; p++) {
                        int pid = event.getPointerId(p);
                        MultiGlideWordSession.PointerTrack track = session.core.activePointers.get(pid);
                        if (track == null) {
                            track = session.core.registerPointerDown(
                                    pid, event.getX(p), event.getY(p), eventTime);
                        }
                        for (int h = 0; h < historySize; h++) {
                            track.addPoint(
                                    event.getHistoricalX(p, h),
                                    event.getHistoricalY(p, h),
                                    event.getHistoricalEventTime(h),
                                    session.geometry
                            );
                        }
                        track.addPoint(event.getX(p), event.getY(p), eventTime, session.geometry);
                    }

                    if (pointerCount >= 2) {
                        session.core.sawMultiTouch = true;
                    }

                    if (session.core.sawMultiTouch) {
                        ensureSoftKeyMapPopulated(handler, session, event);
                        sanitizeTrailIndices(handler);
                    }

                    if (session.core.sawMultiTouch || !session.core.completedTokens.isEmpty()) {
                        markNativeLetterStarted(handler);
                    }

                    maybeActivateTakeover(handler, session, multiGlideThreshold, true);
                    maybeScheduleLivePreviewDecode(session, context, activeLangs, eventTime);
                    break;
                }

                case MotionEvent.ACTION_POINTER_UP: {
                    int pid = event.getPointerId(actionIndex);
                    session.core.onPointerUp(
                            pid,
                            event.getX(actionIndex),
                            event.getY(actionIndex),
                            eventTime,
                            true,
                            callbacks);

                    if (session.core.sawMultiTouch) {
                        ensureSoftKeyMapPopulated(handler, session, event);
                    }

                    if (session.core.sawMultiTouch || !session.core.completedTokens.isEmpty()) {
                        markNativeLetterStarted(handler);
                    }

                    maybeActivateTakeover(handler, session, multiGlideThreshold, true);
                    maybeScheduleLivePreviewDecode(session, context, activeLangs, eventTime);
                    break;
                }

                case MotionEvent.ACTION_UP: {
                    session.cancelLivePreviewSettle();
                    session.liveDecodeGeneration.incrementAndGet();
                    for (MultiGlideWordSession.PointerTrack track : session.core.activePointers.values()) {
                        int pIdx = event.findPointerIndex(track.pointerId);
                        if (pIdx >= 0) {
                            track.addPoint(
                                    event.getX(pIdx),
                                    event.getY(pIdx),
                                    eventTime,
                                    session.geometry
                            );
                        }
                    }
                    session.core.onActionUp(eventTime, settings, editor, decoder, callbacks);
                    GboardThiccTopBarRuntime.onGestureEndedForLiveGuess(false);
                    break;
                }

                case MotionEvent.ACTION_CANCEL: {
                    session.cancelLivePreviewSettle();
                    session.liveDecodeGeneration.incrementAndGet();
                    session.core.onActionCancel(callbacks);
                    GboardThiccTopBarRuntime.onGestureEndedForLiveGuess(true);
                    for (int i = 0; i < 10; i++) {
                        finishTrailForPointer(handler, i, false);
                    }
                    break;
                }

                default:
                    break;
            }
        } catch (Throwable t) {
            Log.w(TAG, "onGestureEventEntry error", t);
        }
    }

    /**
     * Injected right after `invoke-virtual {v0}, AbstractGestureMotionEventHandler;->t()Z; move-result v1`
     * at [0490] in AbstractGestureMotionEventHandler.g(MotionEvent).
     *
     * Returning true here when `this.v` is still false triggers Gboard's native gesture-start block
     * [0494]..[04f9], which sets `this.v = true`, calls `this.p.m()` (cancelling BasicMotionEventHandler),
     * sets `this.U.a = true` (`Lnhj.a = true`, enabling trail rendering!), attaches GestureOverlayView,
     * and posts the trail redraw runnable.
     */
    public static boolean shouldStartGesture(Object handler, boolean stockShouldStart) {
        if (handler == null) return stockShouldStart;
        try {
            setLastGestureHandler(handler);
            if (!multiGlideEnabledCached) return stockShouldStart;
            HandlerSession session = SESSIONS.get(handler);
            if (session == null) return stockShouldStart;

            boolean alreadyActive = !stockShouldStart && isGestureAlreadyActive(handler);
            boolean shouldStart = session.core.shouldStartGesture(
                    multiGlideEnabledCached, stockShouldStart, alreadyActive);
            if (alreadyActive && session.core.isControlled()) {
                ensureTrailRecorderEnabled(handler);
            } else if (shouldStart && session.core.isControlled()) {
                ensureTrailRecorderEnabled(handler);
                ensureGestureHandlerOwnsDispatcher(handler);
            }
            return shouldStart;
        } catch (Throwable t) {
            Log.w(TAG, "shouldStartGesture error", t);
        }
        return stockShouldStart;
    }

    /**
     * Injected right after reading `AbstractGestureMotionEventHandler.u` (`letterStarted`)
     * before its `if-eqz -> return` guard in `g(MotionEvent)`.
     */
    public static boolean resolveLetterStarted(Object handler, boolean stockLetterStarted) {
        if (handler == null) return stockLetterStarted;
        try {
            setLastGestureHandler(handler);
            if (stockLetterStarted || !multiGlideEnabledCached) {
                return stockLetterStarted;
            }
            HandlerSession session = SESSIONS.get(handler);
            if (session != null && session.core.resolveLetterStarted(multiGlideEnabledCached, false)) {
                markNativeLetterStarted(handler);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "resolveLetterStarted error", t);
        }
        return stockLetterStarted;
    }

    /**
     * Implements `AbstractGestureMotionEventHandler.gu()Z` override so dispatcher ownership
     * changes away from BasicMotionEventHandler do not cancel active multi-touch state.
     */
    public static boolean shouldReceiveEventsDuringOtherOwner(Object handler) {
        if (handler == null || !multiGlideEnabledCached) return false;
        try {
            setLastGestureHandler(handler);
            HandlerSession session = SESSIONS.get(handler);
            return session != null && session.core.shouldReceiveEventsDuringOtherOwner(multiGlideEnabledCached);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Injected at entry of `BasicMotionEventHandler.t(MotionEvent)`.
     * Suppresses tap/popup handling once MultiGlide takeover is active, while keeping fresh ACTION_DOWN
     * events intact for normal single-finger and rollover taps.
     */
    public static boolean shouldSuppressBasicMotionEventHandler(Object basicHandler, MotionEvent event) {
        if (suppressingBasicCancelReplay) return false;
        if (!multiGlideEnabledCached || event == null) return false;
        int actionMasked = event.getActionMasked();
        boolean isActionDown = (actionMasked == MotionEvent.ACTION_DOWN);
        try {
            Object gestureHandler = getLastGestureHandler();
            if (gestureHandler == null) return false;
            HandlerSession session = SESSIONS.get(gestureHandler);
            if (session == null) return false;
            Context guardContext = extractContext(gestureHandler);
            if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isMultiGlideBlockedInput(guardContext)) {
                return false;
            }
            if (actionMasked == MotionEvent.ACTION_MOVE && session.core.pendingBackspaceTap
                    && event.getPointerCount() > 0) {
                Context context = extractContext(gestureHandler);
                MultiGlideWordSession.EditorAdapter editor = createEditorAdapter(gestureHandler, context);
                List<String> activeLangs = GboardMultiGlideDictionaryManager.detectActiveLanguages(context);
                MultiGlideWordSession.LifecycleCallbacks callbacks =
                        createCallbacks(gestureHandler, session, context, activeLangs, editor);
                session.core.maybeCancelPendingBackspaceTap(
                        event.getX(0), event.getY(0), event.getEventTime(), callbacks);
            }
            if (actionMasked == MotionEvent.ACTION_UP) {
                if (session.core.shouldSuppressBasicUpForEvent(event.getEventTime())) {
                    dispatchCancelToBasicHandler(basicHandler, event);
                    return true;
                }
                if (session.core.pendingBackspaceTap && event.getPointerCount() > 0) {
                    Context context = extractContext(gestureHandler);
                    MultiGlideWordSession.SettingsSnapshot settings = readSettingsSnapshot(context);
                    MultiGlideWordSession.EditorAdapter editor = createEditorAdapter(gestureHandler, context);
                    List<String> activeLangs = GboardMultiGlideDictionaryManager.detectActiveLanguages(context);
                    MultiGlideWordSession.DecodePort decoder = createDecodePort(context, session, activeLangs);
                    MultiGlideWordSession.LifecycleCallbacks callbacks =
                            createCallbacks(gestureHandler, session, context, activeLangs, editor);
                    if (session.core.tryConsumePendingBackspaceTap(
                            event.getEventTime(),
                            event.getX(0),
                            event.getY(0),
                            settings,
                            editor,
                            decoder,
                            callbacks)) {
                        dispatchCancelToBasicHandler(basicHandler, event);
                        return true;
                    }
                }
            }
            if (isActionDown && session.core.autospaceInserted) {
                View basicView = extractKeyboardViewFromBasicHandler(basicHandler);
                if (basicView == null) {
                    basicView = extractKeyboardView(gestureHandler);
                }
                if (basicView != null) {
                    char keyChar = findSoftKeyCharAt(basicView, event.getX(), event.getY());
                    Context context = extractContext(gestureHandler);
                    session.core.onBasicHandlerActionDown(
                            keyChar, createEditorAdapter(gestureHandler, context));
                }
            }
            return session.core.shouldSuppressBasicHandler(multiGlideEnabledCached, isActionDown);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void dispatchCancelToBasicHandler(Object basicHandler, MotionEvent originalEvent) {
        if (basicHandler == null || originalEvent == null) return;
        MotionEvent cancelEvent = null;
        try {
            Method m = basicHandlerTouchMethod;
            if (m == null) {
                Class<?> cls = basicHandler.getClass();
                for (Method candidate : cls.getDeclaredMethods()) {
                    if (!Modifier.isStatic(candidate.getModifiers())
                            && Modifier.isPrivate(candidate.getModifiers())
                            && candidate.getReturnType() == void.class
                            && candidate.getParameterCount() == 1
                            && candidate.getParameterTypes()[0] == MotionEvent.class) {
                        m = candidate;
                        break;
                    }
                }
                if (m == null) {
                    m = cls.getMethod("g", MotionEvent.class);
                }
                m.setAccessible(true);
                basicHandlerTouchMethod = m;
            }
            cancelEvent = MotionEvent.obtain(originalEvent);
            cancelEvent.setAction(MotionEvent.ACTION_CANCEL);
            suppressingBasicCancelReplay = true;
            m.invoke(basicHandler, cancelEvent);
        } catch (Throwable t) {
            Log.w(TAG, "dispatchCancelToBasicHandler failed", t);
        } finally {
            suppressingBasicCancelReplay = false;
            if (cancelEvent != null) {
                cancelEvent.recycle();
            }
        }
    }

    /**
     * Injected in `Lqil.c(MotionEvent, Z)` right before prematurely committing pointer 0 on
     * `ACTION_POINTER_DOWN`. Suppresses rollover commit when two thumbs land on letter keys within
     * the simultaneous multi-touch window (220ms) or while MultiGlide takeover is active.
     */
    public static boolean shouldSuppressRolloverCommitOnPointerDown(MotionEvent event) {
        if (!multiGlideEnabledCached || event == null) return false;
        if (event.getActionMasked() != MotionEvent.ACTION_POINTER_DOWN) return false;
        try {
            Object gestureHandler = getLastGestureHandler();
            if (gestureHandler == null) return false;
            HandlerSession session = SESSIONS.get(gestureHandler);
            if (session == null) return false;
            Context guardContext = extractContext(gestureHandler);
            if (dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isMultiGlideBlockedInput(guardContext)) {
                return false;
            }

            int actionIdx = event.getActionIndex();
            if (actionIdx < 0 || actionIdx >= event.getPointerCount()) return false;
            boolean hasFirst = event.getPointerCount() >= 2;
            return session.core.shouldSuppressRolloverCommit(
                    multiGlideEnabledCached,
                    true,
                    session.geometryReady,
                    event.getEventTime(),
                    event.getX(actionIdx),
                    event.getY(actionIdx),
                    hasFirst,
                    hasFirst ? event.getX(0) : 0f,
                    hasFirst ? event.getY(0) : 0f);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Injected right before `invoke-interface {v4, v7}, Lqit;->n(Lohe;)V` inside
     * AbstractGestureMotionEventHandler.g(MotionEvent).
     *
     * @return true if MultiGlide has taken over this swipe gesture (suppressing Gboard's
     *         native gesture event dispatch), or false for normal tap typing.
     */
    public static boolean shouldInterceptGestureDispatch(Object handler) {
        if (handler == null) return false;
        HandlerSession session = SESSIONS.get(handler);
        return session != null && session.core.shouldInterceptGestureDispatch();
    }

    /**
     * Injected at the start of AbstractGestureMotionEventHandler.B() (reset gesture state).
     *
     * @return true to intercept and abort B()'s body when active fingers are down
     *         (preserving softKeyMap this.d, letterStarted this.u, and trail state),
     *         false to proceed with stock cleanup when no touches are active.
     */
    public static boolean shouldInterceptGestureReset(Object handler) {
        if (handler == null) return false;
        try {
            HandlerSession session = SESSIONS.get(handler);
            if (session == null) return false;
            if (session.core.shouldInterceptGestureReset()) {
                ensureGestureHandlerOwnsDispatcher(handler);
                return true;
            }
            return false;
        } catch (Throwable t) {
            Log.w(TAG, "shouldInterceptGestureReset error", t);
            return false;
        }
    }

    private static void markNativeLetterStarted(Object handler) {
        if (letterStartedField != null) {
            try {
                letterStartedField.setBoolean(handler, true);
            } catch (Throwable ignored) {
            }
        }
        if (gestureResetField != null) {
            try {
                gestureResetField.setBoolean(handler, false);
            } catch (Throwable ignored) {
            }
        }
    }

    private static void maybeActivateTakeover(
            Object handler,
            HandlerSession session,
            float multiGlideThreshold,
            boolean claimDispatcher
    ) {
        if (!session.core.sawMultiTouch || !session.core.hasAnySwipingPointer(multiGlideThreshold)) {
            return;
        }
        session.core.multiGlideTakeoverActive = true;
        setMultiGlideTrailAccentActive(handler, true, null);
        GboardThiccTopBarRuntime.setNativeTopBarBlankForMultiGlide(true);
        ensureTrailRecorderEnabled(handler);
        if (claimDispatcher) {
            ensureGestureHandlerOwnsDispatcher(handler);
        }
    }

    private static void maybeScheduleLivePreviewDecode(
            HandlerSession session,
            Context context,
            List<String> activeLangs,
            long eventTimeMs
    ) {
        if (context == null
                || !session.core.isLivePreviewEligible(session.core.multiGlideThresholdPx())) {
            return;
        }
        if (!GboardThiccTopBarSettings.readEnabled(context)) {
            GboardThiccTopBarRuntime.setNativeTopBarBlankForMultiGlide(true);
        }
        session.cancelLivePreviewSettle();
        long elapsed = eventTimeMs - session.lastLiveDecodeDispatchMs;
        if (elapsed < LIVE_PREVIEW_INTERVAL_MS) {
            long delayMs = Math.max(20L, LIVE_PREVIEW_INTERVAL_MS - elapsed);
            session.livePreviewSettleRunnable = () -> {
                session.livePreviewSettleRunnable = null;
                maybeScheduleLivePreviewDecode(
                        session, context, activeLangs, android.os.SystemClock.uptimeMillis());
            };
            session.mainHandler.postDelayed(session.livePreviewSettleRunnable, delayMs);
            return;
        }
        List<LanguagePack> packs = GboardMultiGlideDictionaryManager.getLoadedIfReady(
                activeLangs, session.geometry.hasDedicatedUmlauts());
        if (packs.isEmpty() || !session.geometry.isValid()) {
            return;
        }
        List<MultiGlideInputToken> snapshotTokens = session.core.buildLiveSnapshotTokens();
        if (snapshotTokens == null) {
            return;
        }
        if (!session.liveDecodeInFlight.compareAndSet(false, true)) {
            session.livePreviewSettleRunnable = () -> {
                session.livePreviewSettleRunnable = null;
                maybeScheduleLivePreviewDecode(
                        session, context, activeLangs, android.os.SystemClock.uptimeMillis());
            };
            session.mainHandler.postDelayed(session.livePreviewSettleRunnable, LIVE_PREVIEW_INTERVAL_MS);
            return;
        }
        session.lastLiveDecodeDispatchMs = eventTimeMs;
        final int gen = session.liveDecodeGeneration.get();
        final String prevWord = session.core.lastCommittedWord;
        final boolean replacingTapPrefix = session.core.hasPendingTapPrefixInEditor();
        final String snapshotAtDown = session.core.textSnapshotAtActionDown;
        final boolean suppressLeadingSpace = session.core.suppressNextLeadingSpace;
        final MultiGlideWordSession.CapsMode capsModeAtDown = session.core.currentWordCapsMode;
        final MultiGlideGeometry geomRef = session.geometry;
        LIVE_PREVIEW_EXECUTOR.execute(() -> {
            try {
                if (session.liveDecodeGeneration.get() != gen) {
                    return;
                }
                GboardMultiGlideSettings.syncDecoderConstants(context);
                List<WordCandidate> candidates = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                        session.livePreviewDecoder,
                        snapshotTokens,
                        packs,
                        geomRef,
                        prevWord,
                        snapshotAtDown);
                if (session.liveDecodeGeneration.get() != gen
                        || candidates == null
                        || candidates.isEmpty()) {
                    return;
                }
                String formatted = MultiGlideWordSession.formatWordForContext(
                        candidates.get(0).word, snapshotAtDown, suppressLeadingSpace, capsModeAtDown);
                if (formatted != null && !formatted.isEmpty()) {
                    GboardThiccTopBarRuntime.updateLiveGuess(formatted, replacingTapPrefix);
                }
            } catch (Throwable t) {
                Log.w(TAG, "livePreviewDecode error: " + t.getMessage());
            } finally {
                session.liveDecodeInFlight.set(false);
            }
        });
    }

    private static void ensureGestureHandlerOwnsDispatcher(Object handler) {
        probeHandlerFields(handler);
        try {
            markNativeLetterStarted(handler);
            if (hostBridgeField != null && claimOwnershipMethod != null) {
                Object bridge = hostBridgeField.get(handler);
                if (bridge != null) {
                    preemptOtherDispatcherOwner(bridge, handler);
                    claimOwnershipMethod.invoke(bridge);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void preemptOtherDispatcherOwner(Object bridge, Object gestureHandler) {
        try {
            Field dispField = bridgeDispatcherField;
            if (dispField == null) {
                for (Field f : bridge.getClass().getDeclaredFields()) {
                    Class<?> type = f.getType();
                    if (!type.isPrimitive() && !type.isInterface()) {
                        f.setAccessible(true);
                        dispField = f;
                        bridgeDispatcherField = f;
                        break;
                    }
                }
            }
            if (dispField == null) return;
            Object dispatcher = dispField.get(bridge);
            if (dispatcher == null) return;

            Field ownerField = dispatcherOwnerField;
            if (ownerField == null) {
                Class<?> handlerCls = gestureHandler.getClass();
                for (Field f : dispatcher.getClass().getDeclaredFields()) {
                    Class<?> type = f.getType();
                    if (type.isInterface() && type.isAssignableFrom(handlerCls)) {
                        f.setAccessible(true);
                        ownerField = f;
                        dispatcherOwnerField = f;
                        break;
                    }
                }
            }
            if (ownerField != null) {
                Object currentOwner = ownerField.get(dispatcher);
                if (currentOwner != null && currentOwner != gestureHandler) {
                    ownerField.set(dispatcher, null);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void sanitizeTrailIndices(Object handler) {
        probeHandlerFields(handler);
        try {
            if (trailManagerField == null || trailStartIndexArrayField == null || trailSparseArrayField == null) {
                return;
            }
            Object trailMgr = trailManagerField.get(handler);
            if (trailMgr == null) return;

            Object cObj = trailStartIndexArrayField.get(trailMgr);
            Object bObj = trailSparseArrayField.get(trailMgr);

            if (cObj instanceof SparseIntArray && bObj instanceof SparseArray) {
                SparseIntArray c = (SparseIntArray) cObj;
                SparseArray<?> b = (SparseArray<?>) bObj;
                for (int i = 0; i < c.size(); i++) {
                    int pid = c.keyAt(i);
                    Object listObj = b.get(pid);
                    int listSize = (listObj instanceof List) ? ((List<?>) listObj).size() : 0;
                    if (c.valueAt(i) > listSize) {
                        c.put(pid, 0);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void finishTrailForPointer(Object handler, int pointerId, boolean isSwipe) {
        probeHandlerFields(handler);
        try {
            if (trailManagerField == null) return;
            Object trailMgr = trailManagerField.get(handler);
            if (trailMgr == null) return;

            // 1. Delete pointerId from c (SparseIntArray) so gyq.run() never sees a stale fromIndex
            if (trailStartIndexArrayField != null) {
                Object cObj = trailStartIndexArrayField.get(trailMgr);
                if (cObj instanceof SparseIntArray) {
                    ((SparseIntArray) cObj).delete(pointerId);
                }
            }

            // 2. Remove pointer trail from b (SparseArray)
            if (trailSparseArrayField != null) {
                Object sparseObj = trailSparseArrayField.get(trailMgr);
                if (sparseObj instanceof SparseArray) {
                    SparseArray<?> array = (SparseArray<?>) sparseObj;
                    Object listObj = array.get(pointerId);
                    if (listObj instanceof List) {
                        List<?> list = (List<?>) listObj;
                        if (isSwipe && list.size() >= 3) {
                            if (trailFadingListField != null) {
                                Object fadingObj = trailFadingListField.get(trailMgr);
                                if (fadingObj instanceof List) {
                                    ((List<Object>) fadingObj).add(list);
                                }
                            }
                        } else {
                            if (recyclePointsMethod != null) {
                                try {
                                    recyclePointsMethod.invoke(trailMgr, list);
                                } catch (Throwable ignored) {
                                }
                            }
                        }
                        array.remove(pointerId);
                    }
                }
            }

            // 3. Keep indices sanitized
            sanitizeTrailIndices(handler);
        } catch (Throwable ignored) {
        }
    }

    private static void setMultiGlideTrailAccentActive(Object handler, boolean active, Context fallbackCtx) {
        if (handler == null) return;
        probeHandlerFields(handler);
        try {
            if (gestureOverlayViewField == null) return;
            Object overlayObj = gestureOverlayViewField.get(handler);
            if (!(overlayObj instanceof View)) return;
            View overlayView = (View) overlayObj;

            Field paintField = findGestureOverlayPaintField(overlayView);
            if (paintField == null) return;
            Object paintObj = paintField.get(overlayView);
            if (!(paintObj instanceof Paint)) return;
            Paint drawPaint = (Paint) paintObj;

            Boolean wasActive = OVERLAY_MULTIGLIDE_ACTIVE.get(overlayView);
            if (!Boolean.TRUE.equals(wasActive)) {
                ColorFilter capturedFilter = drawPaint.getColorFilter();
                STOCK_TRAIL_FILTERS.put(overlayView, capturedFilter);
                int capturedRgb = extractStockTrailRgb(capturedFilter);
                if (capturedRgb >= 0) {
                    Context ctx = overlayView.getContext() != null ? overlayView.getContext() : fallbackCtx;
                    ThiccTopBarGboardReflector.recordStockTrailAccent(ctx, capturedRgb);
                }
            }

            if (wasActive != null && wasActive == active) {
                return;
            }

            ColorFilter stockFilter = STOCK_TRAIL_FILTERS.get(overlayView);

            if (active) {
                Context ctx = overlayView.getContext() != null ? overlayView.getContext() : fallbackCtx;
                int stockRgb = extractStockTrailRgb(stockFilter);
                if (stockRgb >= 0) {
                    ThiccTopBarGboardReflector.recordStockTrailAccent(ctx, stockRgb);
                }
                int multiGlideRgb = resolveMultiGlideTrailColor(ctx, stockRgb);
                drawPaint.setColorFilter(buildTrailColorFilter(stockFilter, multiGlideRgb));
                OVERLAY_MULTIGLIDE_ACTIVE.put(overlayView, Boolean.TRUE);
                overlayView.invalidate();
            } else if (Boolean.TRUE.equals(wasActive)) {
                drawPaint.setColorFilter(stockFilter);
                OVERLAY_MULTIGLIDE_ACTIVE.put(overlayView, Boolean.FALSE);
                overlayView.invalidate();
            }
        } catch (Throwable ignored) {
        }
    }

    private static Field findGestureOverlayPaintField(Object overlayView) {
        Field cached = gestureOverlayPaintField;
        if (cached != null) return cached;
        Field nFallback = null;
        for (Field f : overlayView.getClass().getDeclaredFields()) {
            if (f.getType() != Paint.class) continue;
            f.setAccessible(true);
            try {
                Object val = f.get(overlayView);
                if (val instanceof Paint && ((Paint) val).getColorFilter() instanceof ColorMatrixColorFilter) {
                    gestureOverlayPaintField = f;
                    return f;
                }
                if ("n".equals(f.getName())) {
                    nFallback = f;
                }
            } catch (Throwable ignored) {
            }
        }
        if (nFallback != null) {
            gestureOverlayPaintField = nFallback;
        }
        return nFallback;
    }

    private static int extractStockTrailRgb(ColorFilter stockFilter) {
        if (!(stockFilter instanceof ColorMatrixColorFilter)) return -1;
        try {
            ColorMatrix cm = new ColorMatrix();
            ((ColorMatrixColorFilter) stockFilter).getColorMatrix(cm);
            float[] m = cm.getArray();
            if (m != null && m.length >= 15) {
                int r = Math.max(0, Math.min(255, Math.round(m[4])));
                int g = Math.max(0, Math.min(255, Math.round(m[9])));
                int b = Math.max(0, Math.min(255, Math.round(m[14])));
                return (r << 16) | (g << 8) | b;
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    private static ColorFilter buildTrailColorFilter(ColorFilter stockFilter, int rgb) {
        float[] matrix = new float[] {
            0f, 0f, 0f, 0f, (float) ((rgb >> 16) & 0xff),
            0f, 0f, 0f, 0f, (float) ((rgb >> 8) & 0xff),
            0f, 0f, 0f, 0f, (float) (rgb & 0xff),
            0f, 0f, 1f, 0f, 0f
        };
        if (stockFilter instanceof ColorMatrixColorFilter) {
            try {
                ColorMatrix existing = new ColorMatrix();
                ((ColorMatrixColorFilter) stockFilter).getColorMatrix(existing);
                float[] existingArr = existing.getArray();
                if (existingArr != null && existingArr.length == 20) {
                    matrix = existingArr.clone();
                    matrix[4] = (rgb >> 16) & 0xff;
                    matrix[9] = (rgb >> 8) & 0xff;
                    matrix[14] = rgb & 0xff;
                }
            } catch (Throwable ignored) {
            }
        }
        return new ColorMatrixColorFilter(new ColorMatrix(matrix));
    }

    private static int resolveMultiGlideTrailColor(Context context, int stockRgb) {
        boolean darkMode = stockRgb >= 0
                ? ThiccTopBarGboardReflector.perceivedLuminance(stockRgb) >= 140f
                : (context != null && (context.getResources().getConfiguration().uiMode
                        & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
        int tertiary = -1;
        int secondary = -1;
        if (context != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            tertiary = ThiccTopBarGboardReflector.resolveAndroidColorRgb(context,
                    darkMode ? android.R.color.system_accent3_200 : android.R.color.system_accent3_500);
            secondary = ThiccTopBarGboardReflector.resolveAndroidColorRgb(context,
                    darkMode ? android.R.color.system_accent2_200 : android.R.color.system_accent2_500);
        }
        return chooseMultiGlideTrailColor(stockRgb, tertiary, secondary, darkMode);
    }

    private static View resolveSpacebarTargetView(Object handler, MultiGlideGeometry geometry) {
        View kv = extractKeyboardView(handler);
        if (!(kv instanceof ViewGroup) || kv.getWidth() <= 0 || kv.getHeight() <= 0) {
            return null;
        }
        float minWidth = Math.max(kv.getWidth() * 0.25f, geometry.keyWidthPx * 2.5f);
        float minY = kv.getHeight() * 0.55f;
        View[] best = new View[1];
        findSpacebarSoftKeyView((ViewGroup) kv, kv, minWidth, minY, best);
        View spaceKeyView = best[0];
        if (spaceKeyView == null) return null;
        if (spaceKeyView.getBackground() != null) return spaceKeyView;
        if (spaceKeyView instanceof ViewGroup) {
            View bgChild = findBackgroundChildView(
                    (ViewGroup) spaceKeyView, spaceKeyView.getWidth() * 0.7f);
            if (bgChild != null) return bgChild;
        }
        return spaceKeyView;
    }

    private static void findSpacebarSoftKeyView(
            ViewGroup group,
            View root,
            float minWidth,
            float minY,
            View[] best
    ) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE || child.getWidth() <= 0 || child.getHeight() <= 0) {
                continue;
            }
            if (child.getClass().getSimpleName().contains("SoftKeyView")) {
                if (child.getWidth() >= minWidth) {
                    float top = child.getY();
                    View parent = (child.getParent() instanceof View) ? (View) child.getParent() : null;
                    while (parent != null && parent != root) {
                        top += parent.getY();
                        parent = (parent.getParent() instanceof View) ? (View) parent.getParent() : null;
                    }
                    if (top >= minY && (best[0] == null || child.getWidth() > best[0].getWidth())) {
                        best[0] = child;
                    }
                }
            } else if (child instanceof ViewGroup) {
                findSpacebarSoftKeyView((ViewGroup) child, root, minWidth, minY, best);
            }
        }
    }

    private static View findBackgroundChildView(ViewGroup group, float minWidth) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            if (child.getBackground() != null && child.getWidth() >= minWidth && child.getHeight() > 0) {
                return child;
            }
            if (child instanceof ViewGroup) {
                View nested = findBackgroundChildView((ViewGroup) child, minWidth);
                if (nested != null) return nested;
            }
        }
        return null;
    }

    private static boolean shouldShowSpacebarIndicator(Context context) {
        return context != null
                && GboardMultiGlideSettings.isAutoSpaceEnabled(context)
                && GboardMultiGlideSettings.isSpacebarTimerIndicatorEnabled(context);
    }

    private static boolean shouldVibrateOnTimerElapse(Context context) {
        return context != null
                && GboardMultiGlideSettings.isAutoSpaceEnabled(context)
                && GboardMultiGlideSettings.isWordReadyVibrationEnabled(context);
    }

    private static void triggerWordReadyVibration(
            Context context,
            Object handler,
            HandlerSession session
    ) {
        if (!shouldVibrateOnTimerElapse(context)) return;
        try {
            Vibrator vibrator = null;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                VibratorManager vm = context.getSystemService(VibratorManager.class);
                if (vm != null) {
                    vibrator = vm.getDefaultVibrator();
                }
            }
            if (vibrator == null) {
                vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
            }
            if (vibrator != null && vibrator.hasVibrator()) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    vibrator.vibrate(VibrationEffect.createPredefined(VibrationEffect.EFFECT_TICK));
                } else {
                    vibrator.vibrate(VibrationEffect.createOneShot(12L, 80));
                }
                return;
            }
        } catch (Throwable ignored) {
        }
        try {
            View spacebarView = resolveSpacebarTargetView(handler, session.geometry);
            if (spacebarView != null) {
                spacebarView.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int resolveSpacebarIndicatorAccent(View spacebarView, Context context) {
        return ThiccTopBarGboardReflector.resolveSpacebarShadingColor(spacebarView, context);
    }

    static int chooseMultiGlideTrailColor(
            int stockRgb,
            int dynamicTertiaryRgb,
            int dynamicSecondaryRgb,
            boolean darkKeyboard
    ) {
        if (dynamicTertiaryRgb >= 0
                && (stockRgb < 0 || !isColorTooClose(dynamicTertiaryRgb & 0x00ffffff, stockRgb))) {
            return dynamicTertiaryRgb & 0x00ffffff;
        }
        if (dynamicSecondaryRgb >= 0
                && (stockRgb < 0 || !isColorTooClose(dynamicSecondaryRgb & 0x00ffffff, stockRgb))) {
            return dynamicSecondaryRgb & 0x00ffffff;
        }
        if (stockRgb >= 0) {
            return rotateMaterialAccentHue(stockRgb, darkKeyboard);
        }
        return darkKeyboard ? 0xEFB8C8 : 0x984061;
    }

    private static boolean isColorTooClose(int rgbA, int rgbB) {
        int dr = ((rgbA >> 16) & 0xff) - ((rgbB >> 16) & 0xff);
        int dg = ((rgbA >> 8) & 0xff) - ((rgbB >> 8) & 0xff);
        int db = (rgbA & 0xff) - (rgbB & 0xff);
        return (dr * dr + dg * dg + db * db) < (56 * 56);
    }

    private static int rotateMaterialAccentHue(int stockRgb, boolean darkKeyboard) {
        float r = ((stockRgb >> 16) & 0xff) / 255f;
        float g = ((stockRgb >> 8) & 0xff) / 255f;
        float b = (stockRgb & 0xff) / 255f;
        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float delta = max - min;
        if (delta < 0.08f) {
            return darkKeyboard ? 0xEFB8C8 : 0x7D5260;
        }
        float hue;
        if (max == r) {
            hue = 60f * (((g - b) / delta) % 6f);
        } else if (max == g) {
            hue = 60f * (((b - r) / delta) + 2f);
        } else {
            hue = 60f * (((r - g) / delta) + 4f);
        }
        if (hue < 0f) hue += 360f;
        float rotatedHue = (hue + 120f) % 360f;
        float sat = Math.max(0.45f, Math.min(0.75f, max > 0f ? delta / max : 0.55f));
        float val = darkKeyboard ? 0.92f : 0.65f;
        return hsvToRgb(rotatedHue, sat, val);
    }

    private static int hsvToRgb(float hueDeg, float sat, float val) {
        float c = val * sat;
        float x = c * (1f - Math.abs((hueDeg / 60f) % 2f - 1f));
        float m = val - c;
        float r1, g1, b1;
        if (hueDeg < 60f) {
            r1 = c; g1 = x; b1 = 0f;
        } else if (hueDeg < 120f) {
            r1 = x; g1 = c; b1 = 0f;
        } else if (hueDeg < 180f) {
            r1 = 0f; g1 = c; b1 = x;
        } else if (hueDeg < 240f) {
            r1 = 0f; g1 = x; b1 = c;
        } else if (hueDeg < 300f) {
            r1 = x; g1 = 0f; b1 = c;
        } else {
            r1 = c; g1 = 0f; b1 = x;
        }
        int r = Math.max(0, Math.min(255, Math.round((r1 + m) * 255f)));
        int g = Math.max(0, Math.min(255, Math.round((g1 + m) * 255f)));
        int b = Math.max(0, Math.min(255, Math.round((b1 + m) * 255f)));
        return (r << 16) | (g << 8) | b;
    }

    private static boolean isGestureAlreadyActive(Object handler) {
        probeHandlerFields(handler);
        try {
            if (gestureActiveFlagField != null) {
                return gestureActiveFlagField.getBoolean(handler);
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void ensureTrailRecorderEnabled(Object handler) {
        probeHandlerFields(handler);
        try {
            if (trailManagerField != null && trailActiveBoolField != null) {
                Object trailMgr = trailManagerField.get(handler);
                if (trailMgr != null) {
                    trailActiveBoolField.setBoolean(trailMgr, true);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void activateMultiGlideTakeoverOnFinish(Object handler) {
        probeHandlerFields(handler);
        try {
            ensureTrailRecorderEnabled(handler);
            if (hostBridgeField != null && claimOwnershipMethod != null) {
                Object bridge = hostBridgeField.get(handler);
                if (bridge != null) {
                    claimOwnershipMethod.invoke(bridge);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static MultiGlideWordSession.SettingsSnapshot readSettingsSnapshot(Context context) {
        boolean enabled = (context == null) || GboardMultiGlideSettings.readEnabled(context);
        boolean autoSpaceEnabled = (context == null) || GboardMultiGlideSettings.isAutoSpaceEnabled(context);
        int autoSpaceDelayMs = (context != null)
                ? GboardMultiGlideSettings.readAutoSpaceDelayMs(context)
                : GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS;
        int combineDelayMs = (context != null)
                ? GboardMultiGlideSettings.readEffectiveSingleTouchCombineDelayMs(context)
                : GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS;
        boolean doubleSpacePeriodEnabled = readDoubleSpacePeriodEnabled(context);
        boolean autoSpaceBeforeWord = (context == null)
                ? GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_BEFORE_WORD
                : GboardMultiGlideSettings.isAutoSpaceBeforeWord(context);
        int tapToMultiGlideDelayMs = (context != null)
                ? GboardMultiGlideSettings.readEffectiveTapToMultiGlideDelayMs(context)
                : GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS;
        String backspaceMode = (context != null)
                ? GboardMultiGlideSettings.readBackspaceMode(context)
                : GboardMultiGlideSettings.DEFAULT_BACKSPACE_MODE;
        boolean smartTapSwipeSplitEnabled = (context == null)
                ? GboardMultiGlideSettings.DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED
                : GboardMultiGlideSettings.readSmartTapSwipeSplitEnabled(context);
        return new MultiGlideWordSession.SettingsSnapshot(
                enabled, autoSpaceEnabled, autoSpaceDelayMs, combineDelayMs,
                doubleSpacePeriodEnabled, autoSpaceBeforeWord, tapToMultiGlideDelayMs,
                backspaceMode, smartTapSwipeSplitEnabled);
    }

    private static boolean readDoubleSpacePeriodEnabled(Context context) {
        if (context == null) return true;
        final String prefKey = "enable_double_space_period";
        final String prefsName = context.getPackageName() + "_preferences";
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !context.isDeviceProtectedStorage()) {
                Context dpContext = context.createDeviceProtectedStorageContext();
                if (dpContext != null) {
                    android.content.SharedPreferences dpPrefs =
                            dpContext.getSharedPreferences(prefsName, Context.MODE_PRIVATE);
                    if (dpPrefs != null && dpPrefs.contains(prefKey)) {
                        return dpPrefs.getBoolean(prefKey, true);
                    }
                }
            }
            android.content.SharedPreferences prefs =
                    context.getSharedPreferences(prefsName, Context.MODE_PRIVATE);
            if (prefs != null && prefs.contains(prefKey)) {
                return prefs.getBoolean(prefKey, true);
            }
        } catch (Throwable ignored) {
        }
        return true;
    }

    private static MultiGlideWordSession.EditorAdapter createEditorAdapter(
            Object handler,
            Context context
    ) {
        return new MultiGlideWordSession.EditorAdapter() {
            @Override
            public String readTextBeforeCursorSnapshot() {
                return GboardMultiGlideRuntime.readTextBeforeCursorSnapshot(handler, context);
            }

            @Override
            public String readCharBeforeCursor() {
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return null;
                try {
                    CharSequence before = ic.getTextBeforeCursor(1, 0);
                    return (before != null) ? before.toString() : null;
                } catch (Throwable ignored) {
                    return null;
                }
            }

            @Override
            public void deleteCharsBeforeCursor(int count) {
                if (count <= 0) return;
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic != null) {
                    try {
                        ic.deleteSurroundingText(count, 0);
                    } catch (Throwable ignored) {
                    }
                }
            }

            @Override
            public int previewWord(String word, String baselineBeforeText, boolean prependLeadingSpace) {
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return 0;
                return previewWordToInputConnection(ic, word, baselineBeforeText, prependLeadingSpace);
            }

            @Override
            public void commitFinishedWord(String word, boolean appendSpace) {
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return;
                try {
                    ic.beginBatchEdit();
                    try {
                        ic.finishComposingText();
                        if (appendSpace) {
                            ic.commitText(" ", 1);
                        }
                    } finally {
                        ic.endBatchEdit();
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "commitFinishedWord failed", t);
                }
            }

            @Override
            public void commitText(String text) {
                if (text == null || text.isEmpty()) return;
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return;
                try {
                    ic.commitText(text, 1);
                } catch (Throwable t) {
                    Log.w(TAG, "commitText failed", t);
                }
            }

            @Override
            public void deleteActiveComposingWord(int charCount) {
                if (charCount <= 0) return;
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return;
                try {
                    ic.beginBatchEdit();
                    try {
                        ic.finishComposingText();
                        ic.deleteSurroundingText(charCount, 0);
                    } finally {
                        ic.endBatchEdit();
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "deleteActiveComposingWord failed", t);
                }
            }

            @Override
            public void replaceComposingWithText(int composingCharCount, String replacement) {
                InputConnection ic = resolveActiveInputConnection(handler, context);
                if (ic == null) return;
                try {
                    ic.beginBatchEdit();
                    try {
                        ic.finishComposingText();
                        if (composingCharCount > 0) {
                            ic.deleteSurroundingText(composingCharCount, 0);
                        }
                        if (replacement != null && !replacement.isEmpty()) {
                            ic.commitText(replacement, 1);
                        }
                    } finally {
                        ic.endBatchEdit();
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "replaceComposingWithText failed", t);
                }
            }
        };
    }

    private static MultiGlideWordSession.DecodePort createDecodePort(
            Context context,
            HandlerSession session,
            List<String> activeLangs
    ) {
        final List<String> langs = (activeLangs != null && !activeLangs.isEmpty())
                ? activeLangs
                : Collections.singletonList("en");
        final String primaryLang = langs.get(0);
        return new MultiGlideWordSession.DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                try {
                    List<LanguagePack> packs = GboardMultiGlideDictionaryManager.loadBlockingIfNeeded(
                            context, langs, session.geometry.hasDedicatedUmlauts());
                    if (packs.isEmpty()) {
                        return Collections.emptyList();
                    }
                    GboardMultiGlideSettings.syncDecoderConstants(context);
                    KineticaDtwDecoder decoder = new KineticaDtwDecoder();
                    return MultiGlideMultilingualDecoder.decodeAcrossPacks(
                            decoder,
                            tokens,
                            packs,
                            session.geometry,
                            prevWord,
                            session.core.textSnapshotAtActionDown);
                } catch (Throwable t) {
                    Log.e(TAG, "decodePort failed", t);
                    return Collections.emptyList();
                }
            }

            @Override
            public String activeLanguage() {
                return primaryLang != null ? primaryLang : "en";
            }

            @Override
            public List<String> activeLanguages() {
                return langs;
            }

            @Override
            public int lookupWordFrequency(String word) {
                if (word == null || word.isEmpty()) return 0;
                List<LanguagePack> packs = GboardMultiGlideDictionaryManager.getLoadedIfReady(
                        langs, session.geometry.hasDedicatedUmlauts());
                if (packs.isEmpty()) {
                    packs = GboardMultiGlideDictionaryManager.loadBlockingIfNeeded(
                            context, langs, session.geometry.hasDedicatedUmlauts());
                }
                int maxFreq = 0;
                for (int i = 0; i < packs.size(); i++) {
                    LanguagePack pack = packs.get(i);
                    if (pack == null || pack.trie == null) continue;
                    pack.rwLock.readLock().lock();
                    try {
                        int freq = pack.trie.lookupFrequency(word);
                        if (freq > maxFreq) {
                            maxFreq = freq;
                        }
                    } finally {
                        pack.rwLock.readLock().unlock();
                    }
                }
                return maxFreq;
            }

            @Override
            public float lookupBigramScore(String prevWord, String word) {
                if (prevWord == null || prevWord.isEmpty() || word == null || word.isEmpty()) {
                    return 0f;
                }
                List<LanguagePack> packs = GboardMultiGlideDictionaryManager.getLoadedIfReady(
                        langs, session.geometry.hasDedicatedUmlauts());
                float maxScore = 0f;
                for (int i = 0; i < packs.size(); i++) {
                    LanguagePack pack = packs.get(i);
                    if (pack == null || pack.bigrams == null) continue;
                    pack.rwLock.readLock().lock();
                    try {
                        float score = pack.bigrams.score(prevWord, word);
                        if (score > maxScore) {
                            maxScore = score;
                        }
                    } finally {
                        pack.rwLock.readLock().unlock();
                    }
                }
                return maxScore;
            }
        };
    }

    private static MultiGlideWordSession.LifecycleCallbacks createCallbacks(
            Object handler,
            HandlerSession session,
            Context context,
            List<String> activeLangs,
            MultiGlideWordSession.EditorAdapter editor
    ) {
        final List<String> langs = (activeLangs != null && !activeLangs.isEmpty())
                ? activeLangs
                : Collections.singletonList("de");
        final String primaryLang = langs.get(0);
        final String activeLangLabel = langs.size() > 1 ? String.join("+", langs) : primaryLang;
        return new MultiGlideWordSession.LifecycleCallbacks() {
            @Override
            public void onTrailAccentChanged(boolean active) {
                setMultiGlideTrailAccentActive(handler, active, context);
            }

            @Override
            public void onTakeoverActivatedOnFinish() {
                activateMultiGlideTakeoverOnFinish(handler);
            }

            @Override
            public void onPointerFinished(int pointerId, boolean isSwipe, boolean inMultiGlideGesture) {
                finishTrailForPointer(handler, pointerId, isSwipe);
            }

            @Override
            public void onClearTrailManagerActive() {
                if (trailActiveBoolField != null) {
                    try {
                        Object tm = trailManagerField.get(handler);
                        if (tm != null) {
                            trailActiveBoolField.setBoolean(tm, false);
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }

            @Override
            public void onScheduleAutospaceTimer(long delayMs) {
                session.cancelAutospaceTimer();
                session.core.autospaceTimerPending = true;
                final MultiGlideWordSession.LifecycleCallbacks self = this;
                session.autospaceRunnable = () -> {
                    boolean autoSpaceEnabled = (context == null)
                            || GboardMultiGlideSettings.isAutoSpaceEnabled(context);
                    boolean autoSpaceBeforeWord = (context == null)
                            ? GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_BEFORE_WORD
                            : GboardMultiGlideSettings.isAutoSpaceBeforeWord(context);
                    session.core.finalizeAutospace(autoSpaceEnabled, autoSpaceBeforeWord, editor, self);
                };
                session.mainHandler.postDelayed(session.autospaceRunnable, delayMs);
                if (shouldShowSpacebarIndicator(context)) {
                    View spacebarView = resolveSpacebarTargetView(handler, session.geometry);
                    session.spacebarOverlay.startTimer(
                            spacebarView,
                            resolveSpacebarIndicatorAccent(spacebarView, context),
                            delayMs);
                } else {
                    session.spacebarOverlay.clearImmediate();
                }
            }

            @Override
            public void onCancelAutospaceTimer() {
                session.cancelAutospaceTimer();
                session.spacebarOverlay.cancelTimer();
            }

            @Override
            public void onScheduleStockSwipeAutospaceTimer(long delayMs) {
                session.cancelStockSwipeAutospaceTimer();
                session.core.stockSwipeAutospacePending = true;
                final MultiGlideWordSession.LifecycleCallbacks self = this;
                session.stockSwipeAutospaceRunnable = () -> {
                    boolean autoSpaceEnabled = (context == null)
                            || GboardMultiGlideSettings.isAutoSpaceEnabled(context);
                    boolean autoSpaceBeforeWord = (context == null)
                            ? GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_BEFORE_WORD
                            : GboardMultiGlideSettings.isAutoSpaceBeforeWord(context);
                    session.core.finalizeStockSwipeAutospace(
                            autoSpaceEnabled, autoSpaceBeforeWord, editor, self);
                };
                session.mainHandler.postDelayed(session.stockSwipeAutospaceRunnable, delayMs);
            }

            @Override
            public void onCancelStockSwipeAutospaceTimer() {
                session.cancelStockSwipeAutospaceTimer();
                session.spacebarOverlay.cancelTimer();
            }

            @Override
            public void onBufferTimerUpdated(long durationMs) {
                if (durationMs > 0L && shouldShowSpacebarIndicator(context)) {
                    View spacebarView = resolveSpacebarTargetView(handler, session.geometry);
                    session.spacebarOverlay.startTimer(
                            spacebarView,
                            resolveSpacebarIndicatorAccent(spacebarView, context),
                            durationMs);
                } else {
                    session.spacebarOverlay.cancelTimer();
                }
            }

            @Override
            public void onWordReadyTimerElapsed() {
                if (shouldShowSpacebarIndicator(context)) {
                    View spacebarView = resolveSpacebarTargetView(handler, session.geometry);
                    session.spacebarOverlay.triggerFlash(
                            spacebarView,
                            resolveSpacebarIndicatorAccent(spacebarView, context));
                }
                triggerWordReadyVibration(context, handler, session);
            }

            @Override
            public void onNativeTopBarBlankChanged(boolean blank) {
                GboardThiccTopBarRuntime.setNativeTopBarBlankForMultiGlide(blank);
            }

            @Override
            public void onWordDecoded(
                    String word,
                    List<String> alternatives,
                    List<MultiGlideInputToken> tokens,
                    boolean capitalizeFirst,
                    String prevWord,
                    String baseline,
                    int promotedPassiveCount,
                    int rollbackDeleted,
                    int restingDropped,
                    List<WordCandidate> candidates
            ) {
                GboardMultiGlideTraceLogger.logWordDecode(
                        context,
                        session.geometry,
                        session.geometryFromNativeLayout,
                        session.lastKeyboardWidth,
                        session.lastKeyboardHeight,
                        activeLangLabel,
                        tokens,
                        word,
                        capitalizeFirst,
                        prevWord,
                        baseline,
                        promotedPassiveCount,
                        rollbackDeleted,
                        restingDropped,
                        candidates);
                if (word != null) {
                    GboardThiccTopBarRuntime.recordMultiGlideDecodedWord(word, alternatives);
                    if (context != null && !GboardThiccTopBarSettings.readEnabled(context)) {
                        GboardThiccTopBarRuntime.updateNativeTopBarLiveGuess(word);
                    }
                }
            }

            @Override
            public void onWordCommitted(
                    String word,
                    boolean autospaceInserted,
                    String prevWord,
                    List<String> alternatives
            ) {
                List<LanguagePack> packs = GboardMultiGlideDictionaryManager.getLoadedIfReady(
                        langs, session.geometry.hasDedicatedUmlauts());
                String commitLang = MultiGlideMultilingualDecoder.resolveCommitLanguage(
                        word, prevWord, packs, primaryLang);
                GboardMultiGlideDictionaryManager.recordCommittedWord(prevWord, word, commitLang);
                GboardMultiGlideTraceLogger.logCommit(context, word, autospaceInserted, prevWord);
                if (alternatives != null) {
                    GboardThiccTopBarRuntime.recordMultiGlideDecodedWord(word, alternatives);
                }
            }

            @Override
            public void onSkippedGesture(
                    String reason,
                    boolean hasSwipe,
                    boolean strokeHadMultiTouch,
                    int passiveBufferSize,
                    int restingDropped,
                    String baseline,
                    List<MultiGlideInputToken> completedTokens
            ) {
                GboardMultiGlideTraceLogger.logSkippedGesture(
                        context,
                        session.geometry,
                        session.geometryFromNativeLayout,
                        session.lastKeyboardWidth,
                        session.lastKeyboardHeight,
                        activeLangLabel,
                        reason,
                        hasSwipe,
                        strokeHadMultiTouch,
                        passiveBufferSize,
                        restingDropped,
                        baseline,
                        completedTokens);
            }
        };
    }

    static boolean shouldPrependLeadingSpace(String baselineBeforeText, boolean autoSpaceEnabled) {
        return MultiGlideWordSession.shouldPrependLeadingSpace(baselineBeforeText, autoSpaceEnabled);
    }

    static boolean shouldSuppressLeadingSpaceAfterDeletion(
            String previousSnapshot,
            String currentSnapshot
    ) {
        return MultiGlideWordSession.didDeleteTrailingChars(previousSnapshot, currentSnapshot);
    }

    static boolean isAttachingDirectlyToWord(String baselineBeforeText, boolean prependLeadingSpace) {
        return MultiGlideWordSession.isAttachingDirectlyToWord(baselineBeforeText, prependLeadingSpace);
    }

    static String lowercaseFirstChar(String word) {
        return MultiGlideWordSession.lowercaseFirstChar(word);
    }

    private static int previewWordToInputConnection(
            InputConnection ic,
            String word,
            String baselineBeforeText,
            boolean prependLeadingSpace
    ) {
        int extraChars = 0;
        try {
            ic.beginBatchEdit();
            try {
                // If BasicMotionEventHandler committed any stray rollover tap characters after ACTION_DOWN,
                // cleanly roll back to the pre-gesture baseline before displaying composing preview.
                if (baselineBeforeText != null) {
                    CharSequence currentSeq = ic.getTextBeforeCursor(TEXT_SNAPSHOT_CHARS, 0);
                    if (currentSeq != null) {
                        extraChars = computeExtraCharsAfterBaseline(
                                baselineBeforeText, currentSeq.toString());
                        if (extraChars > 0) {
                            ic.finishComposingText();
                            ic.deleteSurroundingText(extraChars, 0);
                        }
                    }
                }

                // Stock Gboard single-finger swipes/taps leave no trailing space; prepend one before a new
                // MultiGlide word so transitions like "es" + "dir" produce "es dir" instead of "esdir".
                if (prependLeadingSpace) {
                    ic.finishComposingText();
                    ic.commitText(" ", 1);
                }

                // Display Live Composing preview (underlined text, exact Kinetica behavior)
                ic.setComposingText(word, 1);
            } finally {
                ic.endBatchEdit();
            }
        } catch (Throwable t) {
            Log.w(TAG, "previewWordToInputConnection failed", t);
        }
        return extraChars;
    }

    private static String readTextBeforeCursorSnapshot(Object handler, Context context) {
        InputConnection ic = resolveActiveInputConnection(handler, context);
        if (ic == null) return null;
        try {
            CharSequence before = ic.getTextBeforeCursor(TEXT_SNAPSHOT_CHARS, 0);
            return before != null ? before.toString() : "";
        } catch (Throwable ignored) {
            return null;
        }
    }

    static final class PassiveTapBuffer extends MultiGlideWordSession.PassiveTapBuffer {
        void validateOnActionDown(String snapshotNow, boolean downOnLetter, long eventTimeMs) {
            super.validateOnActionDown(snapshotNow, downOnLetter, eventTimeMs, true);
        }

        void recordStroke(
                List<MultiGlideInputToken> completedTokens,
                boolean hasSwipe,
                boolean sawNonLetter,
                boolean strokeHadMultiTouch,
                String tapBaselineAtDown,
                long eventTimeMs
        ) {
            super.recordStroke(
                    completedTokens,
                    hasSwipe,
                    sawNonLetter,
                    strokeHadMultiTouch,
                    tapBaselineAtDown,
                    eventTimeMs,
                    true);
        }
    }

    static final class SingleTouchCombineBuffer extends MultiGlideWordSession.SingleTouchCombineBuffer {
        void validateOnActionDown(
                String snapshotNow,
                boolean downOnLetter,
                long eventTimeMs,
                int combineDelayMs
        ) {
            super.validateOnActionDown(snapshotNow, downOnLetter, eventTimeMs, combineDelayMs, true);
        }

        void recordStroke(
                List<MultiGlideInputToken> completedTokens,
                boolean strokeHasSwipe,
                boolean sawNonLetter,
                String tapBaselineAtDown,
                long eventTimeMs,
                int combineDelayMs
        ) {
            super.recordStroke(
                    completedTokens,
                    strokeHasSwipe,
                    sawNonLetter,
                    tapBaselineAtDown,
                    eventTimeMs,
                    combineDelayMs,
                    true);
        }
    }

    static boolean isCombinePrefix(String prefix) {
        return MultiGlideWordSession.isCombinePrefix(prefix);
    }

    static int computeExtraCharsAfterBaseline(String baselineBeforeText, String currentStr) {
        return MultiGlideWordSession.computeExtraCharsAfterBaseline(baselineBeforeText, currentStr);
    }

    private static HandlerSession getOrCreateSession(Object handler) {
        synchronized (SESSIONS) {
            HandlerSession session = SESSIONS.get(handler);
            if (session == null) {
                session = new HandlerSession();
                SESSIONS.put(handler, session);
            }
            return session;
        }
    }

    private static Context extractContext(Object handler) {
        probeHandlerFields(handler);
        try {
            if (contextField != null) {
                Object c = contextField.get(handler);
                if (c instanceof Context) {
                    cacheAppContext((Context) c);
                    return (Context) c;
                }
            }
            if (keyboardViewField != null) {
                Object v = keyboardViewField.get(handler);
                if (v instanceof View) {
                    Context c = ((View) v).getContext();
                    if (c != null) {
                        cacheAppContext(c);
                        return c;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return cachedContext;
    }

    private static volatile Field basicKeyboardViewField;
    private static volatile Class<?> basicKeyboardViewScannedClass;

    private static View extractKeyboardViewFromBasicHandler(Object basicHandler) {
        if (basicHandler == null) return null;
        try {
            Class<?> cls = basicHandler.getClass();
            if (basicKeyboardViewScannedClass != cls) {
                Field found = null;
                for (Class<?> c = cls; c != null && c != Object.class && found == null; c = c.getSuperclass()) {
                    for (Field f : c.getDeclaredFields()) {
                        if (View.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object val = f.get(basicHandler);
                            if (val instanceof View && val.getClass().getSimpleName().contains("SoftKeyboardView")) {
                                found = f;
                                break;
                            }
                        }
                    }
                }
                basicKeyboardViewField = found;
                basicKeyboardViewScannedClass = cls;
            }
            if (basicKeyboardViewField != null) {
                Object v = basicKeyboardViewField.get(basicHandler);
                if (v instanceof View) {
                    return (View) v;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static char findSoftKeyCharAt(View view, float localX, float localY) {
        if (view == null || view.getVisibility() != View.VISIBLE) return '\0';
        if (view.getClass().getSimpleName().contains("SoftKeyView")) {
            return Character.toLowerCase(extractRawSingleLetterFromSoftKeyView(view));
        }
        if (view instanceof ViewGroup group) {
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (child == null || child.getVisibility() != View.VISIBLE) continue;
                float cx = child.getX();
                float cy = child.getY();
                if (localX >= cx && localX <= cx + child.getWidth()
                        && localY >= cy && localY <= cy + child.getHeight()) {
                    char hit = findSoftKeyCharAt(child, localX - cx, localY - cy);
                    if (hit != '\0') {
                        return hit;
                    }
                }
            }
        }
        return '\0';
    }

    private static View extractKeyboardView(Object handler) {
        probeHandlerFields(handler);
        try {
            if (keyboardViewField != null) {
                Object v = keyboardViewField.get(handler);
                if (v instanceof View) return (View) v;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static InputConnection resolveActiveInputConnection(Object handler, Context context) {
        try {
            Context cur = context;
            while (cur instanceof ContextWrapper && !(cur instanceof InputMethodService)) {
                cur = ((ContextWrapper) cur).getBaseContext();
            }
            if (cur instanceof InputMethodService) {
                InputConnection ic = ((InputMethodService) cur).getCurrentInputConnection();
                if (ic != null) return ic;
            }
        } catch (Throwable ignored) {
        }
        View kv = extractKeyboardView(handler);
        if (kv != null) {
            try {
                Context vCtx = kv.getContext();
                while (vCtx instanceof ContextWrapper && !(vCtx instanceof InputMethodService)) {
                    vCtx = ((ContextWrapper) vCtx).getBaseContext();
                }
                if (vCtx instanceof InputMethodService) {
                    InputConnection ic = ((InputMethodService) vCtx).getCurrentInputConnection();
                    if (ic != null) return ic;
                }
            } catch (Throwable ignored) {
            }
            return ThiccTopBarGboardReflector.resolveInputConnectionViaHierarchy(kv);
        }
        return null;
    }

    private static void ensureGeometryUpdated(
            Object handler,
            HandlerSession session,
            Context context
    ) {
        probeHandlerFields(handler);
        View keyboardView = null;
        try {
            if (keyboardViewField != null) {
                Object v = keyboardViewField.get(handler);
                if (v instanceof View) {
                    keyboardView = (View) v;
                }
            }
        } catch (Throwable ignored) {
        }

        Object nativeLayout = null;
        try {
            if (nativeLayoutDataField != null) {
                nativeLayout = nativeLayoutDataField.get(handler);
            }
        } catch (Throwable ignored) {
        }

        int width = (keyboardView != null && keyboardView.getWidth() > 0)
                ? keyboardView.getWidth()
                : 1080;
        int height = (keyboardView != null && keyboardView.getHeight() > 0)
                ? keyboardView.getHeight()
                : 680;

        if (session.geometryReady
                && width == session.lastKeyboardWidth
                && height == session.lastKeyboardHeight
                && session.lastNativeLayoutObj == nativeLayout
                && (session.geometryFromNativeLayout || nativeLayout == null)) {
            return;
        }

        session.lastKeyboardWidth = width;
        session.lastKeyboardHeight = height;
        session.lastNativeLayoutObj = nativeLayout;

        if (nativeLayout != null) {
            boolean[] hasUmlaut = new boolean[] {false};
            List<KeySpec> nativeKeys = extractKeysFromNativeLayout(nativeLayout, hasUmlaut);
            if (nativeKeys.size() >= 20) {
                applyGeometryKeys(session, nativeKeys, hasUmlaut[0], true);
                return;
            }
        }

        if (keyboardView instanceof ViewGroup) {
            List<KeySpec> extracted = new ArrayList<>(32);
            boolean[] hasUmlaut = new boolean[] {false};
            collectLetterKeysFromViewHierarchy((ViewGroup) keyboardView, keyboardView, extracted, hasUmlaut);
            if (extracted.size() >= 20) {
                applyGeometryKeys(session, extracted, hasUmlaut[0], false);
                return;
            }
        }

        String lang = GboardMultiGlideDictionaryManager.detectActiveLanguage(context);
        boolean qwertz = "de".equalsIgnoreCase(lang);
        MultiGlideGeometry fallback = MultiGlideGeometry.createStandardLayout(width, height, qwertz);
        session.updateGeometry(fallback);
        session.geometryReady = true;
        session.geometryFromNativeLayout = false;
    }

    private static void applyGeometryKeys(
            HandlerSession session,
            List<KeySpec> keys,
            boolean hasUmlauts,
            boolean fromNativeLayout
    ) {
        float sumW = 0f;
        float sumH = 0f;
        int letterCount = 0;
        for (int i = 0; i < keys.size(); i++) {
            KeySpec k = keys.get(i);
            if (MultiGlideAlphabet.charIndex(k.character) >= 0) {
                sumW += k.width;
                sumH += k.height;
                letterCount++;
            }
        }
        float avgW = letterCount > 0 ? sumW / letterCount : 96f;
        float avgH = letterCount > 0 ? sumH / letterCount : 140f;
        MultiGlideGeometry next = new MultiGlideGeometry();
        next.setKeys(keys, avgW, avgH, hasUmlauts);
        session.updateGeometry(next);
        session.geometryReady = true;
        session.geometryFromNativeLayout = fromNativeLayout;
    }

    /**
     * Extracts exact per-key center coordinates and bounds from Gboard's internal keyboard
     * layout data (`Ltjz`: SparseArray<SoftKeyView>, float[] centerX, float[] centerY,
     * int[] width, int[] height). Works even on Canvas-rendered Gboard themes without TextViews.
     */
    static List<KeySpec> extractKeysFromNativeLayout(Object nativeLayout, boolean[] hasUmlautOut) {
        List<KeySpec> out = new ArrayList<>(36);
        if (nativeLayout == null) return out;
        try {
            probeNativeLayoutClass(nativeLayout.getClass());
            if (nativeLayoutKeysArrayField == null) return out;

            Object sparseObj = nativeLayoutKeysArrayField.get(nativeLayout);
            if (!(sparseObj instanceof SparseArray)) return out;
            SparseArray<?> keyMap = (SparseArray<?>) sparseObj;
            int n = keyMap.size();
            if (n < 20) return out;

            resolveNativeCoordinateArraysIfNeeded(nativeLayout, n);
            if (nativeLayoutCenterXField == null || nativeLayoutCenterYField == null) return out;

            Object cxObj = nativeLayoutCenterXField.get(nativeLayout);
            Object cyObj = nativeLayoutCenterYField.get(nativeLayout);
            if (!(cxObj instanceof float[]) || !(cyObj instanceof float[])) return out;
            float[] cxArr = (float[]) cxObj;
            float[] cyArr = (float[]) cyObj;
            if (cxArr.length < n || cyArr.length < n) return out;

            int[] wArr = null;
            int[] hArr = null;
            if (nativeLayoutWidthArrField != null) {
                Object wObj = nativeLayoutWidthArrField.get(nativeLayout);
                if (wObj instanceof int[] && ((int[]) wObj).length >= n) wArr = (int[]) wObj;
            }
            if (nativeLayoutHeightArrField != null) {
                Object hObj = nativeLayoutHeightArrField.get(nativeLayout);
                if (hObj instanceof int[] && ((int[]) hObj).length >= n) hArr = (int[]) hObj;
            }

            Object[] keyObjs = new Object[n];
            for (int i = 0; i < n; i++) {
                keyObjs[i] = keyMap.valueAt(i);
            }
            return extractKeysFromNativeLayoutArrays(keyObjs, cxArr, cyArr, wArr, hArr, hasUmlautOut);
        } catch (Throwable ignored) {
        }
        return out;
    }

    static List<KeySpec> extractKeysFromNativeLayoutArrays(
            Object[] keyObjs,
            float[] cxArr,
            float[] cyArr,
            int[] wArr,
            int[] hArr,
            boolean[] hasUmlautOut
    ) {
        List<KeySpec> out = new ArrayList<>(36);
        if (keyObjs == null || cxArr == null || cyArr == null) return out;
        int n = Math.min(keyObjs.length, Math.min(cxArr.length, cyArr.length));
        Set<Character> seenChars = new HashSet<>(36);
        for (int i = 0; i < n; i++) {
            Object keyObj = keyObjs[i];
            if (keyObj == null) continue;
            if (keyObj instanceof View && ((View) keyObj).getVisibility() != View.VISIBLE) {
                continue;
            }
            float w = (wArr != null && i < wArr.length)
                    ? wArr[i]
                    : ((keyObj instanceof View) ? ((View) keyObj).getWidth() : 0f);
            float h = (hArr != null && i < hArr.length)
                    ? hArr[i]
                    : ((keyObj instanceof View) ? ((View) keyObj).getHeight() : 0f);
            if (w <= 10f || h <= 10f) continue;

            char ch = extractSupportedCharFromSoftKey(keyObj);
            if (ch == '\0') {
                out.add(new KeySpec('\0', cxArr[i], cyArr[i], w, h));
                continue;
            }
            if (ch == 'ä' || ch == 'ö' || ch == 'ü') {
                if (hasUmlautOut != null && hasUmlautOut.length > 0) {
                    hasUmlautOut[0] = true;
                }
            }
            if (seenChars.add(ch)) {
                out.add(new KeySpec(ch, cxArr[i], cyArr[i], w, h));
            }
        }
        return out;
    }

    private static void probeNativeLayoutClass(Class<?> layoutCls) {
        if (nativeLayoutKeysArrayField != null) return;
        Field sparseField = null;
        Field fField = null;
        Field gField = null;
        Field dField = null;
        Field eField = null;
        List<Field> floatArrays = new ArrayList<>(4);
        List<Field> intArrays = new ArrayList<>(6);
        for (Field f : layoutCls.getDeclaredFields()) {
            f.setAccessible(true);
            Class<?> t = f.getType();
            String name = f.getName();
            if (SparseArray.class.isAssignableFrom(t) && sparseField == null) {
                sparseField = f;
            } else if (t == float[].class) {
                floatArrays.add(f);
                if ("f".equals(name)) fField = f;
                else if ("g".equals(name)) gField = f;
            } else if (t == int[].class) {
                intArrays.add(f);
                if ("d".equals(name)) dField = f;
                else if ("e".equals(name)) eField = f;
            }
        }
        if (sparseField != null) nativeLayoutKeysArrayField = sparseField;
        if (fField != null && gField != null) {
            nativeLayoutCenterXField = fField;
            nativeLayoutCenterYField = gField;
        } else if (floatArrays.size() >= 2 && "centerX".equalsIgnoreCase(floatArrays.get(0).getName())) {
            nativeLayoutCenterXField = floatArrays.get(0);
            nativeLayoutCenterYField = floatArrays.get(1);
        }
        if (dField != null && eField != null) {
            nativeLayoutWidthArrField = dField;
            nativeLayoutHeightArrField = eField;
        } else if (intArrays.size() >= 4) {
            for (Field f : intArrays) {
                String n = f.getName().toLowerCase(java.util.Locale.ROOT);
                if (n.contains("width")) nativeLayoutWidthArrField = f;
                else if (n.contains("height")) nativeLayoutHeightArrField = f;
            }
        }
        StringBuilder missing = new StringBuilder();
        if (nativeLayoutKeysArrayField == null) appendMissingMember(missing, "keysArray");
        if (nativeLayoutCenterXField == null) appendMissingMember(missing, "centerX(f)");
        if (nativeLayoutCenterYField == null) appendMissingMember(missing, "centerY(g)");
        if (nativeLayoutWidthArrField == null) appendMissingMember(missing, "widthArr(d)");
        if (nativeLayoutHeightArrField == null) appendMissingMember(missing, "heightArr(e)");
        if (missing.length() > 0) {
            Log.w(TAG, "probeNativeLayoutClass(" + layoutCls.getSimpleName()
                    + ") missing fields: " + missing);
        }
    }

    private static void resolveNativeCoordinateArraysIfNeeded(Object nativeLayout, int count) {
        if (nativeLayoutCenterXField != null && nativeLayoutCenterYField != null) return;
        try {
            List<Field> floatFields = new ArrayList<>(4);
            for (Field f : nativeLayout.getClass().getDeclaredFields()) {
                if (f.getType() == float[].class) {
                    f.setAccessible(true);
                    Object arr = f.get(nativeLayout);
                    if (arr instanceof float[] && ((float[]) arr).length >= count) {
                        floatFields.add(f);
                    }
                }
            }
            if (floatFields.size() >= 2) {
                Field bestX = floatFields.get(0);
                Field bestY = floatFields.get(1);
                int d0 = countDistinctQuantized((float[]) bestX.get(nativeLayout), count);
                int d1 = countDistinctQuantized((float[]) bestY.get(nativeLayout), count);
                if (d1 > d0) {
                    Field tmp = bestX;
                    bestX = bestY;
                    bestY = tmp;
                }
                nativeLayoutCenterXField = bestX;
                nativeLayoutCenterYField = bestY;
            }
        } catch (Throwable ignored) {
        }
    }

    private static int countDistinctQuantized(float[] arr, int n) {
        Set<Integer> buckets = new HashSet<>(16);
        int limit = Math.min(n, arr.length);
        for (int i = 0; i < limit; i++) {
            buckets.add(Math.round(arr[i] / 12f));
        }
        return buckets.size();
    }

    static boolean isSupportedGeometryChar(char ch) {
        return MultiGlideAccentFolder.isFoldableLatinLetter(ch)
                || MultiGlideGeometry.NO_SPACE_BEFORE.indexOf(ch) >= 0;
    }

    static final long GBOARD_STATE_SHIFT = 0x1L;
    static final long GBOARD_STATE_SHIFT_LOCK_MASK = 0x2L;
    static final long GBOARD_STATE_SHIFT_LOCK = 0x3L;
    static final long GBOARD_STATE_CAPS = 0x20000000000L;
    static final long GBOARD_STATE_CAPS_LOCK = 0x60000000000L;

    /**
     * Reads Gboard's live Shift / Caps Lock state directly from the motion-event host bridge
     * ({@code handler.p.b()} -> {@code IKeyboard.getStates()}), falling back to {@code SoftKeyView}
     * state bitmasks and key-label casing inspection if reflection is unavailable.
     */
    static MultiGlideWordSession.CapsMode readKeyboardCapsMode(Object handler) {
        if (handler == null) return MultiGlideWordSession.CapsMode.AUTO;
        long liveState = readHostBridgeKeyboardState(handler);
        if (liveState >= 0L) {
            return capsModeFromKeyboardState(liveState);
        }
        Object kbView = null;
        try {
            if (keyboardViewField != null) {
                kbView = keyboardViewField.get(handler);
            }
            long combinedState = readCombinedSoftKeyStateMask(handler, kbView);
            if (combinedState >= 0L) {
                return capsModeFromStateMask(combinedState, handler, kbView);
            }
        } catch (Throwable ignored) {
        }
        return detectCapsModeFromKeyLabels(handler, kbView);
    }

    private static long readHostBridgeKeyboardState(Object handler) {
        try {
            if (hostBridgeField == null || getKeyboardStateMethod == null) {
                return -1L;
            }
            Object bridge = hostBridgeField.get(handler);
            if (bridge == null) {
                return -1L;
            }
            Object res = getKeyboardStateMethod.invoke(bridge);
            if (res instanceof Long) {
                return ((Long) res).longValue();
            }
        } catch (Throwable ignored) {
        }
        return -1L;
    }

    static MultiGlideWordSession.CapsMode capsModeFromKeyboardState(long state) {
        if ((state & GBOARD_STATE_SHIFT_LOCK) == GBOARD_STATE_SHIFT_LOCK
                || (state & GBOARD_STATE_CAPS_LOCK) == GBOARD_STATE_CAPS_LOCK) {
            return MultiGlideWordSession.CapsMode.CAPS_LOCK;
        }
        if ((state & GBOARD_STATE_SHIFT) != 0L
                || (state & GBOARD_STATE_CAPS) != 0L) {
            return MultiGlideWordSession.CapsMode.SHIFT;
        }
        return MultiGlideWordSession.CapsMode.NONE;
    }

    private static long readCombinedSoftKeyStateMask(Object handler, Object kbView) {
        long combined = 0L;
        int inspected = 0;
        try {
            if (nativeLayoutDataField != null && nativeLayoutKeysArrayField != null) {
                Object nativeLayout = nativeLayoutDataField.get(handler);
                if (nativeLayout != null) {
                    Object sparseObj = nativeLayoutKeysArrayField.get(nativeLayout);
                    if (sparseObj instanceof SparseArray) {
                        SparseArray<?> map = (SparseArray<?>) sparseObj;
                        for (int i = 0; i < map.size(); i++) {
                            Object keyObj = map.valueAt(i);
                            if (keyObj == null) continue;
                            if (keyObj instanceof View && ((View) keyObj).getVisibility() != View.VISIBLE) {
                                continue;
                            }
                            Field f = resolveUniqueLongField(keyObj.getClass(), "f", softKeyViewStateField);
                            if (f == null) continue;
                            softKeyViewStateField = f;
                            combined |= f.getLong(keyObj);
                            inspected++;
                            if ((combined & GBOARD_STATE_SHIFT_LOCK_MASK) != 0L) {
                                return combined;
                            }
                        }
                    }
                }
            }
            if (inspected == 0 && kbView instanceof ViewGroup) {
                long[] out = new long[] {0L, 0L}; // [0]=combined, [1]=count
                collectSoftKeyStateFromViewGroup((ViewGroup) kbView, out);
                if (out[1] > 0L) {
                    return out[0];
                }
            }
        } catch (Throwable ignored) {
        }
        return (inspected > 0) ? combined : -1L;
    }

    private static void collectSoftKeyStateFromViewGroup(ViewGroup group, long[] out) throws IllegalAccessException {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) continue;
            if (child.getClass().getSimpleName().contains("SoftKeyView")) {
                Field f = resolveUniqueLongField(child.getClass(), "f", softKeyViewStateField);
                if (f != null) {
                    softKeyViewStateField = f;
                    out[0] |= f.getLong(child);
                    out[1]++;
                    if ((out[0] & GBOARD_STATE_SHIFT_LOCK_MASK) != 0L) {
                        return;
                    }
                }
            } else if (child instanceof ViewGroup) {
                collectSoftKeyStateFromViewGroup((ViewGroup) child, out);
                if ((out[0] & GBOARD_STATE_SHIFT_LOCK_MASK) != 0L) {
                    return;
                }
            }
        }
    }

    private static MultiGlideWordSession.CapsMode capsModeFromStateMask(
            long state,
            Object handler,
            Object kbView
    ) {
        MultiGlideWordSession.CapsMode fromBits = capsModeFromKeyboardState(state);
        if (fromBits != MultiGlideWordSession.CapsMode.NONE) {
            return fromBits;
        }
        // Cross-check letter key labels in case Gboard shifts bit positions in a future build.
        if (detectCapsModeFromKeyLabels(handler, kbView) == MultiGlideWordSession.CapsMode.SHIFT) {
            return MultiGlideWordSession.CapsMode.SHIFT;
        }
        return MultiGlideWordSession.CapsMode.NONE;
    }

    private static Field resolveUniqueLongField(Class<?> cls, String preferredName, Field cached) {
        if (cached != null) return cached;
        if (cls == null) return null;
        Field unique = null;
        int longCount = 0;
        for (Field f : cls.getDeclaredFields()) {
            if (f.getType() == long.class) {
                f.setAccessible(true);
                if (preferredName.equals(f.getName())) {
                    return f;
                }
                unique = f;
                longCount++;
            }
        }
        return (longCount == 1) ? unique : null;
    }

    private static MultiGlideWordSession.CapsMode detectCapsModeFromKeyLabels(Object handler, Object kbView) {
        int[] counts = new int[2]; // [0]=upper, [1]=lower
        try {
            if (nativeLayoutDataField != null && nativeLayoutKeysArrayField != null) {
                Object nativeLayout = nativeLayoutDataField.get(handler);
                if (nativeLayout != null) {
                    Object sparseObj = nativeLayoutKeysArrayField.get(nativeLayout);
                    if (sparseObj instanceof SparseArray) {
                        SparseArray<?> map = (SparseArray<?>) sparseObj;
                        for (int i = 0; i < map.size() && (counts[0] + counts[1]) < 8; i++) {
                            Object keyObj = map.valueAt(i);
                            if (keyObj == null) continue;
                            if (keyObj instanceof View && ((View) keyObj).getVisibility() != View.VISIBLE) {
                                continue;
                            }
                            tallyRawLetterCase(extractRawSupportedCharFromSoftKey(keyObj), counts);
                        }
                    }
                }
            }
            if ((counts[0] + counts[1]) < 3 && kbView instanceof ViewGroup) {
                tallyKeyLabelsFromViewGroup((ViewGroup) kbView, counts);
            }
        } catch (Throwable ignored) {
        }
        if (counts[0] >= 3 && counts[0] > counts[1]) {
            return MultiGlideWordSession.CapsMode.SHIFT;
        }
        if (counts[1] >= 3 && counts[1] > counts[0]) {
            return MultiGlideWordSession.CapsMode.NONE;
        }
        return MultiGlideWordSession.CapsMode.AUTO;
    }

    private static void tallyKeyLabelsFromViewGroup(ViewGroup group, int[] counts) {
        for (int i = 0; i < group.getChildCount() && (counts[0] + counts[1]) < 8; i++) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) continue;
            if (child.getClass().getSimpleName().contains("SoftKeyView")) {
                tallyRawLetterCase(extractRawSupportedCharFromSoftKey(child), counts);
            } else if (child instanceof ViewGroup) {
                tallyKeyLabelsFromViewGroup((ViewGroup) child, counts);
            }
        }
    }

    private static void tallyRawLetterCase(char rawCh, int[] counts) {
        if (rawCh == '\0' || !Character.isLetter(rawCh)) return;
        if (Character.isUpperCase(rawCh)) {
            counts[0]++;
        } else if (Character.isLowerCase(rawCh)) {
            counts[1]++;
        }
    }

    private static char extractSupportedCharFromSoftKey(Object softKeyObj) {
        char raw = extractRawSupportedCharFromSoftKey(softKeyObj);
        return (raw == '\0' || raw == MultiGlideGeometry.KEY_CHAR_BACKSPACE)
                ? raw
                : Character.toLowerCase(raw);
    }

    private static char extractRawSupportedCharFromSoftKey(Object softKeyObj) {
        try {
            Field defField = softKeyViewDefField;
            if (defField == null) {
                Class<?> cur = softKeyObj.getClass();
                while (cur != null && cur != Object.class && defField == null) {
                    for (Field f : cur.getDeclaredFields()) {
                        if (f.getType().getName().endsWith("SoftKeyDef")) {
                            f.setAccessible(true);
                            defField = f;
                            softKeyViewDefField = f;
                            break;
                        }
                    }
                    cur = cur.getSuperclass();
                }
            }
            Object softKeyDef = (defField != null) ? defField.get(softKeyObj) : null;
            if (softKeyDef != null) {
                char fromDef = extractRawSupportedCharFromSoftKeyDef(softKeyDef);
                if (fromDef != '\0') return fromDef;
            }
        } catch (Throwable ignored) {
        }
        if (softKeyObj instanceof View) {
            return extractRawSingleLetterFromSoftKeyView((View) softKeyObj);
        }
        return '\0';
    }

    private static char extractRawSupportedCharFromSoftKeyDef(Object softKeyDef) {
        try {
            if (softKeyDefLabelsField == null) {
                Field iCandidate = null;
                List<Field> listFields = new ArrayList<>(4);
                for (Field f : softKeyDef.getClass().getDeclaredFields()) {
                    if (List.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        listFields.add(f);
                        if ("i".equals(f.getName())) iCandidate = f;
                    } else if (softKeyDefDescField == null && f.getType() == String.class && "m".equals(f.getName())) {
                        f.setAccessible(true);
                        softKeyDefDescField = f;
                    }
                }
                if (iCandidate != null) {
                    Object val = iCandidate.get(softKeyDef);
                    if (val instanceof List && !((List<?>) val).isEmpty() && ((List<?>) val).get(0) instanceof CharSequence) {
                        softKeyDefLabelsField = iCandidate;
                    }
                }
                if (softKeyDefLabelsField == null) {
                    for (Field f : listFields) {
                        Object val = f.get(softKeyDef);
                        if (val instanceof List && !((List<?>) val).isEmpty() && ((List<?>) val).get(0) instanceof CharSequence) {
                            softKeyDefLabelsField = f;
                            break;
                        }
                    }
                }
            }

            if (softKeyDefLabelsField != null) {
                Object val = softKeyDefLabelsField.get(softKeyDef);
                if (val instanceof List) {
                    List<?> labels = (List<?>) val;
                    for (int i = 0; i < labels.size(); i++) {
                        Object item = labels.get(i);
                        if (item instanceof CharSequence) {
                            String text = item.toString().trim();
                            if (text.length() == 1) {
                                char raw = text.charAt(0);
                                if (isSupportedGeometryChar(Character.toLowerCase(raw))) {
                                    return raw;
                                }
                            }
                        }
                    }
                }
            }

            if (softKeyDefDescField != null) {
                Object desc = softKeyDefDescField.get(softKeyDef);
                if (desc instanceof String) {
                    String s = ((String) desc).trim();
                    if (s.length() == 1) {
                        char raw = s.charAt(0);
                        if (isSupportedGeometryChar(Character.toLowerCase(raw))) {
                            return raw;
                        }
                    } else if (isBackspaceDescription(s)) {
                        return MultiGlideGeometry.KEY_CHAR_BACKSPACE;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return '\0';
    }

    private static boolean isBackspaceDescription(String desc) {
        if (desc == null || desc.isEmpty()) return false;
        String lower = desc.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("delete")
                || lower.contains("backspace")
                || lower.contains("löschen")
                || lower.contains("entfernen");
    }

    private static void collectLetterKeysFromViewHierarchy(
            ViewGroup group,
            View rootKeyboardView,
            List<KeySpec> out,
            boolean[] hasUmlaut
    ) {
        int count = group.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) continue;

            if (child.getClass().getSimpleName().contains("SoftKeyView")) {
                float w = child.getWidth();
                float h = child.getHeight();
                if (w > 10f && h > 10f) {
                    float cx = child.getX() + w * 0.5f;
                    float cy = child.getY() + h * 0.5f;
                    View parent = (View) child.getParent();
                    while (parent != null && parent != rootKeyboardView) {
                        cx += parent.getX();
                        cy += parent.getY();
                        parent = (parent.getParent() instanceof View)
                                ? (View) parent.getParent()
                                : null;
                    }
                    char labelChar = extractSupportedCharFromSoftKey(child);
                    if (labelChar == '\0') {
                        out.add(new KeySpec('\0', cx, cy, w, h));
                    } else {
                        if (labelChar == 'ä' || labelChar == 'ö' || labelChar == 'ü') {
                            hasUmlaut[0] = true;
                        }
                        int idx = MultiGlideAlphabet.charIndex(labelChar);
                        char storeChar = (idx >= 0) ? MultiGlideAlphabet.indexToChar(idx) : labelChar;
                        out.add(new KeySpec(storeChar, cx, cy, w, h));
                    }
                }
            } else if (child instanceof ViewGroup) {
                collectLetterKeysFromViewHierarchy((ViewGroup) child, rootKeyboardView, out, hasUmlaut);
            }
        }
    }

    private static char extractRawSingleLetterFromSoftKeyView(View softKeyView) {
        if (softKeyView instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) softKeyView;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c instanceof TextView && c.getVisibility() == View.VISIBLE) {
                    CharSequence text = ((TextView) c).getText();
                    if (text != null && text.length() == 1) {
                        char raw = text.charAt(0);
                        if (isSupportedGeometryChar(Character.toLowerCase(raw))) {
                            return raw;
                        }
                    }
                }
            }
        }
        CharSequence desc = softKeyView.getContentDescription();
        if (desc != null && desc.length() == 1) {
            char raw = desc.charAt(0);
            if (isSupportedGeometryChar(Character.toLowerCase(raw))) {
                return raw;
            }
        }
        return '\0';
    }

    private static Object findSampleKeyView(View root) {
        if (root == null) return null;
        if (root.getClass().getName().contains("SoftKeyView")) {
            return root;
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                Object res = findSampleKeyView(vg.getChildAt(i));
                if (res != null) return res;
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    private static void ensureSoftKeyMapPopulated(Object handler, HandlerSession session, MotionEvent event) {
        if (softKeyMapField == null || event == null) return;
        try {
            SparseArray<Object> map = (SparseArray<Object>) softKeyMapField.get(handler);
            if (map != null) {
                Object sample = null;
                if (map.size() > 0) {
                    sample = map.valueAt(0);
                    if (sample != null) cachedSampleKeyViewRef = new WeakReference<>(sample);
                }
                if (sample == null) {
                    WeakReference<Object> ref = cachedSampleKeyViewRef;
                    sample = (ref != null) ? ref.get() : null;
                }
                if (sample == null && keyboardViewField != null) {
                    Object kbView = keyboardViewField.get(handler);
                    if (kbView instanceof View) {
                        sample = findSampleKeyView((View) kbView);
                        if (sample != null) cachedSampleKeyViewRef = new WeakReference<>(sample);
                    }
                }
                if (sample != null) {
                    int count = event.getPointerCount();
                    for (int p = 0; p < count; p++) {
                        int pid = event.getPointerId(p);
                        if (map.get(pid) == null) {
                            float px = event.getX(p);
                            float py = event.getY(p);
                            if (session.geometry.isOnLetterArea(px, py)) {
                                map.put(pid, sample);
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void probeHandlerFields(Object handler) {
        if (handler == null) return;
        Class<?> handlerClass = handler.getClass();
        if (probedClasses.contains(handlerClass)) return;
        synchronized (GboardMultiGlideRuntime.class) {
            if (probedClasses.contains(handlerClass)) return;
            try {
                Class<?> cur = handlerClass;
                while (cur != null && cur != Object.class) {
                    for (Field f : cur.getDeclaredFields()) {
                        f.setAccessible(true);
                        Class<?> type = f.getType();
                        String name = f.getName();
                        if (Context.class.isAssignableFrom(type) && contextField == null) {
                            contextField = f;
                        } else if (type.getName().endsWith("SoftKeyboardView") && keyboardViewField == null) {
                            keyboardViewField = f;
                        } else if ((type.getName().endsWith("GestureOverlayView")
                                || ("h".equals(name) && View.class.isAssignableFrom(type)))
                                && gestureOverlayViewField == null) {
                            gestureOverlayViewField = f;
                        } else if ("v".equals(name) && type == boolean.class) {
                            gestureActiveFlagField = f;
                        } else if ("u".equals(name) && type == boolean.class) {
                            letterStartedField = f;
                        } else if ("Q".equals(name) && type == boolean.class) {
                            gestureResetField = f;
                        } else if ("d".equals(name) && SparseArray.class.isAssignableFrom(type)) {
                            softKeyMapField = f;
                        } else if (trailManagerField == null && tryProbeTrailManagerField(f)) {
                            // Resolved structurally (e.g. U:Lnhj in 18.5.4, R:Lolh in 18.8.1).
                        } else if ("p".equals(name) && type.isInterface()) {
                            hostBridgeField = f;
                            for (Method bm : type.getDeclaredMethods()) {
                                if (bm.getParameterCount() == 0 && bm.getReturnType() == void.class) {
                                    bm.setAccessible(true);
                                    claimOwnershipMethod = bm;
                                    break;
                                }
                            }
                            try {
                                Method stateMethod = type.getDeclaredMethod("b");
                                if (stateMethod.getReturnType() == long.class) {
                                    stateMethod.setAccessible(true);
                                    getKeyboardStateMethod = stateMethod;
                                }
                            } catch (Throwable ignored) {
                            }
                        } else if (nativeLayoutDataField == null && looksLikeNativeLayoutData(type)) {
                            nativeLayoutDataField = f;
                            probeNativeLayoutClass(type);
                        }
                    }
                    cur = cur.getSuperclass();
                }
                logMissingHandlerMembers(handlerClass);
            } catch (Throwable t) {
                Log.w(TAG, "probeHandlerFields(" + handlerClass.getSimpleName() + ") failed", t);
            } finally {
                probedClasses.add(handlerClass);
            }
        }
    }

    private static boolean tryProbeTrailManagerField(Field candidateField) {
        Class<?> type = candidateField.getType();
        if (type.isPrimitive() || type.isInterface() || type.isArray()) return false;
        String typeName = type.getName();
        if (typeName.startsWith("java.") || typeName.startsWith("android.")
                || typeName.startsWith("j$.")) {
            return false;
        }
        Field activeBool = null;
        Field sparseArray = null;
        Field startIndexArray = null;
        Field fadingList = null;
        for (Field tf : type.getDeclaredFields()) {
            if (Modifier.isStatic(tf.getModifiers())) continue;
            Class<?> ft = tf.getType();
            if (ft == boolean.class && activeBool == null) {
                activeBool = tf;
            } else if (SparseArray.class.isAssignableFrom(ft) && sparseArray == null) {
                sparseArray = tf;
            } else if (android.util.SparseIntArray.class.isAssignableFrom(ft) && startIndexArray == null) {
                startIndexArray = tf;
            } else if (List.class.isAssignableFrom(ft) && fadingList == null) {
                fadingList = tf;
            }
        }
        if (activeBool == null || sparseArray == null || startIndexArray == null || fadingList == null) {
            return false;
        }
        Method recycleMethod = null;
        for (Method tm : type.getDeclaredMethods()) {
            if (!Modifier.isStatic(tm.getModifiers())
                    && tm.getParameterCount() == 1
                    && tm.getParameterTypes()[0] == List.class) {
                recycleMethod = tm;
                break;
            }
        }
        if (recycleMethod == null) {
            return false;
        }
        activeBool.setAccessible(true);
        sparseArray.setAccessible(true);
        startIndexArray.setAccessible(true);
        fadingList.setAccessible(true);
        recycleMethod.setAccessible(true);
        trailManagerField = candidateField;
        trailActiveBoolField = activeBool;
        trailSparseArrayField = sparseArray;
        trailStartIndexArrayField = startIndexArray;
        trailFadingListField = fadingList;
        recyclePointsMethod = recycleMethod;
        return true;
    }

    private static void logMissingHandlerMembers(Class<?> handlerClass) {
        StringBuilder missing = new StringBuilder();
        if (contextField == null) appendMissingMember(missing, "context");
        if (keyboardViewField == null) appendMissingMember(missing, "SoftKeyboardView");
        if (gestureOverlayViewField == null) appendMissingMember(missing, "GestureOverlayView");
        if (gestureActiveFlagField == null) appendMissingMember(missing, "gestureActiveFlag(v)");
        if (letterStartedField == null) appendMissingMember(missing, "letterStarted(u)");
        if (gestureResetField == null) appendMissingMember(missing, "gestureReset(Q)");
        if (softKeyMapField == null) appendMissingMember(missing, "softKeyMap(d)");
        if (trailManagerField == null) appendMissingMember(missing, "trailManager(U)");
        if (trailManagerField != null) {
            if (trailActiveBoolField == null) appendMissingMember(missing, "trailManager.a");
            if (trailSparseArrayField == null) appendMissingMember(missing, "trailManager.b");
            if (trailStartIndexArrayField == null) appendMissingMember(missing, "trailManager.c");
            if (trailFadingListField == null) appendMissingMember(missing, "trailManager.e");
            if (recyclePointsMethod == null) appendMissingMember(missing, "trailManager.e(List)");
        }
        if (hostBridgeField == null) appendMissingMember(missing, "hostBridge(p)");
        if (hostBridgeField != null && claimOwnershipMethod == null) {
            appendMissingMember(missing, "hostBridge.m()");
        }
        if (nativeLayoutDataField == null) appendMissingMember(missing, "nativeLayoutData");
        if (missing.length() > 0) {
            Log.w(TAG, "probeHandlerFields(" + handlerClass.getSimpleName()
                    + ") missing members: " + missing);
        }
    }

    private static void appendMissingMember(StringBuilder sb, String name) {
        if (sb.length() > 0) sb.append(", ");
        sb.append(name);
    }

    private static boolean looksLikeNativeLayoutData(Class<?> type) {
        if (type == null || type.isPrimitive() || type.isInterface() || type.isArray()) {
            return false;
        }
        String pkgName = type.getName();
        if (pkgName.startsWith("android.") || pkgName.startsWith("java.") || pkgName.startsWith("dalvik.")) {
            return false;
        }
        boolean hasSparseArray = false;
        int floatArrayCount = 0;
        int intArrayCount = 0;
        for (Field f : type.getDeclaredFields()) {
            Class<?> ft = f.getType();
            if (SparseArray.class.isAssignableFrom(ft)) hasSparseArray = true;
            else if (ft == float[].class) floatArrayCount++;
            else if (ft == int[].class) intArrayCount++;
        }
        return hasSparseArray && floatArrayCount >= 2 && intArrayCount >= 2;
    }
}
