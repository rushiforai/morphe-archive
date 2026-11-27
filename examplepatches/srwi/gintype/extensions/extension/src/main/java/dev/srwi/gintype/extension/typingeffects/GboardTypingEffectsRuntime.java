package dev.srwi.gintype.extension.typingeffects;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Runtime hook entry points for the Typing Effects patch.
 *
 * <p>Hooked into:
 * <ul>
 *   <li>{@code SoftKeyboardView.dispatchTouchEvent(MotionEvent)} — captures all 1-finger and
 *       multi-finger touch events in exact keyboard view coordinates.</li>
 *   <li>{@code SoftKeyboardView.onDetachedFromWindow()} — cleans up overlay drawables and stops
 *       animation loops cleanly.</li>
 *   <li>{@code GestureOverlayView.onDraw(Canvas)} — optionally suppresses Gboard's stock swipe
 *       trail when Typing Effects' custom Rainbow Swipe Trail is active.</li>
 * </ul>
 */
public final class GboardTypingEffectsRuntime {

    private static final String TAG = "GboardTypingEffects";
    private static final long CONFIG_REFRESH_INTERVAL_MS = 350L;

    private static final WeakHashMap<View, OverlayController> CONTROLLERS =
            new WeakHashMap<View, OverlayController>();

    private static volatile TypingEffectsConfig cachedConfig = TypingEffectsConfig.defaults();
    private static volatile long lastConfigReadMs = 0L;

    private GboardTypingEffectsRuntime() {
    }

    public static void invalidateCachedConfig() {
        lastConfigReadMs = 0L;
    }

    /**
     * Called at the entry of {@code SoftKeyboardView.dispatchTouchEvent(MotionEvent)}.
     */
    public static void onKeyboardTouchEvent(Object keyboardViewObj, MotionEvent event) {
        if (!(keyboardViewObj instanceof View) || event == null) {
            return;
        }
        try {
            View view = (View) keyboardViewObj;
            if (isNonBodyKeyboardView(view)) {
                return;
            }
            if (!areSystemAnimatorsEnabled(view.getContext())
                    || dev.srwi.gintype.extension.settings.GboardInputTypeGuard.isPasswordInput(
                            view.getContext())) {
                OverlayController existing = CONTROLLERS.remove(view);
                if (existing != null) {
                    existing.detach();
                }
                return;
            }
            TypingEffectsConfig cfg = resolveConfig(view.getContext(),
                    event.getActionMasked() == MotionEvent.ACTION_DOWN);
            if (!cfg.hasAnyVisualEffectEnabled()) {
                OverlayController existing = CONTROLLERS.remove(view);
                if (existing != null) {
                    existing.setConfig(cfg);
                    existing.detach();
                }
                return;
            }

            OverlayController controller = getOrCreateController(view);
            controller.setConfig(cfg);
            controller.onMotionEvent(event);
        } catch (Throwable t) {
            Log.w(TAG, "Error handling keyboard touch event for typing effects", t);
        }
    }

    /**
     * Called in {@code SoftKeyboardView.onDetachedFromWindow()}.
     */
    public static void onKeyboardDetached(Object keyboardViewObj) {
        if (!(keyboardViewObj instanceof View)) {
            return;
        }
        try {
            View view = (View) keyboardViewObj;
            OverlayController controller = CONTROLLERS.remove(view);
            if (controller != null) {
                controller.detach();
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error detaching typing effects overlay", t);
        }
    }

    /**
     * Called at the start of {@code GestureOverlayView.onDraw(Canvas)}.
     *
     * @return {@code true} to skip Gboard's stock swipe trail when our custom Rainbow Swipe Trail
     *         is active (covering both 1-finger swipe and MultiGlide).
     */
    public static boolean shouldSuppressStockGestureTrail(Object gestureOverlayViewObj) {
        try {
            Context context = gestureOverlayViewObj instanceof View
                    ? ((View) gestureOverlayViewObj).getContext()
                    : null;
            if (!areSystemAnimatorsEnabled(context)) {
                return false;
            }
            TypingEffectsConfig cfg = resolveConfig(context, false);
            return cfg.enabled && cfg.rainbowTrailEnabled;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean areSystemAnimatorsEnabled(Context context) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && !ValueAnimator.areAnimatorsEnabled()) {
                return false;
            }
        } catch (Throwable ignored) {
        }
        if (context != null) {
            try {
                float scale = Settings.Global.getFloat(
                        context.getContentResolver(),
                        Settings.Global.ANIMATOR_DURATION_SCALE,
                        1.0f);
                if (scale <= 0f) {
                    return false;
                }
            } catch (Throwable ignored) {
            }
        }
        return true;
    }

