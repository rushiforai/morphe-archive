package dev.materialtidal.extension.tidal.playlist;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RecordingCanvas;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ImageView;

import java.lang.ref.WeakReference;

import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.MultiTierProgressiveBlurRenderer;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Draws the downward-fading Material 3 Expressive scrim over the hero playlist cover,
 * seamlessly melting the artwork into the Monet/adaptive {@code surfaceBase} canvas while
 * preserving top status-bar/toolbar legibility and observing async Coil drawable changes.
 */
public final class ExpressivePlaylistFadeOverlay extends View {

    public interface OnArtworkDrawableChangedListener {
        void onDrawableChanged(Drawable drawable);
    }

    private static final float[] TOP_SCRIM_POSITIONS = new float[]{0f, 0.45f, 0.80f, 1.0f};
    private static final int[] TOP_SCRIM_COLORS = new int[]{
            0x7A000000,
            0x3D000000,
            0x10000000,
            0x00000000
    };

    private static final float[] BOTTOM_FADE_POSITIONS = new float[]{
            0.00f, 0.16f, 0.34f, 0.52f, 0.68f, 0.83f, 0.94f, 1.00f
    };

    private final float density;
    private final Paint bottomSolidPaint = new Paint();
    private final Paint topScrimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fadePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint collapseVeilPaint = new Paint();

    private WeakReference<ImageView> artworkRef;
    private Drawable lastObservedDrawable;
    private boolean wasArtworkAnimating;
    private OnArtworkDrawableChangedListener drawableListener;
    private ViewTreeObserver.OnPreDrawListener preDrawListener;
    private boolean preDrawAttached;

    private int heroCoverHeightPx;
    private float statusBarInsetPx;
    private int surfaceBaseColor;
    private int atmosphericTintColor;
    private float collapseFraction;
    private boolean heroFadeEnabled = true;

    private int cachedW = -1;
    private int cachedHeroH = -1;
    private float cachedStatusInset = -1f;
    private int cachedSurfaceBase;
    private int cachedAtmosphericTint;
    private boolean cachedBlurEnabled;
    private boolean cachedLightMode;
    private LinearGradient topScrimShader;
    private LinearGradient bottomFadeShader;

    private final MultiTierProgressiveBlurRenderer heroBlurRenderer =
            new MultiTierProgressiveBlurRenderer("heroBlur");
    private boolean hasHeroBlur;
    private boolean heroBlurDirty = true;
    private Drawable cachedBlurDrawable;
    private int cachedBlurW = -1;
    private int cachedBlurH = -1;

    public ExpressivePlaylistFadeOverlay(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        setWillNotDraw(false);
        setForceDarkAllowed(false);
        this.surfaceBaseColor = MaterialYouColorEngine.getSurfaceBase();
        this.atmosphericTintColor = this.surfaceBaseColor;
    }

    public void attachArtworkObserver(ImageView artwork, OnArtworkDrawableChangedListener listener) {
        detachPreDrawObserver();
        this.artworkRef = artwork != null ? new WeakReference<>(artwork) : null;
        this.drawableListener = listener;
        this.lastObservedDrawable = null;
        if (artwork != null && isAttachedToWindow()) {
            attachPreDrawObserver();
        }
        checkArtworkDrawableChanged();
    }

    public void setHeroCoverHeightPx(int heroCoverHeightPx) {
        if (this.heroCoverHeightPx != heroCoverHeightPx) {
            this.heroCoverHeightPx = Math.max(0, heroCoverHeightPx);
            invalidateShaders();
            invalidate();
        }
    }

    public void setStatusBarInsetPx(float statusBarInsetPx) {
        float clamped = Math.max(0f, statusBarInsetPx);
        if (Math.abs(this.statusBarInsetPx - clamped) > 0.5f) {
            this.statusBarInsetPx = clamped;
            invalidateShaders();
            invalidate();
        }
    }

    public void setColors(int surfaceBase, int atmosphericTint) {
        if (this.surfaceBaseColor != surfaceBase || this.atmosphericTintColor != atmosphericTint) {
            this.surfaceBaseColor = surfaceBase;
            this.atmosphericTintColor = atmosphericTint;
            invalidateShaders();
            invalidate();
        }
    }

