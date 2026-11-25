package dev.custom.gboardpatches.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Renders the painted key faces a Kyng ".wmtheme.json" describes under "keySkin": every slot is a
 * stack of vector layers (SVG-style path data) with solid, linear or radial fills, strokes, glows,
 * and per-layer press transforms.
 *
 * <p>Layer coordinates live in the slot's design space (slot "size"), and the slot's stretch bands
 * say which part of the design may grow — so a face is drawn with 9-slice scaling exactly like a
 * nine-patch, which keeps corners and highlights intact on wide keys such as space.
 */
final class KeySkin {

    static final class Stop {
        float at;
        String token;
    }

    /** A fill or stroke colour: either a flat token or a gradient made of token stops. */
    static final class Paint_ {
        String color;
        float[] linear;
        float[] radial;
        List<Stop> stops;
    }

    static final class Glow {
        float width;
        String color;
        float alpha = 1f;
    }

    static final class Press {
        float[] translate;
        float[] scale;
        float[] pivot;
        Float opacity;
    }

    static final class Layer {
        Paint_ fill;
        Paint_ stroke;
        float strokeWidth;
        float opacity = 1f;
        Glow glow;
        Press press;
        Path path;
    }

    static final class Slot {
        float width = 100f;
        float height = 100f;
        float[] stretchX;
        float[] stretchY;
        /** Where the letter belongs, in design units: [x0, y0, x1, y1]. */
        float[] labelBox;
        /** Nudge applied to the label, in design units: [dx, dy]. */
        float[] labelShift;
        /** Colour token for the letter itself, e.g. "previewLabel" or "face:ink:0.85". */
        String labelColor;
        /** Colour token for the surface the letter is drawn on (its own plate face). */
        String labelGround;
        final List<Layer> layers = new ArrayList<Layer>();
    }

    private final Map<String, Slot> slots = new HashMap<String, Slot>();
    private Slot board;

    private KeySkin() {
    }

    boolean isEmpty() {
        return slots.isEmpty() && board == null;
    }

    boolean hasBoard() {
        return board != null && !board.layers.isEmpty();
    }

    /** Maps a keyboard key role onto the slot names Kyng scenes use. */
    String slotFor(boolean enter, boolean modifier, String entry) {
        if (enter && slots.containsKey("enter")) {
            return "enter";
        }
        if (entry != null) {
            if (entry.contains("space") && slots.containsKey("space")) {
                return "space";
            }
            if (entry.contains("delete") && slots.containsKey("delete")) {
                return "delete";
            }
            if (entry.contains("shift") && slots.containsKey("shift")) {
                return "shift";
            }
            if (entry.contains("globe") && slots.containsKey("globe")) {
                return "globe";
            }
            if (entry.contains("emoji") && slots.containsKey("emoji")) {
                return "emoji";
            }
        }
        if (modifier) {
            if (slots.containsKey("special")) {
                return "special";
            }
            if (slots.containsKey("punctuation")) {
                return "punctuation";
            }
        }
        if (slots.containsKey("letter")) {
            return "letter";
        }
        return slots.isEmpty() ? null : slots.keySet().iterator().next();
    }

    Slot slotNamed(String name) {
        return name == null ? null : slots.get(name);
    }

    // ------------------------------------------------------------- label geometry

    /**
     * Maps the slot's labelBox into the pixel rectangle the key actually occupies. The box lives in
     * the same design space as the layers, so it has to go through the same 9-slice stretch as the
     * painted face or the letter would drift on wide keys such as space.
     */
    float[] labelRect(Slot slot, int width, int height) {
        if (slot == null || slot.labelBox == null || slot.labelBox.length < 4) {
            return null;
        }
        float[] rect = new float[4];
        rect[0] = mapAxis(slot.labelBox[0], slot.stretchX, slot.width, width);
        rect[1] = mapAxis(slot.labelBox[1], slot.stretchY, slot.height, height);
        rect[2] = mapAxis(slot.labelBox[2], slot.stretchX, slot.width, width);
        rect[3] = mapAxis(slot.labelBox[3], slot.stretchY, slot.height, height);
        return rect;
    }

