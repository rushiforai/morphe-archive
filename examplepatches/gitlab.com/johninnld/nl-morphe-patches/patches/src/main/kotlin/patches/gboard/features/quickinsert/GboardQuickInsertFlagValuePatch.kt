package patches.gboard.features.quickinsert

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardQuickInsertFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the feature setting after the stock Quick Insert flag results.",
    feature = GboardFlagFamilyFeature.QUICK_INSERT,
)
