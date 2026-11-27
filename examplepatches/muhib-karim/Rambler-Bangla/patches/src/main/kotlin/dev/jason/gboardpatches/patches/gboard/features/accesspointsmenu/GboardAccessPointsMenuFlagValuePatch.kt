package dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAccessPointsMenuFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "讓 enable_access_points_menu_redesign 與使用者開關完全一致",
    feature = GboardFlagFamilyFeature.ACCESS_POINTS_MENU_STYLE,
)