    /**
     * labelShift in pixels. The shift is the same movement the scene's layers apply to the face, so
     * it has to be measured with the same 9-slice mapping the face is drawn with: inside a fixed
     * edge band one design unit is one pixel, in the stretched middle it is not.
     */
    float[] labelShiftPixels(Slot slot, int width, int height) {
        if (slot == null || slot.labelShift == null || slot.labelShift.length < 2) {
            return null;
        }
        float cx = slot.width / 2f;
        float cy = slot.height / 2f;
        if (slot.labelBox != null && slot.labelBox.length >= 4) {
            cx = (slot.labelBox[0] + slot.labelBox[2]) / 2f;
            cy = (slot.labelBox[1] + slot.labelBox[3]) / 2f;
        }
        float dx = mapAxis(cx + slot.labelShift[0], slot.stretchX, slot.width, width)
            - mapAxis(cx, slot.stretchX, slot.width, width);
        float dy = mapAxis(cy + slot.labelShift[1], slot.stretchY, slot.height, height)
            - mapAxis(cy, slot.stretchY, slot.height, height);
        return new float[] {dx, dy};
    }

    private static float mapAxis(float value, float[] stretch, float design, int pixels) {
        if (design <= 0f) {
            return value;
        }
        float start = stretch != null ? clamp(stretch[0], 0f, design) : design / 3f;
        float end = stretch != null ? clamp(stretch[1], start, design) : design - design / 3f;
        float left = start;
        float right = design - end;
        float edgeSum = left + right;
        float edgeScale = edgeSum > pixels && edgeSum > 0f ? pixels / edgeSum : 1f;
        float leftPx = left * edgeScale;
        float rightPx = right * edgeScale;
        float middleDesign = design - left - right;
        float middlePx = pixels - leftPx - rightPx;
        if (value <= left) {
            return value * edgeScale;
        }
        if (value >= design - right) {
            return pixels - (design - value) * edgeScale;
        }
        if (middleDesign <= 0f) {
            return leftPx;
        }
        return leftPx + (value - left) * (middlePx / middleDesign);
    }

    // ---------------------------------------------------------------- palette

    /** Theme colours the layer tokens resolve against. */
    static final class Palette {
        int face;
        int board;
        int accent;
        int special;
        int specialPressed;
        int label;
        int border;
        int chassis;

        int resolve(String token) {
            if (token == null) {
                return face;
            }
            if (token.indexOf('#') == 0) {
                // Scenes may name a colour literally ("#1D1610") instead of through a token.
                int literal = parseHexColor(token);
                if (literal != 0) {
                    return literal;
                }
            }
            String base = token;
            String op = null;
            float amount = 0f;
            int first = token.indexOf(':');
            if (first > 0) {
                base = token.substring(0, first);
                int second = token.indexOf(':', first + 1);
                if (second > 0) {
                    op = token.substring(first + 1, second);
                    amount = parseFloat(token.substring(second + 1), 0f);
                }
            }
            int color;
            if ("board".equals(base)) {
                color = board;
            } else if ("key".equals(base) || "previewFill".equals(base)) {
                color = face;
            } else if ("accent".equals(base) || "signal".equals(base)
                    || "keyAccent".equals(base)) {
                color = accent;
            } else if ("keySpecial".equals(base)) {
                color = special;
            } else if ("keySpecialPressed".equals(base)) {
                color = specialPressed;
            } else if ("label".equals(base) || "faceLabel".equals(base)
                    || "previewLabel".equals(base)) {
                color = label;
            } else if ("border".equals(base)) {
                color = border;
            } else if ("chassis".equals(base)) {
                color = chassis;
            } else if ("shadow".equals(base)) {
                color = Color.BLACK;
            } else {
                color = face;
            }
            if (op == null) {
                return color;
            }
            if ("lighten".equals(op)) {
                return blend(color, Color.WHITE, clamp01(amount));
            }
            if ("darken".equals(op)) {
                return blend(color, Color.BLACK, clamp01(amount));
            }
            if ("alpha".equals(op)) {
                int alpha = Math.round(clamp01(amount) * Color.alpha(color));
                return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
            }
            if ("ink".equals(op)) {
                // "ink" is the reading colour for text on that surface: black on light grounds
                // and white on dark ones, mixed in at the requested strength.
                int ink = luminance(color) > 140 ? Color.BLACK : Color.WHITE;
                return blend(color, ink, clamp01(amount));
            }
            return color;
        }

