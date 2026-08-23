package dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardClipboardContentLimitFeatureMarkerPatch = resourcePatch(
    description = "標記 Clipboard Custom Character Limit feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CLIPBOARD_CONTENT_LIMIT_FEATURE_MARKER)
    }
}

internal const val CLIPBOARD_CONTENT_LIMIT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.clipboard_content_limit"
