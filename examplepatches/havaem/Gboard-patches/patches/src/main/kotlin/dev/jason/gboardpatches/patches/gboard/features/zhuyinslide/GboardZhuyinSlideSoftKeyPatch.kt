package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.beforeDelegate
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val ZHUYIN_SLIDE_SOFT_KEY_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE.beforeDelegate()
}

internal val gboardZhuyinSlideSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "在 18.0.3 SoftKeyView bind 最後補齊普通注音上下滑 action。",
    feature = GboardSoftKeyFamilyFeature.ZHUYIN_SLIDE,
)
