package org.ungoogled.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A 24 x 24 icon drawn from its SVG path data, in any colour. The Save sheet's
 * flag, star, heart, list and checkbox are Compose icons compiled into Maps' code,
 * not resources, so they are drawn here: the flag and list traced off Maps' own
 * sheet, the rest the standard Material shapes they match. Understands the
 * commands those shapes use: M L H V C S Z, absolute and relative. Filled
 * even-odd, so an inner contour is always a hole.
 */
final class PathIcon extends Drawable {
    /** Want to go: a pennant with a swallowtail, as Maps draws it. */
    static final String FLAG = "M4,4H20L17,9L20,14H6V20H4ZM6,6V12H16.5L14.75,9L16.5,6Z";
    static final String STAR = "M22,9.24l-7.19,-0.62L12,2 9.19,8.63 2,9.24l5.46,4.73L5.82,21 12,17.27 18.18,21l-1.63,-7.03L22,9.24z"
            + "M12,15.4l-3.76,2.27 1,-4.28 -3.32,-2.88 4.38,-0.38L12,6.1l1.71,4.04 4.38,0.38 -3.32,2.88 1,4.28L12,15.4z";
    static final String HEART = "M16.5,3c-1.74,0 -3.41,0.81 -4.5,2.09C10.91,3.81 9.24,3 7.5,3 4.42,3 2,5.42 2,8.5"
            + "c0,3.78 3.4,6.86 8.55,11.54L12,21.35l1.45,-1.32C18.6,15.36 22,12.28 22,8.5 22,5.42 19.58,3 16.5,3z"
            + "M12.1,18.55l-0.1,0.1 -0.1,-0.1C7.14,14.24 4,11.39 4,8.5 4,6.5 5.5,5 7.5,5c1.54,0 3.04,0.99 3.57,2.36h1.87"
            + "C13.46,5.99 14.96,5 16.5,5c2,0 3.5,1.5 3.5,3.5 0,2.89 -3.14,5.74 -7.9,10.05z";
    /** A list of the user's own: round bullets, as Maps draws it. */
    static final String LIST = dot(4.1f, 8, 1.1f) + dot(4.1f, 12, 1.1f) + dot(4.1f, 16, 1.1f)
            + "M7,7.1h14v1.8H7zM7,11.1h14v1.8H7zM7,15.1h14v1.8H7z";
    static final String CHECK_OFF = "M19,5v14H5V5h14m0,-2H5c-1.11,0 -2,0.9 -2,2v14c0,1.1 0.89,2 2,2h14c1.1,0 2,-0.9 2,-2V5"
            + "c0,-1.1 -0.9,-2 -2,-2z";
    /** Filled box with the tick cut out of it, so the sheet shows through the tick. */
    static final String CHECK_ON = "M19,3H5c-1.11,0 -2,0.9 -2,2v14c0,1.1 0.89,2 2,2h14c1.1,0 2,-0.9 2,-2V5c0,-1.1 -0.9,-2 -2,-2z"
            + "M10,17l-5,-5 1.41,-1.41L10,14.17l7.59,-7.59L19,8l-9,9z";
    static final String BOOKMARK = "M17,3H7c-1.1,0 -1.99,0.9 -1.99,2L5,21l7,-3 7,3V5c0,-1.1 -0.9,-2 -2,-2z";
    // The You screen's rows that Maps has no drawable for: standard Material shapes.
    static final String LABEL = "M17.63,5.84C17.27,5.33 16.67,5 16,5L5,5.01C3.9,5.01 3,5.9 3,7v10c0,1.1 0.9,1.99 2,1.99L16,19"
            + "c0.67,0 1.27,-0.33 1.63,-0.84L22,12l-4.37,-6.16zM16,17H5V7h11l3.55,5L16,17z";
    static final String TIMELINE = "M23,8c0,1.1 -0.9,2 -2,2 -0.18,0 -0.35,-0.02 -0.51,-0.07l-3.56,3.55c0.05,0.16 0.07,0.34 0.07,0.52"
            + " 0,1.1 -0.9,2 -2,2s-2,-0.9 -2,-2c0,-0.18 0.02,-0.36 0.07,-0.52l-2.55,-2.55c-0.16,0.05 -0.34,0.07 -0.52,0.07"
            + "s-0.36,-0.02 -0.52,-0.07l-4.55,4.56c0.05,0.16 0.07,0.33 0.07,0.51 0,1.1 -0.9,2 -2,2s-2,-0.9 -2,-2 0.9,-2 2,-2"
            + "c0.18,0 0.35,0.02 0.51,0.07l4.56,-4.55C8.02,9.36 8,9.18 8,9c0,-1.1 0.9,-2 2,-2s2,0.9 2,2c0,0.18 -0.02,0.36 -0.07,0.52"
            + "l2.55,2.55c0.16,-0.05 0.34,-0.07 0.52,-0.07s0.36,0.02 0.52,0.07l3.55,-3.56C19.02,8.35 19,8.18 19,8c0,-1.1 0.9,-2 2,-2"
            + "s2,0.9 2,2z";
    static final String DOWNLOAD = "M19,9h-4V3H9v6H5l7,7 7,-7zM5,18v2h14v-2H5z";
    static final String UPLOAD = "M9,16h6v-6h4l-7,-7 -7,7h4zM5,18h14v2H5z";
    static final String NEAR_ME = "M21,3L3,10.53v0.98l6.84,2.65L12.48,21h0.98L21,3z";
    /** A place with no photo: Maps' outlined pin. */
    static final String PIN = "M12,2C8.13,2 5,5.13 5,9c0,5.25 7,13 7,13s7,-7.75 7,-13c0,-3.87 -3.13,-7 -7,-7z"
            + "M7,9c0,-2.76 2.24,-5 5,-5s5,2.24 5,5c0,2.88 -2.88,7.19 -5,9.88C9.92,16.21 7,11.85 7,9z"
            + "M12,6.5c-1.38,0 -2.5,1.12 -2.5,2.5s1.12,2.5 2.5,2.5 2.5,-1.12 2.5,-2.5 -1.12,-2.5 -2.5,-2.5z";
    static final String ARROW_DROP_DOWN = "M7,10l5,5 5,-5z";
    static final String EXPAND_MORE = "M16.59,8.59L12,13.17 7.41,8.59 6,10l6,6 6,-6z";
    static final String EXPAND_LESS = "M12,8l-6,6 1.41,1.41L12,10.83l4.59,4.58L18,14z";
    static final String SEARCH = "M15.5,14h-0.79l-0.28,-0.27C15.41,12.59 16,11.11 16,9.5 16,5.91 13.09,3 9.5,3S3,5.91 3,9.5"
            + " 5.91,16 9.5,16c1.61,0 3.09,-0.59 4.23,-1.57l0.27,0.28v0.79l5,4.99L20.49,19l-4.99,-5zM9.5,14"
            + "C7.01,14 5,11.99 5,9.5S7.01,5 9.5,5 14,7.01 14,9.5 11.99,14 9.5,14z";
    static final String ADD = "M19,13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z";
    static final String WORK = "M14,6V4h-4v2h4zM4,8v11h16V8H4zM20,6c1.11,0 2,0.89 2,2v11c0,1.11 -0.89,2 -2,2H4"
            + "c-1.11,0 -2,-0.89 -2,-2l0.01,-11c0,-1.11 0.88,-2 1.99,-2h4V4c0,-1.11 0.89,-2 2,-2h4c1.11,0 2,0.89 2,2v2h4z";