    public void setCollapseFraction(float fraction) {
        float clamped = Math.max(0f, Math.min(1f, fraction));
        if (Math.abs(this.collapseFraction - clamped) > 0.005f) {
            this.collapseFraction = clamped;
            invalidate();
        }
    }

    public void setHeroFadeEnabled(boolean enabled) {
        if (this.heroFadeEnabled != enabled) {
            this.heroFadeEnabled = enabled;
            invalidateShaders();
            invalidate();
        }
    }

    public void checkArtworkDrawableChanged() {
        WeakReference<ImageView> ref = artworkRef;
        ImageView iv = ref != null ? ref.get() : null;
        if (iv == null) {
            return;
        }
        Drawable current = iv.getDrawable();
        boolean animating = current instanceof Animatable && ((Animatable) current).isRunning();
        if (current != lastObservedDrawable) {
            lastObservedDrawable = current;
            wasArtworkAnimating = animating;
            heroBlurDirty = true;
            OnArtworkDrawableChangedListener listener = drawableListener;
            if (listener != null) {
                listener.onDrawableChanged(current);
            }
            invalidate();
        } else if (animating) {
            wasArtworkAnimating = true;
            heroBlurDirty = true;
            invalidate();
        } else if (wasArtworkAnimating) {
            wasArtworkAnimating = false;
            heroBlurDirty = true;
            OnArtworkDrawableChangedListener listener = drawableListener;
            if (listener != null) {
                listener.onDrawableChanged(current);
            }
            invalidate();
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        attachPreDrawObserver();
        checkArtworkDrawableChanged();
    }

    @Override
    protected void onDetachedFromWindow() {
        detachPreDrawObserver();
        heroBlurRenderer.release();
        cachedBlurDrawable = null;
        hasHeroBlur = false;
        super.onDetachedFromWindow();
    }

    private void attachPreDrawObserver() {
        if (preDrawAttached) {
            return;
        }
        ViewTreeObserver vto = getViewTreeObserver();
        if (vto != null && vto.isAlive()) {
            preDrawListener = () -> {
                try {
                    if (!isAttachedToWindow()) {
                        detachPreDrawObserver();
                        return true;
                    }
                    checkArtworkDrawableChanged();
                } catch (Throwable ignored) {
                }
                return true;
            };
            vto.addOnPreDrawListener(preDrawListener);
            preDrawAttached = true;
        }
    }

    private void detachPreDrawObserver() {
        if (!preDrawAttached || preDrawListener == null) {
            preDrawAttached = false;
            return;
        }
        try {
            ViewTreeObserver vto = getViewTreeObserver();
            if (vto != null && vto.isAlive()) {
                vto.removeOnPreDrawListener(preDrawListener);
            }
        } catch (Throwable ignored) {
        }
        preDrawAttached = false;
        preDrawListener = null;
    }

    private void invalidateShaders() {
        cachedW = -1;
        topScrimShader = null;
        bottomFadeShader = null;
        heroBlurDirty = true;
    }

    private void ensureHeroBlurCaptured(int width, int effectiveHeroH) {
        if (ExpressiveBlurKit.CAPTURING_BACKDROP) {
            hasHeroBlur = false;
            return;
        }
        boolean blurActive = heroFadeEnabled
                && MaterialYouConfig.isExpressiveBlurEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack();
        if (!blurActive) {
            hasHeroBlur = false;
            return;
        }
        ImageView iv = artworkRef != null ? artworkRef.get() : null;
        Drawable drawable = iv != null ? iv.getDrawable() : null;
        if (iv == null || drawable == null) {
            hasHeroBlur = false;
            return;
        }
        if (iv.getWidth() <= 0 || iv.getHeight() <= 0) {
            heroBlurDirty = true;
            hasHeroBlur = false;
            postInvalidateOnAnimation();
            return;
        }
        boolean animating = drawable instanceof Animatable && ((Animatable) drawable).isRunning();
        if (!animating
                && !heroBlurDirty
                && cachedBlurW == width
                && cachedBlurH == effectiveHeroH
                && cachedBlurDrawable == drawable
                && hasHeroBlur) {
            return;
        }
        cachedBlurW = width;
        cachedBlurH = effectiveHeroH;
        cachedBlurDrawable = drawable;
        heroBlurDirty = animating;
        if (animating) {
            wasArtworkAnimating = true;
            postInvalidateOnAnimation();
        }

        heroBlurRenderer.configure(
                MultiTierProgressiveBlurRenderer.DIR_BOTTOM_UP,
                0.36f,
                new float[]{8f, 20f, 38f},
                new float[]{0.00f, 0.34f, 0.68f},
                surfaceBaseColor,
                1.0f,
                0f);

        float bleedPx = 12f * density;
        RecordingCanvas rc = heroBlurRenderer.beginBackdropCapture(
                width, effectiveHeroH, bleedPx, 0.5f, surfaceBaseColor);
        if (rc != null) {
            boolean capturedOk = false;
            int rcSave = rc.save();
            try {
                rc.clipRect(-bleedPx, -bleedPx, width + bleedPx, effectiveHeroH + bleedPx);
                float sx = width / (float) iv.getWidth();
                float sy = effectiveHeroH / (float) iv.getHeight();
                if (Math.abs(sx - 1f) > 0.01f || Math.abs(sy - 1f) > 0.01f) {
                    rc.scale(sx, sy);
                }
                iv.draw(rc);
                capturedOk = true;
            } catch (Throwable ignored) {
                capturedOk = false;
            } finally {
                try {
                    rc.restoreToCount(rcSave);
                } catch (Throwable ignored) {
                }
                heroBlurRenderer.endBackdropCapture(density);
            }
            hasHeroBlur = capturedOk;
        }
    }

    private void ensureShaders(int width, int height) {
        int effectiveHeroH = Math.min(height, Math.max(1, heroCoverHeightPx > 0 ? heroCoverHeightPx : height));
        boolean lightMode = MaterialYouColorEngine.isLightMode(getContext());
        boolean blurActive = MaterialYouConfig.isExpressiveBlurEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack();
        if (cachedW == width
                && cachedHeroH == effectiveHeroH
                && Math.abs(cachedStatusInset - statusBarInsetPx) <= 0.5f
                && cachedSurfaceBase == surfaceBaseColor
                && cachedAtmosphericTint == atmosphericTintColor
                && cachedBlurEnabled == blurActive
                && cachedLightMode == lightMode
                && bottomFadeShader != null) {
            return;
        }

        cachedW = width;
        cachedHeroH = effectiveHeroH;
        cachedStatusInset = statusBarInsetPx;
        cachedSurfaceBase = surfaceBaseColor;
        cachedAtmosphericTint = atmosphericTintColor;
        cachedBlurEnabled = blurActive;
        cachedLightMode = lightMode;

        float topScrimEnd = Math.min(effectiveHeroH, statusBarInsetPx + 78f * density);
        int[] topColors = lightMode
                ? new int[]{
                        MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xB8),
                        MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0x68),
                        MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0x22),
                        MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0x00)
                }
                : TOP_SCRIM_COLORS;
        topScrimShader = new LinearGradient(
                0f, 0f,
                0f, Math.max(1f, topScrimEnd),
                topColors,
                TOP_SCRIM_POSITIONS,
                Shader.TileMode.CLAMP
        );
        topScrimPaint.setShader(topScrimShader);

        if (heroFadeEnabled) {
            float fadeStart = effectiveHeroH * 0.34f;
            float fadeEnd = (float) effectiveHeroH;
            int veil = MaterialYouColorEngine.blendRgb(surfaceBaseColor, atmosphericTintColor, 0.48f);
            int[] colors = blurActive
                    ? new int[]{
                            MaterialYouColorEngine.withAlpha(veil, 0x00),
                            MaterialYouColorEngine.withAlpha(veil, 0x10),
                            MaterialYouColorEngine.withAlpha(veil, 0x32),
                            MaterialYouColorEngine.withAlpha(veil, 0x62),
                            MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.blendRgb(veil, surfaceBaseColor, 0.45f), 0x9C),
                            MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.blendRgb(veil, surfaceBaseColor, 0.78f), 0xD2),
                            MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xF6),
                            MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xFF)
                    }
                    : new int[]{
                            MaterialYouColorEngine.withAlpha(veil, 0x00),
                            MaterialYouColorEngine.withAlpha(veil, 0x1A),
                            MaterialYouColorEngine.withAlpha(veil, 0x4A),
                            MaterialYouColorEngine.withAlpha(veil, 0x86),
                            MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.blendRgb(veil, surfaceBaseColor, 0.45f), 0xBC),
                            MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.blendRgb(veil, surfaceBaseColor, 0.78f), 0xE5),
                            MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xFA),
                            MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xFF)
                    };
            bottomFadeShader = new LinearGradient(
                    0f, fadeStart,
                    0f, Math.max(fadeStart + 1f, fadeEnd),
                    colors,
                    BOTTOM_FADE_POSITIONS,
                    Shader.TileMode.CLAMP
            );
        } else {
            // Subtle ambient top-to-bottom surface wash behind centered squircle artwork
            float fadeEnd = Math.min(height, Math.max(1f, effectiveHeroH));
            int topGlow = MaterialYouColorEngine.blendRgb(surfaceBaseColor, atmosphericTintColor, 0.52f);
            bottomFadeShader = new LinearGradient(
                    0f, 0f,
                    0f, fadeEnd,
                    new int[]{
                            MaterialYouColorEngine.withAlpha(topGlow, 0xCC),
                            MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.blendRgb(topGlow, surfaceBaseColor, 0.55f), 0xEE),
                            MaterialYouColorEngine.withAlpha(surfaceBaseColor, 0xFF)
                    },
                    new float[]{0f, 0.58f, 1f},
                    Shader.TileMode.CLAMP
            );
        }
        fadePaint.setShader(bottomFadeShader);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        try {
            if (canvas == null) {
                return;
            }
            boolean capturing = ExpressiveBlurKit.CAPTURING_BACKDROP;
            if (!capturing) {
                checkArtworkDrawableChanged();
            }
            int w = getWidth();
            int h = getHeight();
            if (w <= 0 || h <= 0) {
                return;
            }
            ensureShaders(w, h);

            int effectiveHeroH = Math.min(h, Math.max(1, heroCoverHeightPx > 0 ? heroCoverHeightPx : h));

            if (heroFadeEnabled) {
                // 1. Solid surfaceBase region below hero artwork (2dp overlap eliminates subpixel seam)
                float solidTop = Math.max(0f, effectiveHeroH - 2f * density);
                if (solidTop < h) {
                    bottomSolidPaint.setColor(surfaceBaseColor);
                    canvas.drawRect(0f, solidTop, w, h, bottomSolidPaint);
                }

                // 2. Downward multi-tier progressive blur of the hero artwork below 36%
                if (!capturing) {
                    ensureHeroBlurCaptured(w, effectiveHeroH);
                    if (hasHeroBlur && heroBlurRenderer.canUseHardwareBlur(canvas)) {
                        heroBlurRenderer.draw(canvas, w, effectiveHeroH, 12f * density);
                    }
                }

                // 3. Signature multi-stop downward cover fade
                float fadeStart = effectiveHeroH * 0.34f;
                canvas.drawRect(0f, fadeStart, w, effectiveHeroH, fadePaint);

                // 4. Top status-bar / toolbar legibility scrim
                float topScrimEnd = Math.min(effectiveHeroH, statusBarInsetPx + 78f * density);
                canvas.drawRect(0f, 0f, w, topScrimEnd, topScrimPaint);

                // 5. Scroll-linked collapse veil so header glides cleanly behind toolbar
                if (collapseFraction > 0.01f) {
                    int veilAlpha = Math.round(Math.min(1f, collapseFraction * 1.1f) * 210f);
                    collapseVeilPaint.setColor(MaterialYouColorEngine.withAlpha(surfaceBaseColor, veilAlpha));
                    canvas.drawRect(0f, 0f, w, effectiveHeroH, collapseVeilPaint);
                }
            } else {
                // Centered squircle mode: ambient gradient at top + solid surfaceBase below
                if (effectiveHeroH < h) {
                    bottomSolidPaint.setColor(surfaceBaseColor);
                    canvas.drawRect(0f, Math.max(0f, effectiveHeroH - 2f * density), w, h, bottomSolidPaint);
                }
                canvas.drawRect(0f, 0f, w, effectiveHeroH, fadePaint);
            }
        } catch (Throwable ignored) {
        }
    }
}
