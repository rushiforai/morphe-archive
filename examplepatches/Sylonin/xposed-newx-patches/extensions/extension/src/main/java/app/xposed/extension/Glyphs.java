package app.xposed.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

import java.util.Locale;

/** X-Posed's badge icons (24x24 viewBox), drawn with android.graphics. */
final class Glyphs {
    private static final float STROKE = 1.8f;

    /** One fill or stroke layer of an icon. */
    static final class Layer {
        final Path path;
        final boolean stroke;
        final float strokeWidth;

        Layer(Path path, boolean stroke, float strokeWidth) {
            this.path = path;
            this.stroke = stroke;
            this.strokeWidth = strokeWidth;
        }
    }

    static final class Glyph {
        private final Layer[] layers;

        Glyph(Layer... layers) {
            this.layers = layers;
        }

        /** The icon as a drawable filling its bounds, for ImageViews. */
        Drawable asDrawable(int color) {
            Glyph glyph = this;
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            return new Drawable() {
                @Override
                public void draw(Canvas canvas) {
                    Rect b = getBounds();
                    glyph.draw(canvas, paint, b.left, b.top, Math.min(b.width(), b.height()), color);
                }

                @Override
                public void setAlpha(int alpha) {
                }

                @Override
                public void setColorFilter(ColorFilter colorFilter) {
                }

                @Override
                public int getOpacity() {
                    return PixelFormat.TRANSLUCENT;
                }
            };
        }

        /** Draws the icon into a size x size box at (left, top). */
        void draw(Canvas canvas, Paint paint, float left, float top, float size, int color) {
            float scale = size / 24f;
            canvas.save();
            canvas.translate(left, top);
            canvas.scale(scale, scale);
            paint.setColor(color);
            for (Layer layer : layers) {
                if (layer.stroke) {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(layer.strokeWidth);
                    paint.setStrokeCap(Paint.Cap.ROUND);
                    paint.setStrokeJoin(Paint.Join.ROUND);
                } else {
                    paint.setStyle(Paint.Style.FILL);
                }
                canvas.drawPath(layer.path, paint);
            }
            canvas.restore();
            paint.setStyle(Paint.Style.FILL);
        }
    }

    static final Glyph INFO = new Glyph(
            new Layer(circle(12, 12, 8.5f), true, STROKE),
            new Layer(svg("M12 11v5M12 7.7h.01"), true, STROKE)
    );

    static final Glyph VPN = new Glyph(
            new Layer(svg("M12 3l7 3v5c0 4.4-3 8-7 10-4-2-7-5.6-7-10V6z"), true, STROKE),
            new Layer(svg("M9.5 12l1.8 1.8L15 9.8"), true, STROKE)
    );

    static final Glyph APPLE = new Glyph(new Layer(svg(
            "M17.05 12.5c-.03-2.5 2.04-3.7 2.13-3.76-1.16-1.7-2.97-1.93-3.61-1.96-1.54-.16-3 .9-3.78.9-.78 0-1.98-.88-3.25-.86"
                    + "-1.67.03-3.21.97-4.07 2.46-1.74 3.02-.45 7.49 1.25 9.94.83 1.2 1.82 2.55 3.12 2.5 1.25-.05 1.72-.81 3.23-.81"
                    + " 1.51 0 1.94.81 3.26.78 1.35-.02 2.2-1.22 3.02-2.43.95-1.39 1.34-2.74 1.36-2.81-.03-.01-2.61-1-2.64-3.99z"
                    + "M14.6 5.1c.69-.83 1.15-1.99 1.02-3.14-.99.04-2.19.66-2.9 1.49-.64.73-1.2 1.91-1.05 3.03 1.1.09 2.24-.56 2.93-1.38z"
    ), false, 0));

    static final Glyph ANDROID = new Glyph(
            new Layer(svg("M8.8 5.3 7.6 3.6M15.2 5.3l1.2-1.7"), true, 1.2f),
            new Layer(androidHead(), false, 0),
            new Layer(androidBody(), false, 0)
    );

    static final Glyph WEB = new Glyph(
            new Layer(circle(12, 12, 8.2f), true, STROKE),
            new Layer(svg("M3.8 12h16.4M12 3.8c2.4 2.2 3.7 5.1 3.7 8.2s-1.3 6-3.7 8.2c-2.4-2.2-3.7-5.1-3.7-8.2S9.6 6 12 3.8z"), true, STROKE)
    );

    // The original question mark starts with an arc; approximated with a cubic.
    static final Glyph UNKNOWN_DEVICE = new Glyph(
            new Layer(circle(12, 12, 8.2f), true, STROKE),
            new Layer(svg("M9.7 9.4C9.9 6.9 14.3 7.3 14.2 10c0 1.5-2.2 1.9-2.2 3.3M12 16.4h.01"), true, STROKE)
    );

    private Glyphs() {
    }

    /** Same classification as X-Posed's classifyDevice(). */
    static Glyph forSource(String source) {
        String s = source == null ? "" : source.toLowerCase(Locale.ROOT);
        if (s.contains("android")) return ANDROID;
        for (String token : new String[]{"app store", "iphone", "ipad", "ios", "mac", "os x"}) {
            if (s.contains(token)) return APPLE;
        }
        if (s.contains("web")) return WEB;
        return UNKNOWN_DEVICE;
    }

