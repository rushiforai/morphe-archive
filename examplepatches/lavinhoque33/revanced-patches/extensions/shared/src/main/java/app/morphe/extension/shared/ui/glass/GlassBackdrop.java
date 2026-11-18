/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/4621
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-18.
 * Written by lavinhoque33, 2026-11-13.
 */

package app.morphe.extension.shared.ui.glass;

import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.RecordingCanvas;
import android.graphics.RenderEffect;
import android.graphics.RectF;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;

import androidx.annotation.ColorInt;
import androidx.annotation.RequiresApi;

import java.util.List;

/**
 * The content behind a glass capsule, recorded again for each frame into a blurred render node.
 * The node only refers to the drawings of the views, so it is fast. Drawn by
 * {@link GlassCapsuleDrawable.Host#drawBackdrop(Canvas)} on a hardware accelerated canvas.
 * <p>
 * Used only on Android 14 and later: on Android 12 and 13 a blur render effect redrawn
 * while the player moves can crash the app.
 */
@RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
@SuppressWarnings("unused")
public final class GlassBackdrop {

    /**
     * The colors of the blurred content are made more vivid and slightly brighter, which looks like frosted
     * glass. A blur alone makes the colors dull and gray.
     */
    private static final ColorMatrix FROSTED_GLASS_COLORS = createFrostedGlassColors();

    private static ColorMatrix createFrostedGlassColors() {
        ColorMatrix colors = new ColorMatrix();
        colors.setSaturation(1.5f);
        final float brightness = 15;
        colors.postConcat(new ColorMatrix(new float[]{
                1, 0, 0, 0, brightness,
                0, 1, 0, 0, brightness,
                0, 0, 1, 0, brightness,
                0, 0, 0, 1, 0
        }));
        return colors;
    }

    private final RenderNode node;
    private final int[] targetLocation = new int[2];
    private final int[] sourceLocation = new int[2];
    private float blurRadius;

    public GlassBackdrop(String name, float blurRadius) {
        node = new RenderNode(name);
        setBlurRadius(blurRadius);
    }

    /**
     * @param blurRadius More than 0.
     */
    public void setBlurRadius(float blurRadius) {
        if (blurRadius == this.blurRadius) return;
        this.blurRadius = blurRadius;
        node.setRenderEffect(RenderEffect.createChainEffect(
                RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(FROSTED_GLASS_COLORS)),
                RenderEffect.createBlurEffect(blurRadius, blurRadius, Shader.TileMode.CLAMP)));
    }

    /**
     * Draws the source blurred, over a background color, where it is behind the target.
     *
     * @param target     The view the glass is the background of.
     * @param source     The view behind the target, which must not hold the target.
     * @param background Drawn below the source, which may have no background of its own.
     *                   Without it, blurred text would be mostly clear and the sharp text would show.
     */
    public void draw(Canvas canvas, View target, View source, @ColorInt int background) {
        final int width = target.getWidth();
        final int height = target.getHeight();
        if (width <= 0 || height <= 0) return;

        target.getLocationInWindow(targetLocation);
        source.getLocationInWindow(sourceLocation);
        node.setPosition(0, 0, width, height);
        RecordingCanvas recording = node.beginRecording(width, height);
        try {
            recording.drawColor(background);
            recording.translate(sourceLocation[0] - targetLocation[0], sourceLocation[1] - targetLocation[1]);
            source.draw(recording);
        } finally {
            node.endRecording();
        }
        canvas.drawRenderNode(node);
    }

    /** Draws only the region needed for the capsule, with room to sample beyond its edges. */
    public void draw(Canvas canvas, View target, List<View> sources, RectF area, @ColorInt int background) {
        final int left = (int) Math.floor(area.left);
        final int top = (int) Math.floor(area.top);
        final int right = (int) Math.ceil(area.right);
        final int bottom = (int) Math.ceil(area.bottom);

        target.getLocationInWindow(targetLocation);
        node.setPosition(left, top, right, bottom);
        RecordingCanvas recording = node.beginRecording(right - left, bottom - top);
        try {
            recording.drawColor(background);
            for (int index = 0, count = sources.size(); index < count; index++) {
                View source = sources.get(index);
                source.getLocationInWindow(sourceLocation);
                final int x = sourceLocation[0] - targetLocation[0] - left;
                final int y = sourceLocation[1] - targetLocation[1] - top;
                if (x >= right - left || y >= bottom - top
                        || x + source.getWidth() <= 0 || y + source.getHeight() <= 0) {
                    continue;
                }

                final int save = recording.save();
                recording.translate(x, y);
                source.draw(recording);
                recording.restoreToCount(save);
            }
        } finally {
            node.endRecording();
        }
        canvas.drawRenderNode(node);
    }
}
