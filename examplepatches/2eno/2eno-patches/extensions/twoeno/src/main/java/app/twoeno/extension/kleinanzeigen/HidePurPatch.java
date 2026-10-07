package app.twoeno.extension.kleinanzeigen;

import java.util.Locale;

import app.twoeno.extension.shared.Reflection;

/**
 * Hides the "Kleinanzeigen Pur" (ad free subscription) offers by reporting
 * the remote config flags of the subscription as disabled.
 */
@SuppressWarnings("unused")
public final class HidePurPatch {
    private static final String FLAG_NAME_PREFIX = "AdFreeSubscription";
    private static final String FLAG_KEY = "ad_free_subscription";

    private HidePurPatch() {
    }

    /**
     * @param flag A remote config flag. Either an enum, a Kotlin data object or an object with a {@code getKey()} method.
     * @return If the flag belongs to the Pur subscription.
     */
    public static boolean isPurFlag(Object flag) {
        if (flag == null) return false;

        if (flag instanceof String) return isPurKey((String) flag);

        String name = flag instanceof Enum ? ((Enum<?>) flag).name() : flag.toString();
        if (name != null && name.startsWith(FLAG_NAME_PREFIX)) return true;

        try {
            Object key = Reflection.call(flag, "getKey");
            return key instanceof String && isPurKey((String) key);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isPurKey(String key) {
        return key != null && key.toLowerCase(Locale.ROOT).contains(FLAG_KEY);
    }
}
