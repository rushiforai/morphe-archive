package io.github.sabopura.morphe.extension.twitch.chat;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;

/**
 * A 7TV name paint as its cosmetic event describes it, with the geometry of its gradient in a name's box.
 * The rules are those of the CSS the 7TV extension writes for a paint (a gradient or image clipped to the
 * text over the name colour, then drop shadows). No Android classes, so it can be tested alone.
 */
final class NamePaint {
    static final int SOLID = 0, LINEAR = 1, RADIAL = 2, IMAGE = 3;
    private static final int MAX_STOPS = 32, MAX_SHADOWS = 4;
    /** Stops closer together than this fraction of the gradient line are one hard edge. */
    private static final float MIN_SPAN = 1e-3f;
    /** The widest blur a published paint uses, in CSS pixels. */
    private static final float MAX_BLUR = 8;

    final int function;
    /** The colour under the paint as ARGB, or 0 for the chatter's own name colour. */
    final int base;
    /** The gradient's colours as ARGB with their places from 0 to 1 between {@link #from} and {@link #to}. */
    final int[] colors;
    final float[] positions;
    /** The stretch of the CSS gradient line (or of the radius, for a radial gradient) that the stops cover. */
    final float from, to;
    final float angle;
    final boolean repeat, ellipse;
    final String image;
    /** x, y and blur of each drop shadow in CSS pixels, the topmost first. */
    final float[] shadows;
    final int[] shadowColors;

    private NamePaint(int function, int base, float[] at, int[] argb, boolean repeat, float angle, boolean ellipse,
                      String image, float[] shadows, int[] shadowColors) {
        this.function = function;
        this.base = base;
        this.angle = angle;
        this.ellipse = ellipse;
        this.image = image;
        this.shadows = shadows;
        this.shadowColors = shadowColors;
        if (at == null) {
            colors = null;
            positions = null;
            from = to = 0;
            this.repeat = false;
            return;
        }
        int count = at.length;
        float first = at[0], last = at[count - 1], shift = 0;
        this.repeat = repeat && last - first >= MIN_SPAN;
        if (this.repeat && function == RADIAL) {
            shift = first / (last - first) % 1;
            if (shift < 0) shift += 1;
        }
        if (shift == 0) {
            // CSS carries the first and last colours beyond the stops; a radial gradient starts at its centre.
            from = this.repeat || function == LINEAR ? first : 0;
            to = Math.max(last, from + MIN_SPAN);
            boolean lead = fraction(first) > 0, trail = fraction(last) < 1;
            colors = new int[count + (lead ? 1 : 0) + (trail ? 1 : 0)];
            positions = new float[colors.length];
            for (int i = 0; i < count; i++) {
                colors[i + (lead ? 1 : 0)] = argb[i];
                positions[i + (lead ? 1 : 0)] = fraction(at[i]);
            }
            colors[0] = argb[0];
            colors[colors.length - 1] = argb[count - 1];
            positions[colors.length - 1] = 1;
            return;
        }
        // A radial gradient can only repeat from its centre, where CSS is this far into the pattern: the
        // stops are turned so that the pattern begins there.
        from = first;
        to = last;
        float cut = 1 - shift;
        int split = count - 2;
        while (fraction(at[split]) > cut) split--;
        float before = fraction(at[split]), after = fraction(at[split + 1]);
        int seam = mix(argb[split], argb[split + 1], (cut - before) / (after - before));
        colors = new int[count + 2];
        positions = new float[count + 2];
        int out = 1;
        for (int i = split + 1; i < count; i++, out++) {
            colors[out] = argb[i];
            // Kept at or before the seam, which rounding could otherwise put a hair past the stop after it.
            positions[out] = Math.max(0, Math.min(shift, fraction(at[i]) - cut));
        }
        for (int i = 0; i <= split; i++, out++) {
            colors[out] = argb[i];
            positions[out] = Math.min(1, fraction(at[i]) + shift);
        }
        colors[0] = colors[out] = seam;
        positions[out] = 1;
    }

    private float fraction(float at) {
        return Math.max(0, Math.min(1, (at - from) / (to - from)));
    }

