package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
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
import android.widget.FrameLayout;
import android.widget.TextView;

import app.yydarlinker.caption.contracts.CaptionContracts;
import app.yydarlinker.caption.contracts.CaptionContracts.Basis;
import app.yydarlinker.caption.contracts.CaptionContracts.Unit;
import app.yydarlinker.caption.contracts.CaptionContracts.Window;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Draws one caption event in one view. Layout never edits a translation or creates timeline events:
 * the pages come from the application, the player authority decides whether anything may show.
 */
final class CaptionOverlay {
    /** What the overlay needs to know about the session that owns the text it shows. */
    interface RenderGuard {
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
    private static CaptionHorizontalPlacement horizontalPlacement;

    // ---- What is to be shown ----

    private static RenderGuard currentGuard;
    private static Unit pendingUnit;
    private static String pendingText = "", pendingIdentity = "", pendingCanonicalHash = "";
    private static long pendingStart = -1, pendingEnd = -1, pendingPosition = -1;
    private static boolean pendingStatus, pendingWaiting;
    private static CaptionRenderSpec pendingRenderSpec = CaptionRenderSpec.LEGACY;
    private static long[] pendingSourceAnchors;
    private static List<CaptionPageLayout.Page> pendingPages = Collections.emptyList();
    private static int shownPage = -1;

    // ---- Layout and render bookkeeping ----

    /** Immutable geometry; background translation can measure without touching Views. */
    private static volatile CaptionPresentationBudget layoutBudget, planBudget;

    private static String desiredLayout = "", failedLayout = "";
    private static int measurementMismatch;
    private static boolean dirty = true, contentNow, reconcilingDisplayTime;
    private static long lastScan, layoutHoldSince = -1;
    private static String lastBlankIdentity, lastNotice = "", lastDisplayResult = "";
    private static String lastPresentationNotice = "";

    private static final Rect previous = new Rect();
    private static int previousScreenWidth;
    private static boolean previousShorts;
    private static CaptionPresentationClass.Kind previousClass;

    /**
     * One presentation class per reading mode. The PlayerType model decides it; geometry is only
     * the fallback for the first frame and for sessions that never deliver a type. It changes once
     * per model event, never per animation frame.
     */
    private static CaptionPresentationClass.Kind presentationClass;

    private static int classFrameWidth, reducedVideoWidth;

    /**
     * The class width a presentation-class commit chose, before any stable-width re-plan. A
     * narrower video re-plans against its own width but can never grow the box past this ceiling.
     */
    private static int classBaseWidth;

    /**
     * The last pre-draw video rectangle. The geometry is settled only after three consecutive
     * samples with exactly the same width; one different sample starts the count again. A
     * rectangle that alternates between two values therefore never settles, while the old
     * "this frame equals the previous one" test settled on every second frame of such a flicker.
     * No time constant is involved: the count is of samples, not of milliseconds.
     */
    private static final Rect previousGeometrySample = new Rect();

    private static final int STABLE_GEOMETRY_SAMPLES = 3;
    private static int stableGeometrySamples;

    private static int stableTextWidth, stableTextLines;
    private static long nextPageAt;

    /** Numeric painted-size state; this View adapter owns only frame scheduling and drawing. */
    private static final CaptionGlyphTransition glyphTransition = new CaptionGlyphTransition();
    private static boolean glyphFrameScheduled;

    /** Size tier and text-debug flag, resolved once per content commit. */
    private static int presentationTier = -1;
    private static boolean textDebug;
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
    private static CaptionPresentationClass.Kind boxClass;
    /** Width of the visible text box; the anchor itself stays full width for centering. */
    private static int contentWidth;
    private static final Rect dragBounds = new Rect();
    private static boolean dragLandscape, pressed;

    /** One frame-aligned UI request; never postpones model authority, clear or quarantine. */
    private static volatile long playerRenderEpoch;

    private static Runnable playerRenderTask;
    private static WeakReference<View> playerFrameClock = new WeakReference<>(null);
    private static boolean playerRenderPending, applyingPlayerRender;
    private static float downY, initial;
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
                if (contentNow) render();
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
                dirty = true;
                render();
            };

    /** The long press itself arms the drag; a finger that never moves still gets its haptic. */
    private static final Runnable ARM_DRAG =
            () -> {
                if (!pressed) return;
                dragging = true;
                TextView text = textRef.get();
                if (text != null) text.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            };

    private static final ViewTreeObserver.OnPreDrawListener WATCH =
            () -> {
                // Never measure, set text or change LayoutParams here: a layout started in
                // pre-draw can only be applied by the next traversal. Pre-draw reads the current
                // matrices and applies the draw-time scale/translation; content and box geometry
                // are queued for the next frame's animation phase.
                if (contentNow || nextPageDue()) requestBeforeTraversal();
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

    static CaptionPresentationBudget budget() {
        return layoutBudget;
    }

    // ---- Authority ----

    /** Display permission and the compact quarantine live in the one player authority. */
    private static boolean suppressed() {
        return !CaptionPlayerAuthority.displayPermitted()
                && CaptionPlayerAuthority.state() != CaptionPlayerAuthority.UNKNOWN;
    }

    private static boolean guardedExpansion() {
        int state = CaptionPlayerAuthority.state();
        return state == CaptionPlayerAuthority.COMPACT
                || state == CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR;
    }

    private static boolean blocked() {
        return CaptionNativeProjection.ccState() != CaptionIntentPolicy.ON
                || CaptionPlayerAuthority.shortsExitBlocked()
                || suppressed() || guardedExpansion();
    }

    private static boolean nothingPending() {
        return pendingText.isEmpty() && pendingIdentity.isEmpty();
    }

    private static boolean guardInvalid() {
        return currentGuard != null && !currentGuard.isValid();
    }

    private static void main(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) r.run();
        else MAIN.post(r);
    }

    // ---- Commands ----

    static void setActivity(Activity a) {
        CaptionPlayerAuthority.setOwner(a);
        main(
                () -> {
                    if (activityRef.get() != a) {
                        invalidatePlayerRender();
                        detach();
                    }
                    activityRef = new WeakReference<>(a);
                    CaptionSurface.activity(a);
                    dirty = true;
                    render();
                });
    }

    static void showStatus(String s, RenderGuard g) {
        show(s, true, g, "", -1, -1, -1, false, CaptionRenderSpec.LEGACY, null, "", null);
    }

