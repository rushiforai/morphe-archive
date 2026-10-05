package app.template.extension.settings;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * On-device equivalent of the patch's {@code accentColorMap}: turns a chosen ARGB into the six
 * green / {@code colorAccent} overrides (the pick for the main green, a lighter shade for
 * highlights, a darker shade for the pressed/gradient tail).
 */
final class AccentMath {

    private AccentMath() {}

    /** {@code #rgb}, {@code #rrggbb} or {@code #aarrggbb} (leading {@code #} optional) -> ARGB int. */
    static int parseHex(String raw) {
        String hex = raw.trim();
        if (hex.startsWith("#")) hex = hex.substring(1);
        if (hex.length() == 3) {
            StringBuilder b = new StringBuilder(6);
            for (int i = 0; i < 3; i++) b.append(hex.charAt(i)).append(hex.charAt(i));
            hex = b.toString();
        }
        if (hex.length() == 6) hex = "FF" + hex;
        if (hex.length() != 8) throw new NumberFormatException(raw);
        return (int) Long.parseLong(hex, 16);
    }

    /** @param ids {colorAccent, green00E054, green0ADE53, green00A010, green00B020, green00C030} */
    static Map<Integer, Integer> overlay(int[] ids, int primary) {
        int bright = blend(primary, 0xFFFFFFFF, 0.30f);
        int dim = blend(primary, 0xFF000000, 0.42f);
        Map<Integer, Integer> map = new LinkedHashMap<>();
        map.put(ids[0], primary);
        map.put(ids[1], primary);
        map.put(ids[2], bright);
        map.put(ids[3], dim);
        map.put(ids[4], dim);
        map.put(ids[5], dim);
        return map;
    }

    private static int blend(int from, int to, float t) {
        int r = lerp((from >> 16) & 0xFF, (to >> 16) & 0xFF, t);
        int g = lerp((from >> 8) & 0xFF, (to >> 8) & 0xFF, t);
        int b = lerp(from & 0xFF, to & 0xFF, t);
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }

    private static int lerp(int a, int b, float t) {
        int v = Math.round(a + (b - a) * t);
        return v < 0 ? 0 : (v > 255 ? 255 : v);
    }
}
