package patches.gboard.features.closeproactivesuggestions

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardCloseProactiveSuggestionsFeatureMarkerPatch = resourcePatch(
    description = "Mark the Close Proactive Suggestions feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CLOSE_PROACTIVE_SUGGESTIONS_FEATURE_MARKER)
    }
}

internal const val CLOSE_PROACTIVE_SUGGESTIONS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.close_proactive_suggestions"
