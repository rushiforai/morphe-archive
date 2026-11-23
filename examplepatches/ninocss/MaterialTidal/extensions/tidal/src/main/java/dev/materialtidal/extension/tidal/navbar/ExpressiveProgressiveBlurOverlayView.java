package dev.materialtidal.extension.tidal.navbar;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;

import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.MultiTierProgressiveBlurRenderer;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Full-width real-time GPU Progressive Blur overlay inserted between @id/coordinatorLayout
 * and @id/appScaffold inside MainActivity's root FrameLayout.
 *
 * Replaces the flat solid black/Monet color fade behind the floating navigation bar and
 * mini-player with a smooth multi-tier Gaussian progressive blur that stays completely idle
 * when content is static (zero background VSync loop).
 */
public final class ExpressiveProgressiveBlurOverlayView extends View {

    private static final float[] TIER_RADII_DP = new float[]{4f, 11f, 24f, 44f};
    private static final float[] TIER_STARTS = new float[]{0.00f, 0.24f, 0.50f, 0.72f};

    private static WeakReference<ExpressiveProgressiveBlurOverlayView> activeOverlayRef =
            new WeakReference<>(null);

    private final MultiTierProgressiveBlurRenderer renderer =
            new MultiTierProgressiveBlurRenderer("navProgressiveBlur");
    private final float density;

    private final WeakReference<ViewGroup> rootRef;
    private final WeakReference<View> coordinatorRef;
    private final WeakReference<View> appScaffoldRef;

    private boolean waitingForOwnDraw = false;
    private long lastInvalidateUptimeMs = 0L;
    private int lastVeilBaseColor = 0;
    private boolean lastLightMode = false;
    private boolean listenersAttached = false;

    private final ViewTreeObserver.OnPreDrawListener preDrawListener = () -> {
        try {
            syncGeometryAndVisibility();
            if (getVisibility() != VISIBLE) {
                waitingForOwnDraw = false;
                return true;
            }
            long now = SystemClock.uptimeMillis();
            if (waitingForOwnDraw && (now - lastInvalidateUptimeMs) < 120L) {
                return true;
            }
            waitingForOwnDraw = true;
            lastInvalidateUptimeMs = now;
            invalidate();
        } catch (Throwable ignored) {
        }
        return true;
    };

    private final ViewTreeObserver.OnScrollChangedListener scrollChangedListener =
            this::scheduleBackdropRefresh;

    private final View.OnLayoutChangeListener layoutChangeListener =
            (v, l, t, r, b, ol, ot, or, ob) -> {
                syncGeometryAndVisibility();
                scheduleBackdropRefresh();
            };

    private ExpressiveProgressiveBlurOverlayView(
            Context context, ViewGroup root, View coordinator, View appScaffold) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.rootRef = new WeakReference<>(root);
        this.coordinatorRef = new WeakReference<>(coordinator);
        this.appScaffoldRef = new WeakReference<>(appScaffold);

        setWillNotDraw(false);
        setForceDarkAllowed(false);
        setClickable(false);
        setFocusable(false);
        setFocusableInTouchMode(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);

