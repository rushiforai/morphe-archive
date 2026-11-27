package dev.srwi.gintype.extension.multiglide;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
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
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;

import java.lang.ref.WeakReference;

/**
 * Renders an animated center-out shading and autospace flash directly on Gboard's
 * spacebar {@code SoftKeyView} (or its pill background child) using {@link View#getOverlay()}.
 */
final class SpacebarTimerOverlay {

    private static final int FILL_MAX_ALPHA = 56;   // ~22% opacity light shading
    private static final int FLASH_MAX_ALPHA = 165; // ~65% peak flash opacity
    private static final long FADE_OUT_DURATION_MS = 115L;
    private static final long FLASH_DURATION_MS = 240L;

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final IndicatorDrawable drawable = new IndicatorDrawable();

    private WeakReference<View> attachedViewRef = null;
    private ValueAnimator fillAnimator = null;
    private ValueAnimator fadeOutAnimator = null;
    private ValueAnimator flashAnimator = null;

    void startTimer(
            View spacebarView,
            int accentRgb,
            long durationMs
    ) {
        if (spacebarView == null) return;
        runOnMain(() -> {
            if (!attachAndUpdate(spacebarView, accentRgb)) return;
            cancelFillAndFade();
            cancelFlash();
            drawable.flashAlpha = 0f;

            if (durationMs <= 0L) {
                return;
            }

            ValueAnimator anim = ValueAnimator.ofFloat(0f, 1f);
            anim.setDuration(durationMs);
            anim.setInterpolator(new LinearInterpolator());
            anim.addUpdateListener(a -> {
                float p = (float) a.getAnimatedValue();
                drawable.fillProgress = p;
                drawable.fillAlpha = Math.min(1f, 0.30f + p * 4.5f);
                drawable.invalidateSelf();
            });
            anim.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    if (fillAnimator == anim) {
                        fillAnimator = null;
                    }
                }
            });
            fillAnimator = anim;
            anim.start();
        });
    }

    void cancelTimer() {
        runOnMain(() -> {
            if (fillAnimator != null) {
                fillAnimator.cancel();
                fillAnimator = null;
            }
            if (drawable.fillAlpha > 0.01f && fadeOutAnimator == null) {
                startFadeOut();
            }
        });
    }

    void triggerFlash(
            View spacebarView,
            int accentRgb
    ) {
        if (spacebarView == null) return;
        runOnMain(() -> {
            if (!attachAndUpdate(spacebarView, accentRgb)) return;
            startFlash();
        });
    }

    private void startFlash() {
        cancelFillAndFade();
        cancelFlash();
        drawable.fillProgress = 0f;
        drawable.fillAlpha = 0f;

        ValueAnimator anim = ValueAnimator.ofFloat(1f, 0f);
        anim.setDuration(FLASH_DURATION_MS);
        anim.setInterpolator(new DecelerateInterpolator(1.4f));
        anim.addUpdateListener(a -> {
            drawable.flashAlpha = (float) a.getAnimatedValue();
            drawable.invalidateSelf();
        });
        anim.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                if (flashAnimator == anim) {
                    flashAnimator = null;
                }
                drawable.flashAlpha = 0f;
                drawable.invalidateSelf();
            }
        });
        flashAnimator = anim;
        anim.start();
    }

    void clearImmediate() {
        runOnMain(() -> {
            cancelFillAndFade();
            cancelFlash();
            drawable.fillProgress = 0f;
            drawable.fillAlpha = 0f;
            drawable.flashAlpha = 0f;
            drawable.invalidateSelf();
            detach();
        });
    }

    private void startFadeOut() {
        if (fadeOutAnimator != null) {
            fadeOutAnimator.cancel();
            fadeOutAnimator = null;
        }
        float startAlpha = drawable.fillAlpha;
        if (startAlpha <= 0.01f) {
            drawable.fillAlpha = 0f;
            drawable.fillProgress = 0f;
            drawable.invalidateSelf();
            return;
        }
        ValueAnimator anim = ValueAnimator.ofFloat(startAlpha, 0f);
        anim.setDuration(FADE_OUT_DURATION_MS);
        anim.setInterpolator(new DecelerateInterpolator());
        anim.addUpdateListener(a -> {
            drawable.fillAlpha = (float) a.getAnimatedValue();
            drawable.invalidateSelf();
        });
        anim.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                if (fadeOutAnimator == anim) {
                    fadeOutAnimator = null;
                }
                drawable.fillAlpha = 0f;
                drawable.fillProgress = 0f;
                drawable.invalidateSelf();
            }
        });
        fadeOutAnimator = anim;
        anim.start();
    }

    private void cancelFillAndFade() {
        if (fillAnimator != null) {
            fillAnimator.cancel();
            fillAnimator = null;
        }
        if (fadeOutAnimator != null) {
            fadeOutAnimator.cancel();
            fadeOutAnimator = null;
        }
    }

    private void cancelFlash() {
        if (flashAnimator != null) {
            flashAnimator.cancel();
            flashAnimator = null;
        }
    }

    private boolean attachAndUpdate(
            View spacebarView,
            int accentRgb
    ) {
        int viewW = spacebarView.getWidth();
        int viewH = spacebarView.getHeight();
        if (viewW <= 0 || viewH <= 0) {
            return false;
        }

        View prevView = (attachedViewRef != null) ? attachedViewRef.get() : null;
        if (prevView != spacebarView) {
            detach();
            try {
                spacebarView.getOverlay().add(drawable);
                attachedViewRef = new WeakReference<>(spacebarView);
            } catch (Throwable ignored) {
                return false;
            }
        }

        drawable.setBounds(0, 0, viewW, viewH);
        drawable.updateFromTargetView(spacebarView, accentRgb);
        return true;
    }

    private void detach() {
        View prevView = (attachedViewRef != null) ? attachedViewRef.get() : null;
        if (prevView != null) {
            try {
                prevView.getOverlay().remove(drawable);
            } catch (Throwable ignored) {
            }
        }
        attachedViewRef = null;
    }

    private void runOnMain(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            mainHandler.post(r);
        }
    }

    private static final class IndicatorDrawable extends Drawable {

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF pillRect = new RectF();
        private final Path pillPath = new Path();
        private final Rect tempRect = new Rect();

        int accentRgb = 0x80CBC4;
        float fillProgress = 0f;
        float fillAlpha = 0f;
        float flashAlpha = 0f;

        void updateFromTargetView(View targetView, int rgb) {
            accentRgb = rgb & 0x00FFFFFF;
            int w = targetView.getWidth();
            int h = targetView.getHeight();
            float density = targetView.getResources().getDisplayMetrics().density;
            float radius = -1f;
            boolean foundOutline = false;

            Drawable bg = targetView.getBackground();
            if (bg != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                try {
                    Outline outline = new Outline();
                    bg.getOutline(outline);
                    if (outline.getRect(tempRect) && !tempRect.isEmpty()) {
                        pillRect.set(tempRect);
                        radius = outline.getRadius();
                        foundOutline = true;
                    }
                } catch (Throwable ignored) {
                }
            }

            if (!foundOutline) {
                if (bg != null) {
                    pillRect.set(
                            targetView.getPaddingLeft(),
                            targetView.getPaddingTop(),
                            w - targetView.getPaddingRight(),
                            h - targetView.getPaddingBottom());
                } else {
                    float insetX = Math.min(w * 0.02f, 3f * density);
                    float insetY = Math.min(h * 0.14f, 5f * density);
                    pillRect.set(insetX, insetY, w - insetX, h - insetY);
                }
            }

            if (radius < 0f) {
                radius = Math.max(0f, pillRect.height() * 0.5f);
            }
            pillPath.reset();
            if (!pillRect.isEmpty()) {
                pillPath.addRoundRect(pillRect, radius, radius, Path.Direction.CW);
            }
        }

        @Override
        public void draw(Canvas canvas) {
            if (pillRect.isEmpty()) return;
            boolean drawFill = fillAlpha > 0.005f && fillProgress > 0f;
            boolean drawFlash = flashAlpha > 0.005f;
            if (!drawFill && !drawFlash) return;

            int r = (accentRgb >> 16) & 0xFF;
            int g = (accentRgb >> 8) & 0xFF;
            int b = accentRgb & 0xFF;

            int fillMaxAlpha = (accentRgb == 0xFFFFFF) ? FILL_MAX_ALPHA : 44;
            int flashMaxAlpha = (accentRgb == 0xFFFFFF) ? FLASH_MAX_ALPHA : 130;

            int save = canvas.save();
            canvas.clipPath(pillPath);
            if (drawFill) {
                float halfW = (pillRect.width() * 0.5f) * Math.max(0f, Math.min(1f, fillProgress));
                float cx = pillRect.centerX();
                paint.setColor(Color.argb(Math.round(fillMaxAlpha * fillAlpha), r, g, b));
                canvas.drawRect(cx - halfW, pillRect.top, cx + halfW, pillRect.bottom, paint);
            }
            if (drawFlash) {
                paint.setColor(Color.argb(Math.round(flashMaxAlpha * flashAlpha), r, g, b));
                canvas.drawRect(pillRect, paint);
            }
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {}

        @Override
        public void setColorFilter(ColorFilter colorFilter) {}

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