    /** Head with the eyes cut out. */
    private static Path androidHead() {
        Path p = svg("M12 5C8.9 5 6.4 7.3 6.2 10.2h11.6C17.6 7.3 15.1 5 12 5z");
        p.setFillType(Path.FillType.EVEN_ODD);
        p.addCircle(9.7f, 7.32f, 0.78f, Path.Direction.CW);
        p.addCircle(14.3f, 7.32f, 0.78f, Path.Direction.CW);
        return p;
    }

    /** Body, legs and arms; legs overlap the body, so this layer uses the default fill rule. */
    private static Path androidBody() {
        Path body = new Path();
        roundRect(body, 6.4f, 11, 11.2f, 7.3f, 1.2f);
        roundRect(body, 8.7f, 17.8f, 2, 3.4f, 1);
        roundRect(body, 13.3f, 17.8f, 2, 3.4f, 1);
        roundRect(body, 3.7f, 11.5f, 2, 5.2f, 1);
        roundRect(body, 18.3f, 11.5f, 2, 5.2f, 1);
        return body;
    }

    private static void roundRect(Path path, float x, float y, float w, float h, float r) {
        path.addRoundRect(new RectF(x, y, x + w, y + h), r, r, Path.Direction.CW);
    }

    private static Path circle(float cx, float cy, float r) {
        Path p = new Path();
        p.addCircle(cx, cy, r, Path.Direction.CW);
        return p;
    }

    /** Minimal SVG path parser: M L H V C S Z, absolute and relative. */
    static Path svg(String d) {
        Path path = new Path();
        float[] args = new float[6];
        float x = 0, y = 0, startX = 0, startY = 0, ctrlX = 0, ctrlY = 0;
        char cmd = 0, prev = 0;
        int i = 0, n = d.length();
        while (i < n) {
            char c = d.charAt(i);
            if (Character.isWhitespace(c) || c == ',') {
                i++;
                continue;
            }
            if (Character.isLetter(c)) {
                cmd = c;
                i++;
                if (cmd == 'z' || cmd == 'Z') {
                    path.close();
                    x = startX;
                    y = startY;
                    prev = cmd;
                }
                continue;
            }
            boolean rel = Character.isLowerCase(cmd);
            char op = Character.toUpperCase(cmd);
            int count = op == 'C' ? 6 : op == 'S' ? 4 : (op == 'H' || op == 'V') ? 1 : 2;
            for (int k = 0; k < count; k++) {
                while (i < n && (Character.isWhitespace(d.charAt(i)) || d.charAt(i) == ',')) i++;
                int end = numberEnd(d, i);
                args[k] = Float.parseFloat(d.substring(i, end));
                i = end;
            }
            float ox = rel ? x : 0, oy = rel ? y : 0;
            switch (op) {
                case 'M':
                    x = ox + args[0];
                    y = oy + args[1];
                    path.moveTo(x, y);
                    startX = x;
                    startY = y;
                    // Further coordinate pairs are implicit line-tos.
                    cmd = rel ? 'l' : 'L';
                    break;
                case 'L':
                    x = ox + args[0];
                    y = oy + args[1];
                    path.lineTo(x, y);
                    break;
                case 'H':
                    x = ox + args[0];
                    path.lineTo(x, y);
                    break;
                case 'V':
                    y = oy + args[0];
                    path.lineTo(x, y);
                    break;
                case 'C':
                    path.cubicTo(ox + args[0], oy + args[1], ox + args[2], oy + args[3], ox + args[4], oy + args[5]);
                    ctrlX = ox + args[2];
                    ctrlY = oy + args[3];
                    x = ox + args[4];
                    y = oy + args[5];
                    break;
                case 'S': {
                    char p = Character.toUpperCase(prev);
                    float c1x = (p == 'C' || p == 'S') ? 2 * x - ctrlX : x;
                    float c1y = (p == 'C' || p == 'S') ? 2 * y - ctrlY : y;
                    path.cubicTo(c1x, c1y, ox + args[0], oy + args[1], ox + args[2], oy + args[3]);
                    ctrlX = ox + args[0];
                    ctrlY = oy + args[1];
                    x = ox + args[2];
                    y = oy + args[3];
                    break;
                }
                default:
                    throw new IllegalArgumentException("Unsupported path command " + cmd);
            }
            prev = op;
        }
        return path;
    }

    /** End of an SVG number starting at i; handles "-.03-2.5" and ".78.78" style runs. */
    private static int numberEnd(String d, int i) {
        int j = i;
        if (j < d.length() && (d.charAt(j) == '-' || d.charAt(j) == '+')) j++;
        boolean dot = false;
        while (j < d.length()) {
            char c = d.charAt(j);
            if (c >= '0' && c <= '9') {
                j++;
            } else if (c == '.' && !dot) {
                dot = true;
                j++;
            } else {
                break;
            }
        }
        return j;
    }
}
