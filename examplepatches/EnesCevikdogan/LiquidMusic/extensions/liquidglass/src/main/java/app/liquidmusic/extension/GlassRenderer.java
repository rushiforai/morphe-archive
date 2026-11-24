package app.liquidmusic.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.os.Build;
import android.view.View;

/**
 * Renders Liquid Glass behind a {@code BlurView} using Android's {@link RenderNode} and
 * {@link RenderEffect} pipeline (vibrancy, optional blur, and AGSL refraction/rim on API 33+).
 */
final class GlassRenderer {

    private final RenderNode glassNode = new RenderNode("LiquidMusicGlass");
    private final GlassShader glassShader;
    private final int[] offset = new int[2];
    private final Path clipPath = new Path();
    private final RectF boundsRect = new RectF();
    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private boolean isRecording;

    GlassRenderer() {
        this.glassShader = Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                ? new GlassShader()
                : null;
        rimPaint.setStyle(Paint.Style.STROKE);
    }

    boolean draw(View blurView, Canvas canvas, boolean isPillSurface) {
        if (isRecording || !canvas.isHardwareAccelerated()) {
            return false;
        }

        int width = blurView.getWidth();
        int height = blurView.getHeight();
        if (width <= 0 || height <= 0) {
            return false;
        }

        View target = BlurTargetLookup.findBlurTarget(blurView);
        RenderNode targetNode = BlurTargetLookup.getRenderNode(target);
        if (targetNode == null || !targetNode.hasDisplayList()) {
            return false;
        }

        if (!BlurTargetLookup.computeOffset(blurView, target, offset)) {
            return false;
        }

        Context context = blurView.getContext();
        float density = context.getResources().getDisplayMetrics().density;

        int blurDp = LiquidPrefs.getBlurRadiusDp(context);
        int refractionHeightDp = LiquidPrefs.getRefractionHeightDp(context);
        int refractionAmountDp = LiquidPrefs.getRefractionAmountDp(context);
        int saturationPercent = LiquidPrefs.getSaturationPercent(context);
        int highlightPercent = LiquidPrefs.getHighlightPercent(context);
        boolean chromatic = LiquidPrefs.isChromaticAberration(context);

        float cornerRadius = isPillSurface
                ? Math.min(width, height) * 0.5f
                : Math.min(Math.min(width, height) * 0.5f, 24f * density);

        isRecording = true;
        try {
            glassNode.setPosition(0, 0, width, height);
            Canvas rec = glassNode.beginRecording(width, height);
            try {
                rec.translate(-offset[0], -offset[1]);
                rec.drawRenderNode(targetNode);
            } finally {
                glassNode.endRecording();
            }

            RenderEffect effect = buildRenderEffect(
                    width,
                    height,
                    cornerRadius,
                    blurDp * density,
                    refractionHeightDp * density,
                    refractionAmountDp * density,
                    saturationPercent / 100f,
                    highlightPercent / 100f,
                    chromatic
            );
            glassNode.setRenderEffect(effect);

            boundsRect.set(0f, 0f, width, height);
            clipPath.reset();
            clipPath.addRoundRect(boundsRect, cornerRadius, cornerRadius, Path.Direction.CW);

            int save = canvas.save();
            try {
                canvas.clipPath(clipPath);
                canvas.drawRenderNode(glassNode);
            } finally {
                canvas.restoreToCount(save);
            }

            // Android 12 fallback rim highlight (API 33+ draws the specular rim in AGSL).
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU && highlightPercent > 0) {
                drawFallbackRim(canvas, width, height, cornerRadius, density, highlightPercent / 100f);
            }
            return true;
        } catch (Throwable t) {
            return false;
        } finally {
            isRecording = false;
        }
    }

    private RenderEffect buildRenderEffect(
            int width,
            int height,
            float cornerRadiusPx,
            float blurPx,
            float refractionHeightPx,
            float refractionAmountPx,
            float saturation,
            float highlightStrength,
            boolean chromatic
    ) {
        RenderEffect current = null;

        if (Math.abs(saturation - 1.0f) > 0.01f) {
            ColorMatrix matrix = new ColorMatrix();
            matrix.setSaturation(saturation);
            current = RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(matrix));
        }

        if (blurPx > 0.5f) {
            RenderEffect blur = RenderEffect.createBlurEffect(blurPx, blurPx, Shader.TileMode.CLAMP);
            current = (current != null) ? RenderEffect.createChainEffect(blur, current) : blur;
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && glassShader != null) {
            RenderEffect shaderEffect = glassShader.createEffect(
                    width,
                    height,
                    cornerRadiusPx,
                    refractionHeightPx,
                    refractionAmountPx,
                    chromatic,
                    highlightStrength
            );
            current = (current != null) ? RenderEffect.createChainEffect(shaderEffect, current) : shaderEffect;
        }

        return current;
    }

    private void drawFallbackRim(
            Canvas canvas,
            int width,
            int height,
            float cornerRadius,
            float density,
            float strength
    ) {
        int topAlpha = Math.min(255, Math.round(135 * strength));
        int bottomAlpha = Math.min(255, Math.round(55 * strength));
        rimPaint.setStrokeWidth(Math.max(1f, 1.1f * density));
        rimPaint.setShader(new LinearGradient(
                0f, 0f, width * 0.4f, height,
                Color.argb(topAlpha, 255, 255, 255),
                Color.argb(bottomAlpha, 255, 255, 255),
                Shader.TileMode.CLAMP
        ));
        float inset = rimPaint.getStrokeWidth() * 0.5f;
        boundsRect.set(inset, inset, width - inset, height - inset);
        canvas.drawRoundRect(boundsRect, cornerRadius, cornerRadius, rimPaint);
    }
}
