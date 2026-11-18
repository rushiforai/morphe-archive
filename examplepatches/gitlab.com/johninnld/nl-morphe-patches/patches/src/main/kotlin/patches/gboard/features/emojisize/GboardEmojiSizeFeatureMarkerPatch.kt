package patches.gboard.features.emojisize

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardEmojiSizeFeatureMarkerPatch = resourcePatch(
    description = "Mark the Change emoji size feature as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(EMOJI_SIZE_FEATURE_MARKER)
    }
}

internal const val EMOJI_SIZE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.emoji_size"
