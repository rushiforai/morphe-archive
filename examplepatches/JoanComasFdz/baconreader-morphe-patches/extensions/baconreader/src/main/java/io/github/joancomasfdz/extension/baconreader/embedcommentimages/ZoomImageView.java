// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.embedcommentimages;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.widget.ImageView;

/**
 * ImageView with pinch to zoom, drag to pan and double tap to zoom in/out.
 */
final class ZoomImageView extends ImageView {
    private static final float MAX_ZOOM = 5f;
    private static final float DOUBLE_TAP_ZOOM = 2.5f;

    private final Matrix imageMatrix = new Matrix();
    private final ScaleGestureDetector scaleDetector;
    private final GestureDetector gestureDetector;
    private float zoom = 1f;
    private Runnable onTap;
    private Runnable onLongPress;

    ZoomImageView(Context context) {
        super(context);
        setScaleType(ScaleType.MATRIX);
        scaleDetector = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector detector) {
                zoomBy(detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
                return true;
            }
        });
        gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onDown(MotionEvent e) {
                return true;
            }

            @Override
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float dx, float dy) {
                if (zoom <= 1.01f) return false;
                imageMatrix.postTranslate(-dx, -dy);
                constrain();
                return true;
            }

            @Override
            public boolean onDoubleTap(MotionEvent e) {
                if (zoom > 1.01f) fit();
                else zoomBy(DOUBLE_TAP_ZOOM, e.getX(), e.getY());
                return true;
            }

            @Override
            public boolean onSingleTapConfirmed(MotionEvent e) {
                if (onTap != null) onTap.run();
                return true;
            }

            @Override
            public void onLongPress(MotionEvent e) {
                if (onLongPress != null) onLongPress.run();
            }
        });
    }

    void setOnTap(Runnable onTap) {
        this.onTap = onTap;
    }

    void setOnLongPress(Runnable onLongPress) {
        this.onLongPress = onLongPress;
    }

    @Override
    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        fit();
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        fit();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        scaleDetector.onTouchEvent(event);
        gestureDetector.onTouchEvent(event);
        return true;
    }

    /** Fits the image to the view, centered. */
    private void fit() {
        Drawable drawable = getDrawable();
        int vw = getWidth();
        int vh = getHeight();
        if (drawable == null || vw == 0 || vh == 0) return;
        int dw = drawable.getIntrinsicWidth();
        int dh = drawable.getIntrinsicHeight();
        if (dw <= 0 || dh <= 0) return;
        float scale = Math.min((float) vw / dw, (float) vh / dh);
        imageMatrix.setScale(scale, scale);
        imageMatrix.postTranslate((vw - dw * scale) / 2f, (vh - dh * scale) / 2f);
        zoom = 1f;
        setImageMatrix(imageMatrix);
    }

    private void zoomBy(float factor, float focusX, float focusY) {
        float target = Math.max(1f, Math.min(MAX_ZOOM, zoom * factor));
        float applied = target / zoom;
        zoom = target;
        imageMatrix.postScale(applied, applied, focusX, focusY);
        constrain();
    }

    /** Keeps the image on screen: centered when smaller than the view, edges clamped when larger. */
    private void constrain() {
        Drawable drawable = getDrawable();
        if (drawable == null) return;
        RectF rect = new RectF(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        imageMatrix.mapRect(rect);
        float dx = 0;
        float dy = 0;
        int vw = getWidth();
        int vh = getHeight();
        if (rect.width() <= vw) dx = (vw - rect.width()) / 2f - rect.left;
        else if (rect.left > 0) dx = -rect.left;
        else if (rect.right < vw) dx = vw - rect.right;
        if (rect.height() <= vh) dy = (vh - rect.height()) / 2f - rect.top;
        else if (rect.top > 0) dy = -rect.top;
        else if (rect.bottom < vh) dy = vh - rect.bottom;
        imageMatrix.postTranslate(dx, dy);
        setImageMatrix(imageMatrix);
    }
}
