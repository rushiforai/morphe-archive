/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/** Core symbols plus 24x24 outline geometry adapted from Tabler Icons (MIT). */
public final class FacebookSymbolDrawable extends Drawable {
    public static final int GEAR = 0;
    public static final int ANALYTICS = 1;
    public static final int SPARKLE = 2;
    public static final int SHIELD = 3;
    public static final int SPEED = 4;
    public static final int INFO = 5;
    public static final int BACK = 6;
    public static final int DOWNLOAD_QUALITY = 7;
    public static final int REELS_QUALITY = 8;
    public static final int STORIES_QUALITY = 9;
    public static final int HOME_REELS = 10;
    public static final int HOME_STORIES = 11;
    public static final int SUGGESTIONS_OFF = 12;
    public static final int CATEGORY_PRIVACY = 13;
    public static final int CATEGORY_APPEARANCE = 14;
    public static final int CATEGORY_MEDIA = 15;
    public static final int CATEGORY_HOME = 16;
    public static final int CATEGORY_PERFORMANCE = 17;
    public static final int CATEGORY_ABOUT = 18;
    public static final int CHEVRON_RIGHT = 19;
    public static final int CATEGORY_DONATE = 20;
    public static final int KOFI = 21;
    public static final int PAYPAL = 22;
    public static final int UPI = 23;
    public static final int MATERIAL_YOU = 24;
    public static final int AUTO_REFRESH_OFF = 25;
    public static final int CATEGORY_STARTUP = 26;
    public static final int MARKETPLACE_LAUNCH = 27;
    public static final int REDUCE_ANIMATIONS = 28;
    public static final int HAPTICS_OFF = 29;
    public static final int BACKGROUND_WORK_OFF = 30;
    public static final int REELS_2X = 31;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final int symbol;

    public FacebookSymbolDrawable(int symbol, int color) {
        this.symbol = symbol;
        paint.setColor(color);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeJoin(Paint.Join.ROUND);
    }

    @Override
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float size = Math.min(bounds.width(), bounds.height());
        float cx = bounds.exactCenterX();
        float cy = bounds.exactCenterY();
        paint.setStrokeWidth(Math.max(1.75f, size / 12f));