    /** The paint of a {@code cosmetic.create} event's data, or null when it holds nothing that can be drawn. */
    static NamePaint parse(JSONObject data) {
        int base = data.isNull("color") ? 0 : argb((int) data.optLong("color"));
        if (base >>> 24 == 0) base = 0;
        float[] shadows = new float[MAX_SHADOWS * 3];
        int[] shadowColors = new int[MAX_SHADOWS];
        int shadowCount = 0;
        JSONArray list = data.optJSONArray("shadows");
        for (int i = 0; list != null && i < list.length() && shadowCount < MAX_SHADOWS; i++) {
            JSONObject shadow = list.optJSONObject(i);
            if (shadow == null) continue;
            int color = argb((int) shadow.optLong("color"));
            float x = number(shadow, "x_offset"), y = number(shadow, "y_offset");
            float blur = Math.max(0, Math.min(MAX_BLUR, number(shadow, "radius")));
            if (color >>> 24 == 0 || x == 0 && y == 0 && blur == 0) continue;
            shadows[shadowCount * 3] = x;
            shadows[shadowCount * 3 + 1] = y;
            shadows[shadowCount * 3 + 2] = blur;
            shadowColors[shadowCount++] = color;
        }
        shadows = Arrays.copyOf(shadows, shadowCount * 3);
        shadowColors = Arrays.copyOf(shadowColors, shadowCount);

        String function = data.optString("function");
        int kind = function.equals("LINEAR_GRADIENT") ? LINEAR
                : function.equals("RADIAL_GRADIENT") ? RADIAL : function.equals("URL") ? IMAGE : -1;
        if (kind < 0) return null;
        if (kind == IMAGE) {
            String url = data.optString("image_url");
            if (url.startsWith("//")) url = "https:" + url;
            if (url.startsWith("https://cdn.7tv.app/"))
                return new NamePaint(IMAGE, base, null, null, false, 0, false, url, shadows, shadowColors);
        }
        JSONArray stops = kind == IMAGE ? null : data.optJSONArray("stops");
        int count = stops == null ? 0 : Math.min(stops.length(), MAX_STOPS);
        if (count == 0) {
            // A paint of one colour arrives as a gradient without stops.
            return base == 0 && shadowCount == 0 ? null
                    : new NamePaint(SOLID, base, null, null, false, 0, false, "", shadows, shadowColors);
        }
        float[] at = new float[count];
        int[] argb = new int[count];
        for (int i = 0; i < count; i++) {
            JSONObject stop = stops.optJSONObject(i);
            if (stop == null) return null;
            // CSS moves a stop that comes before its predecessor up to it.
            at[i] = i == 0 ? number(stop, "at") : Math.max(at[i - 1], number(stop, "at"));
            argb[i] = argb((int) stop.optLong("color"));
        }
        return new NamePaint(kind, base, at, argb, data.optBoolean("repeat"), number(data, "angle"),
                "ellipse".equals(data.optString("shape")), "", shadows, shadowColors);
    }

    private static float number(JSONObject object, String key) {
        double value = object.optDouble(key, 0);
        return Double.isNaN(value) ? 0 : (float) Math.max(-1000, Math.min(1000, value));
    }

    /**
     * Which of a row's colour spans is the sender's name: the earliest that begins where a bold span does,
     * as Twitch styles a name; -1 when none does. A negative start stands for a span to ignore.
     */
    static int nameSpan(int[] colourStarts, int[] boldStarts) {
        int found = -1;
        for (int i = 0; i < colourStarts.length; i++) {
            if (colourStarts[i] < 0 || found >= 0 && colourStarts[i] >= colourStarts[found]) continue;
            for (int bold : boldStarts) if (bold == colourStarts[i]) found = i;
        }
        return found;
    }

    /** 7TV sends colours as signed 32-bit RGBA. */
    static int argb(int rgba) {
        return rgba >>> 8 | rgba << 24;
    }

    static int mix(int a, int b, float amount) {
        int result = 0;
        for (int shift = 0; shift < 32; shift += 8) {
            int from = a >>> shift & 0xFF, to = b >>> shift & 0xFF;
            result |= Math.round(from + (to - from) * amount) << shift;
        }
        return result;
    }

    /** Whether the gradient hides everything under it, so the name colour need not be drawn first. */
    boolean opaque() {
        if (function != LINEAR && function != RADIAL) return false;
        for (int color : colors) if (color >>> 24 != 0xFF) return false;
        return true;
    }

    /**
     * The end points {x0, y0, x1, y1} of a linear gradient in a box, as CSS lays out
     * {@code linear-gradient(angle, ...)}: through the centre, 0 degrees pointing up and 90 to the right,
     * long enough to reach the corners.
     */
    float[] line(float width, float height) {
        double radians = Math.toRadians(angle), dx = Math.sin(radians), dy = -Math.cos(radians);
        double length = Math.abs(width * dx) + Math.abs(height * dy);
        return new float[] {
                (float) (width / 2 + dx * length * (from - .5)), (float) (height / 2 + dy * length * (from - .5)),
                (float) (width / 2 + dx * length * (to - .5)), (float) (height / 2 + dy * length * (to - .5))};
    }

    /**
     * The radius of a radial gradient in a box, as CSS sizes {@code radial-gradient(circle, ...)}: to the
     * farthest corner. For an ellipse this is its horizontal radius; the vertical one keeps the box's shape.
     */
    float radius(float width, float height) {
        return (float) ((ellipse ? width / Math.sqrt(2) : Math.hypot(width / 2, height / 2)) * (to - from));
    }

    boolean same(NamePaint other) {
        return function == other.function && base == other.base && from == other.from && to == other.to
                && angle == other.angle && repeat == other.repeat && ellipse == other.ellipse
                && image.equals(other.image) && Arrays.equals(colors, other.colors)
                && Arrays.equals(positions, other.positions) && Arrays.equals(shadows, other.shadows)
                && Arrays.equals(shadowColors, other.shadowColors);
    }
}
