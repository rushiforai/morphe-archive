package dev.jason.gboardpatches.patches.gboard.features.calculator

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCalculatorFeatureMarkerPatch = resourcePatch(
    description = "Mark the Simple Calculator feature as present in the target APK, sharing the settings UI filter.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CALCULATOR_FEATURE_MARKER_NAME)
    }
}

private const val CALCULATOR_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.simple_calculator"
