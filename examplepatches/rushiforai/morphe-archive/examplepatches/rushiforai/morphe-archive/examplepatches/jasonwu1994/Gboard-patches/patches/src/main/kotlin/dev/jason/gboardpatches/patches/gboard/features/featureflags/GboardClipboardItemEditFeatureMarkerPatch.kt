package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardClipboardItemEditFeatureMarkerPatch = resourcePatch(
    description = "標記 clipboard item edit rollout flag patch 已打入 target APK"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CLIPBOARD_ITEM_EDIT_FEATURE_MARKER_NAME)
    }
}

private const val CLIPBOARD_ITEM_EDIT_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.clipboard_item_edit"
