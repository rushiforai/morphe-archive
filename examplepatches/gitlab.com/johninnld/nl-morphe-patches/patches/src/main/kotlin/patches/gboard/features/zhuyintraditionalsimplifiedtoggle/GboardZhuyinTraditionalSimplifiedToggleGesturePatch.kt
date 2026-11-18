package patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import patches.gboard.shared.GboardGestureFamilyFeature
import patches.gboard.shared.gboardGestureFamilyFeaturePatch

internal val gboardZhuyinTraditionalSimplifiedToggleGesturePatch =
    gboardGestureFamilyFeaturePatch(
        description = "Consume the traditional/simplified toggle gesture during gesture dispatch.",
        feature = GboardGestureFamilyFeature.ZHUYIN_TOGGLE,
    )
