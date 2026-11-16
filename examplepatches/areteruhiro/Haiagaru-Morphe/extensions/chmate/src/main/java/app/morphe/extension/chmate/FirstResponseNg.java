package app.morphe.extension.chmate;

import java.util.LinkedHashMap;
import java.util.Map;

/** Keep the opening post readable without changing stored NG rules or unrelated row flags. */
public final class FirstResponseNg {
    static final String KEY = "disableFirstResponseNg";
    static final boolean DEFAULT = true;
    private static final int NG_FLAGS = ChainAboneVisibility.DIRECT_REASONS | 0x1000;
    private FirstResponseNg() {}

    static boolean disabled() { return FeatureSwitches.enabled(KEY, DEFAULT); }

    public static int protectedNumber(int number) {
        return number != 1 || disabled() ? 1 : 0;
    }

    public static int legacyTreeNumber(int number) {
        return number == 1 && !disabled() ? 0 : number;
    }

    static boolean hasNgFlags(int flags) { return (flags & NG_FLAGS) != 0; }

    static int visibleFlags(int number, int flags) {
        return number == 1 && hasNgFlags(flags) && disabled() ? flags & ~NG_FLAGS : flags;
    }

    public static Map<Integer, Integer> modernFlags(Map<Integer, Integer> flags) {
        if (flags == null) return null;
        Integer original = flags.get(1);
        if (original == null) return flags;
        int visible = visibleFlags(1, original);
        if (visible == original) return flags;
        Map<Integer, Integer> copy = new LinkedHashMap<>(flags);
        if (visible == 0) copy.remove(1);
        else copy.put(1, visible);
        return copy;
    }
}
