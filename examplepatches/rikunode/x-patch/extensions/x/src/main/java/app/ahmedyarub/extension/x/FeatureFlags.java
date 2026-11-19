package app.ahmedyarub.extension.x;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Feature switch values the patches force.
 *
 * Every server feature switch the app reads goes through one repository method, which asks
 * {@link #getOverride} first.
 */
@SuppressWarnings("unused")
public final class FeatureFlags {

    /**
     * The forced flags, separated by semicolons, each key=value. The value starts with its type:
     * b: boolean, l: long, d: double, s: string. Rewritten by the patches.
     */
    private static String forcedFlags() {
        return "";
    }

    /** Parsed on first use, then only read, from any thread. */
    private static final class Holder {
        static final Map<String, Object> OVERRIDES = parse(forcedFlags());
    }

    /** The forced value of a flag, or null to let the app read its own. */
    public static Object getOverride(String key) {
        return key == null ? null : Holder.OVERRIDES.get(key);
    }

    private static Map<String, Object> parse(String encoded) {
        if (encoded.isEmpty()) return Collections.emptyMap();

        Map<String, Object> overrides = new HashMap<>();
        for (String line : encoded.split(";")) {
            int tab = line.indexOf('=');
            if (tab <= 0 || line.length() < tab + 3) continue;

            String key = line.substring(0, tab);
            String value = line.substring(tab + 3);
            switch (line.charAt(tab + 1)) {
                case 'b' -> overrides.put(key, Boolean.parseBoolean(value));
                case 'l' -> overrides.put(key, Long.parseLong(value));
                case 'd' -> overrides.put(key, Double.parseDouble(value));
                default -> overrides.put(key, value);
            }
        }
        return Collections.unmodifiableMap(overrides);
    }
}
