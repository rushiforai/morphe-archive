package dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal const val EDITING_ACCESS_POINTS_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.editing_access_points"

internal val gboardEditingAccessPointsFeatureMarkerPatch = resourcePatch(
    description = "Mark the Toolbar Editing Buttons feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker(EDITING_ACCESS_POINTS_FEATURE_MARKER) }
}
