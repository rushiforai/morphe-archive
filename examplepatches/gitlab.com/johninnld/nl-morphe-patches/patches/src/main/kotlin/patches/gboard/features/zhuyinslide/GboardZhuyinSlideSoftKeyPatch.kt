package patches.gboard.features.zhuyinslide

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.beforeDelegate
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val ZHUYIN_SLIDE_SOFT_KEY_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE.beforeDelegate()
}

internal val gboardZhuyinSlideSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Complete the up/down slide actions at the end of the SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE,
)
