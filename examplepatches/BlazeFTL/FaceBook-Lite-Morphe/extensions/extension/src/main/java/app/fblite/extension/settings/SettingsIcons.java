package app.fblite.extension.settings;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/**
 * Material icons for the settings screen, drawn from 24 x 24 vector path data, since the extension
 * cannot add drawable resources.
 */
final class SettingsIcons {
    static final String ARROW_BACK =
            "M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z";

    static final String FORMAT_SIZE =
            "M9 4v3h5v12h3V7h5V4H9zm-6 8h3v7h3v-7h3V9H3v3z";

    static final String DOWNLOAD =
            "M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z";

    static final String HD =
            "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-8 12H9.5v-2h-2v2H6V9h1.5v2.5h2V9H11v6zm2-6h4c.55 0 1 .45 1 1v4c0 .55-.45 1-1 1h-4V9zm1.5 4.5h2v-3h-2v3z";

    static final String SKIP_NEXT =
            "M6 18l8.5-6L6 6v12zM16 6v12h2V6h-2z";

    static final String FAST_FORWARD =
            "M4 18l8.5-6L4 6v12zm9-12v12l8.5-6L13 6z";

    static final String TOUCH_APP =
            "M9 11.24V7.5C9 6.12 10.12 5 11.5 5S14 6.12 14 7.5v3.74c1.21-.81 2-2.18 2-3.74C16 5.01 13.99 3 11.5 3S7 5.01 7 7.5c0 1.56.79 2.93 2 3.74zm9.84 4.63l-4.54-2.26c-.17-.07-.35-.11-.54-.11H13v-6c0-.83-.67-1.5-1.5-1.5S10 6.67 10 7.5v10.74l-3.43-.72c-.08-.01-.15-.03-.24-.03-.31 0-.59.13-.79.33l-.79.8 4.94 4.94c.27.27.65.44 1.06.44h6.79c.75 0 1.33-.55 1.44-1.28l.75-5.27c.01-.07.02-.14.02-.2 0-.62-.38-1.16-.91-1.38z";

    static final String VISIBILITY_OFF =
            "M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z";

    static final String MOVIE =
            "M18 4l2 4h-3l-2-4h-2l2 4h-3l-2-4H8l2 4H7L5 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V4h-4z";

    static final String VIEW_CAROUSEL =
            "M7 19h10V4H7v15zm-5-2h4V6H2v11zM18 6v11h4V6h-4z";

    static final String PERSON =
            "M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z";

    static final String ACCOUNT_CIRCLE =
            "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z";

    static final String BLOCK =
            "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zM4 12c0-4.42 3.58-8 8-8 1.85 0 3.55.63 4.9 1.69L5.69 16.9C4.63 15.55 4 13.85 4 12zm8 8c-1.85 0-3.55-.63-4.9-1.69L18.31 7.1C19.37 8.45 20 10.15 20 12c0 4.42-3.58 8-8 8z";

    static final String BUG_REPORT =
            "M20 8h-2.81c-.45-.78-1.07-1.45-1.82-1.96L17 4.41 15.59 3l-2.17 2.17C12.96 5.06 12.49 5 12 5c-.49 0-.96.06-1.41.17L8.41 3 7 4.41l1.62 1.63C7.88 6.55 7.26 7.22 6.81 8H4v2h2.09c-.05.33-.09.66-.09 1v1H4v2h2v1c0 .34.04.67.09 1H4v2h2.81c1.04 1.79 2.97 3 5.19 3s4.15-1.21 5.19-3H20v-2h-2.09c.05-.33.09-.66.09-1v-1h2v-2h-2v-1c0-.34-.04-.67-.09-1H20V8zm-6 8h-4v-2h4v2zm0-4h-4v-2h4v2z";

    static final String DESCRIPTION =
            "M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z";

    static final String DELETE =
            "M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z";

    static final String REFRESH =
            "M17.65 6.35C16.2 4.9 14.21 4 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08c-.82 2.33-3.04 4-5.65 4-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z";

