package app.yydarlinker.aicaptions.overlay;

import app.yydarlinker.aicaptions.CaptionCredentialRef;
import app.yydarlinker.aicaptions.CaptionDisplayPage;
import app.yydarlinker.aicaptions.CaptionEventTimeline;
import app.yydarlinker.aicaptions.CaptionLanguageProfile;
import app.yydarlinker.aicaptions.CaptionLinePlan;
import app.yydarlinker.aicaptions.CaptionPresentationBudget;
import app.yydarlinker.aicaptions.CaptionRenderSpec;
import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;
import app.yydarlinker.aicaptions.host.CaptionActions;
import app.yydarlinker.aicaptions.host.CaptionPlayer;
import app.yydarlinker.aicaptions.host.CaptionSurface;
import app.yydarlinker.aicaptions.host.NativeCaptionBridge;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.CaptionTextResolver;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Layout;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Choreographer;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.yydarlinker.caption.contracts.CaptionContracts;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Draws one caption event in one view. Layout never edits a translation or creates timeline events:
 * the pages come from the application, the player authority decides whether anything may show.
 */
public final class CaptionOverlay {
    /** What the overlay needs to know about the session that owns the text it shows. */
    public interface RenderGuard {
        boolean isValid();

        default void onApplied() {}

        default long displayPosition(long supplied) {
            return supplied;
        }

        default String identity() {
            return "";
        }

        default String session() {
            return "";
        }

        default long windowStart() {
            return -1;
        }

        default long windowEnd() {
            return -1;
        }

        default String blankReason() {
            return "";
        }

        /** Known when the guard was bound; never resolved on the render path. */
        default CaptionCredentialRef credential() {
            return CaptionCredentialRef.NONE;
        }
    }

    /**
     * Adjacent captions change text inside a box that stays up. A finished last page stays visible
     * for a short media time while the engine's next unit (or its hide) arrives, and a shown
     * caption stays while the next unit's pages are laid out off the main thread. Explicit hides,
     * seeks, owner changes and longer pauses still clear the box at once.
     */
    private static final long END_HOLD_MS = 800;

    private static final long SCAN_INTERVAL_MS = 500, DRAG_AFTER_MS = 350;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicLong COMMAND = new AtomicLong();
    private static final CaptionPageExecutor LAYOUTS = new CaptionPageExecutor();

    // ---- The views ----

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<FrameLayout> hostRef = new WeakReference<>(null),
            anchorRef = new WeakReference<>(null);
    private static WeakReference<TextView> textRef = new WeakReference<>(null);

    // ---- What is to be shown ----

    private static RenderGuard currentGuard;
    /** Event, plan and invalidation state owned by the UI thread. */
    private static final class PendingPage {
        String text = "", identity = "", canonicalHash = "", layout = "";
        long start = -1, end = -1, position = -1;
        boolean status, waiting, dirty = true, contentNow, layoutFailed, retried;
        CaptionRenderSpec spec = CaptionRenderSpec.LEGACY;
        CaptionEventTimeline timeline;
        List<CaptionDisplayPage> pages = Collections.emptyList();

        boolean timed() {
            return start >= 0 && end > start;
        }

        void resetLayout(String key) {
            layout = key;
            layoutFailed = retried = false;
        }

        void invalidateContent() {
            dirty = contentNow = true;
        }
    }

    private static final PendingPage pending = new PendingPage();
    private static int shownPage = -1;

    // ---- Layout and render bookkeeping ----

    /** Immutable geometry; background translation can measure without touching Views. */
    private static volatile CaptionPresentationBudget layoutBudget, planBudget;

    private static boolean reconcilingDisplayTime;
    private static long lastScan, layoutHoldSince = -1;
    private static String lastBlankIdentity, lastNotice = "", lastDisplayResult = "";
    private static String lastPresentationNotice = "";

    private static final Rect previous = new Rect();
    private static int previousScreenWidth;
    private static boolean previousShorts;
    private static CaptionPresentationDecision.Kind previousClass;

    /** Numerical presentation decisions; View lifetime and applied facts remain here. */
    private static final CaptionPresentationDecision presentationDecision =
            new CaptionPresentationDecision();

    private static int stableTextWidth;
    private static long nextPageAt;

    /** Numeric painted-size state; this View adapter owns only frame scheduling and drawing. */
    private static final CaptionGlyphTransition glyphTransition = new CaptionGlyphTransition();
    private static boolean glyphFrameScheduled;

    /** Size tier, resolved once per content commit. */
    private static int presentationTier = -1;
    /**
     * Glyph ink height of the layout currently on screen. Written only when a layout/page is
     * committed; the per-frame size law reads this cache instead of measuring the Paint.
     */
    static float layoutGlyphInkPx;
    private static GradientDrawable captionBackground;
    private static View touchProxy, dragSource;
    private static WeakReference<FrameLayout> touchHostRef = new WeakReference<>(null);

    /**
     * Geometry only moves the committed box. A new page plan is requested when the content changes,
     * when the mode model reports a new class, or when the committed plan cannot be reused. The
     * sheet animation itself never asks for a plan: its size is a draw-time transform.
     */
    private static final Rect videoGeometry = new Rect();
    private static int boxWidth, boxHeight, nextLeft, nextTop;
    /** The presentation class whose commit produced [boxWidth]; a later class is not fitted. */
    private static CaptionPresentationDecision.Kind boxClass;
    /** Width of the visible text box; the anchor itself stays full width for centering. */
    private static int contentWidth;
    private static boolean dragLandscape, dragShorts, pressed, dragMoved;
    private static boolean deferredDragRender, deferredDragClear;
    private static float dragPosition;

    private static final CaptionBottomObstacles bottomObstacles = new CaptionBottomObstacles();
    private static final CaptionSurface.Projection controlProjection = new CaptionSurface.Projection();
    private static final PathInterpolator CONTROL_EASE = new PathInterpolator(.2f, 0f, 0f, 1f);
    private static final Choreographer.FrameCallback CONTROL_FRAME = CaptionOverlay::advanceControlShift;
    private static float controlShift, controlTarget, controlLimit, controlFrom;
    private static long controlStarted;
    private static boolean controlAnimating, controlsVisible;

    /** One frame-aligned UI request; never postpones model authority, clear or quarantine. */
    private static volatile long playerRenderEpoch;

    private static Runnable playerRenderTask;
    private static WeakReference<View> playerFrameClock = new WeakReference<>(null);
    private static boolean applyingPlayerRender;
    private static float downY, dragStartCenter;
    private static int dragStartTop, dragStartShift;
    private static final Matrix DRAG_TO_GLOBAL = new Matrix(), DRAG_TO_PARENT = new Matrix();
    private static final float[] DRAG_VECTOR = new float[2];
    private static long downAt;
    private static boolean dragging;

    /**
     * Content and box geometry are applied in the animation phase, before the traversal that will
     * draw them. Pre-draw is kept for the draw-time transform only.
     */
    private static boolean beforeTraversalScheduled;

    private static final Choreographer.FrameCallback BEFORE_TRAVERSAL =
            frameTimeNanos -> {
                beforeTraversalScheduled = false;
                Activity owner = activityRef.get();
                if (owner == null || blocked() || guardInvalid() || nothingPending()) return;
                if (touchProxy == null) ensureTouchProxy(owner);
                advancePreparedPageIfDue();
                if (pending.contentNow) render();
            };

    /**
     * The frame clock of the painted glyph transition. A step is advanced only by real frame times;
     * no timer decides a visual parameter.
     */
    private static final Choreographer.FrameCallback GLYPH_FRAME =
            frameTimeNanos -> {
                glyphFrameScheduled = false;
                advanceDisplayedGlyph(frameTimeNanos);
                Activity owner = activityRef.get();
                TextView text = textRef.get();
                if (owner != null && text != null) applyCommentScale(owner, text);
            };

    private static final Runnable HOLD_EXPIRY =
            () -> {
                pending.dirty = true;
                render();
            };

    /** The long press itself arms the drag; a finger that never moves still gets its haptic. */
    private static final Runnable ARM_DRAG =
            () -> {
                FrameLayout host = hostRef.get(), anchor = anchorRef.get();
                TextView text = textRef.get();
                Rect video = liveVideoBounds();
                if (!pressed || blocked() || guardInvalid() || host == null || anchor == null
                        || text == null || video == null || video.isEmpty() || !anchorVisible()) return;
                dragStartTop = Math.round(anchor.getY()) - host.getScrollY();
                dragStartShift = Math.max(0, nextTop - dragStartTop);
                dragStartCenter = dragStartTop + boxHeight / 2f;
                dragPosition = (dragStartCenter - video.top) / video.height();
                dragging = true;
                dragMoved = false;
                nextTop = dragStartTop;
                resetControlAvoidance();
                text.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            };

    private static final ViewTreeObserver.OnPreDrawListener WATCH =
            () -> {
                // Never measure, set text or change LayoutParams here: a layout started in
                // pre-draw can only be applied by the next traversal. Pre-draw reads the current
                // matrices and applies the draw-time scale/translation; content and box geometry
                // are queued for the next frame's animation phase.
                if (pending.contentNow || nextPageDue()) requestBeforeTraversal();
                geometryFrame();
                // The caption must never cancel the window draw: a layout request belongs to the
                // next traversal, not to every other view on screen.
                return true;
            };

    private static boolean nextPageDue() {
        return nextPageAt > 0 && SystemClock.uptimeMillis() >= nextPageAt;
    }

    private static void requestBeforeTraversal() {
        if (beforeTraversalScheduled) return;
        beforeTraversalScheduled = true;
        Choreographer.getInstance().postFrameCallback(BEFORE_TRAVERSAL);
    }

    private CaptionOverlay() {}

    public static CaptionPresentationBudget budget() {
        return layoutBudget;
    }

    // ---- Authority ----

    /** Display permission and the compact quarantine live in the one player authority. */
    private static boolean suppressed() {
        return !CaptionPlayer.displayPermitted()
                && CaptionPlayer.state() != CaptionPlayer.UNKNOWN;
    }

    private static boolean guardedExpansion() {
        int state = CaptionPlayer.state();
        return state == CaptionPlayer.COMPACT
                || state == CaptionPlayer.TRANSITIONING_TO_REGULAR;
    }

    private static boolean blocked() {
        return NativeCaptionBridge.ccState() != NativeCaptionBridge.ON
                || CaptionPlayer.shortsExitBlocked()
                || suppressed() || guardedExpansion();
    }

    private static boolean nothingPending() {
        return pending.text.isEmpty() && pending.identity.isEmpty();
    }

    private static boolean guardInvalid() {
        return currentGuard != null && !currentGuard.isValid();
    }

