/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import app.morphe.extension.shared.ui.glass.GlassBackdrop;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Android's public window blur cannot target a panel within a larger window or a PopupWindow. For those
 * windows, blur a bounded, downsampled copy of the owning activity's surface. The copy is not a recording
 * of the screen: other windows, secure content and separate SurfaceView layers are not captured.
 */
@RequiresApi(Build.VERSION_CODES.S)
final class BlurRegion {
    private static final int MAX_COPY_EDGE = 768;
    private static final int MAX_LOCAL_EDGE = 4096;
    private static final long CAPTURE_DELAY_MS = 48;

    private final View target;
    private final View foreground;
    private final Window source;
    private final View sourceDecor;
    private final boolean inWindow;
    private final int backgroundColor;
    private final int[] targetLocation = new int[2];
    private final int[] sourceLocation = new int[2];
    private final Rect requestedPanel = new Rect();
    private final Rect attemptedPanel = new Rect();
    private final Rect copiedArea = new Rect();
    private final Rect localPanel = new Rect();
    private final Rect testBounds = new Rect();
    private final RectF recordingArea = new RectF();
    private final List<View> siblings = new ArrayList<>();
    private final Runnable requestCopy = this::requestCopy;

    private int radius;
    private int generation;
    private boolean pending;
    private boolean scheduled;
    private int renderVersion;
    private int offsetX;
    private int offsetY;
    @Nullable private RenderNode recorded;
    @Nullable private GlassBackdrop localBackdrop;

    @Nullable
    static BlurRegion create(View target, View foreground, @Nullable Activity owner, int color) {
        Activity activity = owner != null ? owner : contextActivity(target.getContext());
        if (activity == null) {
            activity = Utils.getActivity();
            View decor = activity == null ? null : activity.getWindow().peekDecorView();
            if (decor == null || !Objects.equals(decor.getApplicationWindowToken(),
                    target.getApplicationWindowToken())) return null;
        }

        Window window = activity.getWindow();
        View decor = window.peekDecorView();
        if (decor == null || !decor.isAttachedToWindow() || !decor.isHardwareAccelerated()
                || decor.getDisplay() == null || target.getDisplay() == null
                || decor.getDisplay().getDisplayId() != target.getDisplay().getDisplayId()
                || (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) != 0) {
            return null;
        }

        if (decor == target.getRootView() && Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            // Do not rerender live view trees through RenderEffect on Android 12 or 13.
            return null;
        }

        return new BlurRegion(target, foreground, window, decor, color);
    }

    private BlurRegion(View target, View foreground, Window source, View sourceDecor, int backgroundColor) {
        this.target = target;
        this.foreground = foreground;
        this.source = source;
        this.sourceDecor = sourceDecor;
        this.backgroundColor = backgroundColor;
        inWindow = sourceDecor == target.getRootView();
    }

    @Nullable
    static Activity contextActivity(Context context) {
        for (int depth = 0; depth < 8 && context instanceof ContextWrapper wrapper; depth++) {
            if (context instanceof Activity activity) return activity;
            context = wrapper.getBaseContext();
        }
        return null;
    }

