package app.afterglow.extension.settings;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/** UIColor archive values used by iOS YTAGThemeDecodeLegacyColorData. */
final class LegacyColor {
    private LegacyColor() {}

    static Integer decode(byte[] bytes) {
        try {
            Object value = PropertyList.read(bytes);
            if (!(value instanceof Map)) return null;
            Map<?, ?> root = (Map<?, ?>) value;
            Map<?, ?> color = channels(root) ? root : null;
            Object objects = root.get("$objects");
            if (color == null && objects instanceof Iterable) {
                for (Object item : (Iterable<?>) objects) {
                    if (item instanceof Map && channels((Map<?, ?>) item)) { color = (Map<?, ?>) item; break; }
                }
            }
            if (color == null) return null;
            int alpha = component(color.get("UIAlpha"), 1);
            if (color.get("UIRed") instanceof Number && color.get("UIGreen") instanceof Number && color.get("UIBlue") instanceof Number)
                return alpha << 24 | component(color.get("UIRed"), 0) << 16
                        | component(color.get("UIGreen"), 0) << 8 | component(color.get("UIBlue"), 0);
            int white = component(color.get("UIWhite"), 0);
            return alpha << 24 | white << 16 | white << 8 | white;
        } catch (Exception invalid) { return null; }
    }

    private static boolean channels(Map<?, ?> map) {
        return (map.get("UIRed") instanceof Number && map.get("UIGreen") instanceof Number && map.get("UIBlue") instanceof Number)
                || map.get("UIWhite") instanceof Number;
    }

    private static int component(Object value, double fallback) {
        double number = value instanceof Number ? ((Number) value).doubleValue() : fallback;
        if (Double.isNaN(number)) number = 0;
        return (int) Math.round(Math.max(0, Math.min(1, number)) * 255);
    }

    /** Standard keyed-archive XML, including class/root references, for UIKit readers. */
    static byte[] encode(int argb) throws IOException {
        Map<String, Object> color = map("$class", map("CF$UID", 2));
        color.put("NSColorSpace", 2);
        color.put("UIColorComponentCount", 4);
        color.put("UIRed", ((argb >>> 16) & 255) / 255d);
        color.put("UIGreen", ((argb >>> 8) & 255) / 255d);
        color.put("UIBlue", (argb & 255) / 255d);
        color.put("UIAlpha", (argb >>> 24) / 255d);
        Map<String, Object> type = map("$classes", Arrays.asList("UIColor", "NSObject"));
        type.put("$classname", "UIColor");
        Map<String, Object> archive = map("$archiver", "NSKeyedArchiver");
        archive.put("$version", 100000);
        archive.put("$objects", Arrays.asList("$null", color, type));
        archive.put("$top", map("root", map("CF$UID", 1)));
        return PropertyList.write(archive);
    }

    private static Map<String, Object> map(String key, Object value) {
        Map<String, Object> result = new LinkedHashMap<>(); result.put(key, value); return result;
    }
}