    static void showWaitingEvent(
            String s, RenderGuard g, String id, long start, long end, long position) {
        show(s, false, g, id, start, end, position, true, CaptionRenderSpec.LEGACY, null, "", null);
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

    static void showEvent(
            String text,
            RenderGuard guard,
            String id,
            long start,
            long end,
            long at,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        // A failed or withheld event carries no text: it clears the box (the contract Unit rejects
        // blanks).
        if (text == null || text.trim().isEmpty()) {
            hide(guard);
            return;
        }
        Unit unit =
                start >= 0 && end > start
                        ? new Unit(
                                id,
                                0,
                                1,
                                text,
                                Collections.singletonList(new Window(start, end)),
                                Basis.ESTIMATED,
                                0)
                        : null;
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
                unit,
                CaptionContracts.hash(text),
                sourceAnchors);
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
            Unit sourceUnit,
            String canonicalHash,
            long[] sourceAnchors) {
        if (g != null && !g.isValid()) return;
        long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
        final long renderEpoch = playerRenderEpoch;
        main(
                () -> {
                    if (!accepts(g, command, renderEpoch)) return;
                    pendingRenderSpec = spec;
                    pendingCanonicalHash = canonicalHash;
                    pendingUnit = sourceUnit;
                    pendingSourceAnchors = sourceAnchors;
                    pendingText = s == null ? "" : s;
                    pendingIdentity = id;
                    pendingStart = start;
                    pendingEnd = end;
                    pendingPosition = g == null ? position : g.displayPosition(position);
                    pendingPages = Collections.emptyList();
                    stableTextWidth = 0;
                    stableTextLines = 0;
                    nextPageAt = 0;
                    shownPage = -1;
                    pendingStatus = status;
                    pendingWaiting = waiting;
                    currentGuard = g;
                    dirty = true;
                    contentNow = true;
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

    static void hide(RenderGuard g) {
        if (g != null && !g.isValid()) return;
        long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
        final long renderEpoch = playerRenderEpoch;
        main(
                () -> {
                    if (!accepts(g, command, renderEpoch)) return;
                    final long applyStarted = SystemClock.uptimeMillis();
                    invalidatePlayerRender();
                    forgetPending();
                    currentGuard = g;
                    hideView();
                    if (g == null) return;
                    // The identity is diagnostic only: a blank is not a pending render.
                    pendingIdentity = g.identity();
                    pendingStart = g.windowStart();
                    pendingEnd = g.windowEnd();
                    pendingPosition = g.displayPosition(pendingPosition);
                    displayResult(
                            activityRef.get(),
                            "empty",
                            g.blankReason(),
                            false,
                            0,
                            0,
                            "",
                            applyStarted);
                    pendingIdentity = "";
                    pendingStart = -1;
                    pendingEnd = -1;
                    g.onApplied();
                });
    }

    static void clear() {
        clear(null);
    }

    /** Session cleanup cannot invalidate a newer session's queued render command. */
    static void clear(RenderGuard guard) {
        if (guard != null && !guard.isValid()) return;
        long command = guard == null ? COMMAND.incrementAndGet() : COMMAND.get();
        main(
                () -> {
                    if (command != COMMAND.get() || guard != null && !guard.isValid()) return;
                    forgetPending();
                    invalidatePlayerRender();
                    pendingStatus = false;
                    currentGuard = null;
                    hideView();
                });
    }

    private static void forgetPending() {
        pendingText = "";
        pendingUnit = null;
        pendingStart = -1;
        pendingEnd = -1;
        pendingIdentity = "";
        pendingSourceAnchors = null;
        pendingPages = Collections.emptyList();
        shownPage = -1;
        stableTextWidth = 0;
        stableTextLines = 0;
        nextPageAt = 0;
        desiredLayout = "";
        failedLayout = "";
        measurementMismatch = 0;
        contentNow = false;
        resetGeometry();
    }

    static void position(long position, RenderGuard owner) {
        if (owner != null && !owner.isValid()) return;
        main(
                () -> {
                    if (owner != null && !owner.isValid()) return;
                    long latest =
                            currentGuard != null && currentGuard.isValid()
                                    ? currentGuard.displayPosition(position)
                                    : owner == null ? position : owner.displayPosition(position);
                    long before = pendingPosition;
                    pendingPosition = latest;
                    boolean timed = pendingStart >= 0 && pendingEnd > pendingStart;
                    if (CaptionPageLayout.indexAt(pendingPages, latest) != shownPage
                            || pendingUnit != null
                                    && (!ownsDisplayPosition(latest)
                                            || !ownsDisplayPosition(before))
                            || timed && (!inWindow(latest) || !inWindow(before))) {
                        dirty = true;
                        render();
                    }
                });
    }

    private static boolean inWindow(long at) {
        return at >= pendingStart && at < pendingEnd;
    }

    static void refreshStyle(Context c) {
        main(
                () -> {
                    // An explicit style refresh is not a player notification.
                    invalidatePlayerRender();
                    dirty = true;
                    contentNow = true;
                    render();
                });
    }

    /**
     * Geometry refresh only, and never during a player transition: the transition coordinator is
     * the single place that decides when a new surface may be discovered. Shorts keep their own
     * isolation, which is a surface fact rather than a player-transition fact.
     */
    static void refreshSurface() {
        main(
                () -> {
                    CaptionPlayerAuthority.reconcileCurrentPlayerType();
                    if (CaptionPlayerAuthority.state() == CaptionPlayerAuthority.COMPACT) return;
                    boolean surfaceDirty = CaptionPlayerAuthority.consumeSurfaceDirty();
                    if (CaptionSurface.isShorts()) CaptionPlayerAuthority.noteShortsSurface();
                    else if (CaptionPlayerAuthority.state()
                            == CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR) return;
                    // The throttle bounds repeated searches; a genuinely new player notification is
                    // a real surface change and replaces the throttled search instead of adding.
                    long now = SystemClock.uptimeMillis();
                    if (!surfaceDirty && now >= lastScan && now - lastScan < SCAN_INTERVAL_MS)
                        return;
                    CaptionSurface.refresh();
                    lastScan = SystemClock.uptimeMillis();
                    CaptionSurface.invalidateGeometry();
                    dirty = true;
                    render();
                });
    }

    /** Routes a raw player type into the authority, which alone decides display permission. */
    static void setPlayerType(String type) {
        CaptionPlayerAuthority.onNotification(type);
        main(
                () -> {
                    if (nothingPending() && !anchorVisible()) {
                        CaptionSurface.invalidateGeometry();
                        return;
                    }
                    final long applyStarted = SystemClock.uptimeMillis();
                    int state = CaptionPlayerAuthority.state();
                    if (state == CaptionPlayerAuthority.COMPACT
                            || state == CaptionPlayerAuthority.CLOSED) {
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
                    dirty = true;
                    requestPlayerRender();
                });
    }

    /** Main-thread constant-time retraction; accepted plans and positions are retained. */
    static void denyDisplay(long ownerEpoch) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> denyDisplay(ownerEpoch));
            return;
        }
        if (ownerEpoch != CaptionPlayerAuthority.ownerEpoch()) return;
        invalidatePlayerRender();
        COMMAND.incrementAndGet();
        TextView text = textRef.get();
        stopDrag(text);
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
        playerRenderPending = false;
    }

    /** One render on the next frame; an authoritative transition supersedes a queued one. */
    static void requestPlayerRender() {
        if (nothingPending() || blocked()) return;
        if (playerRenderTask != null) invalidatePlayerRender();
        Activity owner = activityRef.get();
        if (!usable(owner)) return;
        View clock = owner.getWindow().getDecorView();
        final long epoch = playerRenderEpoch;
        playerRenderPending = true;
        playerRenderTask =
                () -> {
                    // A stale callback has no attach/render/hide side effects.
                    if (epoch != playerRenderEpoch || activityRef.get() != owner || !usable(owner))
                        return;
                    playerRenderTask = null;
                    playerFrameClock.clear();
                    playerRenderPending = false;
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
                                    + CaptionPlayerAuthority.playerType()
                                    + ";state="
                                    + CaptionPlayerAuthority.stateName()
                                    + ";geometry_search_count="
                                    + CaptionSurface.refreshSearchCount
                                    + ";native_scan_count="
                                    + CaptionMusicSuppressor.scanCount);
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
        resetCommentScale(textRef.get());
        pressed = false;
        dragging = false;
        View source = dragSource;
        dragSource = null;
        release(source);
        nextPageAt = 0;
        MAIN.removeCallbacks(ARM_DRAG);
        layoutHoldSince = -1;
        if (horizontalPlacement != null) horizontalPlacement.cancel();
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
        stopDrag(null);
        if (horizontalPlacement != null) horizontalPlacement.cancel();
        horizontalPlacement = null;
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
        presentationClass = null;
        classFrameWidth = 0;
        classBaseWidth = 0;
        previousGeometrySample.setEmpty();
        stableGeometrySamples = 0;
        reducedVideoWidth = 0;
        lastScan = -SCAN_INTERVAL_MS;
        lastNotice = "";
        lastBlankIdentity = null;
        layoutBudget = null;
        planBudget = null;
        pendingPages = Collections.emptyList();
        desiredLayout = "";
        failedLayout = "";
        measurementMismatch = 0;
        contentNow = false;
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
            FrameLayout oldHost = hostRef.get();
            if (horizontalPlacement != null) horizontalPlacement.cancel();
            if (oldHost != null && oldHost != host
                    && oldHost.getViewTreeObserver().isAlive())
                oldHost.getViewTreeObserver().removeOnPreDrawListener(WATCH);
            ((ViewGroup) anchor.getParent()).removeView(anchor);
            ViewGroup.LayoutParams params = anchor.getLayoutParams();
            if (params == null) params = new FrameLayout.LayoutParams(1, 1);
            if (topmost) host.addView(anchor, params);
            else if (pinned) host.addView(anchor, 0, params);
            else host.addView(anchor, params);
            hostRef = new WeakReference<>(host);
            TextView text = textRef.get();
            horizontalPlacement = new CaptionHorizontalPlacement(host, anchor, text);
            host.getViewTreeObserver().addOnPreDrawListener(WATCH);
            Rect current = captionVideoBounds(host);
            if (current == null) current = CaptionSurface.refreshedVideoBounds(host);
            if (text != null && current != null && boxWidth > 0)
                placeVisibleText(a, host, anchor, text, current, boxWidth);
            videoGeometry.setEmpty();
            previousGeometrySample.setEmpty();
            stableGeometrySamples = 0;
            previous.setEmpty();
            previousScreenWidth = 0;
            dirty = true;
            ensureTouchProxy(a);
            return true;
        }
        detach();
        if (!host.isAttachedToWindow()) return false;
        anchor = new FrameLayout(a);
        // A fresh overlay starts hidden: only a render that passed the authority, guard and
        // geometry checks may show it, so a transition can never expose an unverified overlay.
        anchor.setVisibility(View.GONE);
        anchor.setTag("yydarlinker.deepseek.caption.anchor");
        // Only the outer coordinate system is physical LTR; the TextView keeps its target spec.
        anchor.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        anchor.setClipChildren(false);
        anchor.setClipToPadding(false);
        TextView text = new CaptionText(a);
        text.setTag("yydarlinker.deepseek.caption.overlay");
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
        if (topmost) host.addView(anchor, new FrameLayout.LayoutParams(1, 1));
        else if (pinned) host.addView(anchor, 0, new FrameLayout.LayoutParams(1, 1));
        else host.addView(anchor, new FrameLayout.LayoutParams(1, 1));
        hostRef = new WeakReference<>(host);
        anchorRef = new WeakReference<>(anchor);
        textRef = new WeakReference<>(text);
        horizontalPlacement = new CaptionHorizontalPlacement(host, anchor, text);
        host.getViewTreeObserver().addOnPreDrawListener(WATCH);
        CaptionDiagnostics.mark(
                a,
                "CAPTION_LAYER",
                "layer="
                        + (videoLayer ? "video" : "activity")
                        + ";host="
                        + host.getClass().getSimpleName()
                        + ";width="
                        + host.getWidth()
                        + ";height="
                        + host.getHeight()
                        + ";children="
                        + host.getChildCount()
                        + ";"
                        + CaptionPlayerAuthority.shortId());
        ensureTouchProxy(a);
        dirty = true;
        return true;
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

    private static boolean ownsDisplayPosition(long at) {
        return pendingUnit != null && pendingUnit.audible(at);
    }

    /** Height belongs to the page that is actually shown, never to the widest page in the plan. */
    private static int pageLines(CaptionPageLayout.Page page) {
        if (page == null || page.linePlan == null) return 0;
        return page.linePlan.line2Px > 0 ? 2 : 1;
    }

    // ---- Holds ----

    private static boolean holdingEnd(long at) {
        boolean held =
                currentGuard != null
                        && currentGuard.isValid()
                        && pendingUnit != null
                        && !pendingStatus
                        && !pendingWaiting
                        && pendingEnd > pendingStart
                        && at >= pendingEnd
                        && at - pendingEnd < END_HOLD_MS
                        && shownPage >= 0
                        && shownPage == pendingPages.size() - 1
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
        return pendingIdentity
                + "|"
                + pendingCanonicalHash
                + "|"
                + pendingStart
                + "|"
                + pendingEnd
                + "|"
                + spec.measurementKey()
                + "|"
                + budget.width
                + "|"
                + Float.floatToIntBits(budget.preferredPx)
                + "|"
                + java.util.Arrays.toString(pendingSourceAnchors);
    }

    /** The pages of the pending event; laid out off the main thread, empty until they are ready. */
    private static List<CaptionPageLayout.Page> currentPlan(
            CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        String key = planKey(budget, spec);
        if (!key.equals(desiredLayout)) {
            desiredLayout = key;
            failedLayout = "";
            measurementMismatch = 0;
        }
        List<CaptionPageLayout.Page> ready = LAYOUTS.get(key);
        if (ready != null) return ready;
        final String body = pendingText, identity = pendingIdentity;
        final long start = pendingStart, end = pendingEnd;
        final RenderGuard guard = currentGuard;
        LAYOUTS.request(
                key,
                () ->
                        CaptionActions.displayPages(
                                body, start, end, budget, spec, pendingSourceAnchors),
                pages ->
                        MAIN.post(
                                () -> {
                                    if (!key.equals(desiredLayout)
                                            || !identity.equals(pendingIdentity)
                                            || guard != currentGuard
                                            || guard != null && !guard.isValid()) return;
                                    if (pages.isEmpty()) failedLayout = key;
                                    dirty = true;
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
                || pendingPages.isEmpty()
                || shownPage < 0
                || shownPage >= pendingPages.size()) return;
        CaptionPageLayout.Page page = pendingPages.get(shownPage);
        long delay = Math.max(0, page.end - at);
        nextPageAt = SystemClock.uptimeMillis() + delay + 8;
    }

    /** Advances an already prepared page when its time arrives. */
    static void advancePreparedPage() {
        // Pages still being laid out belong to render(), which also holds the previous text.
        if (currentGuard == null
                || !currentGuard.isValid()
                || pendingUnit == null
                || !anchorVisible()
                || pendingPages.isEmpty()) return;
        long at = currentGuard.displayPosition(pendingPosition);
        int next = CaptionPageLayout.indexAt(pendingPages, at);
        pendingPosition = at;
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
            if (text != null) text.setText("");
            hideView();
            shownPage = -1;
            return;
        }
        if (next == shownPage) {
            scheduleNextPage(at);
            return;
        }
        CaptionPageLayout.Page page = pendingPages.get(next);
        CaptionPresentationBudget budget = layoutBudget;
        if (text == null || budget == null) return;
        final long applyStarted = SystemClock.uptimeMillis();
        stableTextLines = pageLines(page);
        int applied =
                applyVisibleText(
                        text,
                        page.text,
                        budget.preferredPx,
                        budget.width,
                        pendingRenderSpec,
                        page.linePlan,
                        stableTextWidth,
                        stableTextLines);
        if (applied < 0) {
            text.setText("");
            hideView();
            return;
        }
        // The page was applied: cache the ink height this layout actually paints at. This is one
        // of the only two places that may measure it.
        layoutGlyphInkPx = SubtitleStyleMetrics.measuredGlyphHeightPx(text.getPaint());
        contentWidth = applied;
        Rect placement =
                videoGeometry.isEmpty()
                        ? captionVideoBounds(hostRef.get())
                        : new Rect(videoGeometry);
        if (placement == null) placement = new Rect(previous);
        int planWidth = budget.width + text.getPaddingLeft() + text.getPaddingRight();
        int anchorWidth = classFrameWidth > 0 ? classFrameWidth : planWidth;
        anchorWidth = Math.min(anchorWidth, planWidth);
        if (!placement.isEmpty()) anchorWidth = Math.min(anchorWidth, placement.width());
        placeVisibleText(
                activityRef.get(),
                hostRef.get(),
                anchorRef.get(),
                text,
                placement,
                anchorWidth);
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
            if (anchorVisible()) CaptionOverlay.denyDisplay(CaptionPlayerAuthority.ownerEpoch());
            return;
        }
        if (nothingPending()) return;
        FrameLayout host = hostRef.get(), anchor = anchorRef.get();
        TextView text = textRef.get();
        if (host == null
                || anchor == null
                || text == null
                || !anchorVisible()
                || host.getWidth() <= 0) return;
        Rect video = captionVideoBounds(host);
        if (video == null || video.width() < 50 || video.height() < 50) return;
        noteGeometry(video);
        if (updatePresentationClass(video)) {
            contentNow = true;
            dirty = true;
            // The size law has already moved the current layout to the new reading size; the
            // content and box change belongs to the next frame, before its traversal.
            applyCommentScale(a, text);
            requestBeforeTraversal();
            return;
        }
        if (replanForStableVideo(a, text, video)) {
            contentNow = true;
            dirty = true;
            // The new box is a content fact for the page planner. The frame callback turns it into
            // a plan before the next traversal; pre-draw only scales and translates meanwhile.
            applyCommentScale(a, text);
            requestBeforeTraversal();
            return;
        }
        applyCommentScale(a, text);
        // Pre-draw may only scale and translate. The committed box keeps its measured width and
        // height; a real content change is applied by render() before the next traversal.
        followVisibleTextTranslation(a, anchor);
    }

    /**
     * Re-plans the box against a video that settled narrower than the presentation class's stable
     * width, or back to the class width once the video is wide enough again.
     *
     * <p>The trigger is geometry, not time: three consecutive pre-draw samples must have exactly
     * the same width, so the player/sheet animation has stopped and did not merely return to one
     * of two alternating values. A difference of at most 2% is inside the class's own margin; a
     * larger one means the class width no longer describes the viewport. The plan is requested
     * through the existing frame callback, so pre-draw neither measures nor lays anything out.
     */
    private static boolean replanForStableVideo(Activity a, TextView text, Rect video) {
        if (video.width() == previousGeometrySample.width()) stableGeometrySamples++;
        else stableGeometrySamples = 1;
        previousGeometrySample.set(video);
        if (stableGeometrySamples < STABLE_GEOMETRY_SAMPLES
                || text == null
                || boxWidth <= 0
                || classBaseWidth <= 0) return false;
        float difference = Math.abs(video.width() - boxWidth) / (float) boxWidth;
        if (difference <= .02f) return false;
        int plan = stablePlanWidth(text, video.width());
        if (plan == classFrameWidth) return false;
        int previous = classFrameWidth;
        classFrameWidth = plan;
        // One re-plan per settled width: a further one needs a new run of three samples.
        stableGeometrySamples = 0;
        CaptionDiagnostics.mark(
                a,
                "CAPTION_STABLE_REPLAN",
                "class="
                        + presentationClass
                        + ";video_width="
                        + video.width()
                        + ";class_width="
                        + classBaseWidth
                        + ";previous_width="
                        + previous
                        + ";plan_width="
                        + plan
                        + ";difference="
                        + difference
                        + ";padding="
                        + (text.getPaddingLeft() + text.getPaddingRight()));
        return true;
    }

    /**
     * The box width for a stable video: the class's 92% reading margin, capped by the class width
     * and quantized to 8 px so a sequence of inset endpoints cannot produce a different plan per
     * pixel. When the video is wide enough that 92% reaches the class width, the class width is
     * used unchanged - the fullscreen box is not re-quantized away from its established size.
     */
    private static int stablePlanWidth(TextView text, int videoWidth) {
        int wide = Math.round(videoWidth * .92f);
        if (wide >= classBaseWidth) return classBaseWidth;
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int inner = Math.max(8, ((wide - padding) / 8) * 8);
        return Math.min(classBaseWidth, inner + padding);
    }

    private static boolean computeTarget(
            Activity owner, Rect video, int width, int height, boolean landscape) {
        if (owner == null || video == null || video.isEmpty() || width <= 0 || height <= 0)
            return false;
        float y =
                CaptionSurface.isShorts()
                        ? DeepSeekConfig.shortsPosition(owner)
                        : DeepSeekConfig.captionPositionY(owner, landscape);
        int top = video.top + Math.round(video.height() * y) - height / 2;
        top = Math.max(video.top, Math.min(top, video.bottom - height));
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

    /**
     * The only placement allowed in pre-draw: translation. The anchor keeps the width, height and
     * margins the last content commit gave it; changing them here would request a layout that can
     * only be applied by the next traversal.
     */
    private static void followVisibleTextTranslation(Activity a, FrameLayout anchor) {
        if (boxWidth <= 0 || boxHeight <= 0 || anchor == null) return;
        FrameLayout parent =
                anchor.getParent() instanceof FrameLayout ? (FrameLayout) anchor.getParent() : null;
        if (parent == null || parent != hostRef.get()) {
            // Pre-draw must never add/remove views. Ask for the next frame instead: render()
            // remounts the anchor and commits the new placement before that traversal.
            contentNow = true;
            dirty = true;
            requestBeforeTraversal();
            return;
        }
        // Placement is in the anchor's own parent coordinates. Reading the video against any
        // other container (a stale hostRef) shifts the box by that container's inset.
        Rect video = captionVideoBounds(parent);
        if (video == null || video.isEmpty()) return;
        if (!computeTarget(a, video, boxWidth, boxHeight, video.width() > video.height())) return;
        CaptionHorizontalPlacement.translate(parent, anchor, nextLeft, nextTop);
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
                || pendingPages.isEmpty()
                || shownPage < 0
                || shownPage >= pendingPages.size()
                || contentWidth <= 0
                || !shownText()) return false;
        if (layoutBudget.preferredPx != preferred
                || layoutBudget.width != inner
                || !layoutBudget.renderSpec.measurementKey().equals(spec.measurementKey()))
            return false;
        CaptionPageLayout.Page page = pendingPages.get(shownPage);
        return page.linePlan != null
                && page.contains(pendingPosition)
                && ownsDisplayPosition(pendingPosition);
    }

    private static void resetGeometry() {
        videoGeometry.setEmpty();
        previousGeometrySample.setEmpty();
        stableGeometrySamples = 0;
        boxWidth = 0;
        boxHeight = 0;
        boxClass = null;
        contentWidth = 0;
        stableTextWidth = 0;
        stableTextLines = 0;
        nextPageAt = 0;
    }

    /**
     * Classifies the current reading mode. A PlayerType notification is the model's own statement
     * about the mode, so it is authoritative; geometry is only the fallback for the first frame and
     * for tests/versions that never deliver a type. There is no candidate timer: a class commit is
     * a consequence of the model event, not of the geometry having been still for N milliseconds.
     */
    private static boolean updatePresentationClass(Rect video) {
        Activity a = activityRef.get();
        if (a == null || video == null) return false;
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        boolean shorts = CaptionSurface.isShorts();
        CaptionPresentationClass.Kind next = playerTypeClass(screenWidth, screenHeight, shorts);
        if (next == null)
            next =
                    CaptionPresentationClass.classify(
                            presentationClass, video, screenWidth, screenHeight, shorts);
        if (presentationClass == null)
            return commitPresentationClass(a, next, video, screenWidth, screenHeight, shorts);
        if (next == presentationClass) {
            if (next == CaptionPresentationClass.Kind.REDUCED) {
                int cap = reducedWidthCap(screenWidth, screenHeight);
                if (video.width() > 0 && video.width() <= cap) reducedVideoWidth = video.width();
                else if (reducedVideoWidth > cap) reducedVideoWidth = 0;
            }
            return false;
        }
        return commitPresentationClass(a, next, video, screenWidth, screenHeight, shorts);
    }

    /**
     * The reading class the player-type model currently asks for. Null means the model has no
     * opinion (unknown, or sliding between two sizes), and geometry decides the first frame.
     */
    private static CaptionPresentationClass.Kind playerTypeClass(
            int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationClass.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationClass.Kind.DETAIL;
        String type = CaptionPlayerAuthority.playerType();
        if (type.isEmpty()) return null;
        if (type.contains("SLIDING")) return presentationClass;
        if (type.contains("FULLSCREEN")) return CaptionPresentationClass.Kind.FULL;
        if (type.contains("MAXIMIZED")) return CaptionPresentationClass.Kind.REDUCED;
        return null;
    }

    /** A reduced viewport is by definition no wider than the reduced threshold. */
    private static int reducedWidthCap(int screenWidth, int screenHeight) {
        return Math.max(
                1,
                Math.round(
                        CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                                * CaptionPresentationClass.ENTER_REDUCED));
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
        float density = screenShort / CaptionPresentationClass.REFERENCE_SHORT_SIDE_PX;
        float full = CaptionFontSize.fullScreenGlyphHeightPx(tier) * density;
        float detail = CaptionFontSize.detailGlyphHeightPx(tier) * density;
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
                    CaptionFontSize.detailGlyphHeightPx(tier)
                            * screenShort
                            / CaptionPresentationClass.REFERENCE_SHORT_SIDE_PX;
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
        if (boxClass == presentationClass
                && contentWidth > 0
                && videoWidth > 0
                && videoWidth < contentWidth) fit = videoWidth / (float) contentWidth;
        float scale = captionScale(glyphTransition.displayedPx(), glyphLocalPx, anchorScale) * fit;
        if (!(scale > 0f) || Float.isNaN(scale) || Float.isInfinite(scale)) return;
        if (Math.abs(text.getScaleX() - scale) > .002f
                || Math.abs(text.getScaleY() - scale) > .002f) {
            text.setPivotX(text.getWidth() / 2f);
            text.setPivotY(text.getHeight() / 2f);
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
            CaptionPresentationClass.Kind next,
            Rect video,
            int screenWidth,
            int screenHeight,
            boolean shorts) {
        TextView text = textRef.get();
        int padding =
                text == null
                        ? dp(a, 6) * 2
                        : text.getPaddingLeft() + text.getPaddingRight();
        // A new fullscreen viewport is the start of a new reduced-width observation; keeping the
        // previous video's reduced width would make the first comments opening too narrow.
        if (next == CaptionPresentationClass.Kind.FULL) reducedVideoWidth = 0;
        // FULL is a stable target for the whole fullscreen class: capturing it from the first
        // frame of a closing comments sheet would leave the caption permanently too narrow. The
        // render path still caps the effective width by the displayed video.
        int videoWidth =
                next == CaptionPresentationClass.Kind.FULL
                        ? CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                        : CaptionPresentationClass.layoutVideoWidth(
                                next, video, screenWidth, screenHeight, reducedVideoWidth);
        classFrameWidth = Math.max(1, Math.round(videoWidth * (shorts ? .78f : .92f)));
        classBaseWidth = classFrameWidth;
        // A class commit is a new reading width: the previous video's stable re-plan is over.
        previousGeometrySample.setEmpty();
        stableGeometrySamples = 0;
        float classGlyph =
                CaptionPresentationClass.glyphHeightPx(
                        DeepSeekConfig.displayStyle(a).captionSizeTier,
                        screenWidth,
                        screenHeight,
                        next);
        presentationClass = next;
        stableTextWidth = 0;
        stableTextLines = 0;
        CaptionDiagnostics.mark(
                a,
                "CAPTION_PRESENTATION_CLASS",
                "class="
                        + next
                        + ";video="
                        + video.flattenToString()
                        + ";screen="
                        + screenWidth
                        + "x"
                        + screenHeight
                        + ";full_width="
                        + CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                        + ";layout_video_width="
                        + videoWidth
                        + ";class_frame_width="
                        + classFrameWidth
                        + ";glyph_height_px="
                        + classGlyph
                        + ";reduced_width="
                        + reducedVideoWidth
                        + ";padding="
                        + padding);
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
                || pendingStatus
                || pendingWaiting
                || pendingUnit == null
                || pendingText.isEmpty()
                || pendingStart < 0
                || pendingEnd <= pendingStart) return;
        DisplayMetrics metrics = a.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels, screenHeight = metrics.heightPixels;
        boolean shorts = CaptionSurface.isShorts();
        CaptionPresentationClass.Kind target =
                playerTypePrefetchClass(type, screenWidth, screenHeight, shorts);
        if (target == null || target == presentationClass) return;
        TextView text = textRef.get();
        if (text == null) return;
        FrameLayout host = hostRef.get();
        Rect video = host == null ? null : captionVideoBounds(host);
        if (video == null && !videoGeometry.isEmpty()) video = new Rect(videoGeometry);
        if (video == null || video.width() <= 0) return;
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int videoWidth =
                target == CaptionPresentationClass.Kind.FULL
                        ? CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                        : CaptionPresentationClass.layoutVideoWidth(
                                target, video, screenWidth, screenHeight, reducedVideoWidth);
        int width = Math.max(1, Math.round(videoWidth * (shorts ? .78f : .92f)));
        width = Math.min(width, screenWidth);
        int inner = Math.max(1, width - padding);
        int tier =
                presentationTier >= 0
                        ? presentationTier
                        : DeepSeekConfig.displayStyle(a).captionSizeTier;
        CaptionRenderSpec spec = pendingRenderSpec.withPaint(text);
        float preferred =
                SubtitleStyleMetrics.textSizePxForGlyphHeight(
                        text.getPaint(),
                        CaptionPresentationClass.glyphHeightPx(
                                tier, screenWidth, screenHeight, target));
        float minimum =
                SubtitleStyleMetrics.textSizePxForGlyphHeight(
                        text.getPaint(),
                        CaptionPresentationClass.glyphHeightPx(
                                0, screenWidth, screenHeight, target));
        CaptionPresentationBudget budget =
                new CaptionPresentationBudget(inner, minimum, preferred, spec);
        String key = planKey(budget, spec);
        String body = pendingText;
        long start = pendingStart, end = pendingEnd;
        long[] anchors = pendingSourceAnchors;
        LAYOUTS.prefetch(
                key,
                () -> CaptionActions.displayPages(body, start, end, budget, spec, anchors));
    }

    /** The class a PlayerType event is heading to, including the destination of a slide. */
    private static CaptionPresentationClass.Kind playerTypePrefetchClass(
            String type, int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationClass.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationClass.Kind.DETAIL;
        String name = type == null ? "" : type.toUpperCase(Locale.ROOT);
        if (name.contains("FULLSCREEN")) return CaptionPresentationClass.Kind.FULL;
        if (name.contains("MAXIMIZED")) return CaptionPresentationClass.Kind.REDUCED;
        return null;
    }

    // ---- Render ----

    private static void render() {
        final long applyStarted = SystemClock.uptimeMillis();
        boolean forceContent = contentNow;
        contentNow = false;
        Activity a = activityRef.get();
        if (guardInvalid()) {
            hideView();
            displayResult(a, "suppressed", "owner_invalid", false, 0, 0, "", applyStarted);
            return;
        }
        if (currentGuard != null) pendingPosition = currentGuard.displayPosition(pendingPosition);
        boolean timed = pendingStart >= 0 && pendingEnd > pendingStart;
        if (timed && !inWindow(pendingPosition)) {
            if (holdingEnd(pendingPosition)) return;
            TextView stale = textRef.get();
            if (stale != null) stale.setText("");
            shownPage = -1;
            hideView();
            dirty = true;
            displayResult(a, "empty", "outside_owned_window", false, 0, 0, "", applyStarted);
            return;
        }
        // A time expiry is authoritative even while a geometry frame is queued.
        if (playerRenderPending && !applyingPlayerRender) {
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
        CaptionRenderSpec displaySpec = pendingRenderSpec;
        if (pendingStatus || pendingWaiting) {
            String code = CaptionTextResolver.locale(a).toLanguageTag();
            displaySpec = new CaptionRenderSpec(code, CaptionLanguageProfile.fromCode(code), false);
        }
        displaySpec.apply(text);
        Rect b = captionVideoBounds(host);
        if (b == null || CaptionPlayerAuthority.consumeSurfaceDirty()) {
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
            contentNow = false;
        }
        if (!dirty
                && !forceContent
                && !classChanged
                && b.equals(previous)
                && screenWidth == previousScreenWidth
                && shorts == previousShorts
                && presentationClass == previousClass
                && (anchor.getVisibility() == View.VISIBLE
                        || anchor.getVisibility() == View.GONE
                                && pendingIdentity.equals(lastBlankIdentity))) return;
        previousShorts = shorts;
        previousClass = presentationClass;
        dirty = false;
        previous.set(b);
        // A new surface is committed only outside a player transition.
        if (guardedExpansion() && !shorts) {
            hideView();
            return;
        }
        previousScreenWidth = screenWidth;
        DeepSeekConfig.Appearance cfg = DeepSeekConfig.displayStyle(a);
        // Resolved once per commit, not once per frame: the pre-draw consults both.
        presentationTier = cfg.captionSizeTier;
        textDebug = DeepSeekConfig.displayTextDebugEnabled(a);
        // Size belongs to the stable presentation class, not to the instantaneous rectangle. The
        // class was captured when the viewport crossed its hysteresis threshold, so a sheet
        // animation cannot rescale or re-paginate the text mid-flight.
        float targetGlyphHeight =
                CaptionPresentationClass.glyphHeightPx(
                        cfg.captionSizeTier, screenWidth, screenHeight, presentationClass);
        float preferred =
                SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(), targetGlyphHeight);
        float minimum =
                SubtitleStyleMetrics.textSizePxForGlyphHeight(
                        text.getPaint(),
                        CaptionPresentationClass.glyphHeightPx(
                                0, screenWidth, screenHeight, presentationClass));
        int width =
                classFrameWidth > 0
                        ? classFrameWidth
                        : Math.max(1, Math.round(b.width() * (shorts ? .78f : .92f)));
        // The committed class width is the stable reading width for this mode. A transition frame
        // must not narrow the plan: that would re-paginate the caption while the player animates.
        width = Math.min(width, screenWidth);
        int padding = text.getPaddingLeft() + text.getPaddingRight();
        int inner = Math.max(1, width - padding);
        CaptionRenderSpec measuredSpec = displaySpec.withPaint(text);
        boolean ownedCaption = !pendingStatus && !pendingWaiting && !pendingText.isEmpty() && timed;
        if (!forceContent
                && !classChanged
                && canReuseCommittedPage(preferred, measuredSpec, ownedCaption, inner)) {
            // The video moved or resized inside the same presentation class. Keep its page plan,
            // text width and line breaks; only the class-width centering anchor follows the video.
            placeVisibleText(a, host, anchor, text, b, width);
            if (anchor.getVisibility() != View.VISIBLE) {
                anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
                anchor.setVisibility(View.VISIBLE);
            }
            return;
        }
        planBudget = new CaptionPresentationBudget(inner, minimum, preferred, measuredSpec);
        float size = preferred;
        String shown = pendingText;
        String mode = pendingStatus ? "status" : "caption";
        pendingPages =
                ownedCaption ? currentPlan(planBudget, measuredSpec) : Collections.emptyList();
        shownPage =
                pendingUnit != null && !ownsDisplayPosition(pendingPosition)
                        ? -1
                        : CaptionPageLayout.indexAt(pendingPages, pendingPosition);
        if (shownPage >= 0) {
            shown = pendingPages.get(shownPage).text;
            if (pendingPages.size() > 1) mode = "caption_page";
        } else if (!ownedCaption) {
            while (size > minimum && lineCount(shown, size, inner, measuredSpec) > 2)
                size = Math.max(minimum, size - .5f);
        }
        stableTextLines = 0;
        if (ownedCaption && !pendingPages.isEmpty()) {
            // The box width is the widest line of this event, so a page change never changes the
            // width. Its height is the current page's own line count: a one-line page must not
            // inherit two-line padding from a different page of the same event.
            int maxLine = 0;
            for (CaptionPageLayout.Page page : pendingPages) {
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
            if (shownPage >= 0) stableTextLines = pageLines(pendingPages.get(shownPage));
        }
        String reason = shown.isEmpty() && currentGuard != null ? currentGuard.blankReason() : "";
        if (ownedCaption
                && shownPage < 0
                && shownText()
                && ownsDisplayPosition(pendingPosition)) {
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
                    pendingPages.isEmpty()
                            ? (failedLayout.equals(desiredLayout)
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
        text.setTextColor(pendingStatus ? 0xE6FFFFFF : Color.WHITE);
        int compact = 0;
        if (!shown.isEmpty()) {
            compact =
                    applyVisibleText(
                            text,
                            shown,
                            size,
                            inner,
                            measuredSpec,
                            ownedCaption && shownPage >= 0
                                    ? pendingPages.get(shownPage).linePlan
                                    : null,
                            stableTextWidth,
                            stableTextLines);
            if (compact < 0) {
                shown = "";
                mode = "overflow_status";
                reason = "measurement_mismatch";
                if (ownedCaption && !retryLayout()) reason = "unprojectable_pixel_width";
            } else {
                // The layout commit is the only place that measures the ink height. The per-frame
                // size law below reads the cached value, so it never calls getTextBounds.
                layoutGlyphInkPx = SubtitleStyleMetrics.measuredGlyphHeightPx(text.getPaint());
                // Apply the size law in the same frame as the new layout: the correction was
                // computed from the old layout's own font size, so it is continuous at the swap.
                applyCommentScale(a, text);
            }
        }
        String detail =
                "id="
                        + pendingIdentity
                        + ";mode="
                        + mode
                        + (textDebug
                                ? debugDetail(
                                        text,
                                        shown,
                                        size,
                                        targetGlyphHeight,
                                        screenWidth,
                                        host,
                                        cfg.captionSizeTier,
                                        presentationClass)
                                : "")
                        + ";available_width_px="
                        + inner
                        + ";effective_frame_width_px="
                        + (inner + padding)
                        + ";measured_width_px="
                        + Math.max(0, compact);
        if (shown.isEmpty()) {
            text.setText("");
            hideView();
            lastBlankIdentity = pendingIdentity;
            if (ownedCaption && !reason.isEmpty())
                presentationDiagnostics(
                        a, pendingText, preferred, inner, pendingEnd - pendingStart, reason);
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
                text.setText("");
                hideView();
                displayResult(
                        a, "empty", "owner_invalid", false, inner, size, detail, applyStarted);
                return;
            }
            long latest = currentGuard.displayPosition(pendingPosition);
            if (timed && !inWindow(latest)) {
                pendingPosition = latest;
                text.setText("");
                shownPage = -1;
                hideView();
                dirty = true;
                displayResult(
                        a, "empty", "outside_owned_window", false, inner, size, "", applyStarted);
                return;
            }
            pendingPosition = latest;
            if (ownedCaption && CaptionPageLayout.indexAt(pendingPages, latest) != shownPage) {
                dirty = true;
                if (!reconcilingDisplayTime) {
                    reconcilingDisplayTime = true;
                    try {
                        render();
                    } finally {
                        reconcilingDisplayTime = false;
                    }
                } else {
                    text.setText("");
                    hideView();
                    requestPlayerRender();
                }
                return;
            }
        }
        if (ownedCaption && text.getMeasuredHeight() > b.height()) {
            text.setText("");
            hideView();
            presentationDiagnostics(
                    a, shown, size, inner, pendingEnd - pendingStart, "hard_textview_geometry");
            displayResult(
                    a, "empty", "hard_textview_geometry", false, inner, size, detail, applyStarted);
            return;
        }
        if (ownedCaption) {
            CaptionPageLayout.Page page = pendingPages.get(shownPage);
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
        contentWidth = Math.max(0, compact);
        layoutBudget = planBudget;
        scheduleNextPage(pendingPosition);
        placeVisibleText(a, host, anchor, text, b, width);
        layoutHoldSince = -1;
        if (anchor.getVisibility() != View.VISIBLE) {
            anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
            anchor.setVisibility(View.VISIBLE);
        }
        final long appliedOwner = CaptionPlayerAuthority.ownerEpoch(),
                appliedRender = playerRenderEpoch;
        final String appliedIdentity = pendingIdentity;
        final RenderGuard appliedGuard = currentGuard;
        horizontalPlacement.observe(
                a,
                b,
                shorts
                        ? "shorts"
                        : presentationClass == CaptionPresentationClass.Kind.FULL
                                ? "fullscreen"
                                : "detail",
                appliedGuard == null ? "" : appliedGuard.session(),
                appliedOwner,
                appliedRender,
                () ->
                        appliedOwner == CaptionPlayerAuthority.ownerEpoch()
                                && appliedRender == playerRenderEpoch
                                && appliedIdentity.equals(pendingIdentity)
                                && appliedGuard == currentGuard
                                && (appliedGuard == null || appliedGuard.isValid())
                                && !blocked());
        if ((mode.equals("original_fallback") || mode.equals("overflow_status"))
                && !detail.equals(lastNotice))
            CaptionDiagnostics.mark(a, "REBUILD_LAYOUT_FALLBACK", detail);
        lastNotice = detail;
        displayResult(
                a,
                mode,
                pendingWaiting ? "pending_translation" : "",
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
        if (measurementMismatch != 0) {
            failedLayout = desiredLayout;
            return false;
        }
        measurementMismatch = 1;
        LAYOUTS.remove(desiredLayout);
        dirty = true;
        final String identity = pendingIdentity;
        MAIN.post(
                () -> {
                    if (identity.equals(pendingIdentity)) {
                        dirty = true;
                        contentNow = true;
                        lastBlankIdentity = null;
                        render();
                    }
                });
        return true;
    }

    private static String debugDetail(
            TextView text,
            String shown,
            float size,
            float targetGlyphHeight,
            int screenWidth,
            FrameLayout host,
            int tier,
            CaptionPresentationClass.Kind kind) {
        CaptionPageLayout.Page page = shownPage >= 0 ? pendingPages.get(shownPage) : null;
        Activity owner = activityRef.get();
        boolean activityLayer =
                owner != null && host == owner.findViewById(android.R.id.content);
        return ";text_size_px="
                + size
                + ";target_glyph_height_px="
                + targetGlyphHeight
                + ";glyph_height_px="
                + SubtitleStyleMetrics.measuredGlyphHeightPx(text.getPaint())
                + ";screen_width_px="
                + screenWidth
                + ";caption_layer="
                + (activityLayer ? "activity" : "video")
                + ";caption_host_px="
                + host.getWidth()
                + "x"
                + host.getHeight()
                + ";size_tier="
                + tier
                + ";presentation_class="
                + kind
                + ";size_mode="
                + (kind == null || !CaptionPresentationClass.detailSize(kind)
                        ? "full_screen"
                        : "detail")
                + ";class_frame_width_px="
                + classFrameWidth
                + ";stable_text_width_px="
                + stableTextWidth
                + ";stable_lines="
                + stableTextLines
                + ";lines="
                + (shown.isEmpty() ? 0 : text.getLineCount())
                + (page == null
                        ? ";pagination_unresolved=true"
                        : ";page="
                                + (shownPage + 1)
                                + "/"
                                + pendingPages.size()
                                + ";page_range="
                                + page.start
                                + "-"
                                + page.end
                                + ";page_basis="
                                + page.timingBasis);
    }

    // ---- Measuring and placing ----

    /**
     * Both the ordinary render and the prepared-page advance apply the same content geometry.
     *
     * @return the box width in pixels, or -1 when the text does not fit even at full width
     */
    private static int applyVisibleText(
            TextView text,
            String shown,
            float size,
            int maximumInnerPx,
            CaptionRenderSpec spec,
            CaptionLinePlan line,
            int fixedWidthPx,
            int minLines) {
        boolean same =
                CaptionSettingPreference.sameText(text.getText(), shown)
                        && text.getTextSize() == size
                        && text.getPaint().equalsForTextMeasurement(spec.paint(size));
        spec.apply(text);
        if (text.getTextSize() != size) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, size);
        if (!CaptionSettingPreference.sameText(text.getText(), shown)) text.setText(shown);
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
        int lines = line != null ? (line.line2Px > 0 ? 2 : 1) : minLines;
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
            Activity owner = activityRef.get();
            if (owner != null && DeepSeekConfig.displayTextDebugEnabled(owner))
                CaptionDiagnostics.mark(
                        owner,
                        "CAPTION_COMPACT_MEASURE_RETRY",
                        "reason=font_geometry_mismatch;maximum_inner_px="
                                + maximumInnerPx
                                + ";natural_box_px="
                                + naturalBox);
        }
        return -1;
    }

    private static void placeVisibleText(
            Activity owner,
            FrameLayout host,
            FrameLayout anchor,
            TextView text,
            Rect bounds,
            int anchorWidthPx) {
        placeVisibleText(
                owner,
                host,
                anchor,
                text,
                bounds,
                anchorWidthPx,
                bounds != null && bounds.width() > bounds.height());
    }

    private static void placeVisibleText(
            Activity owner,
            FrameLayout host,
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
        if (!computeTarget(owner, video, width, height, landscape)) return;
        boolean sizeChanged = width != boxWidth || height != boxHeight;
        boxWidth = width;
        boxHeight = height;
        boxClass = presentationClass;
        CaptionHorizontalPlacement.position(parent, anchor, nextLeft, nextTop, boxWidth, boxHeight);
        if (sizeChanged && DeepSeekConfig.displayTextDebugEnabled(owner)) {
            FrameLayout currentHost = hostRef.get();
            CaptionDiagnostics.mark(
                    owner,
                    "PLACEMENT",
                    "video_screen="
                            + screenRect(CaptionSurface.currentSurfaceView())
                            + ";anchor_screen="
                            + screenRect(anchor)
                            + ";host="
                            + (currentHost == null
                                    ? "none"
                                    : currentHost.getClass().getSimpleName())
                            + ";parent="
                            + parent.getClass().getSimpleName());
        }
    }

    /** A view's on-screen rectangle, for the size-change placement diagnostic only. */
    private static String screenRect(View view) {
        if (view == null
                || !view.isAttachedToWindow()
                || view.getWidth() <= 0
                || view.getHeight() <= 0) return "0,0,0,0";
        int[] location = new int[2];
        view.getLocationOnScreen(location);
        return location[0]
                + ","
                + location[1]
                + ","
                + (location[0] + view.getWidth())
                + ","
                + (location[1] + view.getHeight());
    }

    static int compactWidthPx(String value, float sizePx, int maximum, CaptionRenderSpec spec) {
        return Math.min(
                maximum,
                Math.max(
                        1,
                        (int) Math.ceil(spec.actualWidth(spec.layout(value, sizePx, maximum)))
                                + 2));
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
                        + "|event="
                        + pendingIdentity
                        + "|owner="
                        + CaptionPlayerAuthority.ownerEpoch();
        String key =
                pendingIdentity
                        + "|"
                        + mode
                        + "|"
                        + reason
                        + "|"
                        + visible
                        + "|"
                        + shown
                        + "|"
                        + shownPage
                        + "|"
                        + width
                        + "|"
                        + size
                        + projection;
        if (key.equals(lastDisplayResult)) return;
        lastDisplayResult = key;
        long elapsed = Math.max(0, SystemClock.uptimeMillis() - applyStarted);
        String result =
                (detail.isEmpty() ? "id=" + pendingIdentity + ";mode=" + mode : detail)
                        + ";ui_applied=true;visible="
                        + visible
                        + ";reason="
                        + reason
                        + ";render_position="
                        + pendingPosition
                        + ";window="
                        + pendingStart
                        + "-"
                        + pendingEnd
                        + ";applied_wall_ms="
                        + System.currentTimeMillis()
                        + ";applied_uptime_ms="
                        + SystemClock.uptimeMillis()
                        + ";dispatch_uptime_ms="
                        + applyStarted
                        + ";main_apply_elapsed_ms="
                        + elapsed
                        + ";desired_box_width_px="
                        + (view == null ? 0 : view.getLayoutParams().width)
                        + ";measured_box_width_px="
                        + (view == null ? 0 : view.getMeasuredWidth())
                        + ";laid_out_box_width_px="
                        + (view == null ? 0 : view.getWidth())
                        + ";presentation_revision=upstream-ac65fe8"
                        + ";text="
                        + shown;
        CaptionCredentialRef credential =
                currentGuard == null ? CaptionCredentialRef.NONE : currentGuard.credential();
        // Records for the same event, page and geometry merge in the bounded queue and are
        // exported once with their count, keeping the first display and any real change exact.
        String recordKey =
                "DISPLAY|"
                        + pendingIdentity
                        + "|"
                        + shownPage
                        + "|"
                        + mode
                        + "|"
                        + reason
                        + "|"
                        + visible
                        + "|"
                        + width
                        + "|"
                        + size
                        + projection;
        if (DeepSeekConfig.displayTextDebugEnabled(a))
            CaptionDiagnostics.mark(a, "REBUILD_PRESENTED", result, credential, recordKey);
        CaptionDiagnostics.mark(a, "REBUILD_DISPLAY_RESULT", result, credential, recordKey);
    }

    private static void presentationDiagnostics(
            Activity a, String shown, float size, int width, long duration, String reason) {
        String notice =
                pendingIdentity
                        + "|"
                        + pendingRenderSpec.targetCode
                        + "|"
                        + shown
                        + "|"
                        + size
                        + "|"
                        + width
                        + "|"
                        + duration
                        + "|"
                        + reason
                        + "|"
                        + shownPage;
        if (notice.equals(lastPresentationNotice)) return;
        lastPresentationNotice = notice;
        CaptionPageLayout.Page page =
                shownPage >= 0 && shownPage < pendingPages.size()
                        ? pendingPages.get(shownPage)
                        : null;
        CaptionLanguageProfile profile = pendingRenderSpec.profile;
        int readingUnits = pendingRenderSpec.readingUnits(shown);
        double readingCps = duration > 0 ? readingUnits * 1000.0 / duration : 0;
        String detail =
                "id="
                        + pendingIdentity
                        + ";target_code="
                        + pendingRenderSpec.targetCode
                        + ";presentation_policy="
                        + pendingRenderSpec.presentationPolicy
                        + ";duration_ms="
                        + duration
                        + ";available_width_px="
                        + width
                        + ";reading_units="
                        + readingUnits
                        + ";reading_rate_limit="
                        + profile.referenceCps
                        + ";reading_cps="
                        + String.format(Locale.ROOT, "%.2f", readingCps)
                        + ";page_density_over_limit="
                        + (readingCps > profile.referenceCps)
                        + ";minimum_page_wall_ms="
                        + profile.minimumPageMs
                        + ";maximum_recommended_page_wall_ms="
                        + profile.softPageDurationMs
                        + ";page_duration_above_recommendation="
                        + (duration > profile.softPageDurationMs)
                        + (page == null
                                ? ""
                                : ";line1_px="
                                        + page.linePlan.line1Px
                                        + ";line2_px="
                                        + page.linePlan.line2Px);
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
                if (dragSource == v) endDrag(v);
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
        dragBounds.set(live);
        dragLandscape = live.width() > live.height();
        downY = e.getRawY();
        downAt = SystemClock.uptimeMillis();
        dragging = false;
        pressed = true;
        dragSource = source;
        initial =
                CaptionSurface.isShorts()
                        ? DeepSeekConfig.shortsPosition(a)
                        : DeepSeekConfig.captionPositionY(a, dragLandscape);
        ViewParent parent = source.getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        MAIN.removeCallbacks(ARM_DRAG);
        MAIN.postDelayed(ARM_DRAG, DRAG_AFTER_MS);
        touchLog("down", live);
        return true;
    }

    private static void moveDrag(MotionEvent e) {
        Activity a = activityRef.get();
        if (a == null || !pressed) return;
        if (!dragging && SystemClock.uptimeMillis() - downAt >= DRAG_AFTER_MS) {
            MAIN.removeCallbacks(ARM_DRAG);
            ARM_DRAG.run();
        }
        if (!dragging || dragBounds.height() <= 0) return;
        float y = initial + (e.getRawY() - downY) / dragBounds.height();
        y = Math.max(.08f, Math.min(.92f, y));
        if (CaptionSurface.isShorts()) DeepSeekConfig.saveShortsPosition(a, y);
        else DeepSeekConfig.saveCaptionPosition(a, dragLandscape, y);
        FrameLayout host = hostRef.get(), anchor = anchorRef.get();
        TextView text = textRef.get();
        if (host != null && anchor != null && text != null) {
            placeVisibleText(
                    a,
                    host,
                    anchor,
                    text,
                    dragBounds,
                    classFrameWidth > 0 ? classFrameWidth : boxWidth > 0 ? boxWidth : anchor.getWidth(),
                    dragLandscape);
        }
    }

    private static void endDrag(View source) {
        touchLog("up", dragBounds);
        stopDrag(source);
    }

    private static void stopDrag(View v) {
        pressed = false;
        dragging = false;
        MAIN.removeCallbacks(ARM_DRAG);
        View source = dragSource;
        dragSource = null;
        release(source);
        if (source != v) release(v);
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
        proxy.setTag("yydarlinker.deepseek.caption.touch");
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
                            endDrag(v);
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
                        + ";"
                        + host.getWidth()
                        + "x"
                        + host.getHeight());
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

    private static void touchLog(String action, Rect bounds) {
        Activity a = activityRef.get();
        if (a == null || !DeepSeekConfig.displayTextDebugEnabled(a)) return;
        TextView text = textRef.get();
        Rect rect = new Rect();
        if (text != null) text.getGlobalVisibleRect(rect);
        CaptionDiagnostics.mark(
                a,
                "CAPTION_TOUCH",
                "action="
                        + action
                        + ";caption="
                        + rect.flattenToString()
                        + ";drag="
                        + bounds.flattenToString()
                        + ";landscape="
                        + dragLandscape
                        + ";pressed="
                        + pressed
                        + ";dragging="
                        + dragging
                        + ";class="
                        + presentationClass);
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