        switch (symbol) {
            case GEAR:
                drawGear(canvas, cx, cy, size);
                break;
            case ANALYTICS:
                drawAnalytics(canvas, bounds, size);
                break;
            case SPARKLE:
                drawSparkle(canvas, cx, cy, size);
                break;
            case SHIELD:
                drawShield(canvas, cx, cy, size);
                break;
            case SPEED:
                drawSpeed(canvas, cx, cy, size);
                break;
            case INFO:
                drawInfo(canvas, cx, cy, size);
                break;
            case BACK:
                drawBack(canvas, cx, cy, size);
                break;
            case DOWNLOAD_QUALITY:
                drawHdBadge(canvas, bounds);
                break;
            case REELS_QUALITY:
                drawPlayerPlay(canvas, bounds);
                break;
            case STORIES_QUALITY:
                drawPhotoVideo(canvas, bounds);
                break;
            case HOME_REELS:
                drawCarouselHorizontal(canvas, bounds);
                break;
            case HOME_STORIES:
                drawLayoutCards(canvas, bounds);
                break;
            case SUGGESTIONS_OFF:
                drawSparklesOff(canvas, bounds);
                break;
            case CATEGORY_PRIVACY:
                drawShield(canvas, cx, cy, size);
                break;
            case CATEGORY_APPEARANCE:
                drawSparkle(canvas, cx, cy, size);
                break;
            case CATEGORY_MEDIA:
                drawPhotoVideo(canvas, bounds);
                break;
            case CATEGORY_HOME:
                drawLayoutCards(canvas, bounds);
                break;
            case CATEGORY_PERFORMANCE:
                drawSpeed(canvas, cx, cy, size);
                break;
            case CATEGORY_ABOUT:
                drawInfo(canvas, cx, cy, size);
                break;
            case CATEGORY_DONATE:
                drawGift(canvas, cx, cy, size);
                break;
            case KOFI:
                drawCoffeeMug(canvas, cx, cy, size);
                break;
            case PAYPAL:
                drawPaypal(canvas, cx, cy, size);
                break;
            case UPI:
                drawQrCode(canvas, bounds, size);
                break;
            case MATERIAL_YOU:
                drawMaterialYou(canvas, bounds);
                break;
            case AUTO_REFRESH_OFF:
                drawRefreshOff(canvas, bounds);
                break;
            case CATEGORY_STARTUP:
                drawRocket(canvas, bounds);
                break;
            case MARKETPLACE_LAUNCH:
                drawStorefront(canvas, bounds);
                break;
            case REDUCE_ANIMATIONS:
                drawMotionOff(canvas, bounds);
                break;
            case HAPTICS_OFF:
                drawHapticsOff(canvas, bounds);
                break;
            case BACKGROUND_WORK_OFF:
                drawBackgroundWorkOff(canvas, bounds);
                break;
            case REELS_2X:
                drawReels2x(canvas, bounds);
                break;
            case CHEVRON_RIGHT:
                drawForward(canvas, cx, cy, size);
                break;
            default:
                break;
        }
    }

    private void drawGear(Canvas canvas, float cx, float cy, float size) {
        float outer = size * 0.36f;
        float inner = size * 0.15f;
        canvas.drawCircle(cx, cy, outer * 0.72f, paint);
        canvas.drawCircle(cx, cy, inner, paint);
        for (int i = 0; i < 8; i++) {
            double angle = Math.PI * i / 4.0;
            float x1 = cx + (float) Math.cos(angle) * outer * 0.72f;
            float y1 = cy + (float) Math.sin(angle) * outer * 0.72f;
            float x2 = cx + (float) Math.cos(angle) * outer;
            float y2 = cy + (float) Math.sin(angle) * outer;
            canvas.drawLine(x1, y1, x2, y2, paint);
        }
    }

    private void drawAnalytics(Canvas canvas, Rect bounds, float size) {
        float left = bounds.left + size * 0.18f;
        float bottom = bounds.bottom - size * 0.18f;
        float width = size * 0.14f;
        canvas.drawLine(left, bottom, left, bottom - size * 0.25f, paint);
        canvas.drawLine(left + width * 1.8f, bottom, left + width * 1.8f, bottom - size * 0.45f, paint);
        canvas.drawLine(left + width * 3.6f, bottom, left + width * 3.6f, bottom - size * 0.65f, paint);
        canvas.drawLine(left - size * 0.05f, bottom, left + width * 4.2f, bottom, paint);
    }

    private void drawSparkle(Canvas canvas, float cx, float cy, float size) {
        drawStar(canvas, cx - size * 0.08f, cy - size * 0.05f, size * 0.30f);
        drawStar(canvas, cx + size * 0.24f, cy + size * 0.23f, size * 0.13f);
    }

    private void drawStar(Canvas canvas, float cx, float cy, float radius) {
        Path path = new Path();
        path.moveTo(cx, cy - radius);
        path.lineTo(cx + radius * 0.22f, cy - radius * 0.22f);
        path.lineTo(cx + radius, cy);
        path.lineTo(cx + radius * 0.22f, cy + radius * 0.22f);
        path.lineTo(cx, cy + radius);
        path.lineTo(cx - radius * 0.22f, cy + radius * 0.22f);
        path.lineTo(cx - radius, cy);
        path.lineTo(cx - radius * 0.22f, cy - radius * 0.22f);
        path.close();
        canvas.drawPath(path, paint);
    }

    private void drawShield(Canvas canvas, float cx, float cy, float size) {
        Path path = new Path();
        path.moveTo(cx, cy - size * 0.37f);
        path.lineTo(cx + size * 0.31f, cy - size * 0.22f);
        path.lineTo(cx + size * 0.25f, cy + size * 0.20f);
        path.quadTo(cx, cy + size * 0.42f, cx - size * 0.25f, cy + size * 0.20f);
        path.lineTo(cx - size * 0.31f, cy - size * 0.22f);
        path.close();
        canvas.drawPath(path, paint);
    }

    private void drawSpeed(Canvas canvas, float cx, float cy, float size) {
        Rect oval = new Rect(
                (int) (cx - size * 0.36f),
                (int) (cy - size * 0.29f),
                (int) (cx + size * 0.36f),
                (int) (cy + size * 0.43f)
        );
        canvas.drawArc(oval.left, oval.top, oval.right, oval.bottom, 195f, 150f, false, paint);
        canvas.drawLine(cx, cy + size * 0.12f, cx + size * 0.23f, cy - size * 0.15f, paint);
        canvas.drawCircle(cx, cy + size * 0.12f, size * 0.05f, paint);
    }

    private void drawInfo(Canvas canvas, float cx, float cy, float size) {
        canvas.drawCircle(cx, cy, size * 0.34f, paint);
        canvas.drawLine(cx, cy - size * 0.02f, cx, cy + size * 0.22f, paint);
        paint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(cx, cy - size * 0.18f, size * 0.05f, paint);
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawGift(Canvas canvas, float cx, float cy, float size) {
        RectF box = new RectF(
                cx - size * 0.30f,
                cy - size * 0.02f,
                cx + size * 0.30f,
                cy + size * 0.34f
        );
        canvas.drawRoundRect(box, size * 0.05f, size * 0.05f, paint);
        canvas.drawRoundRect(
                new RectF(
                        cx - size * 0.36f,
                        cy - size * 0.14f,
                        cx + size * 0.36f,
                        cy + size * 0.03f
                ),
                size * 0.04f,
                size * 0.04f,
                paint
        );
        canvas.drawLine(cx, cy - size * 0.14f, cx, cy + size * 0.34f, paint);
        canvas.drawArc(
                new RectF(
                        cx - size * 0.22f,
                        cy - size * 0.40f,
                        cx + size * 0.02f,
                        cy - size * 0.07f
                ),
                250f,
                210f,
                false,
                paint
        );
        canvas.drawArc(
                new RectF(
                        cx - size * 0.02f,
                        cy - size * 0.40f,
                        cx + size * 0.22f,
                        cy - size * 0.07f
                ),
                80f,
                210f,
                false,
                paint
        );
    }

    private void drawCoffeeMug(Canvas canvas, float cx, float cy, float size) {
        RectF cup = new RectF(
                cx - size * 0.33f,
                cy - size * 0.16f,
                cx + size * 0.22f,
                cy + size * 0.30f
        );
        canvas.drawRoundRect(cup, size * 0.08f, size * 0.08f, paint);
        canvas.drawArc(
                new RectF(
                        cx + size * 0.10f,
                        cy - size * 0.05f,
                        cx + size * 0.43f,
                        cy + size * 0.22f
                ),
                -90f,
                180f,
                false,
                paint
        );
        canvas.drawLine(
                cx - size * 0.25f,
                cy - size * 0.02f,
                cx + size * 0.14f,
                cy - size * 0.02f,
                paint
        );
        canvas.drawArc(
                new RectF(
                        cx - size * 0.20f,
                        cy - size * 0.43f,
                        cx - size * 0.05f,
                        cy - size * 0.16f
                ),
                200f,
                140f,
                false,
                paint
        );
        canvas.drawArc(
                new RectF(
                        cx + size * 0.02f,
                        cy - size * 0.43f,
                        cx + size * 0.17f,
                        cy - size * 0.16f
                ),
                200f,
                140f,
                false,
                paint
        );
    }

    private void drawPaypal(Canvas canvas, float cx, float cy, float size) {
        int alpha = paint.getAlpha();
        paint.setStyle(Paint.Style.FILL);
        paint.setAlpha(Math.min(alpha, 145));
        drawPaypalP(canvas, cx + size * 0.08f, cy + size * 0.04f, size);
        paint.setAlpha(alpha);
        drawPaypalP(canvas, cx - size * 0.08f, cy - size * 0.04f, size);
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawPaypalP(Canvas canvas, float cx, float cy, float size) {
        float unit = size / 24f;
        Path p = new Path();
        p.moveTo(cx - 5.6f * unit, cy - 8.6f * unit);
        p.lineTo(cx + 1.2f * unit, cy - 8.6f * unit);
        p.cubicTo(
                cx + 5.2f * unit,
                cy - 8.6f * unit,
                cx + 7.0f * unit,
                cy - 6.2f * unit,
                cx + 6.3f * unit,
                cy - 3.0f * unit
        );
        p.cubicTo(
                cx + 5.7f * unit,
                cy - 0.2f * unit,
                cx + 3.5f * unit,
                cy + 1.7f * unit,
                cx + 0.1f * unit,
                cy + 1.7f * unit
        );
        p.lineTo(cx - 1.9f * unit, cy + 1.7f * unit);
        p.lineTo(cx - 3.0f * unit, cy + 8.4f * unit);
        p.lineTo(cx - 6.1f * unit, cy + 8.4f * unit);
        p.close();
        canvas.drawPath(p, paint);
    }

    private void drawQrCode(Canvas canvas, Rect bounds, float size) {
        int alpha = paint.getAlpha();
        float grid = size * 0.80f;
        float unit = grid / 11f;
        float left = bounds.exactCenterX() - grid / 2f;
        float top = bounds.exactCenterY() - grid / 2f;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(Math.max(1.35f, unit * 0.92f));
        drawQrFinder(canvas, left, top, unit);
        drawQrFinder(canvas, left + unit * 6f, top, unit);
        drawQrFinder(canvas, left, top + unit * 6f, unit);

        paint.setStyle(Paint.Style.FILL);
        int[][] modules = {
                {6, 2}, {8, 2}, {9, 2}, {4, 4}, {5, 4}, {7, 4},
                {9, 4}, {10, 4}, {3, 5}, {5, 5}, {8, 5}, {10, 5},
                {4, 7}, {6, 7}, {8, 7}, {9, 7}, {3, 8}, {5, 8},
                {7, 8}, {10, 8}, {4, 9}, {6, 9}, {8, 9}, {9, 9},
                {3, 10}, {5, 10}, {7, 10}, {10, 10}
        };
        for (int[] module : modules) {
            canvas.drawRect(
                    left + module[0] * unit,
                    top + module[1] * unit,
                    left + (module[0] + 1) * unit,
                    top + (module[1] + 1) * unit,
                    paint
            );
        }
        paint.setAlpha(alpha);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(Math.max(1.75f, size / 12f));
    }

    private void drawQrFinder(Canvas canvas, float left, float top, float unit) {
        canvas.drawRect(left, top, left + unit * 5f, top + unit * 5f, paint);
        paint.setStyle(Paint.Style.FILL);
        canvas.drawRect(
                left + unit * 1.5f,
                top + unit * 1.5f,
                left + unit * 3.5f,
                top + unit * 3.5f,
                paint
        );
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawBack(Canvas canvas, float cx, float cy, float size) {
        canvas.drawLine(cx + size * 0.18f, cy - size * 0.30f, cx - size * 0.14f, cy, paint);
        canvas.drawLine(cx - size * 0.14f, cy, cx + size * 0.18f, cy + size * 0.30f, paint);
    }

    private void drawForward(Canvas canvas, float cx, float cy, float size) {
        canvas.drawLine(cx - size * 0.18f, cy - size * 0.30f, cx + size * 0.14f, cy, paint);
        canvas.drawLine(cx + size * 0.14f, cy, cx - size * 0.18f, cy + size * 0.30f, paint);
    }

    private void drawHdBadge(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(
                rect(bounds, 3, 5, 21, 19),
                scale(bounds, 2),
                scale(bounds, 2),
                paint
        );
        canvas.drawLine(
                x(bounds, 7),
                y(bounds, 9),
                x(bounds, 7),
                y(bounds, 15),
                paint
        );
        canvas.drawLine(
                x(bounds, 10),
                y(bounds, 9),
                x(bounds, 10),
                y(bounds, 15),
                paint
        );
        canvas.drawLine(
                x(bounds, 7),
                y(bounds, 12),
                x(bounds, 10),
                y(bounds, 12),
                paint
        );

        Path d = new Path();
        d.moveTo(x(bounds, 14), y(bounds, 9));
        d.lineTo(x(bounds, 14), y(bounds, 15));
        d.lineTo(x(bounds, 15), y(bounds, 15));
        d.quadTo(
                x(bounds, 17),
                y(bounds, 15),
                x(bounds, 17),
                y(bounds, 13)
        );
        d.lineTo(x(bounds, 17), y(bounds, 11));
        d.quadTo(
                x(bounds, 17),
                y(bounds, 9),
                x(bounds, 15),
                y(bounds, 9)
        );
        d.close();
        canvas.drawPath(d, paint);
    }

    private void drawPlayerPlay(Canvas canvas, Rect bounds) {
        Path path = new Path();
        path.moveTo(x(bounds, 7), y(bounds, 4));
        path.lineTo(x(bounds, 7), y(bounds, 20));
        path.lineTo(x(bounds, 20), y(bounds, 12));
        path.close();
        canvas.drawPath(path, paint);
    }

    private void drawPhotoVideo(Canvas canvas, Rect bounds) {
        Path rear = new Path();
        rear.moveTo(x(bounds, 9), y(bounds, 15));
        rear.lineTo(x(bounds, 6), y(bounds, 15));
        rear.quadTo(
                x(bounds, 3),
                y(bounds, 15),
                x(bounds, 3),
                y(bounds, 12)
        );
        rear.lineTo(x(bounds, 3), y(bounds, 6));
        rear.quadTo(
                x(bounds, 3),
                y(bounds, 3),
                x(bounds, 6),
                y(bounds, 3)
        );
        rear.lineTo(x(bounds, 12), y(bounds, 3));
        rear.quadTo(
                x(bounds, 15),
                y(bounds, 3),
                x(bounds, 15),
                y(bounds, 6)
        );
        rear.lineTo(x(bounds, 15), y(bounds, 9));
        canvas.drawPath(rear, paint);

        canvas.drawRoundRect(
                rect(bounds, 9, 9, 21, 21),
                scale(bounds, 3),
                scale(bounds, 3),
                paint
        );

        Path landscape = new Path();
        landscape.moveTo(x(bounds, 3), y(bounds, 12));
        landscape.lineTo(x(bounds, 5.3f), y(bounds, 9.7f));
        landscape.quadTo(
                x(bounds, 7),
                y(bounds, 8),
                x(bounds, 8.7f),
                y(bounds, 9.7f)
        );
        landscape.lineTo(x(bounds, 9), y(bounds, 10));
        canvas.drawPath(landscape, paint);

        Path play = new Path();
        play.moveTo(x(bounds, 14), y(bounds, 13.5f));
        play.lineTo(x(bounds, 14), y(bounds, 16.5f));
        play.lineTo(x(bounds, 16.5f), y(bounds, 15));
        play.close();
        canvas.drawPath(play, paint);
        drawDot(canvas, bounds, 7, 6);
    }

    private void drawCarouselHorizontal(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(
                rect(bounds, 7, 5, 17, 19),
                scale(bounds, 1),
                scale(bounds, 1),
                paint
        );

        Path right = new Path();
        right.moveTo(x(bounds, 22), y(bounds, 17));
        right.lineTo(x(bounds, 21), y(bounds, 17));
        right.quadTo(
                x(bounds, 20),
                y(bounds, 17),
                x(bounds, 20),
                y(bounds, 16)
        );
        right.lineTo(x(bounds, 20), y(bounds, 8));
        right.quadTo(
                x(bounds, 20),
                y(bounds, 7),
                x(bounds, 21),
                y(bounds, 7)
        );
        right.lineTo(x(bounds, 22), y(bounds, 7));
        canvas.drawPath(right, paint);

        Path left = new Path();
        left.moveTo(x(bounds, 2), y(bounds, 17));
        left.lineTo(x(bounds, 3), y(bounds, 17));
        left.quadTo(
                x(bounds, 4),
                y(bounds, 17),
                x(bounds, 4),
                y(bounds, 16)
        );
        left.lineTo(x(bounds, 4), y(bounds, 8));
        left.quadTo(
                x(bounds, 4),
                y(bounds, 7),
                x(bounds, 3),
                y(bounds, 7)
        );
        left.lineTo(x(bounds, 2), y(bounds, 7));
        canvas.drawPath(left, paint);
    }

    private void drawLayoutCards(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(
                rect(bounds, 4, 4, 10, 20),
                scale(bounds, 2),
                scale(bounds, 2),
                paint
        );
        canvas.drawRoundRect(
                rect(bounds, 14, 4, 20, 14),
                scale(bounds, 2),
                scale(bounds, 2),
                paint
        );
    }

    private void drawSparklesOff(Canvas canvas, Rect bounds) {
        Path large = new Path();
        large.moveTo(x(bounds, 9), y(bounds, 6));
        large.cubicTo(
                x(bounds, 9),
                y(bounds, 9.3f),
                x(bounds, 11.7f),
                y(bounds, 12),
                x(bounds, 15),
                y(bounds, 12)
        );
        large.cubicTo(
                x(bounds, 11.7f),
                y(bounds, 12),
                x(bounds, 9),
                y(bounds, 14.7f),
                x(bounds, 9),
                y(bounds, 18)
        );
        large.cubicTo(
                x(bounds, 9),
                y(bounds, 14.7f),
                x(bounds, 6.3f),
                y(bounds, 12),
                x(bounds, 3),
                y(bounds, 12)
        );
        large.cubicTo(
                x(bounds, 6.3f),
                y(bounds, 12),
                x(bounds, 9),
                y(bounds, 9.3f),
                x(bounds, 9),
                y(bounds, 6)
        );
        canvas.drawPath(large, paint);
        drawSmallSparkle(canvas, bounds, 18, 6);
        drawSmallSparkle(canvas, bounds, 18, 18);
        canvas.drawLine(
                x(bounds, 3),
                y(bounds, 3),
                x(bounds, 21),
                y(bounds, 21),
                paint
        );
    }

    private void drawMaterialYou(Canvas canvas, Rect bounds) {
        paint.setStyle(Paint.Style.FILL);
        float radius = scale(bounds, 4);
        float orbit = scale(bounds, 4.5f);
        for (int index = 0; index < 4; index++) {
            double angle = Math.PI * index / 2.0;
            canvas.drawCircle(
                    x(bounds, 12) + (float) Math.cos(angle) * orbit,
                    y(bounds, 12) + (float) Math.sin(angle) * orbit,
                    radius,
                    paint
            );
        }
        canvas.drawCircle(x(bounds, 12), y(bounds, 12), scale(bounds, 1.8f), paint);
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawRefreshOff(Canvas canvas, Rect bounds) {
        canvas.drawArc(
                rect(bounds, 4, 4, 20, 20),
                35f,
                270f,
                false,
                paint
        );
        canvas.drawLine(
                x(bounds, 9),
                y(bounds, 5),
                x(bounds, 7),
                y(bounds, 7),
                paint
        );
        canvas.drawLine(
                x(bounds, 19),
                y(bounds, 19),
                x(bounds, 4),
                y(bounds, 4),
                paint
        );
    }

    private void drawRocket(Canvas canvas, Rect bounds) {
        Path nose = new Path();
        nose.moveTo(x(bounds, 8), y(bounds, 9));
        nose.cubicTo(
                x(bounds, 10.4f),
                y(bounds, 4.2f),
                x(bounds, 13.6f),
                y(bounds, 4.2f),
                x(bounds, 16),
                y(bounds, 9)
        );
        nose.lineTo(x(bounds, 8), y(bounds, 9));
        nose.close();
        canvas.drawPath(nose, paint);

        Path body = new Path();
        body.moveTo(x(bounds, 8), y(bounds, 9));
        body.cubicTo(
                x(bounds, 7.2f),
                y(bounds, 11.5f),
                x(bounds, 7.2f),
                y(bounds, 14),
                x(bounds, 8),
                y(bounds, 16)
        );
        body.lineTo(x(bounds, 16), y(bounds, 16));
        body.cubicTo(
                x(bounds, 16.8f),
                y(bounds, 14),
                x(bounds, 16.8f),
                y(bounds, 11.5f),
                x(bounds, 16),
                y(bounds, 9)
        );
        canvas.drawPath(body, paint);

        canvas.drawLine(
                x(bounds, 8),
                y(bounds, 12),
                x(bounds, 4.5f),
                y(bounds, 18),
                paint
        );
        canvas.drawLine(
                x(bounds, 8),
                y(bounds, 15.5f),
                x(bounds, 4.5f),
                y(bounds, 18),
                paint
        );
        canvas.drawLine(
                x(bounds, 16),
                y(bounds, 12),
                x(bounds, 19.5f),
                y(bounds, 18),
                paint
        );
        canvas.drawLine(
                x(bounds, 16),
                y(bounds, 15.5f),
                x(bounds, 19.5f),
                y(bounds, 18),
                paint
        );
        canvas.drawLine(
                x(bounds, 10.5f),
                y(bounds, 16),
                x(bounds, 10.5f),
                y(bounds, 17.5f),
                paint
        );
        canvas.drawLine(
                x(bounds, 13.5f),
                y(bounds, 16),
                x(bounds, 13.5f),
                y(bounds, 17.5f),
                paint
        );

        paint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(
                x(bounds, 12),
                y(bounds, 10.5f),
                scale(bounds, 1.4f),
                paint
        );

        Path flame = new Path();
        flame.moveTo(x(bounds, 10.5f), y(bounds, 17.5f));
        flame.lineTo(x(bounds, 13.5f), y(bounds, 17.5f));
        flame.lineTo(x(bounds, 12), y(bounds, 21));
        flame.close();
        canvas.drawPath(flame, paint);
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawStorefront(Canvas canvas, Rect bounds) {
        Path awning = new Path();
        awning.moveTo(x(bounds, 4), y(bounds, 8));
        awning.lineTo(x(bounds, 20), y(bounds, 8));
        awning.lineTo(x(bounds, 18), y(bounds, 12));
        awning.lineTo(x(bounds, 6), y(bounds, 12));
        awning.close();
        canvas.drawPath(awning, paint);
        canvas.drawRoundRect(rect(bounds, 5, 12, 19, 20), scale(bounds, 1), scale(bounds, 1), paint);
        canvas.drawLine(x(bounds, 12), y(bounds, 12), x(bounds, 12), y(bounds, 20), paint);
        canvas.drawLine(x(bounds, 9), y(bounds, 16), x(bounds, 9), y(bounds, 18), paint);
        canvas.drawLine(x(bounds, 15), y(bounds, 16), x(bounds, 15), y(bounds, 18), paint);
    }

    private void drawMotionOff(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(rect(bounds, 5, 4, 19, 20), scale(bounds, 1), scale(bounds, 1), paint);
        canvas.drawLine(x(bounds, 8), y(bounds, 8), x(bounds, 8), y(bounds, 16), paint);
        canvas.drawLine(x(bounds, 8), y(bounds, 12), x(bounds, 12), y(bounds, 12), paint);
        canvas.drawLine(x(bounds, 4), y(bounds, 3), x(bounds, 21), y(bounds, 20), paint);
    }

    private void drawHapticsOff(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(rect(bounds, 7, 3, 17, 21), scale(bounds, 1), scale(bounds, 1), paint);
        canvas.drawLine(x(bounds, 10), y(bounds, 6), x(bounds, 14), y(bounds, 6), paint);
        canvas.drawLine(x(bounds, 9), y(bounds, 9), x(bounds, 5), y(bounds, 9), paint);
        canvas.drawLine(x(bounds, 9), y(bounds, 12), x(bounds, 5), y(bounds, 12), paint);
        canvas.drawLine(x(bounds, 9), y(bounds, 15), x(bounds, 5), y(bounds, 15), paint);
        canvas.drawLine(x(bounds, 3), y(bounds, 3), x(bounds, 21), y(bounds, 21), paint);
    }

    private void drawBackgroundWorkOff(Canvas canvas, Rect bounds) {
        canvas.drawArc(rect(bounds, 4, 4, 20, 20), 45f, 270f, false, paint);
        canvas.drawLine(x(bounds, 3), y(bounds, 3), x(bounds, 21), y(bounds, 21), paint);
    }

    private void drawReels2x(Canvas canvas, Rect bounds) {
        canvas.drawRoundRect(
                rect(bounds, 5, 5, 19, 19),
                scale(bounds, 2),
                scale(bounds, 2),
                paint
        );
        drawSmallForward(canvas, x(bounds, 10), y(bounds, 9), scale(bounds, 5), 1f);
        drawSmallForward(canvas, x(bounds, 15), y(bounds, 9), scale(bounds, 5), 1f);
        paint.setStyle(Paint.Style.FILL);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTextSize(scale(bounds, 7));
        canvas.drawText("2", x(bounds, 12), y(bounds, 20), paint);
        paint.setTextAlign(Paint.Align.LEFT);
        paint.setStyle(Paint.Style.STROKE);
    }

    private void drawSmallForward(
            Canvas canvas,
            float left,
            float centerY,
            float height,
            float width
    ) {
        Path path = new Path();
        path.moveTo(left, centerY - height / 2f);
        path.lineTo(left + width, centerY);
        path.lineTo(left, centerY + height / 2f);
        path.close();
        canvas.drawPath(path, paint);
    }

    private void drawSmallSparkle(
            Canvas canvas,
            Rect bounds,
            float cx,
            float cy
    ) {
        Path path = new Path();
        path.moveTo(x(bounds, cx), y(bounds, cy - 2));
        path.quadTo(
                x(bounds, cx),
                y(bounds, cy),
                x(bounds, cx + 2),
                y(bounds, cy)
        );
        path.quadTo(
                x(bounds, cx),
                y(bounds, cy),
                x(bounds, cx),
                y(bounds, cy + 2)
        );
        path.quadTo(
                x(bounds, cx),
                y(bounds, cy),
                x(bounds, cx - 2),
                y(bounds, cy)
        );
        path.quadTo(
                x(bounds, cx),
                y(bounds, cy),
                x(bounds, cx),
                y(bounds, cy - 2)
        );
        canvas.drawPath(path, paint);
    }

    private void drawDot(
            Canvas canvas,
            Rect bounds,
            float unitX,
            float unitY
    ) {
        paint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(
                x(bounds, unitX),
                y(bounds, unitY),
                Math.max(1f, paint.getStrokeWidth() * 0.55f),
                paint
        );
        paint.setStyle(Paint.Style.STROKE);
    }

    private static float x(Rect bounds, float value) {
        return bounds.exactCenterX() +
                (value - 12f) * scale(bounds, 1);
    }

    private static float y(Rect bounds, float value) {
        return bounds.exactCenterY() +
                (value - 12f) * scale(bounds, 1);
    }

    private static float scale(Rect bounds, float value) {
        return Math.min(bounds.width(), bounds.height()) * value / 24f;
    }

    private static RectF rect(
            Rect bounds,
            float left,
            float top,
            float right,
            float bottom
    ) {
        return new RectF(
                x(bounds, left),
                y(bounds, top),
                x(bounds, right),
                y(bounds, bottom)
        );
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
