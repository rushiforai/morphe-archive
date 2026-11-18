/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4801 (Ramik4)
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.player;

import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL;
import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL_BAR;
import static app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType.MINIMAL_BAR_2;

import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.glass.GlassBackdrop;
import app.morphe.extension.shared.ui.glass.GlassCapsuleDrawable;
import app.morphe.extension.shared.ui.glass.GlassCapsuleGeometry;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.general.GlassNavigationBar;
import app.morphe.extension.youtube.patches.general.NavigationBarRoom;
import app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType;
import app.morphe.extension.youtube.utils.ThemeUtils;

/** Styling for the existing minimal bar. Does not own its state, gestures or motion. */
final class GlassMinimalMiniplayer implements GlassCapsuleDrawable.Host, View.OnAttachStateChangeListener {
    private final int landscapeMinWidth = Dim.dp(360);
    private final int landscapeMaxWidthWithoutCapsule = Dim.dp(480);

    /** True only when the patcher installed the glass miniplayer hooks. */
    static boolean isSupported() {
        return false;
    }

    static boolean isAvailable(MiniplayerType type, boolean supported, boolean glassNavigationBar) {
        return supported && glassNavigationBar && (type == MINIMAL || type == MINIMAL_BAR || type == MINIMAL_BAR_2);
    }

    static MiniplayerType resolveType(MiniplayerType type, boolean glassEnabled) {
        // Before 21.29 the Minimal entry uses the stock bar. Glass uses the reconstructed
        // bar on these versions too, without changing the saved type or the glass-off path.
        return type == MINIMAL && glassEnabled ? MINIMAL_BAR : type;
    }

    private final WeakReference<View> containerRef;
    private final boolean overVideo;
    private final GlassCapsuleDrawable drawable;
    private final int floatyTimeBar = ResourceUtils.getIdIdentifier("floaty_bar_time_bar_view");
    private final int watchTimeBar = ResourceUtils.getIdIdentifier("watch_while_time_bar_view");
    private final int watchTimeBarOverlay = ResourceUtils.getIdIdentifier("watch_while_time_bar_view_overlay");
    private final int[] playerLocation = new int[2];
    private final int[] targetLocation = new int[2];
    private final int[] navigationSpan = new int[2];
    private final ArrayList<View> backdropSources = new ArrayList<>();
    private final RectF backdropArea = new RectF();

    @Nullable private Drawable originalBackground;
    @Nullable private GlassBackdrop backdrop;
    @Nullable private ViewTreeObserver scrollObserver;
    @Nullable private WeakReference<View> playerRef;
    @Nullable private WeakReference<View> roundedPlayerRef;
    @Nullable private ViewOutlineProvider originalOutline;
    private boolean originalClip;
    private boolean recordingBackdrop;
    private boolean backdropFailed;
    private boolean active;

    private final Rect outlineBounds = new Rect();
    private float outlineRadius;
    private final ViewOutlineProvider outline = new ViewOutlineProvider() {
        @Override
        public void getOutline(View view, Outline out) {
            out.setRoundRect(outlineBounds, outlineRadius);
        }
    };

    private final ViewTreeObserver.OnScrollChangedListener onScroll = this::invalidate;

    void invalidate() {
        View container = containerRef.get();
        if (active && container != null) container.invalidate();
    }

    GlassMinimalMiniplayer(View container, boolean overVideo) {
        containerRef = new WeakReference<>(container);
        this.overVideo = overVideo;
        drawable = new GlassCapsuleDrawable(container, this, GlassNavigationBar.getOpacityScale());

        if (!overVideo && Build.VERSION.SDK_INT >= NavigationBarRoom.MINIMUM_BLUR_SDK) {
            container.addOnAttachStateChangeListener(this);
            if (container.isAttachedToWindow()) onViewAttachedToWindow(container);
        }
    }

    void update(View player, boolean inBarMode) {
        View container = containerRef.get();
        if (container == null) return;

        if (playerRef == null || playerRef.get() != player) playerRef = new WeakReference<>(player);
        active = inBarMode;

        Drawable background = container.getBackground();
        if (active) {
            if (background != drawable) {
                originalBackground = background;
                container.setBackground(drawable);
            }
            drawable.updateStyle();
            container.invalidate();
        } else {
            if (background == drawable) container.setBackground(originalBackground);
            originalBackground = null;
            restoreOutline();
        }
    }