    private final Path path = new Path();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    PathIcon(String data, int color) {
        parse(data, path);
        path.setFillType(Path.FillType.EVEN_ODD);
        paint.setColor(color);
        paint.setStyle(Paint.Style.FILL);
    }

    @Override public void draw(Canvas c) {
        Rect b = getBounds();
        c.save();
        c.translate(b.left, b.top);
        c.scale(b.width() / 24f, b.height() / 24f);
        c.drawPath(path, paint);
        c.restore();
    }

    /**
     * 24 dp, as Maps' own icons are. With no size of its own the icon filled whatever centred it --
     * the You page's 48 dp search button drew its magnifier twice Maps' size.
     */
    private static final int SIZE = Math.round(24 * android.content.res.Resources.getSystem().getDisplayMetrics().density);

    @Override public int getIntrinsicWidth() { return SIZE; }
    @Override public int getIntrinsicHeight() { return SIZE; }
    @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
    @Override public void setColorFilter(ColorFilter f) { paint.setColorFilter(f); invalidateSelf(); }
    @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }

    /** A filled circle of radius [r] at ([cx], [cy]), as four cubic curves. */
    private static String dot(float cx, float cy, float r) {
        float k = 0.5523f * r;
        return String.format(java.util.Locale.US,
                "M%f,%fC%f,%f %f,%f %f,%fC%f,%f %f,%f %f,%fC%f,%f %f,%f %f,%fC%f,%f %f,%f %f,%fZ",
                cx + r, cy,
                cx + r, cy + k, cx + k, cy + r, cx, cy + r,
                cx - k, cy + r, cx - r, cy + k, cx - r, cy,
                cx - r, cy - k, cx - k, cy - r, cx, cy - r,
                cx + k, cy - r, cx + r, cy - k, cx + r, cy);
    }

    private static final Pattern SEGMENT = Pattern.compile("([MmLlHhVvCcSsZz])([^MmLlHhVvCcSsZz]*)");
    private static final Pattern NUMBER = Pattern.compile("-?(?:\\d+\\.?\\d*|\\.\\d+)(?:[eE][-+]?\\d+)?");

    static void parse(String d, Path p) {
        float x = 0, y = 0, startX = 0, startY = 0, ctrlX = 0, ctrlY = 0;
        char prev = 0;
        Matcher seg = SEGMENT.matcher(d);
        while (seg.find()) {
            char cmd = seg.group(1).charAt(0);
            List<Float> n = new ArrayList<>();
            Matcher num = NUMBER.matcher(seg.group(2));
            while (num.find()) n.add(Float.parseFloat(num.group()));
            boolean rel = Character.isLowerCase(cmd);
            char op = Character.toUpperCase(cmd);
            if (op == 'Z') {
                p.close();
                x = startX; y = startY;
                prev = 'Z';
                continue;
            }
            int arity = op == 'H' || op == 'V' ? 1 : op == 'C' ? 6 : op == 'S' ? 4 : 2;
            for (int i = 0; i + arity <= n.size(); i += arity) {
                float ox = rel ? x : 0, oy = rel ? y : 0;
                switch (op) {
                    case 'M':
                        x = ox + n.get(i); y = oy + n.get(i + 1);
                        if (i == 0) { p.moveTo(x, y); startX = x; startY = y; } else p.lineTo(x, y);
                        break;
                    case 'L':
                        x = ox + n.get(i); y = oy + n.get(i + 1);
                        p.lineTo(x, y);
                        break;
                    case 'H':
                        x = ox + n.get(i);
                        p.lineTo(x, y);
                        break;
                    case 'V':
                        y = oy + n.get(i);
                        p.lineTo(x, y);
                        break;
                    case 'C': {
                        float x1 = ox + n.get(i), y1 = oy + n.get(i + 1);
                        ctrlX = ox + n.get(i + 2); ctrlY = oy + n.get(i + 3);
                        x = ox + n.get(i + 4); y = oy + n.get(i + 5);
                        p.cubicTo(x1, y1, ctrlX, ctrlY, x, y);
                        break;
                    }
                    case 'S': {
                        // First control point: the previous curve's second one, reflected.
                        boolean curve = prev == 'C' || prev == 'S';
                        float x1 = curve ? 2 * x - ctrlX : x, y1 = curve ? 2 * y - ctrlY : y;
                        ctrlX = ox + n.get(i); ctrlY = oy + n.get(i + 1);
                        x = ox + n.get(i + 2); y = oy + n.get(i + 3);
                        p.cubicTo(x1, y1, ctrlX, ctrlY, x, y);
                        break;
                    }
                    default:
                        break;
                }
                prev = op == 'M' ? 'L' : op;
            }
        }
    }
}
