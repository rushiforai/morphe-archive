package patches.gboard.features.zhuyinbottomrow

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.afterDelegate
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog

internal val ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW.afterDelegate()
}
internal val ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW.afterRuntimeCalls.single(),
).owner

internal val gboardZhuyinBottomRowWeightSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Apply the 7-slot bottom row weight override after the SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW,
)
