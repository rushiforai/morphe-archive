package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import dev.jason.gboardpatches.patches.gboard.shared.GboardGestureFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardGestureFamilyFeaturePatch

internal val gboardZhuyinTraditionalSimplifiedToggleGesturePatch =
    gboardGestureFamilyFeaturePatch(
        description = "在 gesture dispatch 中 consume 注音繁簡切換手勢。",
        feature = GboardGestureFamilyFeature.ZHUYIN_TOGGLE,
    )
