package dev.jason.gboardpatches.patches.gboard.features.frostedglass

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal const val FROSTED_GLASS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.frosted_glass"

internal val gboardFrostedGlassFeatureMarkerPatch = resourcePatch(
    description = "Mark the Frosted Glass feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker(FROSTED_GLASS_FEATURE_MARKER) }
}