    /** False means no real backdrop is ready yet, so the caller must keep every stock fill. */
    boolean prepare(Rect panel, int blurRadius, boolean layoutChanged) {
        if (!sourceDecor.isAttachedToWindow() || !sourceDecor.isShown()
                || (source.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) != 0) {
            return false;
        }

        if (radius != blurRadius) {
            clear();
            radius = blurRadius;
        }
        if (radius == 0) return true; // Deliberate zero, never used as an unavailable-blur fallback.

        if (inWindow && Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            target.getLocationOnScreen(targetLocation);
            if (layoutChanged || !localPanel.equals(panel)
                    || offsetX != targetLocation[0] || offsetY != targetLocation[1]) recordLocal(panel);
            return recorded != null;
        }

        target.getLocationOnScreen(targetLocation);
        sourceDecor.getLocationOnScreen(sourceLocation);
        int relativeX = sourceLocation[0] - targetLocation[0];
        int relativeY = sourceLocation[1] - targetLocation[1];
        testBounds.set(panel);
        testBounds.offset(-relativeX, -relativeY);
        // A translating or over-tall sheet can extend past the activity surface. Its visible part
        // still has a real backdrop, even though the entire logical panel cannot be copied.
        if (!clipToSource(testBounds, sourceDecor.getWidth(), sourceDecor.getHeight())) {
            requestedPanel.setEmpty();
            cancelScheduledCopy();
            return false;
        }
        boolean visiblePanelChanged = !requestedPanel.equals(testBounds);
        if (visiblePanelChanged) {
            requestedPanel.set(testBounds);
            cancelScheduledCopy();
        }
        if (recorded != null && copiedArea.contains(requestedPanel)) {
            int left = relativeX + copiedArea.left;
            int top = relativeY + copiedArea.top;
            if (visiblePanelChanged || offsetX != left || offsetY != top) {
                offsetX = left;
                offsetY = top;
                renderVersion++;
            }
            return true;
        }

        if (!pending && !scheduled && !attemptedPanel.equals(requestedPanel)) {
            scheduled = target.postDelayed(requestCopy, CAPTURE_DELAY_MS);
        }
        return false;
    }

    private void requestCopy() {
        scheduled = false;
        if (!target.isAttachedToWindow() || !sourceDecor.isAttachedToWindow()) return;

        attemptedPanel.set(requestedPanel);
        Rect sample = new Rect();
        if (!copyArea(requestedPanel, sourceDecor.getWidth(), sourceDecor.getHeight(), radius * 2, sample)) return;

        float scale = Math.min(0.5f, (float) MAX_COPY_EDGE / Math.max(sample.width(), sample.height()));
        int width = Math.max(1, Math.round(sample.width() * scale));
        int height = Math.max(1, Math.round(sample.height() * scale));
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        int requestGeneration = generation;
        pending = true;
        try {
            PixelCopy.request(source, sample, bitmap, result -> {
                if (generation != requestGeneration) return;

                pending = false;
                if (result == PixelCopy.SUCCESS) {
                    try {
                        recordCopy(bitmap, sample);
                    } catch (RuntimeException ex) {
                        Logger.printException(() -> "Could not render the glass menu snapshot", ex);
                    }
                } else {
                    Logger.printDebug(() -> "Glass menu backdrop unavailable: PixelCopy result " + result);
                }
                target.postInvalidateOnAnimation();
            }, new Handler(Looper.getMainLooper()));
        } catch (IllegalArgumentException ex) {
            pending = false;
            Logger.printDebug(() -> "Glass menu source window is not ready for PixelCopy", ex);
        }
    }

    /** Clips the panel in the owning activity's coordinate space; an empty intersection stays stock. */
    static boolean clipToSource(Rect panel, int sourceWidth, int sourceHeight) {
        return !panel.isEmpty() && panel.intersect(0, 0, sourceWidth, sourceHeight);
    }

    /** The blur may sample beyond the visible panel, but never outside the activity surface. */
    static boolean copyArea(Rect panel, int sourceWidth, int sourceHeight, int padding, Rect result) {
        result.set(panel);
        if (!clipToSource(result, sourceWidth, sourceHeight)) {
            result.setEmpty();
            return false;
        }

        result.set(Math.max(0, result.left - padding), Math.max(0, result.top - padding),
                Math.min(sourceWidth, result.right + padding), Math.min(sourceHeight, result.bottom + padding));
        return true;
    }

