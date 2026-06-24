package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardClipboardEntityExtractionFeatureMarkerPatch = resourcePatch(
    description = "標記 clipboard entity extraction rollout flag patch 已打入 target APK"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CLIPBOARD_ENTITY_EXTRACTION_FEATURE_MARKER_NAME)
    }
}

private const val CLIPBOARD_ENTITY_EXTRACTION_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.clipboard_entity_extraction"
