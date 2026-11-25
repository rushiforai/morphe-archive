package patches.gboard.features.accesspointsmenu

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAccessPointsMenuFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Keep enable_access_points_menu_redesign identical to the user toggle.",
    feature = GboardFlagFamilyFeature.ACCESS_POINTS_MENU_STYLE,
)
