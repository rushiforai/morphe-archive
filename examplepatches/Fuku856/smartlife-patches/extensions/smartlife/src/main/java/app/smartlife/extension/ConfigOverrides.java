package app.smartlife.extension;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Overrides SmartLife's feature flags at the point the app reads them.
 *
 * Every optional feature (AI assistant, ads, analytics, ...) is a public static field of
 * com.smart.app.ThingNGConfig that the app reads by name through one reflection getter
 * ("PackConfig"), optionally followed by a remote-config lookup ("oem:config"). The patches hook
 * those two getters, so a flag is overridden for every caller at once, including the copies R8
 * inlines into other methods between app releases.
 */
@SuppressWarnings("unused")
public final class ConfigOverrides {

    /** Flags that the "Hide AI assistant" runtime toggle forces off. */
    private static final Set<String> AI_KEYS = new HashSet<>();

    /** Flags forced at patch time (not toggleable at runtime). */
    private static final Map<String, Boolean> FIXED;

    static {
        AI_KEYS.add("is_ai_assistant_support");
        AI_KEYS.add("is_aiAssistant_show_in_nav");
        AI_KEYS.add("is_aiAssistant_show_in_deeppull");

        Map<String, Boolean> fixed = new HashMap<>();
        try {
            for (String entry : fixedSpec().split(";")) {
                int eq = entry.indexOf('=');
                if (eq <= 0 || entry.startsWith("@")) continue;
                fixed.put(entry.substring(0, eq), "1".equals(entry.substring(eq + 1)));
            }
        } catch (Throwable ignored) {
        }
        FIXED = Collections.unmodifiableMap(fixed);
    }

    private ConfigOverrides() {}

    /**
     * Rewritten at patch time: the "Hide ads" / "Disable telemetry" patches append ";key=0" /
     * ";key=1" entries to this string constant (found by its "@smartlife-fixed-overrides@"
     * prefix). Must stay a plain string literal, and the marker must not appear anywhere else.
     */
    private static String fixedSpec() {
        return "@smartlife-fixed-overrides@";
    }

    private static Boolean lookup(String key) {
        if (key == null) return null;
        if (AI_KEYS.contains(key)) {
            return SmartLifeSettings.hideAiAssistant() ? Boolean.FALSE : null;
        }
        return FIXED.get(key);
    }

    /**
     * Called at the start of the PackConfig getter (reflection read of a ThingNGConfig field).
     *
     * @return the overridden value, or null to let the app read the real field.
     */
    public static Object override(Class<?> type, String key) {
        try {
            Boolean value = lookup(key);
            if (value == null) return null;
            if (type != null && !type.isInstance(value)) return null;
            return value;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Called at the start of the remote-config boolean getter. */
    public static boolean hasBooleanOverride(String key) {
        try {
            return lookup(key) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Only meaningful after {@link #hasBooleanOverride} returned true. */
    public static boolean booleanOverride(String key) {
        try {
            Boolean value = lookup(key);
            return value != null && value;
        } catch (Throwable t) {
            return false;
        }
    }
}
