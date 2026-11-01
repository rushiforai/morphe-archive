package dev.jason.gboardpatches.patches.gboard.features.closeproactivesuggestions

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardCloseProactiveSuggestionsFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在 close proactive suggestions flag 的 stock result 後套用 feature 設定。",
    feature = GboardFlagFamilyFeature.CLOSE_PROACTIVE_SUGGESTIONS,
)
