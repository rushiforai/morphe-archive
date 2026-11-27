package dev.jason.gboardpatches.extension.closeproactivesuggestions;

public final class GboardCloseProactiveSuggestionsPolicy {
    public static final String FLAG_NAME =
            "enable_close_proactive_suggestions_access_point";

    private GboardCloseProactiveSuggestionsPolicy() {
    }

    public static boolean isTargetFlagName(String flagName) {
        return FLAG_NAME.equals(flagName);
    }

    public static Object maybeForce(String flagName, Object stockResult, boolean enabled) {
        if (!enabled || !isTargetFlagName(flagName) || !(stockResult instanceof Boolean)) {
            return stockResult;
        }
        return Boolean.TRUE;
    }
}
