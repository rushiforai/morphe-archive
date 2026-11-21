/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2616
 *
 * Portions of this file are modified by anddea:
 * Copyright (C) 2026 anddea
 * https://github.com/anddea/revanced-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-11-20
 */

package app.morphe.extension.youtube.patches;

import android.app.Activity;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import kotlin.Unit;

/**
 * Maps the playing video onto the full display with a compositor transform.
 * <p>
 * YouTube's watch player ({@code PlayerView}) is a 16:9 {@code ViewGroup}. The native
 * renderer letterboxes inside the surface when that view is already fullscreen, so
 * resizing the surface cannot stretch. Scale/translate the content rectangle onto the
 * current window instead.
 * <p>
 * Stretch fills the screen for any source aspect ratio by distorting.
 * Zoom covers the screen uniformly (crops). Default leaves YouTube letterboxing.
 */
@SuppressWarnings("unused")
public class FullscreenVideoScalePatch {

    public enum VideoScaleMode {
        DEFAULT("revanced_fullscreen_video_scale_fit"),
        STRETCH("revanced_fullscreen_video_scale_stretch"),
        ZOOM("revanced_fullscreen_video_scale_zoom");

        public final String iconBaseName;

        VideoScaleMode(String iconBaseName) {
            this.iconBaseName = iconBaseName;
        }
    }

    /**
     * Matches YouTube's hardcoded PlayerView aspect ({@code 1.777f}).
     */
    private static final float DEFAULT_VIDEO_ASPECT = 16f / 9f;

    private static final int MAX_CLIP_DEPTH = 16;
    private static final float[] rootPoint = new float[2];

    private static final View.OnLayoutChangeListener overlayLayoutListener =
            (v, l, t, r, b, ol, ot, or, ob) -> applyScale();

    private static volatile WeakReference<View> overlayRef = new WeakReference<>(null);
    private static volatile WeakReference<View> playerViewRef = new WeakReference<>(null);
    private static volatile float videoAspectRatio = DEFAULT_VIDEO_ASPECT;

    // Only the main thread changes the owner or the views it owns.
    @Nullable
    private static volatile ScaleOwner activeScale;

    static {
        PlayerType.getOnChange().addObserver((PlayerType type) -> {
            applyScale();
            return Unit.INSTANCE;
        });
    }

    /**
     * Injection point. Called with {@code YouTubePlayerOverlaysLayout}.
     */
    public static void attachPlayerOverlay(View overlay) {
        try {
            if (overlay == null) {
                return;
            }
            View previous = overlayRef.get();
            if (previous != overlay) {
                overlayRef = new WeakReference<>(overlay);
                if (previous != null) {
                    previous.removeOnLayoutChangeListener(overlayLayoutListener);
                }
                overlay.addOnLayoutChangeListener(overlayLayoutListener);
            }
            applyScale();
        } catch (Exception ex) {
            Logger.printException(() -> "attachPlayerOverlay failure", ex);
        }
    }

    /**
     * Injection point. Called at the end of {@code YouTubePlayerViewNotForReflection}
     * / 16:9 {@code PlayerView} {@code onLayout}.
     */
    public static void onPlayerViewLayout(View playerView) {
        try {
            if (playerView == null) {
                return;
            }
            if (playerViewRef.get() != playerView) {
                playerViewRef = new WeakReference<>(playerView);
            }
            applyScale();
        } catch (Exception ex) {
            Logger.printException(() -> "onPlayerViewLayout failure", ex);
        }
    }

    /**
     * Records the encoded video size so Stretch/Zoom can map non-16:9 content.
     */
    public static void setVideoSize(int width, int height) {
        if (width > 0 && height > 0) {
            videoAspectRatio = width / (float) height;
        }
    }

    public static void applyScale() {
        if (activeScale == null && getActiveMode() == VideoScaleMode.DEFAULT) {
            return;
        }
        Utils.runOnMainThreadNowOrLater(FullscreenVideoScalePatch::applyScaleOnMainThread);
    }

    private static void applyScaleOnMainThread() {
        try {
            VideoScaleMode mode = getActiveMode();
            if (mode == VideoScaleMode.DEFAULT) {
                releaseScale();
                return;
            }

            updateScale(resolvePlayerView(), mode);
        } catch (Exception ex) {
            releaseScale();
            Logger.printException(() -> "applyScale failure", ex);
        }
    }

