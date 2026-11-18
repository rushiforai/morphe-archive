package patches.gboard.features.longpressquickactions

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardLongPressQuickActionsSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Apply or restore the long-press shortcut metadata before the SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.LONG_PRESS_QUICK_ACTIONS,
)
