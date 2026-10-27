package software.santodan.extension.nuviomerged;

/** Navigation owns the merge gate; stream-search flags must never open it. */
public final class NuvioMergePolicy {
    public enum ReadTrigger { STARTUP, USER_SYNC, PLAYBACK, NAVIGATION, PROVIDER_NOTIFICATION }
    public static boolean readsProviders(ReadTrigger trigger) {
        return trigger == ReadTrigger.STARTUP || trigger == ReadTrigger.USER_SYNC;
    }
    private String route;
    private boolean foreground = true;
    private long revision;

    public synchronized boolean navigate(String value) {
        if (java.util.Objects.equals(route, value)) return false;
        route = value;
        revision++;
        return "home".equals(route);
    }
    public synchronized void foreground(boolean value) {
        if (foreground != value) { foreground = value; revision++; }
    }
    public synchronized boolean allowed(boolean manual) {
        return foreground && route != null && !route.startsWith("player/")
            && (manual || "home".equals(route));
    }
    public synchronized long revision() { return revision; }
    public synchronized boolean current(long value, boolean manual) {
        return allowed(manual) && (manual || revision == value);
    }

    public static <T> java.util.ArrayList<T> scrobblers(java.util.ArrayList<T> original,
            boolean enabled, String main, java.util.function.Function<T, String> identity) {
        if (!enabled) return original;
        java.util.ArrayList<T> selected = new java.util.ArrayList<>();
        for (T provider : original) if (main.equals(identity.apply(provider))) selected.add(provider);
        return selected;
    }
    public static boolean syncLocal(boolean requested, boolean enabled, String main) {
        return requested && (!enabled || "NUVIO_SYNC".equals(main));
    }
}
