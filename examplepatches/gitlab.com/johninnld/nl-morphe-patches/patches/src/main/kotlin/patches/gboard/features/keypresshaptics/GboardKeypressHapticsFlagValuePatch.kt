package patches.gboard.features.keypresshaptics

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardKeypressHapticsFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Enable Gboard's native primitive-click path through its existing flag reader.",
    feature = GboardFlagFamilyFeature.KEYPRESS_HAPTICS,
)
