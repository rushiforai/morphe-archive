package dev.jason.gboardpatches.extension.rambler;

/**
 * Exposes Gboard's cloud Rambler voice typing on phones Google does not roll it out to.
 *
 * <p>Gboard only offers the Rambler/Standard choice in Voice settings when agentic dictation is
 * enabled and the activation type is the agentic one (2). A re-signed Gboard never receives
 * those server values, so they are supplied here. The two toolbar flags match the set confirmed
 * working on a device by other Rambler patches. Which recognizer runs stays the user's choice.
 */
public final class GboardRamblerCloudRuntime {
    public static final String ENABLE_AGENTIC_DICTATION_FLAG = "enable_agentic_dictation";
    public static final String ENABLE_RAMBLER_AL_TOOLBAR_FLAG = "enable_rambler_al_toolbar";
    public static final String ENABLE_RAMBLER_TOOLBAR_AT_CURSOR_POSITION_FLAG =
            "enable_rambler_toolbar_at_cursor_position";
    public static final String AD_ACTIVATION_TYPE_FLAG = "ad_activation_type";
    public static final long AGENTIC_ACTIVATION_TYPE = 2L;

    private GboardRamblerCloudRuntime() {
    }

    /** Flag-family hook: called with every flag name and Gboard's own value for it. */
    public static Object applyFlagValue(String flagName, Object originalResult) {
        if (flagName == null) {
            return originalResult;
        }
        switch (flagName) {
            case ENABLE_AGENTIC_DICTATION_FLAG:
            case ENABLE_RAMBLER_AL_TOOLBAR_FLAG:
            case ENABLE_RAMBLER_TOOLBAR_AT_CURSOR_POSITION_FLAG:
                return originalResult instanceof Boolean ? Boolean.TRUE : originalResult;
            case AD_ACTIVATION_TYPE_FLAG:
                return originalResult instanceof Long
                        ? Long.valueOf(AGENTIC_ACTIVATION_TYPE)
                        : originalResult;
            default:
                return originalResult;
        }
    }
}