    void release() {
        active = false;
        View container = containerRef.get();
        if (container != null) {
            if (container.getBackground() == drawable) container.setBackground(originalBackground);
            container.removeOnAttachStateChangeListener(this);
        }
        removeScrollListener();
        restoreOutline();
    }

    @Override
    public void onViewAttachedToWindow(View view) {
        scrollObserver = view.getViewTreeObserver();
        scrollObserver.addOnScrollChangedListener(onScroll);
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        removeScrollListener();
    }

    private void removeScrollListener() {
        if (scrollObserver != null && scrollObserver.isAlive()) {
            scrollObserver.removeOnScrollChangedListener(onScroll);
        }
        scrollObserver = null;
    }

    int videoPadding(int height) {
        return !overVideo && height > 4 * Dim.dp6 ? Dim.dp6 : 0;
    }

    private static float cornerRadius(float width, float height) {
        return GlassCapsuleGeometry.cornerRadius(Dim.dp16, Math.min(width, height));
    }

    void roundVideo(View player, @Nullable Rect clip, int barWidth, int barHeight, int padding) {
        if (clip == null || clip.isEmpty()) {
            restoreOutline();
            return;
        }

        final float radius = GlassCapsuleGeometry.artworkRadius(cornerRadius(barWidth, barHeight), padding, 0);
        if (radius <= 0) {
            restoreOutline();
            return;
        }

        if (roundedPlayerRef == null || roundedPlayerRef.get() != player) {
            restoreOutline();
            roundedPlayerRef = new WeakReference<>(player);
        }
        boolean outlineChanged = !outlineBounds.equals(clip) || outlineRadius != radius;
        outlineBounds.set(clip);
        outlineRadius = radius;
        if (player.getOutlineProvider() != outline) {
            originalOutline = player.getOutlineProvider();
            originalClip = player.getClipToOutline();
            player.setOutlineProvider(outline);
        } else if (outlineChanged) {
            player.invalidateOutline();
        }
        if (!player.getClipToOutline()) player.setClipToOutline(true);
    }

    private void restoreOutline() {
        View player = roundedPlayerRef == null ? null : roundedPlayerRef.get();
        if (player != null && player.getOutlineProvider() == outline) {
            player.setOutlineProvider(originalOutline);
            player.setClipToOutline(originalClip);
        }
        roundedPlayerRef = null;
        originalOutline = null;
    }

    void fitLandscapeWidth(Rect bounds, @Nullable View playerLayout) {
        if (playerLayout == null) return;

        View root = playerLayout.getRootView();
        if (root.getWidth() <= root.getHeight()) return;

        if (GlassNavigationBar.getCapsuleSpanInWindow(root, navigationSpan)) {
            playerLayout.getLocationInWindow(targetLocation);
            final int width = navigationSpan[1] - navigationSpan[0];
            final int center = navigationSpan[0] + width / 2 - targetLocation[0];
            fitLandscapeSpan(bounds, width, center, landscapeMinWidth, landscapeMaxWidthWithoutCapsule);
        } else {
            fitLandscapeSpan(bounds, 0, bounds.centerX(), landscapeMinWidth, landscapeMaxWidthWithoutCapsule);
        }
    }

    static void fitLandscapeSpan(Rect bounds, int capsuleWidth, int center, int minimum, int fallbackMaximum) {
        final int desiredWidth = capsuleWidth > 0 ? Math.max(minimum, capsuleWidth) : fallbackMaximum;
        final int width = Math.min(bounds.width(), desiredWidth);
        bounds.left = GlassCapsuleGeometry.clamp(center - width / 2, bounds.left, bounds.right - width);
        bounds.right = bounds.left + width;
    }