    private static boolean isNonBodyKeyboardView(View view) {
        if (view == null) {
            return true;
        }
        String className = view.getClass().getName().toLowerCase(java.util.Locale.ROOT);
        if (className.contains("popup")) {
            return true;
        }
        Object tag = view.getTag();
        if (tag instanceof CharSequence) {
            String tagLower = tag.toString().toLowerCase(java.util.Locale.ROOT);
            if (tagLower.contains("popup")) {
                return true;
            }
        }
        if (view.getParent() instanceof View parent) {
            String parentClass = parent.getClass().getName().toLowerCase(java.util.Locale.ROOT);
            if (parentClass.contains("popup")) {
                return true;
            }
        }
        return false;
    }

    private static TypingEffectsConfig resolveConfig(Context context, boolean allowRefresh) {
        long now = SystemClock.uptimeMillis();
        if (context != null && (lastConfigReadMs == 0L
                || (allowRefresh && now - lastConfigReadMs >= CONFIG_REFRESH_INTERVAL_MS)
                || now - lastConfigReadMs >= CONFIG_REFRESH_INTERVAL_MS * 3L)) {
            cachedConfig = GboardTypingEffectsSettings.readConfig(context);
            lastConfigReadMs = now;
        }
        return cachedConfig;
    }

    private static OverlayController getOrCreateController(View view) {
        OverlayController controller = CONTROLLERS.get(view);
        if (controller == null) {
            controller = new OverlayController(view);
            CONTROLLERS.put(view, controller);
        }
        return controller;
    }

    private static final class OverlayController {
        private static final class CachedKeyHit {
            int keyId;
            float left;
            float top;
            float right;
            float bottom;
            float cornerRadius;
        }

        private final WeakReference<View> viewRef;
        private final boolean isHeaderView;
        private final TypingEffectsEngine engine;
        private final TypingEffectsOverlayDrawable drawable;
        private final SparseArray<CachedKeyHit> pointerKeyCache = new SparseArray<>();
        private final Rect tempOutlineRect = new Rect();
        private final RectF tempVisualRect = new RectF();
        private final Outline tempOutline = new Outline();
        private boolean attached = false;
        private boolean animating = false;
        private int lastBoundsW = -1;
        private int lastBoundsH = -1;

        private final Runnable frameRunnable = new Runnable() {
            @Override
            public void run() {
                animating = false;
                View view = viewRef.get();
                if (view == null || !view.isAttachedToWindow()) {
                    detach();
                    return;
                }
                if (!view.isShown() || view.getWindowVisibility() != View.VISIBLE) {
                    engine.clearAll();
                    drawable.releaseResources();
                    drawable.invalidateSelf();
                    return;
                }
                syncBounds(view);
                long nowMs = SystemClock.uptimeMillis();
                boolean stillActive = engine.step(nowMs);
                drawable.invalidateSelf();
                if (stillActive) {
                    scheduleNextFrame(view);
                } else if (!engine.hasActiveWarp()) {
                    drawable.releaseResources();
                }
            }
        };

