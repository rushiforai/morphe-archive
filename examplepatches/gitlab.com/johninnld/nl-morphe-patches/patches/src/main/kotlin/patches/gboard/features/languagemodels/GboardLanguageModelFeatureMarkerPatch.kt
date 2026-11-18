package patches.gboard.features.languagemodels

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardLanguageModelFeatureMarkerPatch = resourcePatch(
    description = "Expose dictionary and prediction settings for the selected patch.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker("dev.jason.gboardpatches.feature.language_models") }
}