    private static void main(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) r.run();
        else MAIN.post(r);
    }

    // ---- Commands ----

    public static void setActivity(Activity a) {
        CaptionPlayer.setOwner(a);
        main(
                () -> {
                    if (activityRef.get() != a) {
                        invalidatePlayerRender();
                        controlsVisible = false;
                        detach();
                    }
                    activityRef = new WeakReference<>(a);
                    CaptionSurface.activity(a);
                    pending.dirty = true;
                    render();
                });
    }

    public static void showStatus(String s, RenderGuard g) {
        show(s, true, g, "", -1, -1, -1, false, CaptionRenderSpec.LEGACY, "", null);
    }

    public static void showWaitingEvent(
            String s, RenderGuard g, String id, long start, long end, long position) {
        show(s, false, g, id, start, end, position, true, CaptionRenderSpec.LEGACY, "", null);
    }

    static void showEvent(
            String text,
            RenderGuard guard,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec) {
        showEvent(text, guard, id, start, end, at, spec, null);
    }

    public static void showEvent(
            String text,
            RenderGuard guard,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        // A failed or withheld event carries no text and clears the box.
        if (text == null || text.trim().isEmpty()) {
            hide(guard);
            return;
        }
        // Previously the timed Unit constructor enforced this before checking the guard.
        if (start >= 0 && end > start) Objects.requireNonNull(id);
        show(
                text,
                false,
                guard,
                id,
                start,
                end,
                at,
                false,
                spec,
                CaptionContracts.hash(text),
                sourceTimeline);
    }

    private static void show(
            String s,
            boolean status,
            RenderGuard g,
            String id,
            long start,
            long end,
            long position,
            boolean waiting,
            CaptionRenderSpec spec,
            String canonicalHash,
            CaptionEventTimeline sourceTimeline) {
        if (g != null && !g.isValid()) return;
        long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
        final long renderEpoch = playerRenderEpoch;
        main(
                () -> {
                    if (!accepts(g, command, renderEpoch)) return;
                    pending.spec = spec;
                    pending.canonicalHash = canonicalHash;
                    pending.timeline = sourceTimeline;
                    pending.text = s == null ? "" : s;
                    pending.identity = id;
                    pending.start = start;
                    pending.end = end;
                    pending.position = g == null ? position : g.displayPosition(position);
                    pending.pages = Collections.emptyList();
                    stableTextWidth = 0;

                    nextPageAt = 0;
                    shownPage = -1;
                    pending.status = status;
                    pending.waiting = waiting;
                    currentGuard = g;
                    pending.invalidateContent();
                    render();
                    if (g != null) g.onApplied();
                });
    }

    /**
     * Is this queued command still current? A guarded command is current while its guard is valid;
     * an unguarded one only until a newer command arrived.
     */
    private static boolean accepts(RenderGuard guard, long command, long renderEpoch) {
        if (renderEpoch != playerRenderEpoch) return false;
        if (guard == null) return command == COMMAND.get();
        if (!guard.isValid()) return false;
        COMMAND.incrementAndGet();
        return true;
    }

    public static void hide(RenderGuard g) {
        if (g != null && !g.isValid()) return;
        long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
        final long renderEpoch = playerRenderEpoch;
        main(
                () -> {
                    if (!accepts(g, command, renderEpoch)) return;
                    final long applyStarted = SystemClock.uptimeMillis();
                    invalidatePlayerRender();
                    forgetPending(g != null && dragging && !blocked());
                    currentGuard = g;
                    if (g == null) hideView();
                    else clearVisibleText(textRef.get());
                    if (g == null) return;
                    // The identity is diagnostic only: a blank is not a pending render.
                    pending.identity = g.identity();
                    pending.start = g.windowStart();
                    pending.end = g.windowEnd();
                    pending.position = g.displayPosition(pending.position);
                    displayResult(
                            activityRef.get(),
                            "empty",
                            g.blankReason(),
                            false,
                            0,
                            0,
                            "",
                            applyStarted);
                    pending.identity = "";
                    pending.start = -1;
                    pending.end = -1;
                    g.onApplied();
                });
    }

    static void clear() {
        clear(null);
    }

    /** Session cleanup cannot invalidate a newer session's queued render command. */
    public static void clear(RenderGuard guard) {
        if (guard != null && !guard.isValid()) return;
        long command = guard == null ? COMMAND.incrementAndGet() : COMMAND.get();
        main(
                () -> {
                    if (command != COMMAND.get() || guard != null && !guard.isValid()) return;
                    forgetPending(false);
                    invalidatePlayerRender();
                    pending.status = false;
                    currentGuard = null;
                    hideView();
                });
    }

    private static void forgetPending(boolean keepDraggedBox) {
        pending.text = "";
        pending.start = -1;
        pending.end = -1;
        pending.identity = "";
        pending.timeline = null;
        pending.pages = Collections.emptyList();
        shownPage = -1;

        nextPageAt = 0;
        pending.resetLayout("");
        pending.contentNow = false;
        if (!keepDraggedBox) resetGeometry();
    }

    public static void position(long position, RenderGuard owner) {
        if (owner != null && !owner.isValid()) return;
        main(
                () -> {
                    if (owner != null && !owner.isValid()) return;
                    long latest =
                            currentGuard != null && currentGuard.isValid()
                                    ? currentGuard.displayPosition(position)
                                    : owner == null ? position : owner.displayPosition(position);
                    long before = pending.position;
                    pending.position = latest;
                    boolean timed = pending.timed();
                    if (CaptionPageExecutor.indexAt(pending.pages, latest) != shownPage
                            || hasPendingTimedCaption()
                                    && (!ownsDisplayPosition(latest)
                                            || !ownsDisplayPosition(before))
                            || timed && (!inWindow(latest) || !inWindow(before))) {
                        pending.dirty = true;
                        render();
                    }
                });
    }

    private static boolean inWindow(long at) {
        return at >= pending.start && at < pending.end;
    }

    public static void refreshStyle(Context c) {
        main(
                () -> {
                    // An explicit style refresh is not a player notification.
                    invalidatePlayerRender();
                    pending.invalidateContent();
                    render();
                });
    }

    /**
     * Geometry refresh only, and never during a player transition: the transition coordinator is
     * the single place that decides when a new surface may be discovered. Shorts keep their own
     * isolation, which is a surface fact rather than a player-transition fact.
     */
    public static void refreshSurface() {
        main(
                () -> {
                    CaptionPlayer.reconcileCurrentPlayerType();
                    if (CaptionPlayer.state() == CaptionPlayer.COMPACT) return;
                    boolean surfaceDirty = CaptionPlayer.consumeSurfaceDirty();
                    if (CaptionSurface.isShorts()) CaptionPlayer.noteShortsSurface();
                    else if (CaptionPlayer.state()
                            == CaptionPlayer.TRANSITIONING_TO_REGULAR) return;
                    // The throttle bounds repeated searches; a genuinely new player notification is
                    // a real surface change and replaces the throttled search instead of adding.
                    long now = SystemClock.uptimeMillis();
                    if (!surfaceDirty && now >= lastScan && now - lastScan < SCAN_INTERVAL_MS)
                        return;
                    CaptionSurface.refresh();
                    lastScan = SystemClock.uptimeMillis();
                    CaptionSurface.invalidateGeometry();
                    pending.dirty = true;
                    render();
                });
    }

    /** Routes a raw player type into the authority, which alone decides display permission. */
    public static void setPlayerType(String type) {
        String previousType = CaptionPlayer.playerType();
        CaptionPlayer.onNotification(type);
        main(
                () -> {
                    if (!previousType.equals(CaptionPlayer.playerType())) controlHostChanged();
                    if (nothingPending() && !anchorVisible()) {
                        CaptionSurface.invalidateGeometry();
                        return;
                    }
                    final long applyStarted = SystemClock.uptimeMillis();
                    int state = CaptionPlayer.state();
                    if (state == CaptionPlayer.COMPACT
                            || state == CaptionPlayer.CLOSED) {
                        invalidatePlayerRender();
                        hideView();
                        displayResult(
                                activityRef.get(),
                                "suppressed",
                                "player_suppressed",
                                false,
                                0,
                                0,
                                "",
                                applyStarted);
                        return;
                    }
                    CaptionSurface.invalidateGeometry();
                    // The model event is the earliest evidence of the next reading mode. Prefetch
                    // the target page now, so the frame that commits the class finds it ready.
                    prefetchPlayerClass(type);
                    pending.dirty = true;
                    requestPlayerRender();
                });
    }

    /** Main-thread constant-time retraction; accepted plans and positions are retained. */
    public static void denyDisplay(long ownerEpoch) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> denyDisplay(ownerEpoch));
            return;
        }
        if (ownerEpoch != CaptionPlayer.ownerEpoch()) return;
        invalidatePlayerRender();
        COMMAND.incrementAndGet();
        TextView text = textRef.get();
        stopDrag(text);
        resetControlAvoidance();
        if (text != null) {
            text.cancelPendingInputEvents();
            text.clearFocus();
        }
        View anchor = anchorRef.get();
        if (anchor != null) {
            anchor.cancelPendingInputEvents();
            anchor.clearFocus();
            anchor.setImportantForAccessibility(
                    View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            anchor.setVisibility(View.INVISIBLE);
        }
    }

    /** Lets a cleared session be observed again. */
    static void resetPresentationDedupForTests() {
        lastDisplayResult = "";
        lastNotice = "";
        lastPresentationNotice = "";
        lastBlankIdentity = null;
        lastScan = -SCAN_INTERVAL_MS;

        reconcilingDisplayTime = false;
    }

    // ---- Frame-aligned render ----

    private static void invalidatePlayerRender() {
        playerRenderEpoch++;
        View clock = playerFrameClock.get();
        if (playerRenderTask != null) {
            if (clock != null) clock.removeCallbacks(playerRenderTask);
            MAIN.removeCallbacks(playerRenderTask);
        }
        playerRenderTask = null;
        playerFrameClock.clear();
    }

    /** One render on the next frame; an authoritative transition supersedes a queued one. */
    public static void requestPlayerRender() {
        if (nothingPending() || blocked()) return;
        if (playerRenderTask != null) invalidatePlayerRender();
        Activity owner = activityRef.get();
        if (!usable(owner)) return;
        View clock = owner.getWindow().getDecorView();
        final long epoch = playerRenderEpoch;
        playerRenderTask =
                () -> {
                    // A stale callback has no attach/render/hide side effects.
                    if (epoch != playerRenderEpoch || activityRef.get() != owner || !usable(owner))
                        return;
                    playerRenderTask = null;
                    playerFrameClock.clear();
                    if (blocked() || guardInvalid() || nothingPending()) return;
                    applyingPlayerRender = true;
                    try {
                        render();
                    } finally {
                        applyingPlayerRender = false;
                    }
                    CaptionDiagnostics.mark(
                            owner,
                            "PLAYER_TRANSITION_RENDER_DISPATCH",
                            "type="
                                    + CaptionPlayer.playerType()
                                    + ";state=" + CaptionPlayer.stateName()
                                    + ";geometry_search_count=" + CaptionSurface.refreshSearchCount);
                };
        playerFrameClock = new WeakReference<>(clock);
        clock.postOnAnimation(playerRenderTask);
    }

    private static boolean usable(Activity owner) {
        return owner != null
                && !owner.isFinishing()
                && !owner.isDestroyed()
                && owner.getWindow() != null;
    }

    // ---- Attaching ----

    private static void hideView() {
        controlHostChanged();
        resetCommentScale(textRef.get());
        nextPageAt = 0;
        layoutHoldSince = -1;
        lastBlankIdentity = null;
        FrameLayout a = anchorRef.get();
        if (a != null) a.setVisibility(View.GONE);
    }

    /** Is the overlay anchor visible right now? */
    static boolean anchorVisible() {
        FrameLayout a = anchorRef.get();
        return a != null && a.getVisibility() == View.VISIBLE;
    }

    private static boolean shownText() {
        TextView view = textRef.get();
        return anchorVisible() && view != null && view.getText().length() > 0;
    }

    private static void detach() {
        controlHostChanged();
        FrameLayout h = hostRef.get(), a = anchorRef.get();
        if (h != null && h.getViewTreeObserver().isAlive())
            h.getViewTreeObserver().removeOnPreDrawListener(WATCH);
        if (a != null) {
            if (a.getParent() instanceof ViewGroup) ((ViewGroup) a.getParent()).removeView(a);
            // A detached overlay never keeps a visible state: a later owner renders only after it
            // has proven a permitted player surface.
            a.setVisibility(View.GONE);
        }
        hostRef = new WeakReference<>(null);
        anchorRef = new WeakReference<>(null);
        textRef = new WeakReference<>(null);
        removeTouchProxy();
        previous.setEmpty();
        previousScreenWidth = 0;
        previousClass = null;
        presentationDecision.clear();
        lastScan = -SCAN_INTERVAL_MS;
        lastNotice = "";
        lastBlankIdentity = null;
        layoutBudget = null;
        planBudget = null;
        pending.pages = Collections.emptyList();
        pending.resetLayout("");
        pending.contentNow = false;
        resetGeometry();
        shownPage = -1;
    }

    /**
     * The caption is a stable player-overlay layer, not a child of the video Surface ancestor. It
     * lives in YouTube's topmost player-overlay container: above the video and above the player
     * controls (a control may no longer cover the text), below the comment sheet, which remains a
     * later sibling of the player. Pinning this host means a fullscreen or comment transition
     * moves the already-laid-out box instead of re-attaching it to a rebuilt surface parent. The
     * activity content is only a last-resort host for the first frame before a player overlay
     * exists.
     */
    private static boolean attach(Activity a) {
        FrameLayout host = CaptionSurface.stableCaptionHost();
        if (host == null) host = CaptionSurface.captionHost();
        boolean videoLayer = host != null;
        if (host == null) {
            View content = a.findViewById(android.R.id.content);
            if (!(content instanceof FrameLayout)) return false;
            host = (FrameLayout) content;
        }
        boolean pinned = CaptionSurface.pinnedHost(host);
        boolean topmost = CaptionSurface.topmostOverlayHost(host);
        FrameLayout anchor = anchorRef.get();
        if (anchor != null && anchor.getParent() == host && host.isAttachedToWindow()) {
            ensureTouchProxy(a);
            return true;
        }
        if (anchor != null && anchor.getParent() instanceof ViewGroup) {
            // The player rebuilt its view tree. Keep the text and its view identity; move the
            // already-laid-out box instead of destroying it and flashing a fresh GONE anchor.
            if (!host.isAttachedToWindow()) return false;
            controlHostChanged();
            FrameLayout oldHost = hostRef.get();
            if (oldHost != null && oldHost != host
                    && oldHost.getViewTreeObserver().isAlive())
                oldHost.getViewTreeObserver().removeOnPreDrawListener(WATCH);
            ((ViewGroup) anchor.getParent()).removeView(anchor);
            ViewGroup.LayoutParams params = anchor.getLayoutParams();
            if (params == null) params = new FrameLayout.LayoutParams(1, 1);
            mountAnchor(host, anchor, params, pinned && !topmost);
            TextView text = textRef.get();
            host.getViewTreeObserver().addOnPreDrawListener(WATCH);
            Rect current = captionVideoBounds(host);
            if (current == null) current = CaptionSurface.refreshedVideoBounds(host);
            if (text != null && current != null && boxWidth > 0)
                placeVisibleText(a, anchor, text, current, boxWidth);
            videoGeometry.setEmpty();
            presentationDecision.resetSamples();
            previous.setEmpty();
            previousScreenWidth = 0;
            pending.dirty = true;
            ensureTouchProxy(a);
            return true;
        }
        detach();
        if (!host.isAttachedToWindow()) return false;
        anchor = new FrameLayout(a);
        // A fresh overlay starts hidden: only a render that passed the authority, guard and
        // geometry checks may show it, so a transition can never expose an unverified overlay.
        anchor.setVisibility(View.GONE);
        anchor.setTag("yydarlinker.ai.caption.anchor");
        // Only the outer coordinate system is physical LTR; the TextView keeps its target spec.
        anchor.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        anchor.setClipChildren(false);
        anchor.setClipToPadding(false);
        TextView text = new CaptionText(a);
        text.setTag("yydarlinker.ai.caption.overlay");
        text.setTextColor(Color.WHITE);
        text.setGravity(Gravity.CENTER);
        text.setIncludeFontPadding(false);
        text.setPadding(dp(a, 6), dp(a, 4), dp(a, 6), dp(a, 4));
        text.setShadowLayer(dp(a, 1), 0, dp(a, 1), 0xD0000000);
        text.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        text.setSingleLine(false);
        text.setMaxLines(2);
        text.setEllipsize(null);
        text.setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE);
        text.setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED);
        text.setOnTouchListener((v, e) -> drag(v, e));
        anchor.addView(
                text,
                new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.TOP | Gravity.CENTER_HORIZONTAL));
        mountAnchor(host, anchor, new FrameLayout.LayoutParams(1, 1), pinned && !topmost);
        anchorRef = new WeakReference<>(anchor);
        textRef = new WeakReference<>(text);
        host.getViewTreeObserver().addOnPreDrawListener(WATCH);
        CaptionDiagnostics.mark(
                a,
                "CAPTION_LAYER",
                "layer="
                        + (videoLayer ? "video" : "activity")
                        + ";host=" + host.getClass().getSimpleName()
                        + ";width=" + host.getWidth()
                        + ";height=" + host.getHeight()
                        + ";children=" + host.getChildCount()
                        + ";" + CaptionPlayer.shortId());
        ensureTouchProxy(a);
        pending.dirty = true;
        return true;
    }

    private static void mountAnchor(FrameLayout host, FrameLayout anchor,
            ViewGroup.LayoutParams params, boolean atBack) {
        if (atBack) host.addView(anchor, 0, params);
        else host.addView(anchor, params);
        hostRef = new WeakReference<>(host);
    }

    /**
     * The caption view. A page that no longer owns the current media time is a content decision,
     * taken before traversal; drawing only paints what the last committed plan put here. In
     * particular, a draw must never clear the text or hide the view: that is a one-frame blank.
     */
    private static final class CaptionText extends TextView {
        CaptionText(Context context) {
            super(context);
        }

        @Override
        public void scrollTo(int x, int y) {
            // Pages already fit this non-editable viewport. TextView's deferred caret/centering
            // scroll must not move its text and the custom background onto different clip edges.
            super.scrollTo(0, 0);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            drawCaptionBackground(canvas);
            super.onDraw(canvas);
        }

        /**
         * Draw the rounded background around this page's actual text, not around the stable
         * maximum-width layout box. The View keeps one width across pages (no re-layout/flicker),
         * but a short page must not show the longest page's empty background.
         */
        private void drawCaptionBackground(Canvas canvas) {
            if (captionBackground == null || getLayout() == null || getText().length() == 0) return;
            Layout layout = getLayout();
            float content = 0;
            for (int line = 0; line < layout.getLineCount(); line++)
                content = Math.max(content, layout.getLineWidth(line));
            float width = Math.min(getWidth(), content + getPaddingLeft() + getPaddingRight());
            if (width <= 0) return;
            float left = (getWidth() - width) / 2f;
            captionBackground.setBounds(
                    Math.round(left), 0, Math.round(left + width), getHeight());
            captionBackground.draw(canvas);
        }
    }

    private static boolean hasPendingTimedCaption() {
        // The canonical hash is installed with a real event, before displayPosition may reenter.
        // Status/waiting commands carry an empty hash; clear/hide also empty the text.
        return !pending.canonicalHash.isEmpty() && !pending.text.isEmpty()
                && pending.timed();
    }

    private static boolean ownsDisplayPosition(long at) {
        return hasPendingTimedCaption() && inWindow(at);
    }

    // ---- Holds ----

    private static boolean holdingEnd(long at) {
        boolean held =
                currentGuard != null
                        && currentGuard.isValid()
                        && hasPendingTimedCaption()
                        && !pending.status
                        && !pending.waiting
                        && pending.end > pending.start
                        && at >= pending.end
                        && at - pending.end < END_HOLD_MS
                        && shownPage >= 0
                        && shownPage == pending.pages.size() - 1
                        && shownText();
        if (held) {
            MAIN.removeCallbacks(HOLD_EXPIRY);
            MAIN.postDelayed(HOLD_EXPIRY, END_HOLD_MS + 20);
        }
        return held;
    }

    /**
     * A pending plan keeps the last committed page. This only records that the previous version is
     * being held; there is no timeout after which an empty box takes over.
     */
    private static boolean holdingLayout() {
        if (!shownText()) return false;
        if (layoutHoldSince < 0) layoutHoldSince = SystemClock.uptimeMillis();
        return true;
    }

    // ---- Pages ----

    /**
     * The identity of one page plan: the event, the measurement contract, the box width and the
     * reading size. Both the real request and the speculative player-type prefetch use it, so a
     * plan prepared before a mode event is the exact plan that mode's commit asks for.
     */
    private static String planKey(CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        return pending.identity
                + "|" + pending.canonicalHash
                + "|" + pending.start
                + "|" + pending.end
                + "|" + spec.measurementKey()
                + "|" + budget.width
                + "|" + Float.floatToIntBits(budget.preferredPx)
                + "|" + String.valueOf(pending.timeline);
    }

    /** The pages of the pending event; laid out off the main thread, empty until they are ready. */
    private static List<CaptionDisplayPage> currentPlan(
            CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        String key = planKey(budget, spec);
        if (!key.equals(pending.layout)) {
            pending.resetLayout(key);
        }
        List<CaptionDisplayPage> ready = LAYOUTS.get(key);
        if (ready != null) return ready;
        String identity = pending.identity;
        RenderGuard guard = currentGuard;
        LAYOUTS.request(
                key, pendingPlan(budget, spec),
                pages ->
                        MAIN.post(
                                () -> {
                                    if (!key.equals(pending.layout)
                                            || !identity.equals(pending.identity)
                                            || guard != currentGuard
                                            || guard != null && !guard.isValid()) return;
                                    if (pages.isEmpty()) pending.layoutFailed = true;
                                    pending.dirty = true;
                                    lastBlankIdentity = null;
                                    render();
                                }));
        return Collections.emptyList();
    }

    /** The scheduled page boundary; no per-frame clock read is needed to find it. */
    private static void advancePreparedPageIfDue() {
        if (nextPageAt <= 0 || SystemClock.uptimeMillis() < nextPageAt) return;
        nextPageAt = 0;
        advancePreparedPage();
    }

    private static void scheduleNextPage(long at) {
        nextPageAt = 0;
        if (currentGuard == null
                || !currentGuard.isValid()
                || pending.pages.isEmpty()
                || shownPage < 0
                || shownPage >= pending.pages.size()) return;
        CaptionDisplayPage page = pending.pages.get(shownPage);
        long delay = Math.max(0, page.end - at);
        nextPageAt = SystemClock.uptimeMillis() + delay + 8;
    }

    /** Advances an already prepared page when its time arrives. */
    static void advancePreparedPage() {
        if (dragging) {
            deferredDragRender = true;
            deferredDragClear = false;
            return;
        }
        // Pages still being laid out belong to render(), which also holds the previous text.
        if (currentGuard == null
                || !currentGuard.isValid()
                || !hasPendingTimedCaption()
                || !anchorVisible()
                || pending.pages.isEmpty()) return;
        long at = currentGuard.displayPosition(pending.position);
        int next = CaptionPageExecutor.indexAt(pending.pages, at);
        pending.position = at;
        TextView text = textRef.get();
        if (next < 0 || !ownsDisplayPosition(at)) {
            if (holdingEnd(at)) {
                scheduleNextPage(at);
                return;
            }
            if (next < 0 && shownText() && inWindow(at)) {
                // A page boundary is a content change, not a reason to blank the box. The next
                // page will land before traversal; until then the last page stays painted.
                scheduleNextPage(at);
                return;
            }
            clearVisibleText(text);
            shownPage = -1;
            return;
        }
        if (next == shownPage) {
            scheduleNextPage(at);
            return;
        }
        CaptionDisplayPage page = pending.pages.get(next);
        CaptionPresentationBudget budget = layoutBudget;
        if (text == null || budget == null) return;
        long applyStarted = SystemClock.uptimeMillis();
        int applied = applyPageText(text, page.text, budget.preferredPx, budget.width,
                pending.spec, page.linePlan);
        if (applied < 0) {
            clearVisibleText(text);
            return;
        }
        Rect placement = videoGeometry.isEmpty()
                ? captionVideoBounds(hostRef.get()) : new Rect(videoGeometry);
        if (placement == null) placement = new Rect(previous);
        int planWidth = budget.width + text.getPaddingLeft() + text.getPaddingRight();
        int frameWidth = presentationDecision.frameWidth();
        int anchorWidth = frameWidth > 0 ? Math.min(frameWidth, planWidth) : planWidth;
        if (!placement.isEmpty()) anchorWidth = Math.min(anchorWidth, placement.width());
        commitPageBox(activityRef.get(), anchorRef.get(), text, placement, anchorWidth, applied);
        text.invalidate();
        displayResult(
                activityRef.get(),
                "caption_page",
                "",
                true,
                budget.width,
                budget.preferredPx,
                "",
                applyStarted);
        shownPage = next;
        scheduleNextPage(at);
    }

    /** Shorts captions may use the side bars above the comments, not just the scaled video image. */
    private static Rect captionVideoBounds(View host) {
        return captionVideoBounds(CaptionSurface.currentVideoBounds(host), host);
    }

    private static Rect captionVideoBounds(Rect image, View host) {
        if (image == null || host == null || !CaptionSurface.isShorts() || host.getWidth() <= 0)
            return image;
        int left = host.getPaddingLeft();
        int right = host.getWidth() - host.getPaddingRight();
        return right > left ? new Rect(left, image.top, right, image.bottom) : image;
    }

    // ---- Geometry clock ----

    private static void noteGeometry(Rect video) {
        if (!video.equals(videoGeometry)) videoGeometry.set(video);
    }

    /** Reads the cached video rectangle and moves the existing box; only on layout/motion. */
    private static void geometryFrame() {
        Activity a = activityRef.get();
        if (a == null) return;
        if (nothingPending() && !anchorVisible()) return;
        if (blocked()) {
            // Permission can disappear when Shorts detaches without a further time/type callback.
            // Returning alone leaves the last painted TextView on the Activity indefinitely.
            if (anchorVisible()) CaptionOverlay.denyDisplay(CaptionPlayer.ownerEpoch());
            return;
        }
        if (nothingPending() && !dragging) return;
        FrameLayout host = hostRef.get(), anchor = anchorRef.get();
        TextView text = textRef.get();
        if (guardInvalid() || host == null || anchor == null || text == null
                || !anchor.isShown() || !anchor.isAttachedToWindow() || host.getWidth() <= 0) {
            resetControlAvoidance();
            return;
        }
        Rect image;
        if (CaptionSurface.isShorts()) {
            image = CaptionSurface.currentVideoBounds(host);
        } else {
            image = controlProjection.prepare(host)
                    ? CaptionSurface.projectedVideoBounds(controlProjection) : null;
        }
        Rect video = captionVideoBounds(image, host);
        if (video == null || video.width() < 50 || video.height() < 50) {
            resetControlAvoidance();
            return;
        }
        if (dragging) return;
        noteGeometry(video);
        boolean replan = updatePresentationClass(video) || replanForStableVideo(a, text, video);
        if (replan) pending.invalidateContent();
        applyCommentScale(a, text);
        if (replan) {
            requestBeforeTraversal();
            return;
        }
        // Pre-draw may only scale and translate. The committed box keeps its measured width and
        // height; a real content change is applied by render() before the next traversal.
        followVisibleTextTranslation(a, anchor, text, video, image);
    }

    /** Re-plan only after a settled width; pre-draw still delegates application to a frame. */
    private static boolean replanForStableVideo(Activity a, TextView text, Rect video) {
        int videoWidth = video.width();
        if (!presentationDecision.sampleStableWidth(videoWidth, boxWidth, text != null)) return false;
        float difference = Math.abs(videoWidth - boxWidth) / (float) boxWidth;
        int wide = presentationDecision.stableWide(videoWidth);
        int planPadding = wide >= presentationDecision.baseWidth()
                ? 0 : text.getPaddingLeft() + text.getPaddingRight();
        int previous = presentationDecision.frameWidth();
        if (!presentationDecision.replanStableWidth(wide, planPadding)) return false;
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        CaptionDiagnostics.mark(
                a,
                "CAPTION_STABLE_REPLAN",
                "class="
                        + presentationDecision.currentClass()
                        + ";video_width=" + videoWidth
                        + ";class_width=" + presentationDecision.baseWidth()
                        + ";previous_width=" + previous
                        + ";plan_width=" + presentationDecision.frameWidth()
                        + ";difference=" + difference
                        + ";padding=" + padding);
        return true;
    }

    private static boolean computeTarget(
            Activity owner, Rect video, int width, int height, float drawnHeight, boolean landscape) {
        if (owner == null || video == null || video.isEmpty() || width <= 0 || height <= 0)
            return false;
        float y = dragging ? dragPosition : CaptionSurface.isShorts()
                ? AiCaptionConfig.shortsPosition(owner) : AiCaptionConfig.captionPositionY(owner, landscape);
        int top = positionTop(owner, video, video.top + video.height() * y, height, drawnHeight);
        int left = video.left + Math.round((video.width() - width) / 2f);
        // An unplanned box can still be wider than the video while the stable re-plan is being
        // prepared. Centering it (instead of clamping its left edge to the video) keeps the fitted
        // text on the video's center line; a left-aligned wider box is what put its right side
        // under the comment panel.
        nextLeft =
                width > video.width()
                        ? left
                        : Math.max(video.left, Math.min(left, video.right - width));
        nextTop = top;
        return true;
    }

    private static int positionTop(Context owner, Rect video, float center, int height, float drawnHeight) {
        int edge = dp(owner, 4);
        float inset = (height - drawnHeight) / 2f;
        int minimum = (int) Math.ceil(video.top + edge - inset);
        int maximum = (int) Math.floor(video.bottom - edge - height + inset);
        if (maximum < minimum) return Math.round(video.exactCenterY() - height / 2f);
        return Math.max(minimum, Math.min(maximum, Math.round(center - height / 2f)));
    }

    /**
     * The only placement allowed in pre-draw: translation. The anchor keeps the width, height and
     * margins the last content commit gave it; changing them here would request a layout that can
     * only be applied by the next traversal.
     */
    private static void followVisibleTextTranslation(
            Activity a, FrameLayout anchor, TextView text, Rect video, Rect image) {
        if (boxWidth <= 0 || boxHeight <= 0 || anchor == null) return;
        FrameLayout parent =
                anchor.getParent() instanceof FrameLayout ? (FrameLayout) anchor.getParent() : null;
        if (parent == null || parent != hostRef.get()) {
            // Pre-draw must never add/remove views. Ask for the next frame instead: render()
            // remounts the anchor and commits the new placement before that traversal.
            pending.invalidateContent();
            requestBeforeTraversal();
            return;
        }
        // Placement is in the anchor's own parent coordinates. Reading the video against any
        // other container (a stale hostRef) shifts the box by that container's inset.
        if (!computeTarget(a, video, boxWidth, boxHeight,
                boxHeight * text.getScaleY(), video.width() > video.height())) return;
        updateControlAvoidance(parent, text, image);
        CaptionPresentationDecision.translate(parent, anchor, nextLeft, avoidedTop());
    }

    /** Called on the main thread by the read-only player-controls observer. */
    public static void setPlayerControlsVisible(boolean visible) {
        if (controlsVisible == visible) return;
        controlsVisible = visible;
        if (!visible) {
            bottomObstacles.stop();
            animateControlShift(0);
        }
        FrameLayout anchor = anchorRef.get();
        if (anchor != null && anchorVisible()) anchor.invalidate();
    }

    private static void updateControlAvoidance(FrameLayout parent, TextView text, Rect video) {
        if (!controlsVisible) return;
        View root = CaptionSurface.bottomControlsHost();
        if (root == null || video == null || !root.isAttachedToWindow()) {
            resetControlAvoidance();
            return;
        }
        if (!bottomObstacles.observes(root)) {
            bottomObstacles.stop();
            bottomObstacles.start(root);
        }
        float center = nextTop + boxHeight / 2f;
        float halfHeight = boxHeight * text.getScaleY() / 2f;
        float captionTop = center - halfHeight;
        float captionBottom = center + halfHeight;
        float bandTop = bottomObstacles.bandTop(controlProjection, video);
        boolean landscapeFullscreen = "WATCH_WHILE_FULLSCREEN".equals(CaptionPlayer.playerType())
                && parent.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        float margin = dp(parent.getContext(), landscapeFullscreen ? 8 : 4);
        controlLimit = Math.max(0, captionTop - video.top);
        float target = captionBottom <= bandTop ? 0
                : Math.min(controlLimit, captionBottom - bandTop + margin);
        animateControlShift(target);
    }

    private static void animateControlShift(float target) {
        if (target == controlTarget && (controlAnimating || controlShift == target)) return;
        cancelControlAnimation();
        controlTarget = target;
        if (controlShift == target) return;
        controlFrom = controlShift;
        controlStarted = -1;
        controlAnimating = true;
        Choreographer.getInstance().postFrameCallback(CONTROL_FRAME);
    }

    private static void advanceControlShift(long frameNanos) {
        if (controlStarted < 0) controlStarted = frameNanos;
        float fraction = Math.min(1f, (frameNanos - controlStarted) / 160_000_000f);
        controlShift = controlFrom + (controlTarget - controlFrom) * CONTROL_EASE.getInterpolation(fraction);
        applyControlTranslation();
        controlAnimating = fraction < 1f;
        if (controlAnimating) Choreographer.getInstance().postFrameCallback(CONTROL_FRAME);
    }

    /** A change of activity, player or Shorts page must discard the old view observations. */
    public static void controlHostChanged() {
        stopDrag(null);
        resetControlAvoidance();
    }

    private static void resetControlAvoidance() {
        bottomObstacles.stop();
        cancelControlAnimation();
        boolean moved = controlShift != 0;
        controlShift = controlTarget = 0;
        if (moved) applyControlTranslation();
    }

    private static void cancelControlAnimation() {
        if (controlAnimating) Choreographer.getInstance().removeFrameCallback(CONTROL_FRAME);
        controlAnimating = false;
    }

    private static int avoidedTop() {
        return nextTop - Math.min(Math.round(controlShift), (int) controlLimit);
    }

    private static void applyControlTranslation() {
        FrameLayout anchor = anchorRef.get(), parent = hostRef.get();
        if (anchor != null && anchor.getParent() == parent)
            CaptionPresentationDecision.translate(parent, anchor, nextLeft, avoidedTop());
    }

    /**
     * A committed page is a content fact. When the presentation class is unchanged, a geometry
     * change only moves the box; it never re-paginates because a transient rectangle is narrower.
     * The class switch is the one event that asks for a new plan, and it follows a PlayerType
     * notification (or the first-frame fallback) rather than the animation's current rectangle.
     */
    private static boolean canReuseCommittedPage(
            float preferred, CaptionRenderSpec spec, boolean ownedCaption, int inner) {
        if (!ownedCaption
                || layoutBudget == null
                || planBudget != layoutBudget
                || pending.pages.isEmpty()
                || shownPage < 0
                || shownPage >= pending.pages.size()
                || contentWidth <= 0
                || !shownText()) return false;
        if (layoutBudget.preferredPx != preferred
                || layoutBudget.width != inner
                || !layoutBudget.renderSpec.measurementKey().equals(spec.measurementKey()))
            return false;
        CaptionDisplayPage page = pending.pages.get(shownPage);
        return page.linePlan != null
                && page.contains(pending.position)
                && ownsDisplayPosition(pending.position);
    }

    private static void resetGeometry() {
        videoGeometry.setEmpty();
        presentationDecision.resetSamples();
        boxWidth = 0;
        boxHeight = 0;
        boxClass = null;
        contentWidth = 0;
        stableTextWidth = 0;

        nextPageAt = 0;
    }

    /** The player authority and display are sampled here; only the decision is delegated. */
    private static boolean updatePresentationClass(Rect video) {
        Activity a = activityRef.get();
        if (a == null || video == null) return false;
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        boolean shorts = CaptionSurface.isShorts();
        String type = !shorts && screenWidth > screenHeight
                ? CaptionPlayer.playerType() : "";
        CaptionPresentationDecision.Kind next = presentationDecision.classToCommit(
                video, screenWidth, screenHeight, shorts, type);
        return next != null
                && commitPresentationClass(a, next, video, screenWidth, screenHeight, shorts);
    }

    /**
     * The one continuous size law: r = on-screen video short side / screen short side.
     *
     * <p>At r = 1 (the video fills the short side) it is the full endpoint; at r = 9/16 it is the
     * detail endpoint; in between it is linear in that ratio. Both endpoints are the existing
     * reference sizes scaled from a 1264 px short side, so no class interpolation is needed and
     * the same expression holds in landscape and portrait.
     */
    static float glyphHeightPxForVideo(
            int tier, int screenWidth, int screenHeight, float videoShortOnScreen) {
        int screenShort = Math.min(screenWidth, screenHeight);
        if (screenShort <= 0) return 0f;
        float density = screenShort / CaptionPresentationDecision.REFERENCE_SHORT_SIDE_PX;
        float full = SubtitleStyleMetrics.fullScreenGlyphHeightPx(tier) * density;
        float detail = SubtitleStyleMetrics.detailGlyphHeightPx(tier) * density;
        float r = videoShortOnScreen / (float) screenShort;
        float t = clamp((1f - r) / (1f - 9f / 16f), 0f, 1f);
        return full + (detail - full) * t;
    }

    /** The text scale that maps the current layout size to [glyphPx] on screen; 0 means skip. */
    static float captionScale(float glyphPx, float glyphLocalPx, float anchorScale) {
        if (!(glyphPx > 0f) || !(glyphLocalPx > 0f) || !(anchorScale > 0f)) return 0f;
        float scale = glyphPx / (glyphLocalPx * anchorScale);
        return Float.isNaN(scale) || Float.isInfinite(scale) ? 0f : scale;
    }

    private static float clamp(float value, float minimum, float maximum) {
        return Math.max(minimum, Math.min(maximum, value));
    }

    private static final Matrix ANCHOR_TO_GLOBAL = new Matrix(), SURFACE_TO_GLOBAL = new Matrix();
    private static final float[] MATRIX_VALUES = new float[9];

    /**
     * sqrt(|det|) of a global transform. A degenerate matrix (the animation has collapsed the
     * node) falls back to MSCALE_X; a non-positive result means "no evidence", not scale 1.
     */
    private static float matrixScale(Matrix matrix) {
        matrix.getValues(MATRIX_VALUES);
        float determinant =
                MATRIX_VALUES[Matrix.MSCALE_X] * MATRIX_VALUES[Matrix.MSCALE_Y]
                        - MATRIX_VALUES[Matrix.MSKEW_X] * MATRIX_VALUES[Matrix.MSKEW_Y];
        float scale = (float) Math.sqrt(Math.abs(determinant));
        if (!(scale > 0f) || Float.isNaN(scale) || Float.isInfinite(scale))
            scale = MATRIX_VALUES[Matrix.MSCALE_X];
        return scale > 0f && !Float.isNaN(scale) && !Float.isInfinite(scale) ? scale : 0f;
    }

    /**
     * The whole visual-size calculation. The outer anchor supplies the scale this layer inherits;
     * the surface supplies the video's current on-screen short side. The text's own scale is the
     * correction, so it never feeds back into the anchor matrix.
     */
    static void applyCommentScale(Activity a, TextView text) {
        applyCommentScale(
                a,
                anchorRef.get(),
                CaptionSurface.currentSurfaceView(),
                text,
                presentationTier);
    }

    static void applyCommentScale(
            Activity a, FrameLayout anchor, View surface, TextView text, int tier) {
        if (text == null || a == null || anchor == null || surface == null) return;
        if (tier < 0) return;
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        int screenShort = Math.min(screenWidth, screenHeight);
        int localShort = Math.min(surface.getWidth(), surface.getHeight());
        if (screenShort <= 0 || localShort <= 0) return;
        ANCHOR_TO_GLOBAL.reset();
        anchor.transformMatrixToGlobal(ANCHOR_TO_GLOBAL);
        float anchorScale = matrixScale(ANCHOR_TO_GLOBAL);
        if (anchorScale <= 0f) return;
        SURFACE_TO_GLOBAL.reset();
        surface.transformMatrixToGlobal(SURFACE_TO_GLOBAL);
        float surfaceScale = matrixScale(SURFACE_TO_GLOBAL);
        if (surfaceScale <= 0f) return;
        float glyphPx;
        if (CaptionSurface.isShorts()) {
            // Shorts keeps the detail endpoint it has always used, now against the same density.
            glyphPx =
                    SubtitleStyleMetrics.detailGlyphHeightPx(tier)
                            * screenShort
                            / CaptionPresentationDecision.REFERENCE_SHORT_SIDE_PX;
        } else {
            glyphPx =
                    glyphHeightPxForVideo(
                            tier,
                            screenWidth,
                            screenHeight,
                            localShort * surfaceScale);
        }
        // gLocal is the ink height cached when the layout was committed. This method runs in
        // pre-draw every frame and must not measure the Paint; a non-positive cache means no
        // layout has been committed yet, so keep the existing "skip, do not set scale" semantics.
        float glyphLocalPx = layoutGlyphInkPx;
        if (!(glyphLocalPx > 0f)) return;
        // The painted size follows the displayed glyph, not the instantaneous law target: a layout
        // inset can move the target by tens of percent in one frame, and the box must not jump.
        noteGlyphTarget(glyphPx);
        // While a new plan is being prepared the committed text can still be wider than the video.
        // A proportional draw-time fit keeps the already-laid-out text inside the video without
        // changing its line count or requesting a layout. The fit disappears when the re-plan
        // lands, because the new page plan is then narrower than the video.
        float fit = 1f;
        int videoWidth = videoGeometry.width();
        int contentWidth = stableTextWidth;
        if (boxClass == presentationDecision.currentClass()
                && contentWidth > 0
                && videoWidth > 0
                && videoWidth < contentWidth) fit = videoWidth / (float) contentWidth;
        float scale = captionScale(glyphTransition.displayedPx(), glyphLocalPx, anchorScale) * fit;
        if (!(scale > 0f) || Float.isNaN(scale) || Float.isInfinite(scale)) return;
        text.setPivotX(text.getWidth() / 2f);
        text.setPivotY(text.getHeight() / 2f);
        if (Math.abs(text.getScaleX() - scale) > .002f
                || Math.abs(text.getScaleY() - scale) > .002f) {
            text.setScaleX(scale);
            text.setScaleY(scale);
        }
    }

    /**
     * Sets the target of the painted glyph. A change inside 2% is followed directly; a larger one
     * starts one linear transition of 180 ms. Starting a transition only
     * records a frame callback; the value itself is advanced by {@link #advanceDisplayedGlyph} on
     * frame times, never by a timer.
     */
    private static void noteGlyphTarget(float target) {
        if (glyphTransition.noteTarget(target)) scheduleGlyphFrame();
    }

    /** Advances numerical state, retaining Android callback coalescing in this adapter. */
    static boolean advanceDisplayedGlyph(long frameTimeNanos) {
        boolean needsFrame = glyphTransition.advance(frameTimeNanos);
        if (needsFrame) scheduleGlyphFrame();
        return needsFrame;
    }

    private static void scheduleGlyphFrame() {
        if (glyphFrameScheduled) return;
        glyphFrameScheduled = true;
        Choreographer.getInstance().postFrameCallback(GLYPH_FRAME);
    }

    /** The painted glyph height, for the frame-clock tests and diagnostics. */
    static float displayedGlyphPx() {
        return glyphTransition.displayedPx();
    }

    /** Starts a target without a View, so the frame-clock interpolation can be tested directly. */
    static void noteGlyphTargetForTests(float target) {
        noteGlyphTarget(target);
    }

    static void resetGlyphForTests() {
        resetDisplayedGlyph();
    }

    private static void resetDisplayedGlyph() {
        glyphTransition.reset();
        glyphFrameScheduled = false;
    }

    /** Ends a pending 180 ms step at its target; tests that assert final sizes use this. */
    static void settleDisplayedGlyphForTests() {
        glyphTransition.settle();
    }

    private static void resetCommentScale(TextView text) {
        resetDisplayedGlyph();
        if (text != null && (text.getScaleX() != 1f || text.getScaleY() != 1f)) {
            text.setScaleX(1f);
            text.setScaleY(1f);
        }
    }

    private static boolean commitPresentationClass(
            Activity a,
            CaptionPresentationDecision.Kind next,
            Rect video,
            int screenWidth,
            int screenHeight,
            boolean shorts) {
        TextView text = textRef.get();
        int padding =
                text == null
                        ? dp(a, 6) * 2
                        : text.getPaddingLeft() + text.getPaddingRight();
        int videoWidth = presentationDecision.prepareClassCommit(
                next, video, screenWidth, screenHeight, shorts);
        float classGlyph =
                CaptionPresentationDecision.glyphHeightPx(
                        AiCaptionConfig.displayStyle(a).captionSizeTier,
                        screenWidth,
                        screenHeight,
                        next);
        presentationDecision.finishClassCommit(next);
        stableTextWidth = 0;

        CaptionDiagnostics.mark(
                a,
                "CAPTION_PRESENTATION_CLASS",
                "class="
                        + next
                        + ";video=" + video.flattenToString()
                        + ";screen=" + screenWidth
                        + "x" + screenHeight
                        + ";full_width="
                        + CaptionPresentationDecision.referenceVideoWidth(screenWidth, screenHeight)
                        + ";layout_video_width=" + videoWidth
                        + ";class_frame_width=" + presentationDecision.frameWidth()
                        + ";glyph_height_px=" + classGlyph
                        + ";reduced_width=" + presentationDecision.reducedWidth()
                        + ";padding=" + padding);
        return true;
    }

    /**
     * Plans the page the model's next reading mode will need. A PlayerType event is the earliest
     * reliable statement of that mode, so this is the only speculative planning trigger; there is
     * no timer and no per-frame probe. The key mirrors the width/glyph decisions of render(), so
     * the commit asks for the plan this method already built.
     */
    private static void prefetchPlayerClass(String type) {
        Activity a = activityRef.get();
        if (a == null
                || pending.status
                || pending.waiting
                || !hasPendingTimedCaption()) return;
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        boolean shorts = CaptionSurface.isShorts();
        CaptionPresentationDecision.Kind target =
                presentationDecision.prefetchClass(type, screenWidth, screenHeight, shorts);
        if (target == null || target == presentationDecision.currentClass()) return;
        TextView text = textRef.get();
        if (text == null) return;
        FrameLayout host = hostRef.get();
        Rect video = host == null ? null : captionVideoBounds(host);
        if (video == null && !videoGeometry.isEmpty()) video = new Rect(videoGeometry);
        if (video == null || video.width() <= 0) return;
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int width = presentationDecision.prefetchWidth(
                target, video, screenWidth, screenHeight, shorts);
        int inner = Math.max(1, width - padding);
        int tier =
                presentationTier >= 0
                        ? presentationTier
                        : AiCaptionConfig.displayStyle(a).captionSizeTier;
        CaptionRenderSpec spec = pending.spec.withPaint(text);
        CaptionPresentationBudget budget = classBudget(text, spec, inner, tier,
                screenWidth, screenHeight, target);
        String key = planKey(budget, spec);
        LAYOUTS.prefetch(key, pendingPlan(budget, spec));
    }

    private static java.util.function.Supplier<List<CaptionDisplayPage>> pendingPlan(
            CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        String text = pending.text;
        long start = pending.start, end = pending.end;
        CaptionEventTimeline timeline = pending.timeline;
        return () -> CaptionActions.displayPages(text, start, end, budget, spec, timeline);
    }

    private static CaptionPresentationBudget classBudget(TextView text, CaptionRenderSpec spec,
            int width, int tier, int screenWidth, int screenHeight, CaptionPresentationDecision.Kind kind) {
        float preferred = SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(),
                CaptionPresentationDecision.glyphHeightPx(tier, screenWidth, screenHeight, kind));
        float minimum = SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(),
                CaptionPresentationDecision.glyphHeightPx(0, screenWidth, screenHeight, kind));
        return new CaptionPresentationBudget(width, minimum, preferred, spec);
    }

    // ---- Render ----

    private static void render() {
        final long applyStarted = SystemClock.uptimeMillis();
        boolean forceContent = pending.contentNow;
        pending.contentNow = false;
        Activity a = activityRef.get();
        if (guardInvalid()) {
            hideView();
            displayResult(a, "suppressed", "owner_invalid", false, 0, 0, "", applyStarted);
            return;
        }
        if (dragging && !blocked()) {
            deferredDragRender = true;
            deferredDragClear = false;
            return;
        }
        if (currentGuard != null) pending.position = currentGuard.displayPosition(pending.position);
        boolean timed = pending.timed();
        if (timed && !inWindow(pending.position)) {
            if (holdingEnd(pending.position)) return;
            TextView stale = textRef.get();
            if (stale != null) stale.setText("");
            shownPage = -1;
            hideView();
            pending.dirty = true;
            displayResult(a, "empty", "outside_owned_window", false, 0, 0, "", applyStarted);
            return;
        }
        // A time expiry is authoritative even while a geometry frame is queued.
        if (playerRenderTask != null && !applyingPlayerRender) {
            requestPlayerRender();
            return;
        }
        if (a == null
                || a.isFinishing()
                || a.isDestroyed()
                || nothingPending()
                || blocked()
                || guardInvalid()) {
            hideView();
            if (a != null && blocked())
                displayResult(a, "suppressed", "player_suppressed", false, 0, 0, "", applyStarted);
            return;
        }
        if (!attach(a)) return;
        FrameLayout host = hostRef.get(), anchor = anchorRef.get();
        TextView text = textRef.get();
        CaptionRenderSpec displaySpec = pending.spec;
        if (pending.status || pending.waiting) {
            String code = CaptionTextResolver.locale(a).toLanguageTag();
            displaySpec = new CaptionRenderSpec(code, CaptionLanguageProfile.fromCode(code), false);
        }
        displaySpec.apply(text);
        Rect b = captionVideoBounds(host);
        if (b == null || CaptionPlayer.consumeSurfaceDirty()) {
            // Rediscover a rebuilt surface, but never substitute the player container: that was a
            // one-frame geometry jump. No surface at all keeps the verified page where it is.
            CaptionSurface.refresh();
            lastScan = SystemClock.uptimeMillis();
            b = captionVideoBounds(host);
            if (b == null) b = captionVideoBounds(CaptionSurface.refreshedVideoBounds(host), host);
        }
        if (b == null || b.width() < 50 || b.height() < 50) {
            // A player rebuild can expose no surface for a frame. Keep the already-verified page
            // in place instead of flashing it off; a real close/compact is handled by the
            // authority before this point.
            if (anchorVisible()) return;
            layoutBudget = null;
            planBudget = null;
            hideView();
            return;
        }
        boolean shorts = CaptionSurface.isShorts();
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        noteGeometry(b);
        boolean classChanged = updatePresentationClass(b);
        if (classChanged) {
            forceContent = true;
            pending.contentNow = false;
        }
        if (!pending.dirty
                && !forceContent
                && !classChanged
                && b.equals(previous)
                && screenWidth == previousScreenWidth
                && shorts == previousShorts
                && presentationDecision.currentClass() == previousClass
                && (anchor.getVisibility() == View.VISIBLE
                        || anchor.getVisibility() == View.GONE
                                && pending.identity.equals(lastBlankIdentity))) return;
        previousShorts = shorts;
        previousClass = presentationDecision.currentClass();
        pending.dirty = false;
        previous.set(b);
        // A new surface is committed only outside a player transition.
        if (guardedExpansion() && !shorts) {
            hideView();
            return;
        }
        previousScreenWidth = screenWidth;
        AiCaptionConfig.Appearance cfg = AiCaptionConfig.displayStyle(a);
        // Resolve the tier once per content commit.
        presentationTier = cfg.captionSizeTier;
        int width =
                presentationDecision.frameWidth() > 0
                        ? presentationDecision.frameWidth()
                        : CaptionPresentationDecision.readingWidth(b.width(), shorts);
        // The committed class width is the stable reading width for this mode. A transition frame
        // must not narrow the plan: that would re-paginate the caption while the player animates.
        width = Math.min(width, screenWidth);
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int inner = Math.max(1, width - padding);
        CaptionRenderSpec measuredSpec = displaySpec.withPaint(text);
        CaptionPresentationBudget nextBudget = classBudget(text, measuredSpec, inner,
                presentationTier, screenWidth, screenHeight, presentationDecision.currentClass());
        float preferred = nextBudget.preferredPx, minimum = nextBudget.minimumPx;
        boolean ownedCaption = !pending.status && !pending.waiting && !pending.text.isEmpty() && timed;
        if (!forceContent
                && !classChanged
                && canReuseCommittedPage(preferred, measuredSpec, ownedCaption, inner)) {
            // The video moved or resized inside the same presentation class. Keep its page plan,
            // text width and line breaks; only the class-width centering anchor follows the video.
            placeVisibleText(a, anchor, text, b, width);
            showAnchor(anchor);
            return;
        }
        planBudget = nextBudget;
        float size = preferred;
        String shown = pending.text;
        String mode = pending.status ? "status" : "caption";
        pending.pages =
                ownedCaption ? currentPlan(planBudget, measuredSpec) : Collections.emptyList();
        shownPage =
                hasPendingTimedCaption() && !ownsDisplayPosition(pending.position)
                        ? -1
                        : CaptionPageExecutor.indexAt(pending.pages, pending.position);
        if (shownPage >= 0) {
            shown = pending.pages.get(shownPage).text;
            if (pending.pages.size() > 1) mode = "caption_page";
        } else if (!ownedCaption) {
            while (size > minimum && lineCount(shown, size, inner, measuredSpec) > 2)
                size = Math.max(minimum, size - .5f);
        }

        if (ownedCaption && !pending.pages.isEmpty()) {
            // The box width is the widest line of this event, so a page change never changes the
            // width. Its height is the current page's own line count: a one-line page must not
            // inherit two-line padding from a different page of the same event.
            int maxLine = 0;
            for (CaptionDisplayPage page : pending.pages) {
                if (page.linePlan == null) continue;
                maxLine =
                        Math.max(
                                maxLine,
                                (int)
                                        Math.ceil(
                                                Math.max(
                                                        page.linePlan.line1Px,
                                                        page.linePlan.line2Px)));
            }
            if (maxLine > 0) stableTextWidth = Math.min(inner, Math.max(1, maxLine + 2)) + padding;
        }
        String reason = shown.isEmpty() && currentGuard != null ? currentGuard.blankReason() : "";
        if (ownedCaption
                && shownPage < 0
                && shownText()
                && ownsDisplayPosition(pending.position)) {
            // The plan is still being built, or no page owns this audible instant yet. Keep the
            // previous page exactly as it is: the timeout-then-clear path was the largest source
            // of whole-box blank frames. A non-audible position is content, not a gap, and still
            // falls through to the explicit clear below.
            holdingLayout();
            displayResult(
                    a, "caption_hold", "preparing_layout", true, inner, size, "", applyStarted);
            return;
        }
        if (ownedCaption && shownPage < 0) {
            shown = "";
            mode = "overflow_status";
            reason =
                    pending.pages.isEmpty()
                            ? (pending.layoutFailed
                                    ? "unprojectable_pixel_width"
                                    : "preparing_layout")
                            : "outside_owned_window";
        } else if (!ownedCaption && lineCount(shown, size, inner, measuredSpec) > 2) {
            shown = "";
            mode = "original_fallback";
        }
        text.setTextSize(TypedValue.COMPLEX_UNIT_PX, size);
        text.setSingleLine(false);
        text.setMaxLines(2);
        text.setEllipsize(null);
        text.setAutoSizeTextTypeWithDefaults(TextView.AUTO_SIZE_TEXT_TYPE_NONE);
        text.setTextColor(pending.status ? 0xE6FFFFFF : Color.WHITE);
        int compact = 0;
        if (!shown.isEmpty()) {
            CaptionLinePlan line = ownedCaption && shownPage >= 0
                    ? pending.pages.get(shownPage).linePlan : null;
            compact = applyPageText(text, shown, size, inner, measuredSpec, line);
            if (compact < 0) {
                shown = "";
                mode = "overflow_status";
                reason = "measurement_mismatch";
                if (ownedCaption && !retryLayout()) reason = "unprojectable_pixel_width";
            } else {
                applyCommentScale(a, text);
            }
        }
        String detail =
                "id="
                        + pending.identity
                        + ";mode=" + mode
                        + ";available_width_px=" + inner
                        + ";effective_frame_width_px="
                        + (inner + padding)
                        + ";measured_width_px="
                        + Math.max(0, compact);
        if (shown.isEmpty()) {
            clearVisibleText(text);
            lastBlankIdentity = pending.identity;
            if (ownedCaption && !reason.isEmpty())
                presentationDiagnostics(
                        a, pending.text, preferred, inner, pending.end - pending.start, reason);
            if (mode.equals("overflow_status") && !detail.equals(lastNotice))
                CaptionDiagnostics.mark(a, "REBUILD_LAYOUT_FALLBACK", detail + ";reason=" + reason);
            lastNotice = detail;
            displayResult(a, mode, reason, false, inner, size, detail, applyStarted);
            return;
        }
        lastBlankIdentity = null;
        if (captionBackground == null) captionBackground = new GradientDrawable();
        captionBackground.setColor(SubtitleStyleMetrics.alpha(cfg.backgroundOpacity) << 24);
        captionBackground.setCornerRadius(dp(a, 4));
        // The background is drawn by CaptionText.onDraw around the current page's real line
        // widths, so a short page cannot inherit the event's widest page.
        if (text.getBackground() != null) text.setBackground(null);
        // Time and owner are sampled again at UI application, after the potentially expensive
        // layout.
        if (currentGuard != null) {
            if (!currentGuard.isValid()) {
                clearVisibleText(text);
                displayResult(
                        a, "empty", "owner_invalid", false, inner, size, detail, applyStarted);
                return;
            }
            long latest = currentGuard.displayPosition(pending.position);
            if (timed && !inWindow(latest)) {
                pending.position = latest;
                text.setText("");
                shownPage = -1;
                hideView();
                pending.dirty = true;
                displayResult(
                        a, "empty", "outside_owned_window", false, inner, size, "", applyStarted);
                return;
            }
            pending.position = latest;
            if (ownedCaption && CaptionPageExecutor.indexAt(pending.pages, latest) != shownPage) {
                pending.dirty = true;
                if (!reconcilingDisplayTime) {
                    reconcilingDisplayTime = true;
                    try {
                        render();
                    } finally {
                        reconcilingDisplayTime = false;
                    }
                } else {
                    clearVisibleText(text);
                    requestPlayerRender();
                }
                return;
            }
        }
        if (ownedCaption && text.getMeasuredHeight() > b.height()) {
            clearVisibleText(text);
            presentationDiagnostics(
                    a, shown, size, inner, pending.end - pending.start, "hard_textview_geometry");
            displayResult(
                    a, "empty", "hard_textview_geometry", false, inner, size, detail, applyStarted);
            return;
        }
        if (ownedCaption) {
            CaptionDisplayPage page = pending.pages.get(shownPage);
            presentationDiagnostics(
                    a,
                    shown,
                    size,
                    compact - text.getPaddingLeft() - text.getPaddingRight(),
                    page.end - page.start,
                    "");
        }
        // The page and its measured box are now the committed content. A later geometry frame may
        // move this box, but it may not re-wrap or re-paginate it while it still fits.
        layoutBudget = planBudget;
        scheduleNextPage(pending.position);
        commitPageBox(a, anchor, text, b, width, compact);
        layoutHoldSince = -1;
        showAnchor(anchor);
        if ((mode.equals("original_fallback") || mode.equals("overflow_status"))
                && !detail.equals(lastNotice))
            CaptionDiagnostics.mark(a, "REBUILD_LAYOUT_FALLBACK", detail);
        lastNotice = detail;
        displayResult(
                a,
                mode,
                pending.waiting ? "pending_translation" : "",
                true,
                inner,
                size,
                detail,
                applyStarted);
    }

    /**
     * A page whose real measurement does not fit gets one fresh layout; a second failure marks it
     * unprojectable so the box stays honestly empty.
     *
     * @return false when it gave up
     */
    private static boolean retryLayout() {
        if (pending.retried) {
            pending.layoutFailed = true;
            return false;
        }
        pending.retried = true;
        LAYOUTS.remove(pending.layout);
        pending.dirty = true;
        final String identity = pending.identity;
        MAIN.post(
                () -> {
                    if (identity.equals(pending.identity)) {
                        pending.invalidateContent();
                        lastBlankIdentity = null;
                        render();
                    }
                });
        return true;
    }

    // ---- Measuring and placing ----

    /**
     * Both the ordinary render and the prepared-page advance apply the same content geometry.
     *
     * @return the box width in pixels, or -1 when the text does not fit even at full width
     */
    private static int applyPageText(TextView view, String text, float size, int width,
            CaptionRenderSpec spec, CaptionLinePlan line) {
        int applied = applyVisibleText(view, text, size, width, spec, line, stableTextWidth);
        if (applied >= 0)
            layoutGlyphInkPx = SubtitleStyleMetrics.measuredGlyphHeightPx(view.getPaint());
        return applied;
    }

    private static void clearVisibleText(TextView text) {
        if (dragging && !guardInvalid() && !blocked()) {
            deferredDragRender = false;
            deferredDragClear = true;
            nextPageAt = 0;
            return;
        }
        if (text != null) text.setText("");
        hideView();
    }

    private static int applyVisibleText(
            TextView text,
            String shown,
            float size,
            int maximumInnerPx,
            CaptionRenderSpec spec,
            CaptionLinePlan line,
            int fixedWidthPx) {
        boolean same =
                CaptionTextResolver.sameText(text.getText(), shown)
                        && text.getTextSize() == size
                        && text.getPaint().equalsForTextMeasurement(spec.paint(size));
        spec.apply(text);
        if (text.getTextSize() != size) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, size);
        if (!CaptionTextResolver.sameText(text.getText(), shown)) text.setText(shown);
        if (text.getMaxLines() != 2) {
            text.setSingleLine(false);
            text.setMaxLines(2);
        }
        if (text.getEllipsize() != null) text.setEllipsize(null);
        if (text.getAutoSizeTextType() != TextView.AUTO_SIZE_TEXT_TYPE_NONE)
            text.setAutoSizeTextTypeWithDefaults(TextView.AUTO_SIZE_TEXT_TYPE_NONE);
        if (text.getMinEms() != -1) text.setMinEms(-1);
        if (text.getMaxEms() != Integer.MAX_VALUE) text.setMaxEms(Integer.MAX_VALUE);
        if (text.getMinWidth() != 0) text.setMinWidth(0);
        if (text.getMinimumWidth() != 0) text.setMinimumWidth(0);
        if (text.getGravity() != Gravity.CENTER) text.setGravity(Gravity.CENTER);
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int maximumBox = Math.max(1, maximumInnerPx) + padding;
        int lines = line == null ? 0 : line.line2Px > 0 ? 2 : 1;
        int minHeight =
                lines > 0
                        ? text.getLineHeight() * lines
                                + text.getPaddingTop()
                                + text.getPaddingBottom()
                        : 0;
        boolean heightSame = text.getMinHeight() == minHeight;
        float contentWidthPx =
                line != null
                        ? Math.max(line.line1Px, line.line2Px)
                        : same && text.getLayout() != null && text.getLayout().getLineCount() == 1
                                ? text.getLayout().getLineMax(0)
                                : spec.actualWidth(spec.layout(shown, size, maximumInnerPx));
        int naturalBox =
                Math.min(maximumInnerPx, Math.max(1, (int) Math.ceil(contentWidthPx) + 2))
                        + padding;
        int boxWidthPx =
                fixedWidthPx > 0
                        ? Math.min(maximumBox, Math.max(1, fixedWidthPx))
                        : naturalBox;
        for (int pass = 0; pass < 3; pass++) {
            ViewGroup.LayoutParams params = text.getLayoutParams();
            if (same
                    && heightSame
                    && !text.isLayoutRequested()
                    && params.width == boxWidthPx
                    && params.height == ViewGroup.LayoutParams.WRAP_CONTENT
                    && text.getMeasuredWidth() == boxWidthPx
                    && spec.fits(shown, text.getLayout(), boxWidthPx - padding, 2))
                return boxWidthPx;
            if (text.getMaxWidth() != boxWidthPx) text.setMaxWidth(boxWidthPx);
            if (params.width != boxWidthPx
                    || params.height != ViewGroup.LayoutParams.WRAP_CONTENT) {
                params.width = boxWidthPx;
                params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                text.setLayoutParams(params);
            }
            if (!heightSame) text.setMinHeight(minHeight);
            text.measure(
                    View.MeasureSpec.makeMeasureSpec(boxWidthPx, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            if (spec.fits(shown, text.getLayout(), boxWidthPx - padding, 2)) return boxWidthPx;
            if (boxWidthPx == maximumBox) break;
            // The stable box unexpectedly does not fit (font fallback or an extreme glyph run).
            // Try the width the text wants before stretching to the whole frame.
            boxWidthPx = naturalBox > boxWidthPx ? naturalBox : maximumBox;
        }
        return -1;
    }

    private static void commitPageBox(Activity owner, FrameLayout anchor, TextView text,
            Rect bounds, int width, int measuredWidth) {
        contentWidth = Math.max(0, measuredWidth);
        placeVisibleText(owner, anchor, text, bounds, width);
    }

    private static void showAnchor(FrameLayout anchor) {
        if (anchor.getVisibility() == View.VISIBLE) return;
        anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        anchor.setVisibility(View.VISIBLE);
    }

    private static void placeVisibleText(
            Activity owner,
            FrameLayout anchor,
            TextView text,
            Rect bounds,
            int anchorWidthPx) {
        placeVisibleText(
                owner,
                anchor,
                text,
                bounds,
                anchorWidthPx,
                bounds != null && bounds.width() > bounds.height());
    }

    private static void placeVisibleText(
            Activity owner,
            FrameLayout anchor,
            TextView text,
            Rect bounds,
            int anchorWidthPx,
            boolean landscape) {
        if (owner == null || anchor == null || text == null) return;
        FrameLayout parent =
                anchor.getParent() instanceof FrameLayout ? (FrameLayout) anchor.getParent() : null;
        if (parent == null || parent != hostRef.get()) {
            // The anchor was re-parented by a player rebuild. Placement must follow the real parent
            // (and its inset), so remount once before reading coordinates.
            if (!attach(owner)) return;
            anchor = anchorRef.get();
            text = textRef.get();
            parent =
                    anchor != null && anchor.getParent() instanceof FrameLayout
                            ? (FrameLayout) anchor.getParent()
                            : null;
            if (anchor == null || text == null || parent == null) return;
        }
        // Place against the anchor's actual parent. captionVideoBounds(parent) is
        // CaptionSurface.relative(surface, parent): using a stale hostRef here shifted the box by
        // the difference between the two containers.
        Rect video = captionVideoBounds(parent);
        if (video == null || video.isEmpty()) return;
        // Keep the committed/class width even when the video is temporarily narrower: shrinking
        // the anchor to the video here would cancel the very difference the stable re-plan needs
        // to see, and the draw-time fit already keeps the text inside the video until it lands.
        int width = Math.max(1, anchorWidthPx);
        int height = text.getMeasuredHeight();
        if (!computeTarget(owner, video, width, height, height * text.getScaleY(), landscape)) return;
        boxWidth = width;
        boxHeight = height;
        boxClass = presentationDecision.currentClass();
        CaptionPresentationDecision.position(parent, anchor, nextLeft, avoidedTop(), boxWidth, boxHeight);
        if (anchor.isLayoutRequested() || text.isLayoutRequested()
                || anchor.getWidth() != width || anchor.getHeight() != height
                || text.getWidth() != text.getMeasuredWidth()
                || text.getHeight() != text.getMeasuredHeight()) {
            // The player may defer its own traversal during fullscreen entry. Commit only our
            // measured subtree now: new text must never draw through the preceding page's bounds.
            // Geometry-only pre-draw uses translate(), and never enters this content commit.
            anchor.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            int left = parent.getPaddingLeft(), top = parent.getPaddingTop();
            anchor.layout(left, top, left + width, top + height);
            applyCommentScale(owner, text);
        }
    }

    private static int lineCount(String value, float sizePx, int width, CaptionRenderSpec spec) {
        return spec.layout(value, sizePx, width).getLineCount();
    }

    // ---- Diagnostics ----

    private static void displayResult(
            Activity a,
            String mode,
            String reason,
            boolean visible,
            int width,
            float size,
            String detail,
            long applyStarted) {
        if (a == null) return;
        TextView view = textRef.get();
        String shown = visible && view != null ? view.getText().toString() : "";
        String projection =
                "|font="
                        + (layoutBudget == null ? "" : layoutBudget.renderSpec.measurementKey())
                        + "|event=" + pending.identity
                        + "|owner=" + CaptionPlayer.ownerEpoch();
        String key =
                pending.identity
                        + "|" + mode
                        + "|" + reason
                        + "|" + visible
                        + "|" + shown
                        + "|" + shownPage
                        + "|" + width
                        + "|" + size
                        + projection;
        if (key.equals(lastDisplayResult)) return;
        lastDisplayResult = key;
        long elapsed = Math.max(0, SystemClock.uptimeMillis() - applyStarted);
        String result =
                (detail.isEmpty() ? "id=" + pending.identity + ";mode=" + mode : detail)
                        + ";ui_applied=true;visible=" + visible
                        + ";reason=" + reason
                        + ";render_position=" + pending.position
                        + ";window=" + pending.start
                        + "-" + pending.end
                        + ";applied_wall_ms=" + System.currentTimeMillis()
                        + ";applied_uptime_ms=" + SystemClock.uptimeMillis()
                        + ";dispatch_uptime_ms=" + applyStarted
                        + ";main_apply_elapsed_ms=" + elapsed
                        + ";desired_box_width_px="
                        + (view == null ? 0 : view.getLayoutParams().width)
                        + ";measured_box_width_px="
                        + (view == null ? 0 : view.getMeasuredWidth())
                        + ";laid_out_box_width_px="
                        + (view == null ? 0 : view.getWidth());
        CaptionCredentialRef credential =
                currentGuard == null ? CaptionCredentialRef.NONE : currentGuard.credential();
        CaptionDiagnostics.mark(a, "REBUILD_DISPLAY_RESULT", result, credential);
    }

    private static void presentationDiagnostics(
            Activity a, String shown, float size, int width, long duration, String reason) {
        String notice =
                pending.identity
                        + "|" + pending.spec.targetCode
                        + "|" + shown
                        + "|" + size
                        + "|" + width
                        + "|" + duration
                        + "|" + reason
                        + "|" + shownPage;
        if (notice.equals(lastPresentationNotice)) return;
        lastPresentationNotice = notice;
        CaptionDisplayPage page =
                shownPage >= 0 && shownPage < pending.pages.size()
                        ? pending.pages.get(shownPage)
                        : null;
        CaptionLanguageProfile profile = pending.spec.profile;
        int readingUnits = pending.spec.readingUnits(shown);
        double readingCps = duration > 0 ? readingUnits * 1000.0 / duration : 0;
        String detail =
                "id="
                        + pending.identity
                        + ";target_code=" + pending.spec.targetCode
                        + ";presentation_policy=" + pending.spec.presentationPolicy
                        + ";duration_ms=" + duration
                        + ";available_width_px=" + width
                        + ";reading_units=" + readingUnits
                        + ";reading_rate_limit=" + profile.referenceCps
                        + ";reading_cps="
                        + String.format(Locale.ROOT, "%.2f", readingCps)
                        + ";page_density_over_limit="
                        + (readingCps > profile.referenceCps)
                        + ";minimum_page_wall_ms=" + profile.minimumPageMs
                        + ";maximum_recommended_page_wall_ms=" + profile.softPageDurationMs
                        + ";page_duration_above_recommendation="
                        + (duration > profile.softPageDurationMs)
                        + (page == null
                                ? ""
                                : ";line1_px="
                                        + page.linePlan.line1Px
                                        + ";line2_px=" + page.linePlan.line2Px);
        if (reason.isEmpty())
            CaptionDiagnostics.mark(a, "REBUILD_PRESENTATION", detail + ";hard_reject=false");
        else
            CaptionDiagnostics.mark(
                    a, "REBUILD_PRESENTATION_HARD_REJECT", detail + ";reason=" + reason);
    }

    // ---- Dragging the caption vertically ----

    /**
     * The drag is a gesture over the current video rectangle, not over the last content commit. It
     * captures the live rectangle once and uses that same rectangle and orientation for both the
     * saved position and the placement, so a stale or newly migrated content rect cannot write the
     * portrait key while the placement reads the landscape one.
     */
    private static boolean drag(View v, MotionEvent e) {
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                return beginDrag(v, e);
            case MotionEvent.ACTION_MOVE:
                if (dragSource != v) return false;
                moveDrag(e);
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (dragSource == v) finishDrag(v);
                return true;
            default:
                return false;
        }
    }

    private static boolean beginDrag(View source, MotionEvent e) {
        Activity a = activityRef.get();
        if (a == null || !anchorVisible() || blocked()) {
            stopDrag(source);
            return false;
        }
        Rect live = liveVideoBounds();
        if (live == null || live.height() <= 0 || live.width() <= 0) {
            stopDrag(source);
            return false;
        }
        dragLandscape = live.width() > live.height();
        dragShorts = CaptionSurface.isShorts();
        downY = e.getRawY();
        downAt = SystemClock.uptimeMillis();
        dragging = false;
        pressed = true;
        dragSource = source;
        ViewParent parent = source.getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        MAIN.removeCallbacks(ARM_DRAG);
        MAIN.postDelayed(ARM_DRAG, DRAG_AFTER_MS);
        return true;
    }

    private static void moveDrag(MotionEvent e) {
        Activity a = activityRef.get();
        if (a == null || !pressed) return;
        if (!dragging && SystemClock.uptimeMillis() - downAt >= DRAG_AFTER_MS) {
            MAIN.removeCallbacks(ARM_DRAG);
            ARM_DRAG.run();
        }
        if (!dragging) return;
        FrameLayout host = hostRef.get(), anchor = anchorRef.get();
        TextView text = textRef.get();
        if (host == null || anchor == null || text == null || anchor.getParent() != host) return;
        DRAG_TO_GLOBAL.reset();
        host.transformMatrixToGlobal(DRAG_TO_GLOBAL);
        if (!DRAG_TO_GLOBAL.invert(DRAG_TO_PARENT)) return;
        DRAG_VECTOR[0] = 0;
        DRAG_VECTOR[1] = e.getRawY() - downY;
        DRAG_TO_PARENT.mapVectors(DRAG_VECTOR);
        Rect video = liveVideoBounds();
        if (video == null || video.isEmpty()) return;
        float center = dragStartCenter + DRAG_VECTOR[1];
        nextTop = positionTop(a, video, center, boxHeight, boxHeight * text.getScaleY());
        dragMoved |= nextTop != dragStartTop;
        dragPosition = (nextTop + boxHeight / 2f - video.top) / video.height();
        CaptionPresentationDecision.translate(host, anchor, nextLeft, nextTop);
    }

    private static void stopDrag(View v) {
        pressed = false;
        dragging = false;
        deferredDragClear = deferredDragRender = false;
        MAIN.removeCallbacks(ARM_DRAG);
        View source = dragSource;
        dragSource = null;
        release(source);
        if (source != v) release(v);
    }

    private static void finishDrag(View v) {
        boolean wasDragging = dragging;
        boolean renderAfter = deferredDragRender;
        boolean clearAfter = deferredDragClear;
        Activity a = activityRef.get();
        if (wasDragging && a != null && !blocked() && !guardInvalid()) {
            if (dragMoved) {
                if (dragShorts) AiCaptionConfig.saveShortsPosition(a, dragPosition);
                else AiCaptionConfig.saveCaptionPosition(a, dragLandscape, dragPosition);
            } else if (dragStartShift > 0) {
                nextTop = dragStartTop + dragStartShift;
                controlShift = dragStartShift;
                if (!controlsVisible) animateControlShift(0);
            }
        }
        stopDrag(v);
        if (!wasDragging) return;
        if (clearAfter) {
            if (nothingPending()) resetGeometry();
            clearVisibleText(textRef.get());
        } else if (renderAfter) {
            pending.invalidateContent();
            render();
        }
        v.invalidate();
    }

    private static void release(View v) {
        if (v == null) return;
        ViewParent parent = v.getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
    }

    /**
     * The invisible proxy lives in YouTube's top player-overlay container. It consumes DOWN only
     * inside the visible caption box; every other DOWN falls through to the player controls. This
     * is independent of the visual layer's z-order, so the caption can stay below the player UI
     * while still receiving the gesture.
     */
    private static void ensureTouchProxy(Activity a) {
        FrameLayout visual = hostRef.get();
        FrameLayout host = CaptionSurface.touchHost();
        if (host == null || host == visual) {
            // The caption itself now lives in the topmost player-overlay container (above the
            // controls), so its own TextView is the drag target. A second full-screen proxy would
            // only add another view to hit-test and draw on every comments-sheet frame.
            removeTouchProxy();
            return;
        }
        FrameLayout current = touchHostRef.get();
        if (touchProxy != null && touchProxy.getParent() == host && current == host) return;
        removeTouchProxy();
        View proxy = new View(a);
        proxy.setTag("yydarlinker.ai.caption.touch");
        proxy.setBackgroundColor(Color.TRANSPARENT);
        proxy.setClickable(false);
        proxy.setFocusable(false);
        proxy.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        proxy.setOnTouchListener(
                (v, e) -> {
                    switch (e.getActionMasked()) {
                        case MotionEvent.ACTION_DOWN:
                            if (!captionHit(e)) return false;
                            if (!beginDrag(v, e)) return false;
                            ViewParent parent = v.getParent();
                            if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
                            return true;
                        case MotionEvent.ACTION_MOVE:
                            if (dragSource != v) return false;
                            moveDrag(e);
                            return true;
                        case MotionEvent.ACTION_UP:
                        case MotionEvent.ACTION_CANCEL:
                            if (dragSource != v) return false;
                            finishDrag(v);
                            return true;
                        default:
                            return false;
                    }
                });
        host.addView(
                proxy,
                new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        touchProxy = proxy;
        touchHostRef = new WeakReference<>(host);
        CaptionDiagnostics.mark(
                a,
                "CAPTION_TOUCH_PROXY",
                "host="
                        + host.getClass().getSimpleName()
                        + ";" + host.getWidth()
                        + "x" + host.getHeight());
    }

    private static void removeTouchProxy() {
        if (touchProxy != null && touchProxy.getParent() instanceof ViewGroup)
            ((ViewGroup) touchProxy.getParent()).removeView(touchProxy);
        touchProxy = null;
        touchHostRef.clear();
    }

    private static boolean captionHit(MotionEvent e) {
        TextView text = textRef.get();
        if (text == null || !anchorVisible()) return false;
        Rect rect = new Rect();
        if (!text.getGlobalVisibleRect(rect)) return false;
        return rect.contains((int) e.getRawX(), (int) e.getRawY());
    }

    /** The rectangle the finger is really dragging over; never the stale content snapshot. */
    private static Rect liveVideoBounds() {
        FrameLayout host = hostRef.get();
        Rect live = host == null ? null : captionVideoBounds(host);
        if (live == null && host != null) live = CaptionSurface.refreshedVideoBounds(host);
        if (live != null) return live;
        return videoGeometry.isEmpty() ? null : new Rect(videoGeometry);
    }

    private static int dp(Context c, float x) {
        return Math.round(x * c.getResources().getDisplayMetrics().density);
    }
}