        OverlayController(View view) {
            this.viewRef = new WeakReference<View>(view);
            this.isHeaderView = dev.srwi.gintype.extension.thicctopbar.ThiccTopBarGboardReflector
                    .isHeaderSoftKeyboardView(view);
            float density = view.getResources() != null
                    ? view.getResources().getDisplayMetrics().density
                    : 2.5f;
            this.engine = new TypingEffectsEngine(density);
            this.drawable = new TypingEffectsOverlayDrawable(view, engine);
        }

        void setConfig(TypingEffectsConfig cfg) {
            engine.setConfig(cfg);
            if (!cfg.enabled || !cfg.keyboardWarpEnabled) {
                drawable.releaseResources();
            }
            if (!cfg.hasAnyVisualEffectEnabled()) {
                engine.clearAll();
                View view = viewRef.get();
                if (view != null) {
                    view.removeCallbacks(frameRunnable);
                }
                animating = false;
                drawable.invalidateSelf();
            }
        }

        void onMotionEvent(MotionEvent event) {
            View view = viewRef.get();
            if (view == null) return;

            ensureAttached(view);
            syncBounds(view);

            long nowMs = SystemClock.uptimeMillis();
            int action = event.getActionMasked();

            switch (action) {
                case MotionEvent.ACTION_DOWN:
                    // Android guarantees no pointers are active before ACTION_DOWN; flush any orphaned pointers.
                    engine.onCancel(nowMs);
                    pointerKeyCache.clear();
                    // fall through
                case MotionEvent.ACTION_POINTER_DOWN: {
                    int idx = event.getActionIndex();
                    int pointerId = event.getPointerId(idx);
                    float x = event.getX(idx);
                    float y = event.getY(idx);
                    engine.onPointerDown(pointerId, x, y, nowMs);
                    notifyTouchedKey(view, pointerId, x, y, nowMs);
                    break;
                }
                case MotionEvent.ACTION_MOVE: {
                    int pointerCount = event.getPointerCount();
                    int historySize = event.getHistorySize();
                    for (int p = 0; p < pointerCount; p++) {
                        int pointerId = event.getPointerId(p);
                        for (int h = 0; h < historySize; h++) {
                            engine.onPointerMove(
                                    pointerId,
                                    event.getHistoricalX(p, h),
                                    event.getHistoricalY(p, h),
                                    nowMs);
                        }
                        float x = event.getX(p);
                        float y = event.getY(p);
                        engine.onPointerMove(pointerId, x, y, nowMs);
                        notifyTouchedKey(view, pointerId, x, y, nowMs);
                    }
                    break;
                }
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_POINTER_UP: {
                    int idx = event.getActionIndex();
                    int pointerId = event.getPointerId(idx);
                    pointerKeyCache.remove(pointerId);
                    engine.onPointerUp(pointerId, event.getX(idx), event.getY(idx), nowMs);
                    break;
                }
                case MotionEvent.ACTION_CANCEL: {
                    pointerKeyCache.clear();
                    engine.onCancel(nowMs);
                    break;
                }
                default:
                    break;
            }

            if (engine.hasActiveEffects()) {
                drawable.invalidateSelf();
                scheduleNextFrame(view);
            }
        }

