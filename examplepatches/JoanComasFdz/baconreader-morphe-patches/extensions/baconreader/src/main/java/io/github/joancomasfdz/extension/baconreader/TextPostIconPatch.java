// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import android.animation.ValueAnimator;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

import static app.morphe.extension.shared.StringRef.str;

/**
 * <p>
 * Text posts in the list have a button that expands the post's text under the title. The app
 * draws it as a triangle in a circle, which looks like a video that did not load. This shows a
 * page with text lines instead, with a chevron next to it that flips when the text is open.
 */
@SuppressWarnings("unused")
public final class TextPostIconPatch {
    private static final int ANIMATION_MS = 200;

    private TextPostIconPatch() {
    }

    /** Injected in the LinkHolder / LinkCardHolder constructors, right after the button is found. */
    public static void install(ImageView button) {
        if (button == null) return;
        try {
            Drawable original = button.getDrawable();
            float density = button.getResources().getDisplayMetrics().density;
            int size = original != null && original.getIntrinsicWidth() > 0
                    ? Math.max(original.getIntrinsicWidth(), original.getIntrinsicHeight())
                    : Math.round(24 * density);
            button.setImageDrawable(new PageDrawable(iconColor(button), size, density));
            button.clearAnimation();
            button.setRotation(0);
            button.setContentDescription(str("revanced_text_post_icon_content_description"));
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "Could not replace the text post icon", t);
        }
    }

    /**
     * Injected at the start of rotateSelftextArrow(expanded, duration). Returns true when the
     * icon was handled here (the app's rotation must then be skipped).
     */
    public static boolean setExpanded(ImageView button, boolean expanded, int duration) {
        if (button == null || !(button.getDrawable() instanceof PageDrawable)) return false;
        button.clearAnimation();
        button.setRotation(0);
        ((PageDrawable) button.getDrawable()).setExpanded(expanded, duration > 0);
        return true;
    }

    /** The color of the app's secondary icons and text in the current theme. */
    private static int iconColor(ImageView view) {
        TypedArray array = view.getContext().obtainStyledAttributes(new int[]{android.R.attr.textColorSecondary});
        try {
            return array.getColor(0, 0xFF888888);
        } finally {
            array.recycle();
        }
    }

    /** A page with three text lines, and a chevron to its right: down when closed, up when open. */
    static final class PageDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF page = new RectF();
        private final Path path = new Path();
        private final int size;
        /** 0 = closed (chevron down), 1 = open (chevron up). */
        private float progress;
        private ValueAnimator animator;

        PageDrawable(int color, int size, float density) {
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(Math.max(1.5f * density, size / 16f));
        }

        void setExpanded(boolean expanded, boolean animate) {
            float target = expanded ? 1f : 0f;
            if (animator != null) animator.cancel();
            if (!animate || progress == target) {
                progress = target;
                invalidateSelf();
                return;
            }
            animator = ValueAnimator.ofFloat(progress, target);
            animator.setDuration(ANIMATION_MS);
            animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                @Override
                public void onAnimationUpdate(ValueAnimator animation) {
                    progress = (Float) animation.getAnimatedValue();
                    invalidateSelf();
                }
            });
            animator.start();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float s = Math.min(b.width(), b.height());
            float left = b.exactCenterX() - s / 2f;
            float top = b.exactCenterY() - s / 2f;

            // Page on the left, vertically centered.
            float pageWidth = s * 0.42f;
            float pageHeight = s * 0.56f;
            float pageLeft = left + s * 0.06f;
            float pageTop = top + (s - pageHeight) / 2f;
            page.set(pageLeft, pageTop, pageLeft + pageWidth, pageTop + pageHeight);
            float corner = s * 0.06f;
            canvas.drawRoundRect(page, corner, corner, paint);

            // Text lines, the last one shorter.
            float lineLeft = pageLeft + pageWidth * 0.22f;
            float lineRight = pageLeft + pageWidth * 0.78f;
            for (int i = 0; i < 3; i++) {
                float y = pageTop + pageHeight * (0.3f + 0.2f * i);
                float right = i == 2 ? lineLeft + (lineRight - lineLeft) * 0.6f : lineRight;
                canvas.drawLine(lineLeft, y, right, y, paint);
            }

            // Chevron on the right, with a gap after the page: tip down when closed, up when open.
            float cx = left + s * 0.8f;
            float cy = b.exactCenterY();
            float half = s * 0.12f;
            float depth = s * 0.06f * (1f - 2f * progress);
            path.reset();
            path.moveTo(cx - half, cy - depth);
            path.lineTo(cx, cy + depth);
            path.lineTo(cx + half, cy - depth);
            canvas.drawPath(path, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
