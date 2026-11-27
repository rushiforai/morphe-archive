package local.privacy;

import java.lang.reflect.Method;
import java.util.Map;

/** Accept a previously activated Firebase configuration after a transient fetch failure. */
public final class RemoteConfigFallback {
    private static String sourceGetter = "Q";
    private RemoteConfigFallback() { }
    public static void configure(String getter) {
        sourceGetter = getter;
    }

    public static boolean successOrActivated(boolean fetchSucceeded) {
        return fetchSucceeded || hasActivatedConfig();
    }

    public static boolean hasActivatedConfig() {
        try {
            Object config = Class.forName("com.google.firebase.remoteconfig.p")
                .getMethod("t").invoke(null);
            Object values = config.getClass().getMethod("p").invoke(config);
            for (Object value : ((Map<?, ?>) values).values()) {
                Method source = value.getClass().getMethod(sourceGetter);
                if (((Number) source.invoke(value)).intValue() == 2) return true;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // No safe cached value could be established.
        }
        return false;
    }
}