    private static void updateScale(@Nullable View target, VideoScaleMode mode) {
        if (mode == VideoScaleMode.DEFAULT || target == null || !target.isAttachedToWindow()) {
            releaseScale();
            return;
        }

        ScaleOwner owner = activeScale;
        ViewTreeObserver observer = target.getViewTreeObserver();
        if (owner != null && (owner.targetRef.get() != target || owner.observerRef.get() != observer)) {
            releaseScale();
        }

        View root = target.getRootView();
        int displayW = root.getWidth();
        int displayH = root.getHeight();
        int viewW = target.getWidth();
        int viewH = target.getHeight();
        if (!observer.isAlive() || displayW <= 0 || displayH <= 0 || viewW <= 0 || viewH <= 0) {
            releaseScale();
            return;
        }

        mapContentToDisplay(target, observer, root, displayW, displayH, viewW, viewH, mode);
    }

    /**
     * Scale {@code view} so the letterboxed video content fills the current window.
     * Does not change layout bounds (that would make the native player letterbox again).
     */
    private static void mapContentToDisplay(View view, ViewTreeObserver observer, View root,
                                            int displayW, int displayH, int viewW, int viewH,
                                            VideoScaleMode mode) {
        final float videoAR = getVideoAspectRatio(view, viewW, viewH);
        final float viewAR = viewW / (float) viewH;

        float contentW;
        float contentH;
        if (videoAR >= viewAR) {
            contentW = viewW;
            contentH = viewW / videoAR;
        } else {
            contentH = viewH;
            contentW = viewH * videoAR;
        }
        if (contentW < 1f || contentH < 1f) {
            releaseScale();
            return;
        }

        final float contentLeft = (viewW - contentW) / 2f;
        final float contentTop = (viewH - contentH) / 2f;

        getUnscaledRootLocation(view, root);

        ScaleOwner owner = activeScale;
        if (owner == null) {
            // Scale the player itself: some devices ignore a transform on the SurfaceView alone.
            owner = new ScaleOwner(view, observer);
            activeScale = owner;
            view.addOnAttachStateChangeListener(owner);
            observer.addOnPreDrawListener(owner);
        }
        owner.disableClipping(view);

        final float scaleX = displayW / contentW;
        final float scaleY = displayH / contentH;
        if (mode == VideoScaleMode.ZOOM) {
            final float scale = Math.max(scaleX, scaleY);
            owner.applyTransform(view, scale, scale, contentLeft + contentW / 2f, contentTop + contentH / 2f,
                    displayW / 2f, displayH / 2f);
        } else {
            owner.applyTransform(view, scaleX, scaleY, contentLeft, contentTop, 0f, 0f);
        }
    }

    private static float getVideoAspectRatio(View view, int viewW, int viewH) {
        View child = findDirectVideoSurface(view);
        if (child != null && child != view && child.getWidth() > 8 && child.getHeight() > 8) {
            float childAR = child.getWidth() / (float) child.getHeight();
            float parentAR = viewW / (float) viewH;
            if (Math.abs(childAR - parentAR) > 0.02f) {
                return childAR;
            }
        }
        float recorded = videoAspectRatio;
        if (recorded > 0.15f && recorded < 8f) {
            return recorded;
        }
        return DEFAULT_VIDEO_ASPECT;
    }

    /**
     * Maps the player's layout origin into the root viewport, excluding both views' own transforms.
     */
    private static void getUnscaledRootLocation(View view, View root) {
        if (view == root) {
            rootPoint[0] = 0f;
            rootPoint[1] = 0f;
            return;
        }

        rootPoint[0] = view.getLeft();
        rootPoint[1] = view.getTop();
        for (View current = view; current.getParent() instanceof View parent; current = parent) {
            rootPoint[0] -= parent.getScrollX();
            rootPoint[1] -= parent.getScrollY();
            if (parent == root) {
                return;
            }
            parent.getMatrix().mapPoints(rootPoint);
            rootPoint[0] += parent.getLeft();
            rootPoint[1] += parent.getTop();
        }
    }

    private static void releaseScale() {
        ScaleOwner owner = activeScale;
        if (owner != null) {
            activeScale = null;
            owner.release();
        }
    }

