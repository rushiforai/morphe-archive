package patches.gboard.features.betafeatures

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardBetaFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Force the 18.8 beta gates that are plain boolean switches.",
    feature = GboardFlagFamilyFeature.BETA_FLAGS,
)
