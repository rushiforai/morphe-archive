package dev.materialtidal.extension.tidal.gestures;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;

/**
 * Draws a Material 3 Expressive pill-shaped reveal behind a horizontally swiped track row,
 * using Android 12+ dynamic Monet system colors in both Light and Dark Mode.
 */
final class MaterialExpressiveSwipeRenderer {

    private static final int FALLBACK_NEUTRAL_BG = 0xFF2B2930;
    private static final int FALLBACK_NEUTRAL_FG = 0xFFE6E0E9;
    private static final int FALLBACK_ACCENT1_BG = 0xFF4F378B;
    private static final int FALLBACK_ACCENT1_FG = 0xFFEADDFF;
    private static final int FALLBACK_ACCENT2_BG = 0xFF4A4458;
    private static final int FALLBACK_ACCENT2_FG = 0xFFE8DEF8;
    private static final int FALLBACK_ACCENT3_BG = 0xFF633B48;
    private static final int FALLBACK_ACCENT3_FG = 0xFFFFD8E4;
    private static final int ERROR_CONTAINER_BG = 0xFF93000A;
    private static final int ERROR_CONTAINER_FG = 0xFFFFDAD6;

    private static final int LIGHT_FALLBACK_NEUTRAL_BG = 0xFFEAEAF0;
    private static final int LIGHT_FALLBACK_NEUTRAL_FG = 0xFF2B2C32;
    private static final int LIGHT_FALLBACK_ACCENT1_BG = 0xFFEADDFF;
    private static final int LIGHT_FALLBACK_ACCENT1_FG = 0xFF21005D;
    private static final int LIGHT_FALLBACK_ACCENT2_BG = 0xFFE8DEF8;
    private static final int LIGHT_FALLBACK_ACCENT2_FG = 0xFF1D192B;
    private static final int LIGHT_FALLBACK_ACCENT3_BG = 0xFFFFD8E4;
    private static final int LIGHT_FALLBACK_ACCENT3_FG = 0xFF31111D;
    private static final int LIGHT_ERROR_CONTAINER_BG = 0xFFFFDAD6;
    private static final int LIGHT_ERROR_CONTAINER_FG = 0xFFBA1A1A;

    private final Paint bgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint iconFillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint iconStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF pillRect = new RectF();
    private final Path iconPath = new Path();

    private boolean iconsLoaded;
    private Drawable iconAddToQueue;
    private Drawable iconPlayNext;
    private Drawable iconFavoriteFilled;
    private Drawable iconFavoriteOutline;
    private Drawable iconPlaylists;

    MaterialExpressiveSwipeRenderer() {
        bgPaint.setStyle(Paint.Style.FILL);
        iconFillPaint.setStyle(Paint.Style.FILL);
        iconStrokePaint.setStyle(Paint.Style.STROKE);
        iconStrokePaint.setStrokeCap(Paint.Cap.ROUND);
        iconStrokePaint.setStrokeJoin(Paint.Join.ROUND);
    }

