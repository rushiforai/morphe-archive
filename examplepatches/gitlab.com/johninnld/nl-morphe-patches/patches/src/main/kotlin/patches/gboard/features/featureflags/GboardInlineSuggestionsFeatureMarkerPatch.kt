package patches.gboard.features.featureflags

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardInlineSuggestionsFeatureMarkerPatch = resourcePatch(
    description = "Mark the inline suggestions rollout flag patch as present in the target APK."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(INLINE_SUGGESTIONS_FEATURE_MARKER_NAME)
    }
}

private const val INLINE_SUGGESTIONS_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.inline_suggestions"