        private void notifyTouchedKey(View root, int pointerId, float x, float y, long nowMs) {
            if (!engine.getConfig().keyHighlightEnabled) {
                return;
            }
            if (isHeaderView && isPointInsideVisibleThiccTopBar(root, x, y, 0, 0)) {
                return;
            }
            CachedKeyHit cached = pointerKeyCache.get(pointerId);
            if (cached != null
                    && x >= cached.left && x <= cached.right
                    && y >= cached.top && y <= cached.bottom) {
                engine.onKeyTouched(
                        cached.keyId,
                        cached.left,
                        cached.top,
                        cached.right,
                        cached.bottom,
                        cached.cornerRadius,
                        nowMs);
                return;
            }
            View keyView = findSoftKeyAt(root, x, y, 0, 0);
            if (keyView != null) {
                float cornerRadius = resolveKeyVisualBounds(root, keyView, tempVisualRect);
                if (!tempVisualRect.isEmpty()) {
                    int keyId = System.identityHashCode(keyView);
                    if (cached == null) {
                        cached = new CachedKeyHit();
                        pointerKeyCache.put(pointerId, cached);
                    }
                    cached.keyId = keyId;
                    cached.left = tempVisualRect.left;
                    cached.top = tempVisualRect.top;
                    cached.right = tempVisualRect.right;
                    cached.bottom = tempVisualRect.bottom;
                    cached.cornerRadius = cornerRadius;
                    engine.onKeyTouched(
                            keyId,
                            tempVisualRect.left,
                            tempVisualRect.top,
                            tempVisualRect.right,
                            tempVisualRect.bottom,
                            cornerRadius,
                            nowMs);
                }
            }
        }

        /**
         * Resolves the exact visible keycap pill bounds and corner radius (matching Gboard's
         * actual key background Drawable Outline, just like {@code SpacebarTimerOverlay}).
         */
        private float resolveKeyVisualBounds(View root, View softKeyView, RectF outRect) {
            View targetView = resolveKeyBackgroundView(softKeyView);
            int w = targetView.getWidth();
            int h = targetView.getHeight();
            if (w <= 0 || h <= 0) {
                outRect.setEmpty();
                return -1f;
            }

            // Compute targetView's exact origin in root (SoftKeyboardView) coordinates.
            float originX = 0f;
            float originY = 0f;
            View cur = targetView;
            while (cur != null && cur != root) {
                originX += cur.getX();
                originY += cur.getY();
                if (cur.getParent() instanceof View) {
                    View parent = (View) cur.getParent();
                    originX -= parent.getScrollX();
                    originY -= parent.getScrollY();
                    cur = parent;
                } else {
                    break;
                }
            }

            float radius = -1f;
            boolean foundOutline = false;
            Drawable bg = targetView.getBackground();
            if (bg != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                try {
                    tempOutline.setEmpty();
                    bg.getOutline(tempOutline);
                    if (tempOutline.getRect(tempOutlineRect) && !tempOutlineRect.isEmpty()) {
                        outRect.set(
                                originX + tempOutlineRect.left,
                                originY + tempOutlineRect.top,
                                originX + tempOutlineRect.right,
                                originY + tempOutlineRect.bottom);
                        radius = tempOutline.getRadius();
                        foundOutline = true;
                    }
                } catch (Throwable ignored) {
                }
            }

            if (!foundOutline) {
                if (bg != null) {
                    outRect.set(
                            originX + targetView.getPaddingLeft(),
                            originY + targetView.getPaddingTop(),
                            originX + w - targetView.getPaddingRight(),
                            originY + h - targetView.getPaddingBottom());
                } else {
                    float density = engine.getDensity();
                    float insetX = Math.min(w * 0.06f, 3f * density);
                    float insetY = Math.min(h * 0.12f, 5f * density);
                    outRect.set(
                            originX + insetX,
                            originY + insetY,
                            originX + w - insetX,
                            originY + h - insetY);
                }
            }

            return radius;
        }

        private static View resolveKeyBackgroundView(View softKeyView) {
            if (softKeyView.getBackground() != null) {
                return softKeyView;
            }
            if (softKeyView instanceof ViewGroup) {
                View bgChild = findBackgroundChildView(
                        (ViewGroup) softKeyView, softKeyView.getWidth() * 0.55f);
                if (bgChild != null) {
                    return bgChild;
                }
            }
            return softKeyView;
        }

