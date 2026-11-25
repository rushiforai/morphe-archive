package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.RectF;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;

import dev.materialtidal.extension.tidal.player.ExpressivePlayerView;

/**
 * Full-screen interactive expansion overlay mounted in {@code MainActivity}'s root
 * {@link FrameLayout} that allows the floating {@link ExpressiveMiniPlayerView} stadium pill
 * to follow the user's finger 1:1 all the way up (and down) the screen, morphing smoothly
 * into the Material 3 Expressive Full-Screen Player ({@link ExpressivePlayerView}).
 */
public final class ExpressiveMiniPlayerExpandOverlayView extends View {

    private static final int STATE_IDLE = 0;
    private static final int STATE_DRAGGING = 1;
    private static final int STATE_SETTLING_OPEN = 2;
    private static final int STATE_WAITING_HANDOFF = 3;
    private static final int STATE_SETTLING_CLOSE = 4;

    private static WeakReference<ExpressiveMiniPlayerExpandOverlayView> activeOverlayRef =
            new WeakReference<>(null);

    private final float density;
    private final ExpressivePlayerView previewPlayer;
    private final RectF startCardRect = new RectF();
    private final RectF startArtRect = new RectF();
    private final int[] tempLocMini = new int[2];
    private final int[] tempLocRoot = new int[2];

    private WeakReference<ViewGroup> rootRef = new WeakReference<>(null);
    private WeakReference<View> coordinatorRef = new WeakReference<>(null);
    private WeakReference<ExpressiveMiniPlayerView> sourceMiniRef = new WeakReference<>(null);

    private int state = STATE_IDLE;
    private float startArtRadiusPx;
    private float startCardScale = 1f;
    private float expandProgress = 0f;
    private float expandVel = 0f;
    private boolean openDispatched = false;
    private boolean realPlayerDrawn = false;
    private int framesSinceRealPlayerDrawn = 0;
    private long realPlayerDrawnUptimeMs = 0L;
    private long settleStartUptimeMs = 0L;
    private long handoffStartUptimeMs = 0L;
    private long lastFrameNanos = 0L;
    private boolean isLoopRunning = false;

    private final Choreographer.FrameCallback choreoCallback = this::onChoreographerFrame;

    private ExpressiveMiniPlayerExpandOverlayView(Context context, ViewGroup root, View coordinator) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.rootRef = new WeakReference<>(root);
        this.coordinatorRef = new WeakReference<>(coordinator);
        this.previewPlayer = new ExpressivePlayerView(context);
        this.previewPlayer.setPreviewInstance(true);

        setWillNotDraw(false);
        setForceDarkAllowed(false);
        setClickable(false);
        setFocusable(false);
        setFocusableInTouchMode(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setElevation(24f * density);
        setTranslationZ(24f * density);
        setVisibility(GONE);
    }

