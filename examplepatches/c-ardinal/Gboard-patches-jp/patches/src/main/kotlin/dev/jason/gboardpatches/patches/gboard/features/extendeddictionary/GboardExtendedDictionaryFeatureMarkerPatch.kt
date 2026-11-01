package dev.jason.gboardpatches.patches.gboard.features.extendeddictionary

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal const val EXTENDED_DICTIONARY_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.extended_dictionary"

internal val gboardExtendedDictionaryFeatureMarkerPatch = resourcePatch(
    description = "標記 Extended Dictionary feature 已被打入 target APK。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { applyFeatureMarker(EXTENDED_DICTIONARY_FEATURE_MARKER) }
}
