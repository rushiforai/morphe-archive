package patches.gboard.features.accessibilitylayout

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAccessibilityLayoutFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the user setting after the stock enable_pk_simulator result.",
    feature = GboardFlagFamilyFeature.ENABLE_ACCESSIBILITY_LAYOUT,
)
