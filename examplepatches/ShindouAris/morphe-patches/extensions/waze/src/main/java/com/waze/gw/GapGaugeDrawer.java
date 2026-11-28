package com.waze.gw;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;

/**
 * Draws the distance-to-vehicle-ahead gauge: a 270 degree ring filled in proportion to the gap,
 * with a mark at 12 o'clock where the safe distance is, the gap in metres in the middle and the
 * safe distance written under it. Used by the Android views and, through a Bitmap, by the Android Auto overlay.
 * One instance per drawing thread (the paints are reused).
 */
final class GapGaugeDrawer {
    private static final int CARD = 0xE61B1F29;
    private static final int TRACK = 0x33FFFFFF;
    private static final int OK = 0xFF39D6AE;
    private static final int NEUTRAL = 0xFFDCE6EE;
    private static final int ALERT = 0xFFFF4D4D;
    private static final int MUTED = 0xFFB8C2CC;
    private static final float START_ANGLE = 135f;   // bottom-left; the ring opens at the bottom
    private static final float SWEEP = 270f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
    private final RectF rect = new RectF();

    private final Typeface digits;
    private boolean card = true;

    /** @param digits face for the metres number; the labels keep the system bold face. */
    GapGaugeDrawer(Typeface digits) {
        this.digits = digits;
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextAlign(Paint.Align.CENTER);
    }

    /** False when the gauge sits inside another panel: no background card and no alert border. */
    void setCard(boolean value) { card = value; }

    /** @param pulse 0..1; only used while {@code state.alert} (the ring and border breathe). */
    void draw(Canvas canvas, float size, XadasGapPolicy.State state, float pulse, boolean compact) {
        float s = size;
        if (card) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(CARD);
            rect.set(0f, 0f, s, s);
            canvas.drawRoundRect(rect, s * 0.18f, s * 0.18f, paint);
        }

        int accent = state.alert ? ALERT : (state.safeMetres > 0 ? OK : NEUTRAL);
        int breathe = state.alert ? (int) (140 + 115 * pulse) : 255;

        if (card && state.alert) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(2f, s * 0.03f));
            paint.setColor(withAlpha(ALERT, (int) (70 + 150 * pulse)));
            float inset = paint.getStrokeWidth() / 2f;
            rect.set(inset, inset, s - inset, s - inset);
            canvas.drawRoundRect(rect, s * 0.18f, s * 0.18f, paint);
        }

        float cx = s / 2f;
        float cy = s * 0.5f;
        float r = s * 0.37f;
        float stroke = s * 0.075f;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeWidth(stroke);
        rect.set(cx - r, cy - r, cx + r, cy + r);
        paint.setColor(TRACK);
        canvas.drawArc(rect, START_ANGLE, SWEEP, false, paint);
        float sweep = SWEEP * state.fraction();
        if (sweep > 1f) {
            paint.setColor(withAlpha(accent, breathe));
            canvas.drawArc(rect, START_ANGLE, sweep, false, paint);
        }
        if (state.safeMetres > 0) {               // the safe-distance mark, always at 12 o'clock
            paint.setStrokeCap(Paint.Cap.BUTT);
            paint.setStrokeWidth(Math.max(2f, stroke * 0.4f));
            paint.setColor(0xFFFFFFFF);
            canvas.drawLine(cx, cy - r - stroke * 0.8f, cx, cy - r + stroke * 0.8f, paint);
        }

        paint.setStyle(Paint.Style.FILL);
        boolean feet = Units.imperial();
        String number = String.valueOf(feet ? Units.feet(state.metres) : state.metres);
        paint.setColor(state.alert ? 0xFFFF9A9A : 0xFFFFFFFF);
        paint.setTypeface(digits);
        centered(canvas, number, cx, cy - s * 0.02f, s * (number.length() >= 3 ? 0.24f : 0.30f));
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setColor(MUTED);
        centered(canvas, feet ? "ft" : "m", cx, cy + s * 0.15f, s * 0.12f);
        if (!compact && state.safeMetres > 0) {
            centered(canvas, feet ? Units.feet(state.safeMetres) + " ft" : state.safeMetres + " m",
                    cx, cy + r * 0.98f, s * 0.10f);
        }
    }

    private void centered(Canvas canvas, String text, float x, float centerY, float textSize) {
        paint.setTextSize(textSize);
        Paint.FontMetrics m = paint.getFontMetrics();
        canvas.drawText(text, x, centerY - (m.ascent + m.descent) / 2f, paint);
    }

    private static int withAlpha(int color, int alpha) {
        return (Math.max(0, Math.min(255, alpha)) << 24) | (color & 0x00FFFFFF);
    }
}
