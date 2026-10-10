package app.noam.extension.chesscom.arcade;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.Xml;

import org.xmlpull.v1.XmlPullParser;

import java.io.StringReader;
import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Renders the website's Arcade sprites (Figma SVG exports). It covers only what those files use:
 * M/C/H/V/Z paths, groups with a rect clip, opacity or blur, fills, strokes and gradients.
 */
final class SvgRaster {
    private SvgRaster() {}

    private static final class Element {
        final String name;
        final Map<String, String> attributes = new HashMap<>();
        final List<Element> children = new ArrayList<>();

        Element(String name) {
            this.name = name;
        }

        String get(String key) {
            return attributes.get(key);
        }

        float number(String key, float fallback) {
            String value = attributes.get(key);
            if (value == null) return fallback;
            try {
                return Float.parseFloat(value.trim());
            } catch (NumberFormatException e) {
                return fallback;
            }
        }
    }

    /** Draws {@code svg} at {@code scale} times its own size. */
    static Bitmap render(String svg, float scale) throws Exception {
        Element root = parse(svg);
        int width = Math.max(1, Math.round(root.number("width", 1) * scale));
        int height = Math.max(1, Math.round(root.number("height", 1) * scale));
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.scale(scale, scale);
        Map<String, Element> defs = new HashMap<>();
        collectDefinitions(root, defs);
        String fill = root.get("fill");
        for (Element child : root.children) draw(child, canvas, defs, fill == null ? "black" : fill, scale);
        return bitmap;
    }