    static final String INFO =
            "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z";

    private SettingsIcons() {
    }

    static Drawable get(String pathData, int color) {
        Path path;
        try {
            path = parse(pathData);
        } catch (RuntimeException e) {
            // A bad path only costs the icon, never the settings screen.
            path = new Path();
        }
        return new Icon(path, color);
    }

    private static final class Icon extends Drawable {
        private final Path path;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        Icon(Path path, int color) {
            this.path = path;
            paint.setColor(color);
            paint.setStyle(Paint.Style.FILL);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            int save = canvas.save();
            canvas.translate(bounds.left, bounds.top);
            canvas.scale(bounds.width() / 24f, bounds.height() / 24f);
            canvas.drawPath(path, paint);
            canvas.restoreToCount(save);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static final class Scanner {
        private final String text;
        private int index;

        Scanner(String text) {
            this.text = text;
        }

        private void skipSeparators() {
            while (index < text.length()) {
                char c = text.charAt(index);
                if (c == ' ' || c == ',' || c == '\t' || c == '\n') index++;
                else break;
            }
        }

        boolean more() {
            skipSeparators();
            return index < text.length();
        }

        /** Returns the next command letter, or 0 when numbers follow (the previous command repeats). */
        char command() {
            skipSeparators();
            char c = text.charAt(index);
            if (Character.isLetter(c)) {
                index++;
                return c;
            }
            return 0;
        }

        float number() {
            skipSeparators();
            int start = index;
            if (index < text.length() && (text.charAt(index) == '-' || text.charAt(index) == '+')) index++;
            boolean dot = false;
            while (index < text.length()) {
                char c = text.charAt(index);
                if (c >= '0' && c <= '9') {
                    index++;
                } else if (c == '.' && !dot) {
                    dot = true;
                    index++;
                } else {
                    break;
                }
            }
            return Float.parseFloat(text.substring(start, index));
        }

        /** Arc flags are a single 0 or 1 and may be written without a separator after them. */
        boolean flag() {
            skipSeparators();
            return text.charAt(index++) == '1';
        }
    }

    private static Path parse(String data) {
        Path path = new Path();
        Scanner s = new Scanner(data);
        float cx = 0, cy = 0, startX = 0, startY = 0, lastCtrlX = 0, lastCtrlY = 0;
        char cmd = 0;
        boolean prevCubic = false;
        while (s.more()) {
            char c = s.command();
            if (c != 0) cmd = c;
            boolean rel = Character.isLowerCase(cmd);
            char u = Character.toUpperCase(cmd);
            float ox = rel ? cx : 0;
            float oy = rel ? cy : 0;
            boolean cubic = false;
            switch (u) {
                case 'M':
                    cx = startX = ox + s.number();
                    cy = startY = oy + s.number();
                    path.moveTo(cx, cy);
                    cmd = rel ? 'l' : 'L';
                    break;
                case 'L':
                    cx = ox + s.number();
                    cy = oy + s.number();
                    path.lineTo(cx, cy);
                    break;
                case 'H':
                    cx = ox + s.number();
                    path.lineTo(cx, cy);
                    break;
                case 'V':
                    cy = oy + s.number();
                    path.lineTo(cx, cy);
                    break;
                case 'C': {
                    float x1 = ox + s.number(), y1 = oy + s.number();
                    float x2 = ox + s.number(), y2 = oy + s.number();
                    float x = ox + s.number(), y = oy + s.number();
                    path.cubicTo(x1, y1, x2, y2, x, y);
                    lastCtrlX = x2;
                    lastCtrlY = y2;
                    cx = x;
                    cy = y;
                    cubic = true;
                    break;
                }
                case 'S': {
                    float x1 = prevCubic ? 2 * cx - lastCtrlX : cx;
                    float y1 = prevCubic ? 2 * cy - lastCtrlY : cy;
                    float x2 = ox + s.number(), y2 = oy + s.number();
                    float x = ox + s.number(), y = oy + s.number();
                    path.cubicTo(x1, y1, x2, y2, x, y);
                    lastCtrlX = x2;
                    lastCtrlY = y2;
                    cx = x;
                    cy = y;
                    cubic = true;
                    break;
                }
                case 'Q': {
                    float x1 = ox + s.number(), y1 = oy + s.number();
                    float x = ox + s.number(), y = oy + s.number();
                    path.quadTo(x1, y1, x, y);
                    cx = x;
                    cy = y;
                    break;
                }
                case 'A': {
                    float rx = s.number(), ry = s.number(), rotation = s.number();
                    boolean large = s.flag();
                    boolean sweep = s.flag();
                    float x = ox + s.number(), y = oy + s.number();
                    arc(path, cx, cy, rx, ry, rotation, large, sweep, x, y);
                    cx = x;
                    cy = y;
                    break;
                }
                case 'Z':
                    path.close();
                    cx = startX;
                    cy = startY;
                    cmd = 0;
                    break;
                default:
                    return path;
            }
            prevCubic = cubic;
        }
        return path;
    }

    /** Appends an SVG elliptical arc as cubic curves of at most a quarter turn each. */
    private static void arc(Path path, float x0, float y0, float rxIn, float ryIn, float rotation,
                            boolean large, boolean sweep, float x, float y) {
        double rx = Math.abs(rxIn);
        double ry = Math.abs(ryIn);
        if (rx == 0 || ry == 0 || (x0 == x && y0 == y)) {
            path.lineTo(x, y);
            return;
        }
        double phi = Math.toRadians(rotation);
        double cos = Math.cos(phi);
        double sin = Math.sin(phi);
        double dx = (x0 - x) / 2.0;
        double dy = (y0 - y) / 2.0;
        double x1 = cos * dx + sin * dy;
        double y1 = -sin * dx + cos * dy;
        double scale = x1 * x1 / (rx * rx) + y1 * y1 / (ry * ry);
        if (scale > 1) {
            double k = Math.sqrt(scale);
            rx *= k;
            ry *= k;
        }
        double num = rx * rx * ry * ry - rx * rx * y1 * y1 - ry * ry * x1 * x1;
        double den = rx * rx * y1 * y1 + ry * ry * x1 * x1;
        double coef = Math.sqrt(Math.max(0, num / den));
        if (large == sweep) coef = -coef;
        double cx1 = coef * rx * y1 / ry;
        double cy1 = -coef * ry * x1 / rx;
        double cx = cos * cx1 - sin * cy1 + (x0 + x) / 2.0;
        double cy = sin * cx1 + cos * cy1 + (y0 + y) / 2.0;
        double start = Math.atan2((y1 - cy1) / ry, (x1 - cx1) / rx);
        double end = Math.atan2((-y1 - cy1) / ry, (-x1 - cx1) / rx);
        double delta = end - start;
        if (sweep && delta < 0) delta += 2 * Math.PI;
        if (!sweep && delta > 0) delta -= 2 * Math.PI;
        int segments = Math.max(1, (int) Math.ceil(Math.abs(delta) / (Math.PI / 2) - 1e-9));
        double step = delta / segments;
        double t = 4.0 / 3.0 * Math.tan(step / 4);
        double a = start;
        for (int i = 0; i < segments; i++) {
            double b = a + step;
            double ca = Math.cos(a), sa = Math.sin(a), cb = Math.cos(b), sb = Math.sin(b);
            double[] p = {ca - t * sa, sa + t * ca, cb + t * sb, sb - t * cb, cb, sb};
            float[] out = new float[6];
            for (int k = 0; k < 6; k += 2) {
                double ex = p[k] * rx;
                double ey = p[k + 1] * ry;
                out[k] = (float) (cos * ex - sin * ey + cx);
                out[k + 1] = (float) (sin * ex + cos * ey + cy);
            }
            path.cubicTo(out[0], out[1], out[2], out[3], out[4], out[5]);
            a = b;
        }
    }
}