        int fingerprint() {
            return face ^ (board << 3) ^ (accent << 6) ^ (special << 9) ^ (specialPressed << 12)
                ^ (label << 15) ^ (border << 18) ^ (chassis << 21);
        }
    }

    /** Parses "#RRGGBB" or "#AARRGGBB"; returns 0 when the text is not a colour. */
    private static int parseHexColor(String text) {
        String hex = text.trim();
        if (hex.startsWith("#")) {
            hex = hex.substring(1);
        } else if (hex.startsWith("0x") || hex.startsWith("0X")) {
            hex = hex.substring(2);
        }
        if (hex.length() == 6) {
            hex = "FF" + hex;
        }
        if (hex.length() != 8) {
            return 0;
        }
        try {
            return (int) Long.parseLong(hex, 16);
        } catch (NumberFormatException broken) {
            return 0;
        }
    }

    /** Sort order for ":ink:" – the perceived brightness of a colour, 0 (black) to 255 (white). */
    private static int luminance(int color) {
        return (299 * Color.red(color) + 587 * Color.green(color) + 114 * Color.blue(color)) / 1000;
    }

    /**
     * The letter's colour for a slot: its own labelColor token when the scene has one, otherwise an
     * ink picked for the slot's labelGround so the letter stays readable on the surface it is drawn
     * on. "previewLabel" means "the theme's normal letter colour".
     */
    static int labelColor(Slot slot, Palette palette, int fallback) {
        if (slot == null) {
            return fallback;
        }
        if (slot.labelColor != null && !"previewLabel".equals(slot.labelColor)) {
            return palette.resolve(slot.labelColor);
        }
        if (slot.labelGround != null) {
            int ground = palette.resolve(slot.labelGround);
            int ink = luminance(ground) > 140 ? Color.BLACK : Color.WHITE;
            return blend(ground, ink, 0.88f);
        }
        return fallback;
    }

    private static int blend(int from, int to, float amount) {
        int r = Math.round(Color.red(from) + (Color.red(to) - Color.red(from)) * amount);
        int g = Math.round(Color.green(from) + (Color.green(to) - Color.green(from)) * amount);
        int b = Math.round(Color.blue(from) + (Color.blue(to) - Color.blue(from)) * amount);
        return Color.argb(Color.alpha(from), clamp255(r), clamp255(g), clamp255(b));
    }

    // ---------------------------------------------------------------- drawing

