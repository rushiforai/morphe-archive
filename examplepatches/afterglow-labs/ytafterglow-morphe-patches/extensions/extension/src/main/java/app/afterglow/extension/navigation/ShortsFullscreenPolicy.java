package app.afterglow.extension.navigation;

/** The independently installed Shorts pinch preference; native behavior is the default. */
public final class ShortsFullscreenPolicy {
    private ShortsFullscreenPolicy() {}

    public static boolean enabled() {
        return Gate.on(Gate.SHORTS, "pinchToFullscreenShorts");
    }

    public static boolean capability(boolean original) {
        return original || enabled();
    }
}
