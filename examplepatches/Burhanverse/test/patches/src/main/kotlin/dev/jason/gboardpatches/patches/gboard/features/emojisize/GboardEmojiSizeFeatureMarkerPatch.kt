package dev.jason.gboardpatches.patches.gboard.features.emojisize

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.applyFeatureMarker
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardEmojiSizeFeatureMarkerPatch = resourcePatch(
    description = "標記 Change emoji size feature 已被打入 target APK",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(EMOJI_SIZE_FEATURE_MARKER)
    }
}

internal const val EMOJI_SIZE_FEATURE_MARKER =
    "dev.jason.gboardpatches.feature.emoji_size"