    private static Element parse(String svg) throws Exception {
        XmlPullParser parser = Xml.newPullParser();
        parser.setInput(new StringReader(svg));
        List<Element> stack = new ArrayList<>();
        Element root = null;
        for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
            if (event == XmlPullParser.START_TAG) {
                Element element = new Element(parser.getName());
                for (int i = 0; i < parser.getAttributeCount(); i++) {
                    element.attributes.put(parser.getAttributeName(i), parser.getAttributeValue(i));
                }
                if (stack.isEmpty()) root = element;
                else stack.get(stack.size() - 1).children.add(element);
                stack.add(element);
            } else if (event == XmlPullParser.END_TAG) {
                stack.remove(stack.size() - 1);
            }
        }
        if (root == null) throw new IllegalArgumentException("Empty SVG");
        return root;
    }

    private static void collectDefinitions(Element element, Map<String, Element> defs) {
        String id = element.get("id");
        if (id != null) defs.put(id, element);
        for (Element child : element.children) collectDefinitions(child, defs);
    }

    private static void draw(Element element, Canvas canvas, Map<String, Element> defs, String fill, float scale) {
        switch (element.name) {
            case "g":
                drawGroup(element, canvas, defs, element.get("fill") == null ? fill : element.get("fill"), scale);
                break;
            case "path":
                drawPath(element, canvas, defs, fill);
                break;
            default:
                // defs, clipPath, filter and gradients are only referenced.
                break;
        }
    }

    private static void drawGroup(Element group, Canvas canvas, Map<String, Element> defs, String fill, float scale) {
        int saved = canvas.save();
        Element clip = reference(group.get("clip-path"), defs);
        if (clip != null) {
            for (Element shape : clip.children) {
                if (!"rect".equals(shape.name)) continue;
                Path path = new Path();
                path.addRect(shape.number("x", 0), shape.number("y", 0),
                    shape.number("x", 0) + shape.number("width", 0),
                    shape.number("y", 0) + shape.number("height", 0), Path.Direction.CW);
                path.transform(transform(shape.get("transform")));
                canvas.clipPath(path);
            }
        }
        float opacity = group.number("opacity", 1f);
        if (opacity < 1f) canvas.saveLayerAlpha(null, Math.round(opacity * 255));

        Element filter = reference(group.get("filter"), defs);
        float deviation = blurDeviation(filter);
        if (filter != null && deviation > 0) {
            drawBlurred(group, canvas, defs, fill, scale, filter, deviation);
        } else {
            for (Element child : group.children) draw(child, canvas, defs, fill, scale);
        }
        canvas.restoreToCount(saved);
    }

    /** Figma's layer blur: the group drawn alone, blurred, inside the filter region. */
    private static void drawBlurred(Element group, Canvas canvas, Map<String, Element> defs, String fill,
                                    float scale, Element filter, float deviation) {
        float x = filter.number("x", 0), y = filter.number("y", 0);
        float width = filter.number("width", 0), height = filter.number("height", 0);
        int pixelWidth = (int) Math.ceil(width * scale), pixelHeight = (int) Math.ceil(height * scale);
        if (pixelWidth <= 0 || pixelHeight <= 0) return;
        Bitmap layer = Bitmap.createBitmap(pixelWidth, pixelHeight, Bitmap.Config.ARGB_8888);
        Canvas layerCanvas = new Canvas(layer);
        layerCanvas.scale(scale, scale);
        layerCanvas.translate(-x, -y);
        for (Element child : group.children) draw(child, layerCanvas, defs, fill, scale);
        blur(layer, deviation * scale);
        canvas.drawBitmap(layer, null, new RectF(x, y, x + pixelWidth / scale, y + pixelHeight / scale),
            new Paint(Paint.FILTER_BITMAP_FLAG));
        layer.recycle();
    }

    private static float blurDeviation(Element filter) {
        if (filter == null) return 0;
        for (Element primitive : filter.children) {
            if ("feGaussianBlur".equals(primitive.name)) return primitive.number("stdDeviation", 0);
        }
        return 0;
    }

    private static void drawPath(Element element, Canvas canvas, Map<String, Element> defs, String inheritedFill) {
        String d = element.get("d");
        if (d == null) return;
        Path path = path(d);
        float opacity = element.number("opacity", 1f);

        String fill = element.get("fill") == null ? inheritedFill : element.get("fill");
        if (fill != null && !"none".equals(fill)) {
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setStyle(Paint.Style.FILL);
            float alpha = opacity * element.number("fill-opacity", 1f);
            if (!applyPaint(paint, fill, alpha, defs)) return;
            canvas.drawPath(path, paint);
        }
        String stroke = element.get("stroke");
        if (stroke != null && !"none".equals(stroke)) {
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(element.number("stroke-width", 1f));
            float alpha = opacity * element.number("stroke-opacity", 1f);
            if (!applyPaint(paint, stroke, alpha, defs)) return;
            canvas.drawPath(path, paint);
        }
    }

    /** A colour or a url(#gradient) onto {@code paint}; false when it cannot be drawn. */
    private static boolean applyPaint(Paint paint, String value, float alpha, Map<String, Element> defs) {
        Element gradient = reference(value, defs);
        if (gradient != null) {
            Shader shader = shader(gradient);
            if (shader == null) return false;
            paint.setShader(shader);
            paint.setAlpha(Math.round(clamp(alpha) * 255));
            return true;
        }
        Integer color = color(value, alpha);
        if (color == null) return false;
        paint.setColor(color);
        return true;
    }

    private static Shader shader(Element gradient) {
        List<Element> stops = new ArrayList<>();
        for (Element child : gradient.children) if ("stop".equals(child.name)) stops.add(child);
        if (stops.isEmpty()) return null;
        if (stops.size() == 1) stops.add(stops.get(0));
        int[] colors = new int[stops.size()];
        float[] positions = new float[stops.size()];
        float last = 0;
        for (int i = 0; i < stops.size(); i++) {
            Element stop = stops.get(i);
            Integer color = color(stop.get("stop-color"), stop.number("stop-opacity", 1f));
            colors[i] = color == null ? Color.TRANSPARENT : color;
            last = Math.max(last, clamp(stop.number("offset", 0)));
            positions[i] = last;
        }
        Shader shader;
        if ("radialGradient".equals(gradient.name)) {
            float radius = gradient.number("r", 0);
            if (radius <= 0) return null;
            shader = new RadialGradient(gradient.number("cx", 0), gradient.number("cy", 0), radius,
                colors, positions, Shader.TileMode.CLAMP);
        } else {
            shader = new LinearGradient(gradient.number("x1", 0), gradient.number("y1", 0),
                gradient.number("x2", 0), gradient.number("y2", 0), colors, positions, Shader.TileMode.CLAMP);
        }
        String transform = gradient.get("gradientTransform");
        if (transform != null) shader.setLocalMatrix(transform(transform));
        return shader;
    }

    private static Element reference(String value, Map<String, Element> defs) {
        if (value == null) return null;
        int start = value.indexOf("url(#");
        if (start < 0) return null;
        int end = value.indexOf(')', start);
        return end < 0 ? null : defs.get(value.substring(start + 5, end));
    }

    private static Integer color(String value, float alpha) {
        if (value == null) return null;
        int rgb;
        String text = value.trim();
        if (text.startsWith("#") && text.length() == 7) {
            rgb = Integer.parseInt(text.substring(1), 16);
        } else if ("white".equalsIgnoreCase(text)) {
            rgb = 0xFFFFFF;
        } else if ("black".equalsIgnoreCase(text)) {
            rgb = 0;
        } else {
            return null;
        }
        return (Math.round(clamp(alpha) * 255) << 24) | rgb;
    }

    /** translate, rotate, scale and matrix, applied in SVG order. */
    static Matrix transform(String value) {
        Matrix matrix = new Matrix();
        if (value == null) return matrix;
        int index = 0;
        while (index < value.length()) {
            int open = value.indexOf('(', index);
            int close = value.indexOf(')', open + 1);
            if (open < 0 || close < 0) break;
            String function = value.substring(index, open).trim();
            float[] args = numbers(value.substring(open + 1, close));
            switch (function) {
                case "translate":
                    if (args.length > 0) matrix.preTranslate(args[0], args.length > 1 ? args[1] : 0);
                    break;
                case "rotate":
                    if (args.length >= 3) matrix.preRotate(args[0], args[1], args[2]);
                    else if (args.length > 0) matrix.preRotate(args[0]);
                    break;
                case "scale":
                    if (args.length > 0) matrix.preScale(args[0], args.length > 1 ? args[1] : args[0]);
                    break;
                case "matrix":
                    if (args.length == 6) {
                        Matrix m = new Matrix();
                        m.setValues(new float[]{args[0], args[2], args[4], args[1], args[3], args[5], 0, 0, 1});
                        matrix.preConcat(m);
                    }
                    break;
                default:
                    break;
            }
            index = close + 1;
        }
        return matrix;
    }

    /** Absolute M, L, H, V, C and Z. */
    static Path path(String d) {
        Path path = new Path();
        float x = 0, y = 0;
        char command = 'M';
        Tokens tokens = new Tokens(d);
        while (tokens.hasMore()) {
            if (tokens.atCommand()) command = tokens.command();
            switch (command) {
                case 'M':
                    x = tokens.number();
                    y = tokens.number();
                    path.moveTo(x, y);
                    command = 'L';
                    break;
                case 'L':
                    x = tokens.number();
                    y = tokens.number();
                    path.lineTo(x, y);
                    break;
                case 'H':
                    x = tokens.number();
                    path.lineTo(x, y);
                    break;
                case 'V':
                    y = tokens.number();
                    path.lineTo(x, y);
                    break;
                case 'C': {
                    float x1 = tokens.number(), y1 = tokens.number();
                    float x2 = tokens.number(), y2 = tokens.number();
                    x = tokens.number();
                    y = tokens.number();
                    path.cubicTo(x1, y1, x2, y2, x, y);
                    break;
                }
                case 'Z':
                case 'z':
                    path.close();
                    if (tokens.hasMore() && !tokens.atCommand()) return path;
                    break;
                default:
                    // Not used by the Arcade files.
                    return path;
            }
        }
        return path;
    }

    private static float[] numbers(String text) {
        Tokens tokens = new Tokens(text);
        List<Float> list = new ArrayList<>();
        while (tokens.hasMore()) list.add(tokens.number());
        float[] result = new float[list.size()];
        for (int i = 0; i < result.length; i++) result[i] = list.get(i);
        return result;
    }

    private static final class Tokens {
        private final String text;
        private int index;

        Tokens(String text) {
            this.text = text;
        }

        private void skipSeparators() {
            while (index < text.length()) {
                char c = text.charAt(index);
                if (c == ' ' || c == ',' || c == '\n' || c == '\r' || c == '\t') index++;
                else break;
            }
        }

        boolean hasMore() {
            skipSeparators();
            return index < text.length();
        }

        boolean atCommand() {
            skipSeparators();
            char c = text.charAt(index);
            return Character.isLetter(c) && c != 'e' && c != 'E';
        }

        char command() {
            return text.charAt(index++);
        }

        float number() {
            skipSeparators();
            int start = index;
            if (index < text.length() && (text.charAt(index) == '-' || text.charAt(index) == '+')) index++;
            boolean dot = false;
            while (index < text.length()) {
                char c = text.charAt(index);
                if (Character.isDigit(c)) {
                    index++;
                } else if (c == '.' && !dot) {
                    dot = true;
                    index++;
                } else if ((c == 'e' || c == 'E') && index + 1 < text.length()) {
                    index++;
                    if (text.charAt(index) == '-' || text.charAt(index) == '+') index++;
                } else {
                    break;
                }
            }
            if (start == index) {
                index++;
                return 0;
            }
            return Float.parseFloat(text.substring(start, index));
        }
    }

    /** Gaussian blur of the premultiplied pixels, as three box blurs each way. */
    private static void blur(Bitmap bitmap, float deviation) {
        int width = bitmap.getWidth(), height = bitmap.getHeight();
        IntBuffer buffer = IntBuffer.allocate(width * height);
        bitmap.copyPixelsToBuffer(buffer);
        int[] pixels = buffer.array();
        int[] scratch = new int[pixels.length];
        for (int radius : boxRadii(deviation)) {
            boxBlur(pixels, scratch, width, height, radius, true);
            boxBlur(scratch, pixels, width, height, radius, false);
        }
        buffer.rewind();
        bitmap.copyPixelsFromBuffer(buffer);
    }

    /** Box radii whose three passes approximate a Gaussian of {@code deviation}. */
    private static int[] boxRadii(float deviation) {
        double ideal = Math.sqrt(12 * deviation * deviation / 3 + 1);
        int lower = (int) Math.floor(ideal);
        if (lower % 2 == 0) lower--;
        int upper = lower + 2;
        double mIdeal = (12 * deviation * deviation - 3 * lower * lower - 12 * lower - 9) / (-4.0 * lower - 4);
        long m = Math.round(mIdeal);
        int[] radii = new int[3];
        for (int i = 0; i < 3; i++) radii[i] = ((i < m ? lower : upper) - 1) / 2;
        return radii;
    }

    /** One box pass over all four byte lanes; pixels outside the bitmap count as transparent. */
    private static void boxBlur(int[] source, int[] target, int width, int height, int radius, boolean horizontal) {
        int lines = horizontal ? height : width;
        int length = horizontal ? width : height;
        int step = horizontal ? 1 : width;
        float divisor = 2 * radius + 1;
        for (int line = 0; line < lines; line++) {
            int base = horizontal ? line * width : line;
            int s0 = 0, s1 = 0, s2 = 0, s3 = 0;
            for (int i = 0; i <= Math.min(radius, length - 1); i++) {
                int p = source[base + i * step];
                s0 += p & 0xFF;
                s1 += (p >>> 8) & 0xFF;
                s2 += (p >>> 16) & 0xFF;
                s3 += p >>> 24;
            }
            for (int i = 0; i < length; i++) {
                target[base + i * step] = (Math.round(s3 / divisor) << 24) | (Math.round(s2 / divisor) << 16)
                    | (Math.round(s1 / divisor) << 8) | Math.round(s0 / divisor);
                int add = i + radius + 1, remove = i - radius;
                if (add < length) {
                    int p = source[base + add * step];
                    s0 += p & 0xFF;
                    s1 += (p >>> 8) & 0xFF;
                    s2 += (p >>> 16) & 0xFF;
                    s3 += p >>> 24;
                }
                if (remove >= 0) {
                    int p = source[base + remove * step];
                    s0 -= p & 0xFF;
                    s1 -= (p >>> 8) & 0xFF;
                    s2 -= (p >>> 16) & 0xFF;
                    s3 -= p >>> 24;
                }
            }
        }
    }

    private static float clamp(float value) {
        return value < 0 ? 0 : value > 1 ? 1 : value;
    }
}