    private void recordCopy(Bitmap bitmap, Rect sample) {
        // The RenderEffect and its working surface are also downsampled, not just the bitmap.
        RenderNode node = new RenderNode("Glass menu snapshot");
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        node.setPosition(0, 0, width, height);
        node.setRenderEffect(RenderEffect.createBlurEffect(
                (float) radius * width / sample.width(), (float) radius * height / sample.height(),
                Shader.TileMode.CLAMP));
        RecordingCanvas canvas = node.beginRecording();
        try {
            canvas.drawColor(backgroundColor);
            canvas.drawBitmap(bitmap, 0, 0, null);
        } finally {
            node.endRecording();
        }
        recorded = node;
        copiedArea.set(sample);
        renderVersion++;
    }

    @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
    private void recordLocal(Rect panel) {
        localPanel.set(panel);
        offsetX = targetLocation[0];
        offsetY = targetLocation[1];
        if (panel.width() > MAX_LOCAL_EDGE || panel.height() > MAX_LOCAL_EDGE) {
            recorded = null;
            return;
        }

        // The playlist overlay's own list and close bar are both in foreground; never record either one.
        siblings.clear();
        testBounds.set(panel);
        testBounds.offset(targetLocation[0], targetLocation[1]);
        collectBehind(foreground, testBounds, 0);
        if (siblings.isEmpty()) {
            recorded = null;
            return;
        }

        RenderNode node = recorded != null ? recorded : new RenderNode("Glass menu in-window backdrop");
        if (localBackdrop == null) localBackdrop = new GlassBackdrop("Glass menu panel", radius);
        node.setPosition(panel.left, panel.top, panel.right, panel.bottom);
        RecordingCanvas canvas = node.beginRecording();
        try {
            canvas.translate(-panel.left, -panel.top);
            recordingArea.set(panel);
            recordingArea.inset(-radius, -radius);
            localBackdrop.draw(canvas, target, siblings, recordingArea, backgroundColor);
        } finally {
            node.endRecording();
            siblings.clear();
        }
        recorded = node;
        renderVersion++;
    }

    private void collectBehind(View branch, Rect panelOnScreen, int depth) {
        if (depth >= 24 || !(branch.getParent() instanceof ViewGroup parent)) return;

        collectBehind(parent, panelOnScreen, depth + 1);
        for (int index = 0, count = parent.getChildCount(); index < count; index++) {
            View sibling = parent.getChildAt(index);
            if (sibling == branch) break;
            if (!sibling.isShown() || sibling.getAlpha() != 1f || sibling.getZ() > branch.getZ()) continue;

            sibling.getLocationOnScreen(sourceLocation);
            int left = sourceLocation[0];
            int top = sourceLocation[1];
            if (panelOnScreen.intersects(left, top, left + sibling.getWidth(), top + sibling.getHeight())) {
                siblings.add(sibling);
            }
        }
    }

    void draw(Canvas canvas) {
        RenderNode node = recorded;
        if (node == null) return;

        if (inWindow) {
            canvas.drawRenderNode(node);
        } else {
            int save = canvas.save();
            int relativeX = offsetX - copiedArea.left;
            int relativeY = offsetY - copiedArea.top;
            canvas.clipRect(requestedPanel.left + relativeX, requestedPanel.top + relativeY,
                    requestedPanel.right + relativeX, requestedPanel.bottom + relativeY);
            canvas.translate(offsetX, offsetY);
            canvas.scale((float) copiedArea.width() / node.getWidth(), (float) copiedArea.height() / node.getHeight());
            canvas.drawRenderNode(node);
            canvas.restoreToCount(save);
        }
    }

    int renderVersion() {
        return renderVersion;
    }

    private void cancelScheduledCopy() {
        if (scheduled) {
            target.removeCallbacks(requestCopy);
            scheduled = false;
        }
    }

    void clear() {
        generation++;
        renderVersion++;
        cancelScheduledCopy();
        pending = false;
        requestedPanel.setEmpty();
        attemptedPanel.setEmpty();
        copiedArea.setEmpty();
        localPanel.setEmpty();
        localBackdrop = null;
        recorded = null;
    }
}
