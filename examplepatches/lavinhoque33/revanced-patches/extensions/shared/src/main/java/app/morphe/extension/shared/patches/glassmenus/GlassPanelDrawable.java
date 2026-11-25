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

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import app.morphe.extension.shared.ui.Dim;

@RequiresApi(Build.VERSION_CODES.S)
final class GlassPanelDrawable extends Drawable implements Drawable.Callback {
    @Nullable private final Drawable stock;
    @Nullable private BlurRegion backdrop;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path shape = new Path();
    private final Path border = new Path();
    private final Rect panel = new Rect();
    private final RectF pathBounds = new RectF();
    private final float[] corners = new float[8];
    private final int rimAlpha;
    private float radius;
    private boolean roundBottom;
    private int renderVersion;
    private int opacity;
    private int alpha = 255;

    GlassPanelDrawable(@Nullable Drawable stock, int background, boolean dark) {
        this.stock = stock;

        float white = dark ? 0.08f : 0.6f;
        fill.setColor(Color.rgb(raised(Color.red(background), white), raised(Color.green(background), white),
                raised(Color.blue(background), white)));
        rim.setColor(dark ? Color.WHITE : Color.BLACK);
        rimAlpha = dark ? 0x30 : 0x18;
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(Dim.dp1);
    }

    private static int raised(int channel, float white) {
        return Math.round(channel + (255 - channel) * white);
    }

    boolean configure(Rect bounds, float radius, boolean roundBottom, int opacity, @Nullable BlurRegion backdrop) {
        boolean geometryChanged = !panel.equals(bounds) || this.radius != radius || this.roundBottom != roundBottom;
        if (geometryChanged) {
            panel.set(bounds);
            this.radius = radius;
            this.roundBottom = roundBottom;
            updatePaths();
        }
        int nextVersion = backdrop == null ? 0 : backdrop.renderVersion();
        boolean outlineChanged = geometryChanged || this.opacity != opacity;
        if (outlineChanged || this.backdrop != backdrop || renderVersion != nextVersion) {
            this.opacity = opacity;
            this.backdrop = backdrop;
            renderVersion = nextVersion;
            updateAlpha();
        }
        return outlineChanged;
    }

    private void updatePaths() {
        pathBounds.set(panel);
        shape.reset();
        setCorners(radius);
        shape.addRoundRect(pathBounds, corners, Path.Direction.CW);

        float halfStroke = rim.getStrokeWidth() / 2f;
        pathBounds.inset(halfStroke, halfStroke);
        border.reset();
        if (!pathBounds.isEmpty()) {
            setCorners(Math.max(0, radius - halfStroke));
            border.addRoundRect(pathBounds, corners, Path.Direction.CW);
        }
    }

    private void setCorners(float radius) {
        corners[0] = corners[1] = corners[2] = corners[3] = radius;
        corners[4] = corners[5] = corners[6] = corners[7] = roundBottom ? radius : 0;
    }

    @Override
    public void draw(Canvas canvas) {
        if (panel.isEmpty() || !canvas.isHardwareAccelerated()) {
            if (stock != null) stock.draw(canvas);
            return;
        }
        if (stock != null && !getBounds().equals(panel)) {
            int save = canvas.save();
            canvas.clipOutPath(shape);
            stock.draw(canvas);
            canvas.restoreToCount(save);
        }
        if (backdrop != null) {
            int save = canvas.save();
            canvas.clipPath(shape);
            backdrop.draw(canvas);
            canvas.restoreToCount(save);
        }
        canvas.drawPath(shape, fill);
        canvas.drawPath(border, rim);
    }

    @Override
    public void getOutline(Outline outline) {
        if (panel.isEmpty()) {
            if (stock != null) stock.getOutline(outline);
            return;
        }
        if (radius == 0 || roundBottom) {
            outline.setRoundRect(panel, radius);
        } else {
            outline.setPath(shape);
        }
        outline.setAlpha(fill.getAlpha() / 255f);
    }

    @Override
    protected void onBoundsChange(Rect bounds) {
        if (stock != null) stock.setBounds(bounds);
    }

    @Override
    public boolean getPadding(Rect padding) {
        return stock != null && stock.getPadding(padding);
    }

    @Override
    public int getMinimumWidth() {
        return stock == null ? 0 : stock.getMinimumWidth();
    }

    @Override
    public int getMinimumHeight() {
        return stock == null ? 0 : stock.getMinimumHeight();
    }

    @Override
    public boolean isStateful() {
        return stock != null && stock.isStateful();
    }

    @Override
    protected boolean onStateChange(int[] state) {
        return stock != null && stock.setState(state);
    }

    @Override
    public void setAlpha(int alpha) {
        if (this.alpha == alpha) return;

        this.alpha = alpha;
        updateAlpha();
    }

    @Override
    public int getAlpha() {
        return alpha;
    }

    private void updateAlpha() {
        fill.setAlpha(alpha * opacity / 100);
        rim.setAlpha(alpha * rimAlpha / 255);
        invalidateSelf();
    }

    @Override
    public void setColorFilter(@Nullable ColorFilter filter) {
        fill.setColorFilter(filter);
        rim.setColorFilter(filter);
        invalidateSelf();
    }

    @Override
    @Deprecated
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public void invalidateDrawable(Drawable who) {
        invalidateSelf();
    }

    @Override
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        scheduleSelf(what, when);
    }

    @Override
    public void unscheduleDrawable(Drawable who, Runnable what) {
        unscheduleSelf(what);
    }
}