        refreshRendererPalette();
    }

    /**
     * Ensures the progressive blur overlay is mounted inside MainActivity whenever themed.
     */
    public static void attachToActivity(Activity activity) {
        if (activity == null) {
            return;
        }
        try {
            View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
            if (decor == null) {
                return;
            }
            Context ctx = activity;
            Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            int scaffoldId = res.getIdentifier("appScaffold", "id", pkg);
            int coordId = res.getIdentifier("coordinatorLayout", "id", pkg);
            if (scaffoldId == 0 || coordId == 0) {
                return;
            }
            View appScaffold = decor.findViewById(scaffoldId);
            View coordinator = decor.findViewById(coordId);
            ensureAttached(appScaffold, coordinator);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Resolves @id/appScaffold and @id/coordinatorLayout from any descendant view created inside
     * the AppScaffold (such as ExpressiveNavbarView) so the overlay attaches on first compose.
     */
    public static void attachFromScaffoldDescendant(View descendant) {
        if (descendant == null) {
            return;
        }
        try {
            Context ctx = descendant.getContext();
            Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            int scaffoldId = res.getIdentifier("appScaffold", "id", pkg);
            int coordId = res.getIdentifier("coordinatorLayout", "id", pkg);
            if (scaffoldId == 0 || coordId == 0) {
                return;
            }
            View cursor = descendant;
            View appScaffold = null;
            while (cursor != null) {
                if (cursor.getId() == scaffoldId) {
                    appScaffold = cursor;
                    break;
                }
                ViewParent p = cursor.getParent();
                cursor = p instanceof View ? (View) p : null;
            }
            if (appScaffold == null || !(appScaffold.getParent() instanceof ViewGroup)) {
                return;
            }
            ViewGroup root = (ViewGroup) appScaffold.getParent();
            View coordinator = root.findViewById(coordId);
            ensureAttached(appScaffold, coordinator);
        } catch (Throwable ignored) {
        }
    }

    public static void invalidateActive() {
        ExpressiveProgressiveBlurOverlayView active = activeOverlayRef.get();
        if (active != null) {
            active.refreshRendererPalette();
            active.syncGeometryAndVisibility();
            active.scheduleBackdropRefresh();
        }
    }

    private static void ensureAttached(View appScaffold, View coordinator) {
        if (appScaffold == null || coordinator == null) {
            return;
        }
        ViewParent parent = appScaffold.getParent();
        if (!(parent instanceof ViewGroup)) {
            return;
        }
        ViewGroup root = (ViewGroup) parent;
        if (coordinator.getParent() != root) {
            return;
        }

        ExpressiveProgressiveBlurOverlayView existing = null;
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (child instanceof ExpressiveProgressiveBlurOverlayView) {
                existing = (ExpressiveProgressiveBlurOverlayView) child;
                break;
            }
        }

        if (existing == null) {
            existing = new ExpressiveProgressiveBlurOverlayView(
                    root.getContext(), root, coordinator, appScaffold);
            int insertIdx = Math.max(0, root.indexOfChild(appScaffold));
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.round(140f * root.getResources().getDisplayMetrics().density),
                    Gravity.BOTTOM);
            root.addView(existing, insertIdx, lp);
        }
        activeOverlayRef = new WeakReference<>(existing);
        existing.refreshRendererPalette();
        existing.syncGeometryAndVisibility();
        existing.invalidate();
    }

    private void refreshRendererPalette() {
        int baseColor = MaterialYouColorEngine.getSurfaceBase();
        boolean lightMode = MaterialYouColorEngine.isLightMode();
        lastVeilBaseColor = baseColor;
        lastLightMode = lightMode;
        renderer.configure(
                MultiTierProgressiveBlurRenderer.DIR_BOTTOM_UP,
                0.05f,
                TIER_RADII_DP,
                TIER_STARTS,
                baseColor,
                0.16f,
                lightMode ? 0.68f : 0.56f);
    }

    private void scheduleBackdropRefresh() {
        if (getVisibility() != VISIBLE || waitingForOwnDraw) {
            return;
        }
        waitingForOwnDraw = true;
        lastInvalidateUptimeMs = SystemClock.uptimeMillis();
        invalidate();
    }

    private void syncGeometryAndVisibility() {
        ViewGroup root = rootRef.get();
        View coordinator = coordinatorRef.get();
        View appScaffold = appScaffoldRef.get();

        if (root == null || coordinator == null || appScaffold == null) {
            setVisibility(GONE);
            return;
        }

        boolean enabled = MaterialYouConfig.isMaterialYouEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack()
                && MaterialYouConfig.isExpressiveBlurEnabled()
                && MaterialYouConfig.isNavbarProgressiveBlurEnabled();

        int rootH = root.getHeight();
        int scaffoldH = appScaffold.getHeight();
        boolean fullScreenOverlayOpen = rootH > 0 && scaffoldH > Math.round(rootH * 0.55f);

        boolean shouldShow = enabled
                && appScaffold.getVisibility() == VISIBLE
                && coordinator.getVisibility() == VISIBLE
                && rootH > 0
                && scaffoldH > 0
                && !fullScreenOverlayOpen;

        int targetVisibility = shouldShow ? VISIBLE : GONE;
        if (getVisibility() != targetVisibility) {
            setVisibility(targetVisibility);
        }
        if (!shouldShow) {
            waitingForOwnDraw = false;
            return;
        }

        int bleedTopPx = Math.round(34f * density);
        int targetH = Math.min(rootH, scaffoldH + bleedTopPx);
        ViewGroup.LayoutParams lp = getLayoutParams();
        if (lp != null && lp.height != targetH) {
            lp.height = targetH;
            setLayoutParams(lp);
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        waitingForOwnDraw = false;
        try {
            if (canvas == null || getVisibility() != VISIBLE) {
                return;
            }
            int baseColor = MaterialYouColorEngine.getSurfaceBase();
            boolean lightMode = MaterialYouColorEngine.isLightMode();
            if (baseColor != lastVeilBaseColor || lightMode != lastLightMode) {
                refreshRendererPalette();
            }
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            View coordinator = coordinatorRef.get();
            if (coordinator == null) {
                return;
            }

            float bleedPx = 24f * density;
            if (renderer.canUseHardwareBlur(canvas) && !ExpressiveBlurKit.CAPTURING_BACKDROP) {
                RecordingCanvas rc = renderer.beginBackdropCapture(w, h, bleedPx, 0.5f, baseColor);
                if (rc != null) {
                    int dx = (getLeft() + Math.round(getTranslationX()))
                            - (coordinator.getLeft() + Math.round(coordinator.getTranslationX()));
                    int dy = (getTop() + Math.round(getTranslationY()))
                            - (coordinator.getTop() + Math.round(coordinator.getTranslationY()));
                    int rcSave = rc.save();
                    rc.clipRect(-bleedPx, -bleedPx, w + bleedPx, h + bleedPx);
                    rc.translate(-dx, -dy);
                    ExpressiveBlurKit.CAPTURING_BACKDROP = true;
                    try {
                        coordinator.draw(rc);
                    } catch (Throwable ignored) {
                    } finally {
                        ExpressiveBlurKit.CAPTURING_BACKDROP = false;
                        rc.restoreToCount(rcSave);
                        renderer.endBackdropCapture(density);
                    }
                }
            }
            renderer.draw(canvas, w, h, bleedPx);
        } catch (Throwable ignored) {
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return false;
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        return false;
    }

    private void attachListeners() {
        if (listenersAttached) {
            return;
        }
        ViewGroup root = rootRef.get();
        View appScaffold = appScaffoldRef.get();
        if (root != null) {
            ViewTreeObserver vto = root.getViewTreeObserver();
            if (vto.isAlive()) {
                vto.addOnPreDrawListener(preDrawListener);
                vto.addOnScrollChangedListener(scrollChangedListener);
                listenersAttached = true;
            }
        }
        if (appScaffold != null) {
            appScaffold.addOnLayoutChangeListener(layoutChangeListener);
        }
    }

    private void detachListeners() {
        if (!listenersAttached) {
            return;
        }
        ViewGroup root = rootRef.get();
        View appScaffold = appScaffoldRef.get();
        if (root != null) {
            ViewTreeObserver vto = root.getViewTreeObserver();
            if (vto.isAlive()) {
                vto.removeOnPreDrawListener(preDrawListener);
                vto.removeOnScrollChangedListener(scrollChangedListener);
            }
        }
        if (appScaffold != null) {
            appScaffold.removeOnLayoutChangeListener(layoutChangeListener);
        }
        listenersAttached = false;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        attachListeners();
        syncGeometryAndVisibility();
    }

    @Override
    protected void onDetachedFromWindow() {
        detachListeners();
        renderer.release();
        super.onDetachedFromWindow();
    }
}
