package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.afterDelegate
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog

internal val ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW.afterDelegate()
}
internal val ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW.afterRuntimeCalls.single(),
).owner

internal val gboardZhuyinBottomRowWeightSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "在 SoftKeyView bind 完成後套用注音底排 7-slot 權重覆寫。",
    feature = GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW,
)
