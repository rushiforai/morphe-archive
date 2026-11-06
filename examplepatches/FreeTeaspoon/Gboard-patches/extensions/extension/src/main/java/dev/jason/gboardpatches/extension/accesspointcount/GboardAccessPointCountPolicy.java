package dev.jason.gboardpatches.extension.accesspointcount;

public final class GboardAccessPointCountPolicy {
    public static final String MAX_ACCESS_POINTS_FLAG = "config_max_access_points";
    public static final String DEFAULT_ACCESS_POINTS_FLAG =
            "config_default_access_points_num_on_bar";

    private GboardAccessPointCountPolicy() {
    }

    public static boolean isTargetFlagName(String flagName) {
        return MAX_ACCESS_POINTS_FLAG.equals(flagName)
                || DEFAULT_ACCESS_POINTS_FLAG.equals(flagName);
    }

    public static Object maybeForce(String flagName, Object stockResult,
            GboardAccessPointCountSettings.Snapshot settings) {
        if (settings == null
                || !settings.enabled
                || !GboardAccessPointCountSettings.isValidCount(settings.count)
                || !isTargetFlagName(flagName)
                || !(stockResult instanceof Long)) {
            return stockResult;
        }
        return Long.valueOf(settings.count);
    }
}
