package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * The phone's "V2" upcoming-alert rail (a one-dimensional route: far alerts at the top, the car at
 * the bottom) for the Android Auto renderer. Same layout rules as {@code UpcomingAlertRail}'s
 * DistanceRailView, drawn once into a Bitmap with plain Canvas calls (no animation, no GL state);
 * {@link AaSpeedo} uploads it as a texture exactly as it does for {@link AaAlertRail}.
 */
final class AaDistanceRail {
    /** Alerts further away than this are not on the rail. */
    static final int HORIZON_METERS = 1000;
    private static final int TOP_PAD = 18;
    private static final int BOTTOM_PAD = 52;
    private static final int RAIL_HEIGHT = 310;
    /** Smallest visible gap between two icons before that stretch is zoomed. */
    private static final int ZOOM_GAP = 30;
    private static final int MIN_GAP = 6;
    private static final int DISTANCE_TEXT = 18;
    private static final int PANEL_PAD = 5;

    private AaDistanceRail() { }

    /** Nearest first, one per type, within the horizon, at most {@code count}. */
    static List<AaAlertRail.Entry> entries(int count) {
        List<AaAlertRail.Entry> all = AaAlertRail.entries(Integer.MAX_VALUE);
        ArrayList<AaAlertRail.Entry> out = new ArrayList<AaAlertRail.Entry>();
        for (AaAlertRail.Entry entry : all) {
            if (entry.meters <= HORIZON_METERS && out.size() < count) out.add(entry);
        }
        return out;
    }

    /** Changes exactly when the rendered picture would change. */
    static String signature(List<AaAlertRail.Entry> entries, int sizePercent, int dpi, int ambient) {
        StringBuilder s = new StringBuilder("V2:").append(sizePercent).append('@').append(dpi)
                .append('#').append(ambient);
        for (AaAlertRail.Entry e : entries) {
            s.append('|').append(e.rawIcon).append(':').append(e.meters);
        }
        return s.toString();
    }

