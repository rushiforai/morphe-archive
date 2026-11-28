package com.waze.gw;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;

/** Car marker shared by the map's upcoming rail and the traffic bubble. */
final class UpcomingRailCarGlyph {
    private UpcomingRailCarGlyph() { }

    static void draw(Canvas canvas, Paint paint, Path path, float x, float y, float unit) {
        float top = y - 18f * unit, base = y + 15f * unit, notch = y + 8f * unit;
        float half = 14f * unit, curve = 4f * unit;
        path.reset();
        path.moveTo(x, top);
        path.quadTo(x + 2f * unit, top + unit, x + 3f * unit, top + 3f * unit);
        path.lineTo(x + half, base - curve);
        path.quadTo(x + half + unit, base, x + half - curve, base - unit);
        path.lineTo(x, notch);
        path.lineTo(x - half + curve, base - unit);
        path.quadTo(x - half - unit, base, x - half, base - curve);
        path.lineTo(x - 3f * unit, top + 3f * unit);
        path.quadTo(x - 2f * unit, top + unit, x, top);
        path.close();
        paint.setShader(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.WHITE);
        canvas.drawPath(path, paint);

        path.reset();
        float inset = 3f * unit;
        path.moveTo(x, top + inset);
        path.lineTo(x + half - inset, base - inset);
        path.lineTo(x, notch - inset);
        path.lineTo(x - half + inset, base - inset);
        path.close();
        paint.setColor(0xFF19A9E8);
        canvas.drawPath(path, paint);
    }
}