        private static View findBackgroundChildView(ViewGroup group, float minWidth) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child == null || child.getVisibility() != View.VISIBLE) {
                    continue;
                }
                if (child.getBackground() != null
                        && child.getWidth() >= minWidth
                        && child.getHeight() > 0) {
                    return child;
                }
                if (child instanceof ViewGroup) {
                    View nested = findBackgroundChildView((ViewGroup) child, minWidth);
                    if (nested != null) {
                        return nested;
                    }
                }
            }
            return null;
        }

        private static boolean isPointInsideVisibleThiccTopBar(
                View node,
                float x,
                float y,
                int offsetX,
                int offsetY) {
            if (node == null || node.getVisibility() != View.VISIBLE) {
                return false;
            }
            int w = node.getWidth();
            int h = node.getHeight();
            if (w <= 0 || h <= 0) {
                return false;
            }
            if (x < offsetX || x > offsetX + w || y < offsetY || y > offsetY + h) {
                return false;
            }
            if (node instanceof dev.srwi.gintype.extension.thicctopbar.ThiccTopBarView) {
                return true;
            }
            if (node instanceof ViewGroup group) {
                int baseX = offsetX - group.getScrollX();
                int baseY = offsetY - group.getScrollY();
                for (int i = group.getChildCount() - 1; i >= 0; i--) {
                    View child = group.getChildAt(i);
                    if (child == null || child.getVisibility() != View.VISIBLE) {
                        continue;
                    }
                    int childLeft = baseX + child.getLeft() + Math.round(child.getTranslationX());
                    int childTop = baseY + child.getTop() + Math.round(child.getTranslationY());
                    if (isPointInsideVisibleThiccTopBar(child, x, y, childLeft, childTop)) {
                        return true;
                    }
                }
            }
            return false;
        }

        private static View findSoftKeyAt(
                View node,
                float x,
                float y,
                int offsetX,
                int offsetY) {
            if (node == null || node.getVisibility() != View.VISIBLE) {
                return null;
            }
            int w = node.getWidth();
            int h = node.getHeight();
            if (w <= 0 || h <= 0) {
                return null;
            }
            if (x < offsetX || x > offsetX + w || y < offsetY || y > offsetY + h) {
                return null;
            }
            String className = node.getClass().getName();
            if (className.endsWith("SoftKeyView")) {
                return node;
            }
            if (node instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) node;
                int childCount = group.getChildCount();
                int baseX = offsetX - group.getScrollX();
                int baseY = offsetY - group.getScrollY();
                for (int i = childCount - 1; i >= 0; i--) {
                    View child = group.getChildAt(i);
                    if (child == null || child.getVisibility() != View.VISIBLE) {
                        continue;
                    }
                    int childLeft = baseX + child.getLeft() + Math.round(child.getTranslationX());
                    int childTop = baseY + child.getTop() + Math.round(child.getTranslationY());
                    View hit = findSoftKeyAt(child, x, y, childLeft, childTop);
                    if (hit != null) {
                        return hit;
                    }
                }
            }
            return null;
        }

        private void ensureAttached(View view) {
            if (attached) return;
            try {
                view.getOverlay().add(drawable);
                attached = true;
            } catch (Throwable t) {
                Log.w(TAG, "Unable to attach typing effects overlay drawable", t);
            }
        }

        private void syncBounds(View view) {
            int w = view.getWidth();
            int h = view.getHeight();
            if (w > 0 && h > 0 && (w != lastBoundsW || h != lastBoundsH)) {
                drawable.setBounds(0, 0, w, h);
                lastBoundsW = w;
                lastBoundsH = h;
                pointerKeyCache.clear();
            }
        }

        private void scheduleNextFrame(View view) {
            if (animating) return;
            animating = true;
            view.postOnAnimation(frameRunnable);
        }

        void detach() {
            View view = viewRef.get();
            if (view != null) {
                view.removeCallbacks(frameRunnable);
                if (attached) {
                    try {
                        view.getOverlay().remove(drawable);
                    } catch (Throwable ignored) {
                    }
                }
            }
            animating = false;
            attached = false;
            pointerKeyCache.clear();
            engine.clearAll();
            drawable.releaseResources();
        }
    }
}