    void clipSeekbar(View seekbar, Canvas canvas) {
        View player = playerRef == null ? null : playerRef.get();
        if (!active || player == null || !player.isAttachedToWindow() || player.getRootView() != seekbar.getRootView()
                || !isWatchSeekbar(seekbar, player, floatyTimeBar, watchTimeBar, watchTimeBarOverlay)) {
            return;
        }

        final int width = player.getWidth();
        final float radius = cornerRadius(width, player.getHeight());
        if (radius <= 0) return;

        player.getLocationInWindow(playerLocation);
        seekbar.getLocationInWindow(targetLocation);
        final float left = playerLocation[0] - targetLocation[0];
        // Only the straight part of the bottom edge. This canvas belongs to the seekbar's draw pass.
        canvas.clipRect(left + radius, -seekbar.getHeight(), left + width - radius, 2f * seekbar.getHeight());
    }

    static boolean isWatchSeekbar(View seekbar, View player, int floatyBar, int watchBar, int watchOverlay) {
        // Shorts also uses the hooked seekbar class, but not these watch-player wrappers.
        for (View view = seekbar; view != null; view = view.getParent() instanceof View parent ? parent : null) {
            if (view == player) return true;

            final int id = view.getId();
            if (id > 0 && (id == floatyBar || id == watchBar || id == watchOverlay)) return true;
        }
        return false;
    }

    @Override
    public void getCapsule(Rect bounds, RectF capsule) {
        View container = containerRef.get();
        View player = playerRef == null ? null : playerRef.get();
        if (container == null || player == null || !active) {
            capsule.setEmpty();
            return;
        }

        player.getLocationInWindow(playerLocation);
        container.getLocationInWindow(targetLocation);
        final int left = bounds.left + playerLocation[0] - targetLocation[0];
        final int top = bounds.top + playerLocation[1] - targetLocation[1];
        capsule.set(left, top, left + player.getWidth(), top + player.getHeight());
        if (!capsule.intersect(bounds.left, bounds.top, bounds.right, bounds.bottom)) capsule.setEmpty();
        if (!overVideo) backdropArea.set(capsule);
    }

    @Nullable
    @Override
    public View getSelectedTabView() {
        return null;
    }

    @Override
    public boolean isOverVideo() {
        return overVideo;
    }

    @Override
    public float getCornerRadius(RectF capsule) {
        return cornerRadius(capsule.width(), capsule.height());
    }

    @Override
    public void drawBackdrop(Canvas canvas) {
        View container = containerRef.get();
        if (container == null) return;

        final int background = ThemeUtils.getAppBackgroundColor() | 0xff000000;
        if (!NavigationBarRoom.useBlur(Build.VERSION.SDK_INT, canvas.isHardwareAccelerated(), false)
                || recordingBackdrop || backdropFailed) {
            canvas.drawColor(background);
            return;
        }

        recordingBackdrop = true;
        try {
            View player = playerRef == null ? null : playerRef.get();
            collectViewsBehind(container, player);
            if (backdrop == null) backdrop = new GlassBackdrop("GlassMinimalMiniplayer", Dim.dp20);

            backdropArea.inset(-Dim.dp20, -Dim.dp20);
            backdrop.draw(canvas, container, backdropSources, backdropArea, background);
        } catch (Exception ex) {
            backdropFailed = true;
            Logger.printException(() -> "Glass miniplayer backdrop failure", ex);
            canvas.drawColor(background);
        } finally {
            backdropSources.clear();
            recordingBackdrop = false;
        }
    }

    /** Visits preceding siblings from the root down, in drawing order, without capturing the player. */
    private void collectViewsBehind(View target, @Nullable View player) {
        if (!(target.getParent() instanceof ViewGroup parent)) return;
        collectViewsBehind(parent, player);

        for (int index = 0, end = parent.indexOfChild(target); index < end; index++) {
            View source = parent.getChildAt(index);
            if (source.getVisibility() == View.VISIBLE && source.getAlpha() > 0 && !contains(source, player)) {
                backdropSources.add(source);
            }
        }
    }

    private static boolean contains(View ancestor, @Nullable View child) {
        for (View view = child; view != null; view = view.getParent() instanceof View parent ? parent : null) {
            if (view == ancestor) return true;
        }
        return false;
    }
}