    /**
     * Stretch/Zoom maps the player onto the full window, which is only valid in
     * true fullscreen.
     * <p>
     * Landscape {@link PlayerType#WATCH_WHILE_MAXIMIZED} is the tablet / foldable
     * inner-screen watch page (player in a pane), not fullscreen. Phone landscape
     * already reports {@link PlayerType#WATCH_WHILE_FULLSCREEN}.
     * <p>
     * {@link PlayerType#WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN} is used for both
     * enter and exit. Scaling during it would keep the full-window transform while
     * the player is already shrinking back into the watch page.
     *
     * @see <a href="https://github.com/MorpheApp/morphe-patches/issues/2652">#2652</a>
     */
    private static VideoScaleMode getActiveMode() {
        return PlayerType.getCurrent() == PlayerType.WATCH_WHILE_FULLSCREEN
                ? Settings.FULLSCREEN_VIDEO_SCALE.get()
                : VideoScaleMode.DEFAULT;
    }

    @Nullable
    private static View resolvePlayerView() {
        View cached = playerViewRef.get();
        if (cached != null && cached.isAttachedToWindow()) {
            return cached;
        }

        Activity activity = Utils.getActivity();
        if (activity != null) {
            Window window = activity.getWindow();
            if (window != null) {
                View found = findPlayerView(window.getDecorView(), 0);
                if (found != null) {
                    playerViewRef = new WeakReference<>(found);
                    return found;
                }
            }
        }

        View overlay = overlayRef.get();
        if (overlay != null) {
            View found = findPlayerView(overlay.getRootView(), 0);
            if (found != null) {
                playerViewRef = new WeakReference<>(found);
                return found;
            }
        }
        return null;
    }

    @Nullable
    private static View findPlayerView(View view, int depth) {
        if (depth > 16 || view == null) {
            return null;
        }
        String name = view.getClass().getName();
        if (view.isAttachedToWindow()
                && (name.endsWith("YouTubePlayerViewNotForReflection") || name.endsWith("player.ui.PlayerView"))) {
            return view;
        }
        if (!(view instanceof ViewGroup group)) {
            return null;
        }

        for (int i = 0, getChildCount = group.getChildCount(); i < getChildCount; i++) {
            View found = findPlayerView(group.getChildAt(i), depth + 1);
            if (found != null) {
                return found;
            }
        }
        return null;
    }

    @Nullable
    private static View findDirectVideoSurface(@Nullable View container) {
        if (isUsableVideoView(container)) {
            return container;
        }

        if (container instanceof ViewGroup group) {
            for (int i = 0, childCount = group.getChildCount(); i < childCount; i++) {
                View child = group.getChildAt(i);
                if (isUsableVideoView(child)) {
                    return child;
                }
            }
        }
        return findVideoViewField(container);
    }

    @Nullable
    private static View findVideoViewField(@Nullable View playerView) {
        if (playerView == null) {
            return null;
        }

        Class<?> cls = playerView.getClass();
        for (int depth = 0; depth < 8 && cls != null && cls != ViewGroup.class && cls != View.class; depth++) {
            for (Field field : cls.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                if (!View.class.isAssignableFrom(field.getType())) {
                    continue;
                }

                try {
                    field.setAccessible(true);
                    Object value = field.get(playerView);
                    if (value instanceof View candidate && candidate != playerView
                            && isUsableVideoView(candidate)) {
                        return candidate;
                    }
                } catch (Exception ex) {
                    Logger.printDebug(() -> "Ignoring exception", ex); // Ignore exception?
                    // Keep looking.
                }
            }
            cls = cls.getSuperclass();
        }

        return null;
    }

    private static boolean isUsableVideoView(@Nullable View view) {
        return view instanceof TextureView || view instanceof SurfaceView;
    }

    private static final class ScaleOwner implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        final WeakReference<View> targetRef;
        final WeakReference<ViewTreeObserver> observerRef;
        private final ClipState[] clipStates = new ClipState[MAX_CLIP_DEPTH];
        private int clipCount;

        private final TransformValue scaleX = new TransformValue();
        private final TransformValue scaleY = new TransformValue();
        private final TransformValue translationX = new TransformValue();
        private final TransformValue translationY = new TransformValue();

        ScaleOwner(View target, ViewTreeObserver observer) {
            targetRef = new WeakReference<>(target);
            observerRef = new WeakReference<>(observer);
        }

        @Override
        public boolean onPreDraw() {
            if (activeScale == this) {
                try {
                    updateScale(targetRef.get(), getActiveMode());
                } catch (Exception ex) {
                    releaseScale();
                    Logger.printException(() -> "fullscreen video scale pre-draw failure", ex);
                }
            }
            return true;
        }

