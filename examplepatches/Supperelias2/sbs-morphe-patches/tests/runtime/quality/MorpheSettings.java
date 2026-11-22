package dev.supperelias2.sbs.morphe;

import java.util.HashMap;
import java.util.Map;

public final class MorpheSettings {
    public static final Map<String, Object> VALUES = new HashMap<>();
    public static boolean enabled(String key, boolean fallback) {
        Object value = VALUES.get(key);
        return value instanceof Boolean ? (Boolean) value : fallback;
    }
    public static int getInt(String key, int fallback) {
        Object value = VALUES.get(key);
        return value instanceof Integer ? (Integer) value : fallback;
    }
    public static void saveInt(String key, int value) { VALUES.put(key, value); }
}
