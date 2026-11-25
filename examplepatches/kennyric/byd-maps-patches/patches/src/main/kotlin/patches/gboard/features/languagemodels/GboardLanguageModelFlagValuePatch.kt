package patches.gboard.features.languagemodels

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardLanguageModelFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Select typed dictionary and prediction resource flags.",
    feature = GboardFlagFamilyFeature.LANGUAGE_MODELS,
)
