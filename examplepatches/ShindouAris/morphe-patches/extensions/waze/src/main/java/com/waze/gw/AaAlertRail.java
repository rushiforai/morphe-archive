package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

/**
 * Upcoming-alert list (the phone's "V1" vertical rail) for the Android Auto renderer.
 *
 * Android Auto shows only what Waze's own GL surface draws, so the phone's View based rail cannot
 * appear there. This class renders the same list, nearest alert first, into a Bitmap with plain
 * Canvas calls; {@link AaSpeedo} uploads it as a texture and draws it like the speedometer overlay.
 * It has no GL state, so it stays cheap to reason about on the render thread.
 */
final class AaAlertRail {
    static final class Entry {
        final String rawIcon;
        final String distance;
        final int meters;
        final int speed;

        Entry(String rawIcon, String distance, int meters, int speed) {
            this.rawIcon = rawIcon;
            this.distance = distance;
            this.meters = meters;
            this.speed = speed;
        }
    }

    /** Alerts further away than this are not listed (same 2 km cap as the traffic bubble). */
    static final int MAX_ALERT_METERS = 2000;

    private AaAlertRail() { }

    /**
     * The alerts the phone rail would show: nearest first, one per type, and no speed drop equal
     * to the limit already in force. Same rules as {@code UpcomingAlertRail.readEntries}.
     */
    static List<Entry> entries(int max) {
        ArrayList<Entry> out = new ArrayList<Entry>();
        List<String> snapshot = Gateway.hudAlerts;
        if (snapshot == null) return out;
        HashSet<String> seen = new HashSet<String>();
        for (String row : snapshot) {
            try {
                String[] p = row.split("\\t", -1);
                if (p.length < 5) continue;
                int meters = Integer.parseInt(p[3]);
                if (meters < 0 || meters > MAX_ALERT_METERS) continue;   // far look-aheads are noise
                String rawIcon = p[4] != null ? p[4] : "";
                int speed = speedFromIcon(rawIcon);
                if (speed > 0 && speed == Gateway.hudLimit) continue;
                String key = speed > 0 ? "speed" : rawIcon.toLowerCase(Locale.US);
                if (key.length() == 0 || !seen.add(key)) continue;
                out.add(new Entry(rawIcon, p[2], meters, speed));
            } catch (Throwable ignored) { }
        }
        Collections.sort(out, new Comparator<Entry>() {
            @Override public int compare(Entry a, Entry b) { return a.meters - b.meters; }
        });
        return out.size() > max ? new ArrayList<Entry>(out.subList(0, max)) : out;
    }

    /** Changes exactly when the rendered picture would change. */
    static String signature(List<Entry> entries, int sizePercent, int dpi) {
        StringBuilder s = new StringBuilder().append(sizePercent).append('@').append(dpi);
        for (Entry e : entries) s.append('|').append(e.rawIcon).append(':').append(label(e));
        return s.toString();
    }

    /** Vertical list: dark translucent panel, one grey-ringed speed sign or alert icon per row. */
    static Bitmap render(Context context, List<Entry> entries, int sizePercent, int dpi) {
        if (context == null || entries == null || entries.isEmpty()) return null;
        float d = Math.max(0.75f, dpi / 160f) * sizePercent / 100f;
        int count = entries.size();
        float pad = 5f * d;
        float itemWidth = 66f * d;
        float itemHeight = 85f * d;
        float gap = 7f * d;
        int width = Math.round(itemWidth + 2f * pad);
        int height = Math.round(count * itemHeight + (count - 1) * gap + 2f * pad);

        Bitmap bitmap = Bitmap.createBitmap(Math.max(1, width), Math.max(1, height),
                Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        RectF panel = new RectF(0f, 0f, width, height);
        float radius = 14f * d;
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xA619191F);
        canvas.drawRoundRect(panel, radius, radius, paint);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(Math.max(1f, d));
        paint.setColor(0x443F3F48);
        float half = paint.getStrokeWidth() / 2f;
        canvas.drawRoundRect(new RectF(half, half, width - half, height - half), radius, radius,
                paint);

        for (int i = 0; i < count; i++) {
            Entry entry = entries.get(i);
            float top = pad + i * (itemHeight + gap);
            float cx = pad + itemWidth / 2f;
            float cy = top + (3f + 29f) * d;
            if (entry.speed > 0) drawSpeedSign(canvas, paint, cx, cy, entry.speed, d);
            else drawAlertIcon(canvas, paint, context, entry.rawIcon, cx, cy, d);
            drawDistance(canvas, paint, label(entry), cx, top + (3f + 58f + 3f + 14f) * d,
                    itemWidth, d);
        }
        return bitmap;
    }

    /** White disc with a grey ring: grey means "upcoming", not the limit in force. */
    private static void drawSpeedSign(Canvas canvas, Paint paint, float cx, float cy, int speed,
                                      float d) {
        float radius = 29f * d;
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFFFFFFF);
        canvas.drawCircle(cx, cy, radius, paint);
        float ring = 6f * d;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(ring);
        paint.setColor(0xFF9A9AA1);
        canvas.drawCircle(cx, cy, radius - ring / 2f, paint);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFF000000);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextSize((speed >= 100 ? 23f : 27f) * d);
        canvas.drawText(String.valueOf(speed), cx, cy - (paint.ascent() + paint.descent()) / 2f,
                paint);
    }

    private static void drawAlertIcon(Canvas canvas, Paint paint, Context context, String rawIcon,
                                      float cx, float cy, float d) {
        Bitmap icon = Signs.alertIcon(context, rawIcon);
        if (icon == null || icon.getWidth() <= 0 || icon.getHeight() <= 0) return;
        float box = 52f * d;
        float scale = Math.min(box / icon.getWidth(), box / icon.getHeight());
        float w = icon.getWidth() * scale;
        float h = icon.getHeight() * scale;
        paint.setStyle(Paint.Style.FILL);
        paint.setAlpha(255);
        paint.setColorFilter(null);
        paint.setFilterBitmap(true);
        canvas.drawBitmap(icon, null, new RectF(cx - w / 2f, cy - h / 2f, cx + w / 2f, cy + h / 2f),
                paint);
    }

    private static void drawDistance(Canvas canvas, Paint paint, String text, float cx,
                                     float baseline, float maxWidth, float d) {
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xFFF3F3F5);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextSize(14f * d);
        float measured = paint.measureText(text);
        if (measured > maxWidth) paint.setTextSize(14f * d * maxWidth / measured);
        canvas.drawText(text, cx, baseline, paint);
    }

    private static String label(Entry entry) {
        if (entry.distance != null && entry.distance.length() > 0) return entry.distance;
        String imperial = Units.imperialDistance(entry.meters, false);
        if (imperial != null) return imperial;
        if (entry.meters < 1000) return entry.meters + " m";
        if (entry.meters < 10000)
            return String.format(Locale.US, "%.1f km", entry.meters / 1000f);
        return Math.round(entry.meters / 1000f) + " km";
    }

    private static int speedFromIcon(String rawIcon) {
        if (rawIcon == null || !rawIcon.toLowerCase(Locale.US).startsWith("speeddrop_")) return -1;
        try {
            int speed = Integer.parseInt(rawIcon.substring(10));
            return speed >= 10 && speed <= 160 ? speed : -1;
        } catch (Throwable ignored) {
            return -1;
        }
    }
}
