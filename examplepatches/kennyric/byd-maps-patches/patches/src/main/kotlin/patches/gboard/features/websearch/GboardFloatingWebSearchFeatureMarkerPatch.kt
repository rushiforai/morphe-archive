package patches.gboard.features.websearch

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardFloatingWebSearchFeatureMarkerPatch = resourcePatch(
    description = "Mark the Floating Web Search feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(FLOATING_WEB_SEARCH_FEATURE_MARKER)
    }
}

internal const val FLOATING_WEB_SEARCH_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.floating_web_search"
