package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.RectF;
import android.os.SystemClock;
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
    private WeakReference<ExpressiveMiniPlayerView> sourceMiniRef = new WeakReference<>(null);

    private int state = STATE_IDLE;
    private float startArtRadiusPx;
    private float expandProgress = 0f;
    private float expandVel = 0f;
    private boolean openDispatched = false;
    private boolean realPlayerDrawn = false;
    private int framesSinceRealPlayerDrawn = 0;
    private long handoffStartUptimeMs = 0L;
    private long lastFrameUptimeMs = 0L;
    private boolean isLoopRunning = false;

    private final Runnable frameCallback = this::stepAnimation;

    private ExpressiveMiniPlayerExpandOverlayView(Context context, ViewGroup root) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.rootRef = new WeakReference<>(root);
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

            ExpressiveMiniPlayerExpandOverlayView existing = null;
            for (int i = 0; i < root.getChildCount(); i++) {
                View child = root.getChildAt(i);
                if (child instanceof ExpressiveMiniPlayerExpandOverlayView) {
                    existing = (ExpressiveMiniPlayerExpandOverlayView) child;
                    break;
                }
            }
            if (existing == null) {
                existing = new ExpressiveMiniPlayerExpandOverlayView(root.getContext(), root);
                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT);
                root.addView(existing, lp);
            }
            activeOverlayRef = new WeakReference<>(existing);
            return existing;
        } catch (Throwable ignored) {
            return null;
        }
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
            overlay.realPlayerDrawn = true;
            overlay.startAnimationLoop();
        }
    }

    private boolean startDragInternal(ExpressiveMiniPlayerView miniPlayer) {
        ViewGroup root = rootRef.get();
        if (root == null || miniPlayer == null || root.getWidth() <= 0 || root.getHeight() <= 0) {
            return false;
        }
        removeCallbacks(frameCallback);
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
            previewPlayer.setWindowInsetsPx(topBars.top, navBars.bottom);
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

        state = STATE_DRAGGING;
        expandProgress = 0f;
        expandVel = 0f;
        openDispatched = false;
        realPlayerDrawn = false;
        framesSinceRealPlayerDrawn = 0;

        if (getVisibility() != VISIBLE) {
            setVisibility(VISIBLE);
        }
        miniPlayer.setExpandOverlayActive(true);
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
        invalidate();
        return true;
    }

    private void updateDragInternal(float dragUpPx) {
        if (state != STATE_DRAGGING) {
            return;
        }
        float travelPx = getTravelDistancePx();
        expandProgress = Math.max(0f, Math.min(1f, dragUpPx / travelPx));
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(expandProgress);
        invalidate();
    }

    private void endDragInternal(float dragUpPx, float velocityYpxPerSec) {
        if (state != STATE_DRAGGING) {
            return;
        }
        float travelPx = getTravelDistancePx();
        expandProgress = Math.max(0f, Math.min(1f, dragUpPx / travelPx));
        float normVel = -velocityYpxPerSec / travelPx;

        boolean flingUp = velocityYpxPerSec < -460f * density && dragUpPx > 22f * density;
        boolean flingDown = velocityYpxPerSec > 520f * density;
        boolean shouldOpen = !flingDown && (flingUp || expandProgress >= 0.18f || dragUpPx >= 86f * density);

        ExpressiveMiniPlayerView mp = sourceMiniRef.get();
        if (shouldOpen) {
            if (mp != null) {
                mp.performHapticFeedback(HapticFeedbackConstants.CONFIRM);
            }
            state = STATE_SETTLING_OPEN;
            expandVel = Math.max(0.45f, normVel);
            if (expandProgress >= 0.90f && !openDispatched) {
                openDispatched = true;
                ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFullInstant();
            }
        } else {
            state = STATE_SETTLING_CLOSE;
            expandVel = Math.min(-0.35f, normVel);
        }
        startAnimationLoop();
    }

    private void cancelDragInternal() {
        if (state == STATE_IDLE) {
            return;
        }
        state = STATE_SETTLING_CLOSE;
        expandVel = -0.5f;
        startAnimationLoop();
    }

    private float getTravelDistancePx() {
        return Math.max(140f * density, startCardRect.top);
    }

    private void startAnimationLoop() {
        if (!isLoopRunning) {
            isLoopRunning = true;
            lastFrameUptimeMs = SystemClock.uptimeMillis();
            postOnAnimation(frameCallback);
        }
    }

    private void stepAnimation() {
        if (!isLoopRunning || state == STATE_IDLE || state == STATE_DRAGGING) {
            isLoopRunning = false;
            return;
        }

        long now = SystemClock.uptimeMillis();
        float dt = Math.min(0.032f, Math.max(0.004f, (now - lastFrameUptimeMs) / 1000f));
        lastFrameUptimeMs = now;

        if (state == STATE_SETTLING_OPEN) {
            float[] res = stepSpring(expandProgress, expandVel, 1f, 420f, 0.86f, dt);
            expandProgress = Math.max(0f, Math.min(1f, res[0]));
            expandVel = res[1];
            ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(expandProgress);

            if (expandProgress >= 0.90f && !openDispatched) {
                openDispatched = true;
                ExpressiveScaffoldBridge.dispatchMiniPlayerOpenFullInstant();
            }
            if (realPlayerDrawn) {
                framesSinceRealPlayerDrawn++;
            }

            if (expandProgress >= 0.988f) {
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
            postOnAnimation(frameCallback);
        } else if (state == STATE_WAITING_HANDOFF) {
            if (realPlayerDrawn) {
                framesSinceRealPlayerDrawn++;
            }
            if ((realPlayerDrawn && framesSinceRealPlayerDrawn >= 3)
                    || (now - handoffStartUptimeMs > 520L)) {
                finishAndReset();
            } else {
                invalidate();
                postOnAnimation(frameCallback);
            }
        } else if (state == STATE_SETTLING_CLOSE) {
            float[] res = stepSpring(expandProgress, expandVel, 0f, 400f, 0.82f, dt);
            expandProgress = Math.max(0f, Math.min(1f, res[0]));
            expandVel = res[1];
            ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(expandProgress);
            invalidate();

            if (expandProgress <= 0.004f && Math.abs(expandVel) < 0.04f) {
                finishAndReset();
            } else {
                postOnAnimation(frameCallback);
            }
        }
    }

    private void finishAndReset() {
        removeCallbacks(frameCallback);
        isLoopRunning = false;
        state = STATE_IDLE;
        expandProgress = 0f;
        expandVel = 0f;
        openDispatched = false;
        realPlayerDrawn = false;
        framesSinceRealPlayerDrawn = 0;

        ExpressiveMiniPlayerView mp = sourceMiniRef.get();
        if (mp != null) {
            mp.setExpandOverlayActive(false);
        }
        ExpressiveScaffoldBridge.notifyMiniPlayerPullUp(0f);
        if (getVisibility() != GONE) {
            setVisibility(GONE);
        }
    }

    private static float[] stepSpring(
            float pos,
            float vel,
            float target,
            float stiffness,
            float dampingRatio,
            float dt
    ) {
        float damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        float force = -stiffness * (pos - target) - damping * vel;
        vel += force * dt;
        pos += vel * dt;
        return new float[]{pos, vel};
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
