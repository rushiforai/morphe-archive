package dev.jason.gboardpatches.patches.gboard.features.featureflags

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardDeviceIntelligenceFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Device Intelligence rollout flag.",
    feature = GboardFlagFamilyFeature.DEVICE_INTELLIGENCE,
)

internal val gboardGrammarCheckerFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Grammar Checker rollout flag.",
    feature = GboardFlagFamilyFeature.GRAMMAR_CHECKER,
)

internal val gboardInlineSuggestionsFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Inline Suggestions rollout flag.",
    feature = GboardFlagFamilyFeature.INLINE_SUGGESTIONS,
)

internal val gboardMultipleSmartSuggestionsFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Multiple Smart Suggestions rollout flag.",
    feature = GboardFlagFamilyFeature.MULTIPLE_SMART_SUGGESTIONS,
)

internal val gboardKeyShapeSelectionFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force only the selected Key Shape Selection rollout flag.",
    feature = GboardFlagFamilyFeature.KEY_SHAPE_SELECTION,
)
