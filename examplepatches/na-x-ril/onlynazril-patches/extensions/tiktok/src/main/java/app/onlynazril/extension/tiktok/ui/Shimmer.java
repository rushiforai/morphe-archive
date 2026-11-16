package app.onlynazril.extension.tiktok.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.animation.LinearInterpolator;

/**
 * A one-shot shimmer across a row, used to point at the row a search result named.
 *
 * The drawable is set as the row's foreground, so it never touches the row's own background and
 * disappears completely when the sweep ends. One band crosses the row once, which is enough to
 * catch the eye without competing with the controls underneath.
 */
public final class Shimmer {
    private static final long DURATION_MS = 900L;
    /** Band width as a fraction of the row width. */
    private static final float BAND = 0.45f;

    private Shimmer() {}

    public static void play(View view) {
        if (view == null || view.getWidth() == 0) return;
        try {
            final Band band = new Band();
            view.setForeground(band);
            ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(DURATION_MS);
            animator.setInterpolator(new LinearInterpolator());
            animator.addUpdateListener(animation -> {
                band.progress = (float) animation.getAnimatedValue();
                view.invalidate();
            });
            animator.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    view.setForeground(null);
                }
            });
            animator.start();
        } catch (Throwable ignored) {
            // A missing effect is not a reason to fail the screen that asked for it.
            view.setForeground(null);
        }
    }

    private static final class Band extends Drawable {
        float progress;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        @Override
        public void draw(Canvas canvas) {
            int width = getBounds().width();
            int height = getBounds().height();
            if (width == 0 || height == 0) return;
            float band = width * BAND;
            float left = -band + progress * (width + band);
            paint.setShader(new LinearGradient(
                    left,
                    0f,
                    left + band,
                    0f,
                    new int[] {0x00FFFFFF, 0x33FFFFFF, 0x00FFFFFF},
                    new float[] {0f, 0.5f, 1f},
                    Shader.TileMode.CLAMP));
            canvas.drawRect(0, 0, width, height, paint);
            paint.setShader(null);
        }

        @Override
        public void setAlpha(int alpha) {}

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {}

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