    void drawBehindRow(
            Canvas canvas,
            View child,
            float dX,
            float thresholdPx,
            int action,
            boolean isFavorite,
            float pulseBoost
    ) {
        if (Math.abs(dX) < 1f || action == TrackSwipeConfig.ACTION_NONE) {
            return;
        }

        Context ctx = child.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        float progress = Math.min(1f, Math.abs(dX) / Math.max(1f, thresholdPx));
        boolean activated = Math.abs(dX) >= thresholdPx;

        boolean lightMode = MaterialYouColorEngine.isLightMode(ctx);
        int neutralBg = lightMode
                ? resolveColor(ctx, android.R.color.system_neutral1_100, LIGHT_FALLBACK_NEUTRAL_BG)
                : resolveColor(ctx, android.R.color.system_neutral1_800, FALLBACK_NEUTRAL_BG);
        int neutralFg = lightMode
                ? resolveColor(ctx, android.R.color.system_neutral1_800, LIGHT_FALLBACK_NEUTRAL_FG)
                : resolveColor(ctx, android.R.color.system_neutral1_200, FALLBACK_NEUTRAL_FG);

        int activeBg;
        int activeFg;
        switch (action) {
            case TrackSwipeConfig.ACTION_TOGGLE_FAVORITE:
                if (isFavorite) {
                    activeBg = lightMode ? LIGHT_ERROR_CONTAINER_BG : ERROR_CONTAINER_BG;
                    activeFg = lightMode ? LIGHT_ERROR_CONTAINER_FG : ERROR_CONTAINER_FG;
                } else if (lightMode) {
                    activeBg = resolveColor(ctx, android.R.color.system_accent3_100, LIGHT_FALLBACK_ACCENT3_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent3_900, LIGHT_FALLBACK_ACCENT3_FG);
                } else {
                    activeBg = resolveColor(ctx, android.R.color.system_accent3_800, FALLBACK_ACCENT3_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent3_100, FALLBACK_ACCENT3_FG);
                }
                break;
            case TrackSwipeConfig.ACTION_ADD_TO_PLAYLIST:
                if (lightMode) {
                    activeBg = resolveColor(ctx, android.R.color.system_accent2_100, LIGHT_FALLBACK_ACCENT2_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent2_900, LIGHT_FALLBACK_ACCENT2_FG);
                } else {
                    activeBg = resolveColor(ctx, android.R.color.system_accent2_800, FALLBACK_ACCENT2_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent2_100, FALLBACK_ACCENT2_FG);
                }
                break;
            case TrackSwipeConfig.ACTION_ADD_TO_QUEUE:
            case TrackSwipeConfig.ACTION_PLAY_NEXT:
            default:
                if (lightMode) {
                    activeBg = resolveColor(ctx, android.R.color.system_accent1_100, LIGHT_FALLBACK_ACCENT1_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent1_900, LIGHT_FALLBACK_ACCENT1_FG);
                } else {
                    activeBg = resolveColor(ctx, android.R.color.system_accent1_800, FALLBACK_ACCENT1_BG);
                    activeFg = resolveColor(ctx, android.R.color.system_accent1_100, FALLBACK_ACCENT1_FG);
                }
                break;
        }

        float colorFraction = activated ? 1f : Math.min(1f, progress * 0.55f);
        int bgColor = blendArgb(neutralBg, activeBg, colorFraction);
        int fgColor = blendArgb(neutralFg, activeFg, colorFraction);

        float vInset = 4f * density;
        float hMargin = 8f * density;
        float ty = child.getTranslationY();
        float top = child.getTop() + ty + vInset;
        float bottom = child.getBottom() + ty - vInset;
        if (bottom <= top) {
            return;
        }

        float left;
        float right;
        if (dX > 0f) {
            left = child.getLeft() + hMargin;
            right = child.getLeft() + dX - (4f * density);
        } else {
            left = child.getRight() + dX + (4f * density);
            right = child.getRight() - hMargin;
        }

        if (right - left <= 8f * density) {
            return;
        }

        float cornerRadius = lerp(14f * density, 26f * density, progress);
        cornerRadius = Math.min(cornerRadius, (bottom - top) * 0.5f);

        pillRect.set(left, top, right, bottom);
        bgPaint.setColor(bgColor);
        canvas.drawRoundRect(pillRect, cornerRadius, cornerRadius, bgPaint);

        // Compute icon anchor and expressive scale.
        float pillWidth = right - left;
        float iconAnchorOffset = Math.min(28f * density, pillWidth * 0.5f);
        float iconCx = (dX > 0f) ? (left + iconAnchorOffset) : (right - iconAnchorOffset);
        float iconCy = (top + bottom) * 0.5f;

        float iconAlphaFraction = Math.min(1f, Math.max(0f, (progress - 0.12f) / 0.88f));
        int alpha = Math.round(70 + 185 * iconAlphaFraction);
        int tintedFg = (fgColor & 0x00FFFFFF) | (alpha << 24);
        iconFillPaint.setColor(tintedFg);
        iconStrokePaint.setColor(tintedFg);
        iconStrokePaint.setStrokeWidth(2.1f * density);

        float baseScale = lerp(0.72f, 1.0f, progress);
        float scale = baseScale + pulseBoost * 0.16f;
        float unit = 12f * density;

        canvas.save();
        canvas.clipRect(pillRect);
        canvas.translate(iconCx, iconCy);
        canvas.scale(scale, scale);

        ensureIconsLoaded(ctx);
        drawActionIcon(canvas, action, isFavorite, unit, tintedFg);

        canvas.restore();
    }

