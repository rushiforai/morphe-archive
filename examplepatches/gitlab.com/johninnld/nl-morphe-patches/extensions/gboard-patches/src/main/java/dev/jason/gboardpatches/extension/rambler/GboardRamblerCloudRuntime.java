package dev.jason.gboardpatches.extension.rambler;

import android.content.Context;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;

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
    /** Optional extras live behind this manifest marker, written by their own patch. */
    private static final String RAMBLER_EXTRAS_FEATURE_MARKER =
            "dev.jason.gboardpatches.feature.rambler_extras";
    private static final String RAMBLER_AUTOMATIC_RETRY_FEATURE_MARKER =
            "dev.jason.gboardpatches.feature.rambler_automatic_retry";
    private static final String AUTOMATIC_RETRY_FLAG =
            "agentic_dictation_enable_auto_parallel_retry";
    public static final String RAMBLER_AL_OVERFLOW_MENU_FLAG =
            "enable_rambler_al_toolbar_overflow_menu";
    public static final String RAMBLER_PRESERVE_REWRITTEN_ON_REVERT_FLAG =
            "rambler_preserve_rewritten_text_on_revert";
    public static final String JETSON_LITE_EDIT_HISTORY_FLAG = "jetson_lite_enable_edit_history";
    private static volatile Boolean extrasEnabled;
    public static final long AGENTIC_ACTIVATION_TYPE = 2L;
    /**
     * 18.8.0 addition: after Rambler rewrites a span, put the cursor after the last change instead
     * of at the end of the text (kov reads it at two sites). Off by default in this beta.
     */
    public static final String JETSON_POSITION_INPUT_CURSOR_AFTER_DIFF_FLAG =
            "jetson_position_cursor_after_last_diff";

    private GboardRamblerCloudRuntime() {
    }

    /** True when the optional-extras patch added its manifest marker to this build. */
    static boolean extrasEnabled() {
        Boolean cached = extrasEnabled;
        if (cached != null) {
            return cached.booleanValue();
        }
        Context context = GboardFlagRuntimeContext.resolveContext();
        if (context == null) {
            return false;
        }
        boolean resolved = GboardPatchesFeatureAvailability.hasFeature(
                context, RAMBLER_EXTRAS_FEATURE_MARKER);
        extrasEnabled = Boolean.valueOf(resolved);
        return resolved;
    }

    /** Flag-family hook: called with every flag name and Gboard's own value for it. */
    public static Object applyFlagValue(String flagName, Object originalResult) {
        if (flagName == null) {
            return originalResult;
        }
        if (AUTOMATIC_RETRY_FLAG.equals(flagName)) {
            return applyAutomaticRetryFlag(originalResult, Boolean.FALSE.equals(originalResult)
                    && GboardPatchesFeatureAvailability.hasFeature(
                            GboardFlagRuntimeContext.resolveContext(),
                            RAMBLER_AUTOMATIC_RETRY_FEATURE_MARKER));
        }
        return applyFlagValue(flagName, originalResult, extrasEnabled());
    }

    static Object applyAutomaticRetryFlag(Object originalResult, boolean enabled) {
        return enabled && Boolean.FALSE.equals(originalResult) ? Boolean.TRUE : originalResult;
    }

    static Object applyFlagValue(String flagName, Object originalResult, boolean extras) {
        switch (flagName) {
            case RAMBLER_AL_OVERFLOW_MENU_FLAG:
            case RAMBLER_PRESERVE_REWRITTEN_ON_REVERT_FLAG:
            case JETSON_LITE_EDIT_HISTORY_FLAG:
                return extras && originalResult instanceof Boolean
                        ? Boolean.TRUE
                        : originalResult;
            case ENABLE_AGENTIC_DICTATION_FLAG:
            case ENABLE_RAMBLER_AL_TOOLBAR_FLAG:
            case ENABLE_RAMBLER_TOOLBAR_AT_CURSOR_POSITION_FLAG:
            case JETSON_POSITION_INPUT_CURSOR_AFTER_DIFF_FLAG:
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