    public static ExpressiveMiniPlayerExpandOverlayView ensureAttachedFromMiniPlayer(
            ExpressiveMiniPlayerView miniPlayer
    ) {
        if (miniPlayer == null) {
            return null;
        }
        ExpressiveMiniPlayerExpandOverlayView current = activeOverlayRef.get();
        if (current != null && current.isAttachedToWindow() && current.getParent() instanceof ViewGroup) {
            return current;
        }
        try {
            Context ctx = miniPlayer.getContext();
            Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            int scaffoldId = res.getIdentifier("appScaffold", "id", pkg);
            int coordId = res.getIdentifier("coordinatorLayout", "id", pkg);

            View cursor = miniPlayer;
            View appScaffold = null;
            ViewGroup fallbackRoot = null;
            while (cursor != null) {
                if (scaffoldId != 0 && cursor.getId() == scaffoldId) {
                    appScaffold = cursor;
                    break;
                }
                if (cursor.getId() == android.R.id.content && cursor instanceof ViewGroup) {
                    fallbackRoot = (ViewGroup) cursor;
                }
                ViewParent p = cursor.getParent();
                cursor = p instanceof View ? (View) p : null;
            }

            ViewGroup root = null;
            if (appScaffold != null && appScaffold.getParent() instanceof ViewGroup) {
                root = (ViewGroup) appScaffold.getParent();
            } else if (fallbackRoot != null) {
                root = fallbackRoot;
            }
            if (root == null) {
                return null;
            }

            View coordinator = coordId != 0 ? root.findViewById(coordId) : null;

            ExpressiveMiniPlayerExpandOverlayView existing = null;
            for (int i = 0; i < root.getChildCount(); i++) {
                View child = root.getChildAt(i);
                if (child instanceof ExpressiveMiniPlayerExpandOverlayView) {
                    existing = (ExpressiveMiniPlayerExpandOverlayView) child;
                    break;
                }
            }
            if (existing == null) {
                existing = new ExpressiveMiniPlayerExpandOverlayView(root.getContext(), root, coordinator);
                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT);
                root.addView(existing, lp);
            } else if (coordinator != null) {
                existing.coordinatorRef = new WeakReference<>(coordinator);
            }
            activeOverlayRef = new WeakReference<>(existing);
            return existing;
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static boolean isOverlayActive() {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        return overlay != null && overlay.state != STATE_IDLE;
    }

    public static boolean beginInteractiveDrag(ExpressiveMiniPlayerView miniPlayer) {
        ExpressiveMiniPlayerExpandOverlayView overlay = ensureAttachedFromMiniPlayer(miniPlayer);
        if (overlay == null) {
            return false;
        }
        return overlay.startDragInternal(miniPlayer);
    }

    public static void updateInteractiveDrag(float dragUpPx) {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        if (overlay != null) {
            overlay.updateDragInternal(dragUpPx);
        }
    }

    public static void endInteractiveDrag(float dragUpPx, float velocityYpxPerSec) {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        if (overlay != null) {
            overlay.endDragInternal(dragUpPx, velocityYpxPerSec);
        }
    }

    public static void cancelInteractiveDrag() {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        if (overlay != null) {
            overlay.cancelDragInternal();
        }
    }

    public static ExpressivePlayerView getActivePreviewPlayer() {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        if (overlay != null && overlay.state != STATE_IDLE) {
            return overlay.previewPlayer;
        }
        return null;
    }

    public static void onRealFullPlayerDrawn() {
        ExpressiveMiniPlayerExpandOverlayView overlay = activeOverlayRef.get();
        if (overlay != null && (overlay.state == STATE_WAITING_HANDOFF
                || overlay.state == STATE_SETTLING_OPEN)) {
            if (!overlay.realPlayerDrawn) {
                overlay.realPlayerDrawn = true;
                overlay.realPlayerDrawnUptimeMs = SystemClock.uptimeMillis();
            }
            overlay.startAnimationLoop();
        }
    }

    private boolean startDragInternal(ExpressiveMiniPlayerView miniPlayer) {
        ViewGroup root = rootRef.get();
        if (root == null || miniPlayer == null || root.getWidth() <= 0 || root.getHeight() <= 0) {
            return false;
        }
        Choreographer.getInstance().removeFrameCallback(choreoCallback);
        isLoopRunning = false;

        this.sourceMiniRef = new WeakReference<>(miniPlayer);
        bringToFront();

        // Sync WindowInsets from root so previewPlayer layout matches real FullPlayer 1:1
        WindowInsets insets = root.getRootWindowInsets();
        if (insets != null) {
            Insets topBars = insets.getInsetsIgnoringVisibility(
                    WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout());
            Insets navBars = insets.getInsetsIgnoringVisibility(
                    WindowInsets.Type.navigationBars());
            previewPlayer.setWindowInsetsPx(
                    Math.max(topBars.left, navBars.left),
                    topBars.top,
                    Math.max(topBars.right, navBars.right),
                    navBars.bottom
            );
        }

        previewPlayer.syncPreviewFromMiniPlayer(
                miniPlayer.getTrackTitle(),
                miniPlayer.getTrackArtist(),
                miniPlayer.getTrackCoverId(),
                miniPlayer.getTrackPlayState(),
                miniPlayer.canTrackSkipToNext(),
                miniPlayer.isTrackExplicit()
        );

        // Compute Mini-Player pill & artwork rect in root coordinates
        miniPlayer.getLocationInWindow(tempLocMini);
        root.getLocationInWindow(tempLocRoot);
        float dx = tempLocMini[0] - tempLocRoot[0];
        float dy = tempLocMini[1] - tempLocRoot[1];

        miniPlayer.getBaseCardRect(startCardRect);
        startCardRect.offset(dx, dy);

        miniPlayer.getBaseArtRect(startArtRect);
        startArtRect.offset(dx, dy);

        startArtRadiusPx = miniPlayer.getCurrentArtCornerRadiusPx();
        startCardScale = miniPlayer.getCurrentCardScale();

        state = STATE_DRAGGING;
        expandProgress = 0f;
        expandVel = 0f;
        openDispatched = false;
        realPlayerDrawn = false;
        framesSinceRealPlayerDrawn = 0;
        realPlayerDrawnUptimeMs = 0L;
        settleStartUptimeMs = 0L;
        handoffStartUptimeMs = 0L;

        if (getVisibility() != VISIBLE) {
            setVisibility(VISIBLE);
        }
        miniPlayer.setExpandOverlayActive(true);
        applyBackdropDepth(0f);
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
        invalidate();
        return true;
    }

    private float mapDragPxToProgress(float rawDragUpPx) {
        float travelPx = getTravelDistancePx();
        if (rawDragUpPx >= 0f) {
            if (rawDragUpPx <= travelPx) {
                return rawDragUpPx / travelPx;
            }
            float excess = rawDragUpPx - travelPx;
            return 1f + 0.045f * (excess / (excess + 120f * density));
        }
        float below = -rawDragUpPx;
        return -0.045f * (below / (below + 90f * density));
    }

    private void updateDragInternal(float dragUpPx) {
        if (state != STATE_DRAGGING) {
            return;
        }
        expandProgress = mapDragPxToProgress(dragUpPx);
        applyBackdropDepth(expandProgress);
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(Math.max(0f, expandProgress));
        invalidate();
    }

    private void endDragInternal(float dragUpPx, float velocityYpxPerSec) {
        if (state != STATE_DRAGGING) {
            return;
        }
        float travelPx = getTravelDistancePx();
        float releaseProgress = mapDragPxToProgress(dragUpPx);
        float normVel = -velocityYpxPerSec / travelPx;

        boolean flingUp = velocityYpxPerSec < -380f * density
                && (dragUpPx > 14f * density || expandProgress > 0.015f);
        boolean flingDown = velocityYpxPerSec > 560f * density;
        boolean shouldOpen = !flingDown && (flingUp || expandProgress >= 0.16f || dragUpPx >= 72f * density);

        ExpressiveMiniPlayerView mp = sourceMiniRef.get();
        if (shouldOpen) {
            expandProgress = Math.max(expandProgress, releaseProgress);
            if (mp != null) {
                mp.performHapticFeedback(HapticFeedbackConstants.CONFIRM);
            }
            state = STATE_SETTLING_OPEN;
            settleStartUptimeMs = SystemClock.uptimeMillis();
            expandVel = Math.max(1.20f, Math.min(5.2f, normVel));
            if (expandProgress >= 0.994f && expandVel < 0.25f && !openDispatched) {
                openDispatched = true;
                ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFullInstant();
            }
        } else {
            expandProgress = releaseProgress;
            state = STATE_SETTLING_CLOSE;
            expandVel = Math.min(-0.65f, Math.max(-4.5f, normVel));
        }
        applyBackdropDepth(expandProgress);
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(Math.max(0f, expandProgress));
        startAnimationLoop();
    }

    private void cancelDragInternal() {
        if (state == STATE_IDLE) {
            return;
        }
        state = STATE_SETTLING_CLOSE;
        expandVel = -0.65f;
        startAnimationLoop();
    }

    private float getTravelDistancePx() {
        return Math.max(140f * density, startCardRect.top);
    }

    private void applyBackdropDepth(float progress) {
        View coord = coordinatorRef.get();
        if (coord == null) {
            return;
        }
        float p = Math.max(0f, Math.min(1f, progress));
        float inv = 1f - p;
        float ease = 1f - inv * inv * inv;
        float scale = 1f - 0.032f * ease;
        if (coord.getWidth() > 0 && coord.getHeight() > 0) {
            coord.setPivotX(coord.getWidth() * 0.5f);
            coord.setPivotY(coord.getHeight() * 0.5f);
        }
        coord.setScaleX(scale);
        coord.setScaleY(scale);
    }

    private void resetBackdropDepth() {
        View coord = coordinatorRef.get();
        if (coord != null) {
            coord.setScaleX(1f);
            coord.setScaleY(1f);
        }
    }

    private void startAnimationLoop() {
        if (!isLoopRunning) {
            isLoopRunning = true;
            lastFrameNanos = 0L;
            Choreographer.getInstance().postFrameCallback(choreoCallback);
        }
    }

    private void onChoreographerFrame(long frameTimeNanos) {
        if (!isLoopRunning || state == STATE_IDLE || state == STATE_DRAGGING) {
            isLoopRunning = false;
            return;
        }

        float dt = lastFrameNanos > 0L
                ? Math.min(0.033f, Math.max(0.001f, (frameTimeNanos - lastFrameNanos) / 1_000_000_000f))
                : 0.016f;
        lastFrameNanos = frameTimeNanos;
        long now = SystemClock.uptimeMillis();

        if (state == STATE_SETTLING_OPEN) {
            stepSpringSubstepped(1f, 390f, 0.74f, dt);
            expandProgress = Math.max(-0.04f, Math.min(1.075f, expandProgress));
            applyBackdropDepth(expandProgress);
            ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(Math.max(0f, expandProgress));

            if (realPlayerDrawn) {
                framesSinceRealPlayerDrawn++;
            }

            boolean settledAtTop = Math.abs(expandProgress - 1f) < 0.005f && Math.abs(expandVel) < 0.14f;
            boolean settleTimedOut = settleStartUptimeMs > 0L && (now - settleStartUptimeMs) > 460L;
            if (settledAtTop || settleTimedOut) {
                expandProgress = 1f;
                expandVel = 0f;
                state = STATE_WAITING_HANDOFF;
                handoffStartUptimeMs = now;
                if (!openDispatched) {
                    openDispatched = true;
                    ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFullInstant();
                }
            }
            invalidate();
            Choreographer.getInstance().postFrameCallback(choreoCallback);
        } else if (state == STATE_WAITING_HANDOFF) {
            if (realPlayerDrawn) {
                framesSinceRealPlayerDrawn++;
            }
            boolean ready = realPlayerDrawn
                    && framesSinceRealPlayerDrawn >= 4
                    && realPlayerDrawnUptimeMs > 0L
                    && (now - realPlayerDrawnUptimeMs) >= 50L;
            if (ready || (now - handoffStartUptimeMs > 650L)) {
                finishAndReset();
            } else {
                invalidate();
                Choreographer.getInstance().postFrameCallback(choreoCallback);
            }
        } else if (state == STATE_SETTLING_CLOSE) {
            stepSpringSubstepped(0f, 460f, 0.76f, dt);
            expandProgress = Math.max(-0.035f, Math.min(1.05f, expandProgress));
            applyBackdropDepth(expandProgress);
            ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(Math.max(0f, expandProgress));
            invalidate();

            if (Math.abs(expandProgress) < 0.003f && Math.abs(expandVel) < 0.05f) {
                finishAndReset();
            } else {
                Choreographer.getInstance().postFrameCallback(choreoCallback);
            }
        }
    }

    private void stepSpringSubstepped(float target, float stiffness, float dampingRatio, float dt) {
        final float maxSubStep = 0.004f;
        int steps = Math.max(1, (int) Math.ceil(dt / maxSubStep));
        float subDt = dt / steps;
        float damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        float pos = expandProgress;
        float vel = expandVel;
        for (int i = 0; i < steps; i++) {
            float force = -stiffness * (pos - target) - damping * vel;
            vel += force * subDt;
            pos += vel * subDt;
        }
        expandProgress = pos;
        expandVel = vel;
    }

    private void finishAndReset() {
        Choreographer.getInstance().removeFrameCallback(choreoCallback);
        isLoopRunning = false;
        state = STATE_IDLE;
        expandProgress = 0f;
        expandVel = 0f;
        openDispatched = false;
        realPlayerDrawn = false;
        framesSinceRealPlayerDrawn = 0;
        realPlayerDrawnUptimeMs = 0L;
        settleStartUptimeMs = 0L;
        handoffStartUptimeMs = 0L;
        lastFrameNanos = 0L;

        resetBackdropDepth();
        ExpressiveMiniPlayerView mp = sourceMiniRef.get();
        if (mp != null) {
            mp.setExpandOverlayActive(false);
        }
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
        if (getVisibility() != GONE) {
            setVisibility(GONE);
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (state == STATE_IDLE || getVisibility() != VISIBLE) {
            return;
        }
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        previewPlayer.drawInteractiveExpansion(
                canvas,
                w,
                h,
                expandProgress,
                startCardRect,
                startArtRect,
                startArtRadiusPx,
                startCardScale,
                sourceMiniRef.get()
        );
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return false;
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        return false;
    }

    @Override
    protected void onDetachedFromWindow() {
        finishAndReset();
        super.onDetachedFromWindow();
    }
}
