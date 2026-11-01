package dev.jason.gboardpatches.patches.gboard.features.emojifont

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardEmojiFontPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "在 Gboard 鍵盤按鍵綁定後套用自訂 Emoji TTF 字型",
    feature = GboardSoftKeyFamilyFeature.CUSTOM_EMOJI_FONT,
)
