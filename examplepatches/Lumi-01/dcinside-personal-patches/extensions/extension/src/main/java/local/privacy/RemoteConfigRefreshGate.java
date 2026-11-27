package local.privacy;



/** Avoid redundant remote-config fetches while retaining startup and stale refreshes. */
public final class RemoteConfigRefreshGate {
    private static final long EIGHTEEN_HOURS_MS = 64_800_000L;
    private static String preferencesClass;
    private static String forceGetter;

    private RemoteConfigRefreshGate() { }

    public static void configure(String owner, String getter) {
        preferencesClass = owner;
        forceGetter = getter;
    }

    public static boolean shouldRefreshOnHomeStop() {
        if (!SettingsState.get("reduce_config_refresh")) return true;
        try {
            Class<?> prefs = Class.forName(preferencesClass);
            Object instance = prefs.getField("a").get(null);
            if ((Boolean) prefs.getMethod(forceGetter).invoke(instance)) return true;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return true;
        }

        try {
            Object config = Class.forName("com.google.firebase.remoteconfig.p")
                .getMethod("t").invoke(null);
            Object info = config.getClass().getMethod("s").invoke(config);
            long lastFetch = ((Number) info.getClass().getMethod("a").invoke(info)).longValue();
            long age = System.currentTimeMillis() - lastFetch;
            if (lastFetch > 0 && age >= 0 && age < EIGHTEEN_HOURS_MS
                    && RemoteConfigFallback.hasActivatedConfig()) {
                return false;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return true;
        }
        return true;
    }
}
