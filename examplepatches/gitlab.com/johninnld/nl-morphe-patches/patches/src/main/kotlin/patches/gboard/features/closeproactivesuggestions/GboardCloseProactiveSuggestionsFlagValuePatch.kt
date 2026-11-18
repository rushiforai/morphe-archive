package patches.gboard.features.closeproactivesuggestions

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardCloseProactiveSuggestionsFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the feature setting after the stock close proactive suggestions flag result.",
    feature = GboardFlagFamilyFeature.CLOSE_PROACTIVE_SUGGESTIONS,
)
