package dev.srwi.gintype.patches.gboard.features.multiglide

import app.morphe.patcher.patch.resourcePatch
import dev.srwi.gintype.patches.gboard.shared.applyFeatureMarker
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardMultiGlideFeatureMarkerPatch = resourcePatch(
    description = "Marks MultiGlide multi-finger swipe patch availability in AndroidManifest metadata.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(MULTIGLIDE_FEATURE_MARKER_NAME)
    }
}

internal const val MULTIGLIDE_FEATURE_MARKER_NAME =
    "dev.srwi.gintype.feature.multiglide"