        @Override
        public void onViewAttachedToWindow(View target) {
            // Ownership only starts on an attached target.
        }

        @Override
        public void onViewDetachedFromWindow(View target) {
            if (activeScale == this) {
                releaseScale();
            }
        }

        void applyTransform(View view, float xScale, float yScale,
                            float contentX, float contentY, float displayX, float displayY) {
            // Adjust location for the existing pivot rather than setting it. Even an automatic
            // pivot remains automatic when switching modes, resizing, or leaving fullscreen.
            float xTranslation = displayX - rootPoint[0] - contentX
                    - (contentX - view.getPivotX()) * (xScale - 1f);
            float yTranslation = displayY - rootPoint[1] - contentY
                    - (contentY - view.getPivotY()) * (yScale - 1f);

            if (scaleX.update(view.getScaleX(), xScale)) {
                view.setScaleX(xScale);
            }
            if (scaleY.update(view.getScaleY(), yScale)) {
                view.setScaleY(yScale);
            }
            if (translationX.update(view.getTranslationX(), xTranslation)) {
                view.setTranslationX(xTranslation);
            }
            if (translationY.update(view.getTranslationY(), yTranslation)) {
                view.setTranslationY(yTranslation);
            }
        }

        void disableClipping(View target) {
            View current = target;
            int depth = 0;
            while (current != null && depth < MAX_CLIP_DEPTH) {
                if (depth < clipCount && clipStates[depth].viewRef.get() != current) {
                    restoreClippingFrom(depth);
                }
                if (depth == clipCount) {
                    clipStates[clipCount++] = new ClipState(current);
                }
                clipStates[depth++].disable(current);
                current = current.getParent() instanceof View parent ? parent : null;
            }
            restoreClippingFrom(depth);
        }

        private void restoreClippingFrom(int depth) {
            while (clipCount > depth) {
                ClipState state = clipStates[--clipCount];
                clipStates[clipCount] = null;
                state.restore();
            }
        }

        void release() {
            // Remove from the exact observer used at registration, even after the host has detached.
            ViewTreeObserver observer = observerRef.get();
            if (observer != null && observer.isAlive()) {
                observer.removeOnPreDrawListener(this);
            }
            View target = targetRef.get();
            if (target != null) {
                target.removeOnAttachStateChangeListener(this);
                restoreTransform(target);
            }
            restoreClippingFrom(0);
        }

        private void restoreTransform(View view) {
            if (scaleX.canRestore(view.getScaleX())) {
                view.setScaleX(scaleX.original);
            }
            if (scaleY.canRestore(view.getScaleY())) {
                view.setScaleY(scaleY.original);
            }
            if (translationX.canRestore(view.getTranslationX())) {
                view.setTranslationX(translationX.original);
            }
            if (translationY.canRestore(view.getTranslationY())) {
                view.setTranslationY(translationY.original);
            }
        }
    }

    private static final class TransformValue {
        float original;
        float applied;

        boolean update(float current, float next) {
            if (current != applied) {
                // Any intervening native write becomes the value to restore.
                original = current;
            }
            applied = next;
            return current != next;
        }

        boolean canRestore(float current) {
            return original != applied && current == applied;
        }
    }

    private static final class ClipState {
        final WeakReference<View> viewRef;
        private boolean outlineChanged;
        private boolean childrenChanged;
        private boolean paddingChanged;

        ClipState(View view) {
            viewRef = new WeakReference<>(view);
        }

        void disable(View view) {
            if (view.getClipToOutline()) {
                outlineChanged = true;
                view.setClipToOutline(false);
            }
            if (view instanceof ViewGroup group) {
                if (group.getClipChildren()) {
                    childrenChanged = true;
                    group.setClipChildren(false);
                }
                if (group.getClipToPadding()) {
                    paddingChanged = true;
                    group.setClipToPadding(false);
                }
            }
        }

        void restore() {
            View view = viewRef.get();
            if (view == null) {
                return;
            }

            if (outlineChanged && !view.getClipToOutline()) {
                view.setClipToOutline(true);
            }
            if (view instanceof ViewGroup group) {
                if (childrenChanged && !group.getClipChildren()) {
                    group.setClipChildren(true);
                }
                if (paddingChanged && !group.getClipToPadding()) {
                    group.setClipToPadding(true);
                }
            }
        }
    }
}
