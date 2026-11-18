package app.afterglow.extension.navigation;

/** Native 21.43.523 Shorts progress modes, before the protobuf enum mapper. */
public final class ShortsProgressPolicy {
    private ShortsProgressPolicy() {}

    public static boolean enabled() {
        return Gate.on(Gate.SHORTS, "shortsProgress");
    }

    public static int displayMode(int original) {
        // 1: disabled, 2: always, 3: pause only. Keep unspecified and unknown
        // values, and leave every native lifecycle/interaction guard intact.
        return enabled() && original >= 1 && original <= 3 ? 2 : original;
    }
}
