package patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.afterDelegate
import patches.gboard.shared.beforeDelegate
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val ZHUYIN_TOGGLE_PATCH_INCOMING_METADATA_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_TOGGLE.beforeDelegate()
}
internal val ZHUYIN_TOGGLE_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.ZHUYIN_TOGGLE.afterDelegate()
}

internal val gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch =
    gboardSoftKeyFamilyFeaturePatch(
        description = "Fix the up-flick toggle key metadata at SoftKeyView bind time.",
        feature = GboardSoftKeyFamilyFeature.ZHUYIN_TOGGLE,
    )
