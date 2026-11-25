package patches.gboard.features.accesspointcount

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAccessPointCountFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the feature setting after the stock toolbar access point count flag result.",
    feature = GboardFlagFamilyFeature.ACCESS_POINT_COUNT,
)
