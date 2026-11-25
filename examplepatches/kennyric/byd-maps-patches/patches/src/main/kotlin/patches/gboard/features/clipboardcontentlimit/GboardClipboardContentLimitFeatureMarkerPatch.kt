package patches.gboard.features.clipboardcontentlimit

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardClipboardContentLimitFeatureMarkerPatch = resourcePatch(
    description = "Mark the Clipboard Custom Character Limit feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(CLIPBOARD_CONTENT_LIMIT_FEATURE_MARKER)
    }
}

internal const val CLIPBOARD_CONTENT_LIMIT_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.clipboard_content_limit"