    /**
     * Builds the background for one key slot. Pressed and normal faces are separate bitmaps inside
     * a StateListDrawable, so the press transforms (sink, scale, opacity) animate the face.
     */
    static Drawable buildKeyDrawable(KeySkin skin, String slotName, Palette palette,
                                     int pressedTint) {
        Slot slot = slotName == null ? null : skin.slots.get(slotName);
        if (slot == null || slot.layers.isEmpty()) {
            return null;
        }
        SkinDrawable up = new SkinDrawable(slot, palette, false, false, 0);
        SkinDrawable down = new SkinDrawable(slot, palette, true, false, pressedTint);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[] {android.R.attr.state_pressed}, down);
        states.addState(new int[] {}, up);
        return states;
    }

    static Drawable buildBoardDrawable(KeySkin skin, Palette palette) {
        if (skin.board == null || skin.board.layers.isEmpty()) {
            return null;
        }
        return new SkinDrawable(skin.board, palette, false, true, 0);
    }

    /** Lazy bitmap-backed drawable: the face is rendered at the view's real size. */
    private static final class SkinDrawable extends Drawable {
        private static final int CACHE_SIZE = 24;
        private static final LinkedHashMap<String, Bitmap> CACHE =
            new LinkedHashMap<String, Bitmap>(CACHE_SIZE, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
                    return size() > CACHE_SIZE;
                }
            };

        private final Slot slot;
        private final Palette palette;
        private final boolean pressed;
        private final boolean board;
        /** ARGB colour blended over the painted face while the key is held down. */
        private final int tint;
        private Bitmap bitmap;

        SkinDrawable(Slot slot, Palette palette, boolean pressed, boolean board, int tint) {
            this.slot = slot;
            this.palette = palette;
            this.pressed = pressed;
            this.board = board;
            this.tint = tint;
        }

        @Override
        public boolean isStateful() {
            return !board;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            return false;
        }

        @Override
        protected void onBoundsChange(android.graphics.Rect bounds) {
            bitmap = null;
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect bounds = getBounds();
            int width = bounds.width();
            int height = bounds.height();
            if (width <= 0 || height <= 0) {
                return;
            }
            Bitmap face = bitmap;
            if (face == null || face.getWidth() != width || face.getHeight() != height) {
                face = bitmapFor(slot, palette, width, height, pressed, board, tint);
                bitmap = face;
            }
            if (face != null) {
                canvas.drawBitmap(face, null, bounds, null);
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    private static Bitmap bitmapFor(Slot slot, Palette palette, int width, int height,
                                    boolean pressed, boolean board, int tint) {
        String key = System.identityHashCode(slot) + ":" + palette.fingerprint() + ":" + width
            + "x" + height + (pressed ? ":p" : ":n") + (board ? ":b" : "") + ":" + tint;
        Bitmap cached;
        synchronized (SkinDrawable.CACHE) {
            cached = SkinDrawable.CACHE.get(key);
        }
        if (cached != null) {
            return cached;
        }
        Bitmap bitmap = render(slot, palette, width, height, pressed, tint);
        synchronized (SkinDrawable.CACHE) {
            SkinDrawable.CACHE.put(key, bitmap);
        }
        return bitmap;
    }

    /** Draws the slot's layers into a bitmap of the requested size with 9-slice scaling. */
    private static Bitmap render(Slot slot, Palette palette, int width, int height, boolean pressed,
                                 int tint) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        float designW = slot.width <= 0f ? width : slot.width;
        float designH = slot.height <= 0f ? height : slot.height;

        float left = slot.stretchX != null ? slot.stretchX[0] : designW / 3f;
        float right = slot.stretchX != null ? designW - slot.stretchX[1] : designW / 3f;
        float top = slot.stretchY != null ? slot.stretchY[0] : designH / 3f;
        float bottom = slot.stretchY != null ? designH - slot.stretchY[1] : designH / 3f;
        left = clamp(left, 0f, designW);
        right = clamp(right, 0f, designW);
        top = clamp(top, 0f, designH);
        bottom = clamp(bottom, 0f, designH);

        float[] xs = bands(left, designW - right, designW);
        float[] ys = bands(top, designH - bottom, designH);
        // Shrink the fixed edges when the key is smaller than both of them together.
        float edgeSumX = left + right;
        float edgeSumY = top + bottom;
        float slackX = width - edgeSumX;
        float slackY = height - edgeSumY;
        float scaleX = slackX < 0f && edgeSumX > 0f ? width / edgeSumX : 1f;
        float scaleY = slackY < 0f && edgeSumY > 0f ? height / edgeSumY : 1f;

        float[] destX = new float[] {0f, left * scaleX, width - right * scaleX, width};
        float[] destY = new float[] {0f, top * scaleY, height - bottom * scaleY, height};

        for (int row = 0; row < 3; row++) {
            float srcTop = ys[row];
            float srcBottom = ys[row + 1];
            if (srcBottom - srcTop <= 0.01f) {
                continue;
            }
            for (int col = 0; col < 3; col++) {
                float srcLeft = xs[col];
                float srcRight = xs[col + 1];
                if (srcRight - srcLeft <= 0.01f) {
                    continue;
                }
                float dstLeft = destX[col];
                float dstRight = destX[col + 1];
                float dstTop = destY[row];
                float dstBottom = destY[row + 1];
                if (dstRight - dstLeft <= 0.01f || dstBottom - dstTop <= 0.01f) {
                    continue;
                }
                float sx = (dstRight - dstLeft) / (srcRight - srcLeft);
                float sy = (dstBottom - dstTop) / (srcBottom - srcTop);

                int save = canvas.save();
                canvas.clipRect(dstLeft, dstTop, dstRight, dstBottom);
                canvas.translate(dstLeft - srcLeft * sx, dstTop - srcTop * sy);
                canvas.scale(sx, sy);
                for (int i = 0; i < slot.layers.size(); i++) {
                    drawLayer(canvas, slot.layers.get(i), palette, pressed);
                }
                canvas.restoreToCount(save);
            }
        }
        if (pressed && tint != 0) {
            // The scene's press layers only move/recolour their own art; blending the theme's
            // pressed colour over the finished face keeps that colour visible on any scene.
            canvas.drawColor(tint, PorterDuff.Mode.SRC_ATOP);
        }
        return bitmap;
    }

    private static float[] bands(float stretchStart, float stretchEnd, float design) {
        float start = clamp(stretchStart, 0f, design);
        float end = clamp(stretchEnd, start, design);
        return new float[] {0f, start, end, design};
    }

    private static void drawLayer(Canvas canvas, Layer layer, Palette palette, boolean pressed) {
        if (layer.path == null) {
            return;
        }
        float alpha = layer.opacity;
        float tx = 0f;
        float ty = 0f;
        float scaleX = 1f;
        float scaleY = 1f;
        float pivotX = 0f;
        float pivotY = 0f;
        if (pressed && layer.press != null) {
            Press press = layer.press;
            if (press.opacity != null) {
                alpha *= press.opacity;
            }
            if (press.translate != null && press.translate.length >= 2) {
                tx = press.translate[0];
                ty = press.translate[1];
            }
            if (press.scale != null && press.scale.length >= 2) {
                scaleX = press.scale[0];
                scaleY = press.scale[1];
            }
            if (press.pivot != null && press.pivot.length >= 2) {
                pivotX = press.pivot[0];
                pivotY = press.pivot[1];
            }
        }
        int save = canvas.save();
        if (tx != 0f || ty != 0f || scaleX != 1f || scaleY != 1f) {
            canvas.translate(pivotX, pivotY);
            canvas.scale(scaleX, scaleY);
            canvas.translate(-pivotX, -pivotY);
            canvas.translate(tx, ty);
        }

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setStyle(Paint.Style.FILL);

        if (layer.glow != null) {
            int glowColor = palette.resolve(layer.glow.color);
            float glowAlpha = clamp01(layer.glow.alpha) * alpha;
            Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            glowPaint.setStyle(Paint.Style.STROKE);
            glowPaint.setStrokeJoin(Paint.Join.ROUND);
            glowPaint.setStrokeCap(Paint.Cap.ROUND);
            float base = Math.max(0.5f, layer.glow.width);
            for (int ring = 3; ring >= 1; ring--) {
                float spreadWidth = base * ring * 2f;
                int ringAlpha = Math.round(255f * glowAlpha * (0.55f / ring));
                glowPaint.setStrokeWidth(spreadWidth);
                glowPaint.setColor(Color.argb(clamp255(ringAlpha),
                    Color.red(glowColor), Color.green(glowColor), Color.blue(glowColor)));
                canvas.drawPath(layer.path, glowPaint);
            }
        }

        if (layer.fill != null) {
            paint.setAlpha(Math.round(clamp01(alpha) * 255f));
            applyPaintColor(paint, layer.fill, palette);
            canvas.drawPath(layer.path, paint);
        }
        if (layer.stroke != null && layer.strokeWidth > 0f) {
            Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(layer.strokeWidth);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setAlpha(Math.round(clamp01(alpha) * 255f));
            applyPaintColor(strokePaint, layer.stroke, palette);
            canvas.drawPath(layer.path, strokePaint);
        }
        canvas.restoreToCount(save);
    }

    private static void applyPaintColor(Paint paint, Paint_ spec, Palette palette) {
        if (spec.stops != null && spec.stops.size() > 0) {
            int count = spec.stops.size();
            int[] colors = new int[count];
            float[] positions = new float[count];
            for (int i = 0; i < count; i++) {
                Stop stop = spec.stops.get(i);
                colors[i] = palette.resolve(stop.token);
                positions[i] = clamp01(stop.at);
            }
            Shader shader = null;
            try {
                if (spec.radial != null && spec.radial.length >= 3) {
                    shader = new RadialGradient(spec.radial[0], spec.radial[1],
                        Math.max(1f, spec.radial[2]), colors, positions, Shader.TileMode.CLAMP);
                } else if (spec.linear != null && spec.linear.length >= 4) {
                    shader = new LinearGradient(spec.linear[0], spec.linear[1],
                        spec.linear[2], spec.linear[3], colors, positions, Shader.TileMode.CLAMP);
                }
            } catch (Throwable ignored) {
            }
            if (shader != null) {
                paint.setShader(shader);
                return;
            }
        }
        paint.setShader(null);
        paint.setColor(palette.resolve(spec.color));
    }

    // ---------------------------------------------------------------- parsing

    static KeySkin parse(String json) {
        if (json == null || json.length() == 0) {
            return null;
        }
        try {
            Object rootValue = MiniJson.parse(json);
            if (!(rootValue instanceof Map)) {
                return null;
            }
            @SuppressWarnings("unchecked")
            Map<String, Object> root = (Map<String, Object>) rootValue;
            KeySkin skin = new KeySkin();
            Object slotTree = root.get("slots");
            if (slotTree instanceof Map) {
                for (Map.Entry<String, Object> entry
                        : ((Map<String, Object>) slotTree).entrySet()) {
                    Slot slot = parseSlot(entry.getValue());
                    if (slot != null && !slot.layers.isEmpty()) {
                        skin.slots.put(entry.getKey(), slot);
                    }
                }
            }
            Object boardTree = root.get("board");
            if (boardTree instanceof Map) {
                skin.board = parseSlot(boardTree);
            }
            return skin.isEmpty() ? null : skin;
        } catch (Throwable broken) {
            return null;
        }
    }

    private static Slot parseSlot(Object value) {
        if (!(value instanceof Map)) {
            return null;
        }
        Map<String, Object> map = asMap(value);
        Slot slot = new Slot();
        float[] size = asFloats(map.get("size"));
        if (size != null && size.length >= 2) {
            slot.width = size[0];
            slot.height = size[1];
        }
        slot.stretchX = asFloats(map.get("stretchX"));
        slot.stretchY = asFloats(map.get("stretchY"));
        slot.labelBox = asFloats(map.get("labelBox"));
        slot.labelShift = asFloats(map.get("labelShift"));
        slot.labelColor = asString(map.get("labelColor"));
        slot.labelGround = asString(map.get("labelGround"));
        Object layers = map.get("layers");
        if (layers instanceof List) {
            for (Object raw : (List<?>) layers) {
                Layer layer = parseLayer(raw);
                if (layer != null) {
                    slot.layers.add(layer);
                }
            }
        }
        return slot;
    }

    private static Layer parseLayer(Object value) {
        if (!(value instanceof Map)) {
            return null;
        }
        Map<String, Object> map = asMap(value);
        String data = asString(map.get("d"));
        if (data == null || data.length() == 0) {
            return null;
        }
        Layer layer = new Layer();
        layer.path = parsePath(data);
        if (layer.path == null) {
            return null;
        }
        layer.fill = parsePaint(map.get("fill"));
        layer.stroke = parsePaint(map.get("stroke"));
        layer.strokeWidth = asFloat(map.get("strokeWidth"), 0f);
        layer.opacity = asFloat(map.get("opacity"), 1f);
        Object glow = map.get("glow");
        if (glow instanceof Map) {
            Map<String, Object> glowMap = asMap(glow);
            Glow parsed = new Glow();
            parsed.width = asFloat(glowMap.get("width"), 1f);
            parsed.color = asString(glowMap.get("color"));
            parsed.alpha = asFloat(glowMap.get("alpha"), 1f);
            layer.glow = parsed;
        }
        Object press = map.get("press");
        if (press instanceof Map) {
            Map<String, Object> pressMap = asMap(press);
            Press parsed = new Press();
            parsed.translate = asFloats(pressMap.get("translate"));
            parsed.scale = asFloats(pressMap.get("scale"));
            parsed.pivot = asFloats(pressMap.get("pivot"));
            if (pressMap.containsKey("opacity")) {
                parsed.opacity = Float.valueOf(asFloat(pressMap.get("opacity"), 1f));
            }
            layer.press = parsed;
        }
        return layer;
    }

    private static Paint_ parsePaint(Object value) {
        if (!(value instanceof Map)) {
            return null;
        }
        Map<String, Object> map = asMap(value);
        Paint_ paint = new Paint_();
        paint.color = asString(map.get("color"));
        paint.linear = asFloats(map.get("linear"));
        paint.radial = asFloats(map.get("radial"));
        Object stops = map.get("stops");
        if (stops instanceof List) {
            List<Stop> parsed = new ArrayList<Stop>();
            for (Object raw : (List<?>) stops) {
                if (!(raw instanceof Map)) {
                    continue;
                }
                Map<String, Object> stopMap = asMap(raw);
                Stop stop = new Stop();
                stop.at = asFloat(stopMap.get("at"), 0f);
                stop.token = asString(stopMap.get("color"));
                parsed.add(stop);
            }
            paint.stops = parsed;
        }
        return paint;
    }

    /** Minimal SVG path reader: Kyng scenes only use move/line/cubic/close commands. */
    static Path parsePath(String data) {
        try {
            Path path = new Path();
            int index = 0;
            int length = data.length();
            char command = 0;
            float currentX = 0f;
            float currentY = 0f;
            float startX = 0f;
            float startY = 0f;
            while (index < length) {
                index = skipSeparators(data, index);
                if (index >= length) {
                    break;
                }
                char current = data.charAt(index);
                if (Character.isLetter(current)) {
                    command = current;
                    index++;
                    if (command == 'Z' || command == 'z') {
                        path.close();
                        currentX = startX;
                        currentY = startY;
                    }
                    continue;
                }
                boolean relative = Character.isLowerCase(command);
                char op = Character.toUpperCase(command);
                int count;
                if (op == 'H' || op == 'V') {
                    count = 1;
                } else if (op == 'C') {
                    count = 6;
                } else if (op == 'Q' || op == 'S') {
                    count = 4;
                } else if (op == 'T') {
                    count = 2;
                } else if (op == 'A') {
                    count = 7;
                } else {
                    count = 2;
                }
                float[] values = new float[count];
                for (int i = 0; i < count; i++) {
                    index = skipSeparators(data, index);
                    int start = index;
                    index = scanNumber(data, index);
                    if (index == start) {
                        return path;
                    }
                    values[i] = parseFloat(data.substring(start, index), 0f);
                }
                if (relative) {
                    for (int i = 0; i < count; i++) {
                        values[i] += (i % 2 == 0) ? currentX : currentY;
                    }
                }
                switch (op) {
                    case 'M':
                        path.moveTo(values[0], values[1]);
                        currentX = values[0];
                        currentY = values[1];
                        startX = currentX;
                        startY = currentY;
                        command = relative ? 'l' : 'L';
                        break;
                    case 'L':
                        path.lineTo(values[0], values[1]);
                        currentX = values[0];
                        currentY = values[1];
                        break;
                    case 'H':
                        path.lineTo(values[0], currentY);
                        currentX = values[0];
                        break;
                    case 'V':
                        path.lineTo(currentX, values[0]);
                        currentY = values[0];
                        break;
                    case 'C':
                        path.cubicTo(values[0], values[1], values[2], values[3],
                            values[4], values[5]);
                        currentX = values[4];
                        currentY = values[5];
                        break;
                    case 'Q':
                        path.quadTo(values[0], values[1], values[2], values[3]);
                        currentX = values[2];
                        currentY = values[3];
                        break;
                    case 'A':
                        path.lineTo(values[5], values[6]);
                        currentX = values[5];
                        currentY = values[6];
                        break;
                    default:
                        break;
                }
            }
            return path;
        } catch (Throwable broken) {
            return null;
        }
    }

    private static int skipSeparators(String data, int index) {
        while (index < data.length()) {
            char c = data.charAt(index);
            if (Character.isWhitespace(c) || c == ',') {
                index++;
            } else {
                break;
            }
        }
        return index;
    }

    private static int scanNumber(String data, int index) {
        int length = data.length();
        if (index < length && (data.charAt(index) == '-' || data.charAt(index) == '+')) {
            index++;
        }
        boolean seenDot = false;
        while (index < length) {
            char c = data.charAt(index);
            if (Character.isDigit(c)) {
                index++;
            } else if (c == '.' && !seenDot) {
                seenDot = true;
                index++;
            } else if (c == 'e' || c == 'E') {
                index++;
                if (index < length && (data.charAt(index) == '-' || data.charAt(index) == '+')) {
                    index++;
                }
            } else {
                break;
            }
        }
        return index;
    }

    // ---------------------------------------------------------------- helpers

    @SuppressWarnings("unchecked")
    private static Map<String, Object> asMap(Object value) {
        return (Map<String, Object>) value;
    }

    private static String asString(Object value) {
        return value instanceof String ? (String) value : null;
    }

    private static float asFloat(Object value, float fallback) {
        if (value instanceof Number) {
            return ((Number) value).floatValue();
        }
        if (value instanceof String) {
            return parseFloat((String) value, fallback);
        }
        return fallback;
    }

    private static float[] asFloats(Object value) {
        if (!(value instanceof List)) {
            return null;
        }
        List<?> list = (List<?>) value;
        float[] out = new float[list.size()];
        for (int i = 0; i < out.length; i++) {
            out[i] = asFloat(list.get(i), 0f);
        }
        return out;
    }

    private static float parseFloat(String text, float fallback) {
        try {
            return Float.parseFloat(text);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static float clamp(float value, float min, float max) {
        return value < min ? min : (value > max ? max : value);
    }

    private static float clamp01(float value) {
        return clamp(value, 0f, 1f);
    }

    private static int clamp255(int value) {
        return value < 0 ? 0 : (value > 255 ? 255 : value);
    }

    /** Tiny JSON reader: the build's android.jar predates org.json. */
    static final class MiniJson {
        private final String text;
        private int index;

        private MiniJson(String text) {
            this.text = text;
        }

        static Object parse(String text) {
            MiniJson reader = new MiniJson(text);
            reader.skipSpace();
            Object value = reader.readValue();
            return value;
        }

        private Object readValue() {
            skipSpace();
            if (index >= text.length()) {
                return null;
            }
            char c = text.charAt(index);
            if (c == '{') {
                return readObject();
            }
            if (c == '[') {
                return readArray();
            }
            if (c == '"') {
                return readString();
            }
            if (c == 't' || c == 'f') {
                if (text.startsWith("true", index)) {
                    index += 4;
                    return Boolean.TRUE;
                }
                if (text.startsWith("false", index)) {
                    index += 5;
                    return Boolean.FALSE;
                }
                index++;
                return null;
            }
            if (c == 'n') {
                index += 4;
                return null;
            }
            return readNumber();
        }

        private Map<String, Object> readObject() {
            Map<String, Object> map = new LinkedHashMap<String, Object>();
            index++;
            while (true) {
                skipSpace();
                if (index >= text.length()) {
                    return map;
                }
                if (text.charAt(index) == '}') {
                    index++;
                    return map;
                }
                if (text.charAt(index) == ',') {
                    index++;
                    continue;
                }
                String key = readString();
                skipSpace();
                if (index < text.length() && text.charAt(index) == ':') {
                    index++;
                }
                map.put(key, readValue());
            }
        }

        private List<Object> readArray() {
            List<Object> list = new ArrayList<Object>();
            index++;
            while (true) {
                skipSpace();
                if (index >= text.length()) {
                    return list;
                }
                if (text.charAt(index) == ']') {
                    index++;
                    return list;
                }
                if (text.charAt(index) == ',') {
                    index++;
                    continue;
                }
                list.add(readValue());
            }
        }

        private String readString() {
            StringBuilder out = new StringBuilder();
            skipSpace();
            if (index >= text.length() || text.charAt(index) != '"') {
                return out.toString();
            }
            index++;
            while (index < text.length()) {
                char c = text.charAt(index++);
                if (c == '\\') {
                    if (index >= text.length()) {
                        break;
                    }
                    char escape = text.charAt(index++);
                    if (escape == 'n') {
                        out.append('\n');
                    } else if (escape == 't') {
                        out.append('\t');
                    } else if (escape == 'r') {
                        out.append('\r');
                    } else if (escape == 'u' && index + 4 <= text.length()) {
                        try {
                            out.append((char) Integer.parseInt(text.substring(index, index + 4), 16));
                        } catch (Throwable ignored) {
                        }
                        index += 4;
                    } else {
                        out.append(escape);
                    }
                    continue;
                }
                if (c == '"') {
                    break;
                }
                out.append(c);
            }
            return out.toString();
        }

        private Double readNumber() {
            int start = index;
            while (index < text.length()) {
                char c = text.charAt(index);
                if (Character.isDigit(c) || c == '-' || c == '+' || c == '.' || c == 'e'
                        || c == 'E') {
                    index++;
                } else {
                    break;
                }
            }
            try {
                return Double.valueOf(Double.parseDouble(text.substring(start, index)));
            } catch (Throwable ignored) {
                return null;
            }
        }

        private void skipSpace() {
            while (index < text.length() && Character.isWhitespace(text.charAt(index))) {
                index++;
            }
        }
    }
}
