package dev.jason.gboardpatches.patches.gboard.features.accessibilitylayout

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAccessibilityLayoutFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在 enable_pk_simulator 原始結果後套用使用者設定值",
    feature = GboardFlagFamilyFeature.ENABLE_ACCESSIBILITY_LAYOUT,
)