    private void ensureIconsLoaded(Context ctx) {
        if (iconsLoaded) {
            return;
        }
        iconsLoaded = true;
        iconAddToQueue = loadTidalIcon(ctx, "ic_add_to_queue");
        iconPlayNext = loadTidalIcon(ctx, "ic_play_next");
        iconFavoriteFilled = loadTidalIcon(ctx, "ic_favorite_filled");
        iconFavoriteOutline = loadTidalIcon(ctx, "ic_favorite");
        iconPlaylists = loadTidalIcon(ctx, "ic_playlists");
    }

    private static Drawable loadTidalIcon(Context ctx, String name) {
        try {
            int resId = ctx.getResources().getIdentifier(name, "drawable", ctx.getPackageName());
            if (resId == 0) {
                return null;
            }
            Drawable d = ctx.getDrawable(resId);
            return d != null ? d.mutate() : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    @SuppressWarnings("deprecation")
    private static boolean drawTidalIcon(Canvas canvas, Drawable icon, float sizePx, int color) {
        if (icon == null) {
            return false;
        }
        int iw = icon.getIntrinsicWidth();
        int ih = icon.getIntrinsicHeight();
        float w = sizePx;
        float h = sizePx;
        if (iw > 0 && ih > 0 && iw != ih) {
            if (iw > ih) {
                h = sizePx * (ih / (float) iw);
            } else {
                w = sizePx * (iw / (float) ih);
            }
        }
        int left = Math.round(-w * 0.5f);
        int top = Math.round(-h * 0.5f);
        int right = Math.round(w * 0.5f);
        int bottom = Math.round(h * 0.5f);
        icon.setBounds(left, top, Math.max(left + 1, right), Math.max(top + 1, bottom));
        icon.setAlpha(Color.alpha(color));
        icon.setColorFilter(color | 0xFF000000, PorterDuff.Mode.SRC_IN);
        icon.draw(canvas);
        return true;
    }

    private void drawActionIcon(Canvas canvas, int action, boolean isFavorite, float u, int tintedFg) {
        switch (action) {
            case TrackSwipeConfig.ACTION_PLAY_NEXT:
                if (!drawTidalIcon(canvas, iconPlayNext, u * 1.95f, tintedFg)) {
                    drawPlayNextIcon(canvas, u);
                }
                break;
            case TrackSwipeConfig.ACTION_TOGGLE_FAVORITE:
                if (isFavorite) {
                    if (drawTidalIcon(canvas, iconFavoriteOutline, u * 1.95f, tintedFg)) {
                        canvas.drawLine(-0.72f * u, -0.72f * u, 0.72f * u, 0.72f * u, iconStrokePaint);
                    } else {
                        drawRemoveFavoriteIcon(canvas, u);
                    }
                } else {
                    if (!drawTidalIcon(canvas, iconFavoriteFilled, u * 1.95f, tintedFg)) {
                        drawHeartIcon(canvas, u, true);
                    }
                }
                break;
            case TrackSwipeConfig.ACTION_ADD_TO_PLAYLIST:
                if (!drawTidalIcon(canvas, iconPlaylists, u * 1.95f, tintedFg)) {
                    drawAddToPlaylistIcon(canvas, u);
                }
                break;
            case TrackSwipeConfig.ACTION_ADD_TO_QUEUE:
            default:
                if (!drawTidalIcon(canvas, iconAddToQueue, u * 1.90f, tintedFg)) {
                    drawQueueIcon(canvas, u);
                }
                break;
        }
    }

    private void drawQueueIcon(Canvas canvas, float u) {
        // Three queue bars + small play triangle on bottom-right.
        canvas.drawLine(-0.75f * u, -0.48f * u, 0.72f * u, -0.48f * u, iconStrokePaint);
        canvas.drawLine(-0.75f * u, -0.02f * u, 0.72f * u, -0.02f * u, iconStrokePaint);
        canvas.drawLine(-0.75f * u, 0.44f * u, 0.05f * u, 0.44f * u, iconStrokePaint);

        iconPath.reset();
        iconPath.moveTo(0.28f * u, 0.18f * u);
        iconPath.lineTo(0.82f * u, 0.48f * u);
        iconPath.lineTo(0.28f * u, 0.78f * u);
        iconPath.close();
        canvas.drawPath(iconPath, iconFillPaint);
    }

    private void drawPlayNextIcon(Canvas canvas, float u) {
        // Play arrow on left + stacked "next" bar and queue lines on right.
        iconPath.reset();
        iconPath.moveTo(-0.78f * u, -0.52f * u);
        iconPath.lineTo(-0.14f * u, -0.14f * u);
        iconPath.lineTo(-0.78f * u, 0.24f * u);
        iconPath.close();
        canvas.drawPath(iconPath, iconFillPaint);

        canvas.drawLine(0.08f * u, -0.42f * u, 0.78f * u, -0.42f * u, iconStrokePaint);
        canvas.drawLine(0.08f * u, 0.05f * u, 0.78f * u, 0.05f * u, iconStrokePaint);
        canvas.drawLine(-0.75f * u, 0.52f * u, 0.78f * u, 0.52f * u, iconStrokePaint);
    }

    private void drawHeartIcon(Canvas canvas, float u, boolean filled) {
        iconPath.reset();
        iconPath.moveTo(0f, 0.74f * u);
        iconPath.cubicTo(-0.22f * u, 0.55f * u, -0.88f * u, 0.12f * u, -0.88f * u, -0.30f * u);
        iconPath.cubicTo(-0.88f * u, -0.66f * u, -0.52f * u, -0.84f * u, -0.22f * u, -0.68f * u);
        iconPath.cubicTo(-0.09f * u, -0.61f * u, -0.03f * u, -0.50f * u, 0f, -0.42f * u);
        iconPath.cubicTo(0.03f * u, -0.50f * u, 0.09f * u, -0.61f * u, 0.22f * u, -0.68f * u);
        iconPath.cubicTo(0.52f * u, -0.84f * u, 0.88f * u, -0.66f * u, 0.88f * u, -0.30f * u);
        iconPath.cubicTo(0.88f * u, 0.12f * u, 0.22f * u, 0.55f * u, 0f, 0.74f * u);
        iconPath.close();
        canvas.drawPath(iconPath, filled ? iconFillPaint : iconStrokePaint);
    }

    private void drawRemoveFavoriteIcon(Canvas canvas, float u) {
        drawHeartIcon(canvas, u, false);
        canvas.drawLine(-0.78f * u, -0.78f * u, 0.78f * u, 0.78f * u, iconStrokePaint);
    }

    private void drawAddToPlaylistIcon(Canvas canvas, float u) {
        canvas.drawLine(-0.75f * u, -0.48f * u, 0.65f * u, -0.48f * u, iconStrokePaint);
        canvas.drawLine(-0.75f * u, -0.02f * u, 0.65f * u, -0.02f * u, iconStrokePaint);
        canvas.drawLine(-0.75f * u, 0.44f * u, 0.05f * u, 0.44f * u, iconStrokePaint);

        // Plus sign on bottom-right.
        canvas.drawLine(0.24f * u, 0.44f * u, 0.84f * u, 0.44f * u, iconStrokePaint);
        canvas.drawLine(0.54f * u, 0.14f * u, 0.54f * u, 0.74f * u, iconStrokePaint);
    }

    private static int resolveColor(Context ctx, int resId, int fallback) {
        try {
            return ctx.getColor(resId);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static float lerp(float a, float b, float t) {
        return a + (b - a) * t;
    }

    private static int blendArgb(int c1, int c2, float fraction) {
        float inv = 1f - fraction;
        int a = Math.round(Color.alpha(c1) * inv + Color.alpha(c2) * fraction);
        int r = Math.round(Color.red(c1) * inv + Color.red(c2) * fraction);
        int g = Math.round(Color.green(c1) * inv + Color.green(c2) * fraction);
        int b = Math.round(Color.blue(c1) * inv + Color.blue(c2) * fraction);
        return Color.argb(a, r, g, b);
    }
}