    static Bitmap render(Context context, List<AaAlertRail.Entry> entries, int sizePercent, int dpi,
                         int ambient) {
        if (context == null || entries == null || entries.isEmpty()) return null;
        final float u = Math.max(0.75f, dpi / 160f) * sizePercent / 100f;   // one "dp"
        int count = entries.size();

        // Nearer alerts are drawn larger.
        float[] scale = new float[count];
        float[] half = new float[count];
        float maxHalf = 0f;
        for (int i = 0; i < count; i++) {
            AaAlertRail.Entry entry = entries.get(i);
            scale[i] = proximityScale(entry.meters);
            half[i] = (entry.speed > 0 ? 20f : 18f) * u * scale[i];
            maxHalf = Math.max(maxHalf, half[i]);
        }
        float[] offset = new float[count];
        boolean[] zoomed = new boolean[count];
        layoutOffsets(entries, half, (RAIL_HEIGHT - TOP_PAD - BOTTOM_PAD) * u, u, offset, zoomed);

        float railWidth = Math.max(72f * u, maxHalf * 2f + 16f * u);
        float railHeight = RAIL_HEIGHT * u;
        float pad = PANEL_PAD * u;
        int width = Math.round(railWidth + 2f * pad);
        int height = Math.round(railHeight + 2f * pad);
        Bitmap bitmap = Bitmap.createBitmap(Math.max(1, width), Math.max(1, height),
                Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xA619191F);
        float radius = 14f * u;
        canvas.drawRoundRect(new RectF(0f, 0f, width, height), radius, radius, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(Math.max(1f, u));
        paint.setColor(0x443F3F48);
        float edge = paint.getStrokeWidth() / 2f;
        canvas.drawRoundRect(new RectF(edge, edge, width - edge, height - edge), radius, radius, paint);

        float center = pad + railWidth / 2f;
        float top = pad + TOP_PAD * u;
        float bottom = pad + railHeight - BOTTOM_PAD * u;

        int faded = (ambient & 0x00FFFFFF) | 0x18000000;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        paint.setStrokeWidth(7f * u);
        paint.setShader(new LinearGradient(center, top, center, bottom,
                new int[]{faded, ambient, ambient, faded},
                new float[]{0f, 0.28f, 0.72f, 1f}, Shader.TileMode.CLAMP));
        canvas.drawLine(center, top, center, bottom, paint);
        paint.setShader(null);

        // Zoomed stretches go under the icons so the highlight never covers a marker.
        for (int i = 1; i < count; i++) {
            if (!zoomed[i]) continue;
            float lowerEdge = bottom - offset[i - 1] - half[i - 1];
            float upperEdge = bottom - offset[i] + half[i];
            int gapMeters = Math.max(0, entries.get(i).meters - entries.get(i - 1).meters);
            drawZoomGap(canvas, paint, center, upperEdge, lowerEdge, gapMeters, ambient, u);
        }
        for (int i = 0; i < count; i++) {
            drawMarker(canvas, paint, context, entries.get(i), center, bottom - offset[i], scale[i], u);
        }

        UpcomingRailCarGlyph.draw(canvas, paint, new Path(), center, bottom + 5f * u, u);
        drawDistance(canvas, paint, entries.get(0).meters, center, bottom + 41f * u,
                railWidth - 8f * u, u);
        return bitmap;
    }

    /** Alerts within 200 m read at 1.12x, fading to 0.78x at the horizon. */
    private static float proximityScale(int meters) {
        float t = Math.max(0f, Math.min(1f, (meters - 200) / 800f));
        return 1.12f - 0.34f * t;
    }

    /** First 200 m take half of the rail; the rest is spread over the other half. */
    private static float position(int meters) {
        float normalized = Math.max(0f, Math.min(1f, meters / (float) HORIZON_METERS));
        if (normalized <= 0.2f) return normalized * 2.5f;
        return 0.5f + (normalized - 0.2f) * 0.625f;
    }

    /**
     * Distance-from-car (px, up the rail) for every marker. Crowded alerts are zoomed (the gap is
     * widened and labelled) and, when the rail still runs out of room, squeezed, so everything fits.
     */
    private static void layoutOffsets(List<AaAlertRail.Entry> entries, float[] half, float track,
                                      float u, float[] offset, boolean[] zoomed) {
        int count = offset.length;
        float zoomGap = ZOOM_GAP * u;
        float minGap = MIN_GAP * u;
        float[] wanted = new float[count];
        float[] floor = new float[count];
        float previousIdeal = 0f;
        float total = half[count - 1];
        for (int i = 0; i < count; i++) {
            float ideal = position(entries.get(i).meters) * track;
            if (i == 0) {
                floor[i] = half[i] + 16f * u;
                wanted[i] = Math.max(ideal, floor[i]);
                zoomed[i] = false;
            } else {
                float halves = half[i - 1] + half[i];
                float idealGap = ideal - previousIdeal;
                zoomed[i] = idealGap - halves < zoomGap;
                floor[i] = halves + minGap;
                wanted[i] = zoomed[i] ? halves + zoomGap : idealGap;
            }
            previousIdeal = ideal;
            total += wanted[i];
        }
        float excess = total - (track + TOP_PAD * u - 2f * u);
        if (excess > 0f) {
            float squeeze = Math.min(excess, wanted[0] - floor[0]);
            wanted[0] -= squeeze;
            excess -= squeeze;
        }
        if (excess > 0f) {
            float flexible = 0f;
            for (int i = 1; i < count; i++) flexible += wanted[i] - floor[i];
            float keep = flexible <= 0f ? 0f : Math.max(0f, 1f - excess / flexible);
            for (int i = 1; i < count; i++) wanted[i] = floor[i] + (wanted[i] - floor[i]) * keep;
        }
        float position = 0f;
        for (int i = 0; i < count; i++) {
            position += wanted[i];
            offset[i] = position;
        }
    }

    /** Highlight a magnified stretch between two alerts and label the real distance between them. */
    private static void drawZoomGap(Canvas canvas, Paint paint, float x, float upperY, float lowerY,
                                    int meters, int ambient, float u) {
        if (lowerY - upperY < 20f * u) return;   // no room left for the label
        paint.setShader(null);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStrokeWidth(7f * u);
        paint.setColor((ambient & 0x00FFFFFF) | (150 << 24));
        canvas.drawLine(x, upperY + 2f * u, x, lowerY - 2f * u, paint);

        paint.setStrokeWidth(2f * u);
        paint.setColor(0xC8FFFFFF);
        float cap = 11f * u;
        canvas.drawLine(x - cap, upperY + 2f * u, x + cap, upperY + 2f * u, paint);
        canvas.drawLine(x - cap, lowerY - 2f * u, x + cap, lowerY - 2f * u, paint);

        String label = formatDistance(meters);
        paint.setTextSize(11f * u);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextAlign(Paint.Align.CENTER);
        float midY = (upperY + lowerY) / 2f;
        float halfW = paint.measureText(label) / 2f + 6f * u;
        float halfH = 9f * u;
        RectF pill = new RectF(x - halfW, midY - halfH, x + halfW, midY + halfH);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xEB19191F);
        canvas.drawRoundRect(pill, halfH, halfH, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(u);
        paint.setColor((ambient & 0x00FFFFFF) | (255 << 24));
        canvas.drawRoundRect(pill, halfH, halfH, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFF3F3F5);
        canvas.drawText(label, x, midY - (paint.ascent() + paint.descent()) / 2f, paint);
    }

    private static void drawMarker(Canvas canvas, Paint paint, Context context,
                                   AaAlertRail.Entry entry, float x, float y, float scale, float u) {
        if (entry.speed > 0) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.WHITE);
            canvas.drawCircle(x, y, 20f * u * scale, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(4f * u * scale);
            paint.setColor(0xFFE52329);
            canvas.drawCircle(x, y, 18f * u * scale, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.BLACK);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextSize((entry.speed >= 100 ? 13f : 16f) * u * scale);
            canvas.drawText(String.valueOf(entry.speed), x,
                    y - (paint.ascent() + paint.descent()) / 2f, paint);
            return;
        }
        Bitmap icon = Signs.alertIcon(context, entry.rawIcon);
        if (icon == null) return;
        float half = 18f * u * scale;
        paint.setStyle(Paint.Style.FILL);
        paint.setAlpha(255);
        paint.setColorFilter(null);
        paint.setFilterBitmap(true);
        canvas.drawBitmap(icon, null, new RectF(x - half, y - half, x + half, y + half), paint);
    }

    private static void drawDistance(Canvas canvas, Paint paint, int meters, float x, float baseline,
                                     float maxWidth, float u) {
        String text = formatDistance(meters);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFF3F3F5);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextSize(DISTANCE_TEXT * u);
        float measured = paint.measureText(text);
        if (measured > maxWidth) paint.setTextSize(DISTANCE_TEXT * u * maxWidth / measured);
        canvas.drawText(text, x, baseline, paint);
    }

    private static String formatDistance(int meters) {
        String imperial = Units.imperialDistance(meters, false);
        if (imperial != null) return imperial;
        if (meters < 1000) return meters + " m";
        if (meters < 10000) return String.format(Locale.US, "%.1f km", meters / 1000f);
        return Math.round(meters / 1000f) + " km";
    }
}
