package dev.jason.gboardpatches.patches.gboard.features.spacebarlogo

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.afterDelegate
import dev.jason.gboardpatches.patches.gboard.shared.beforeDelegate
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val SPACEBAR_LOGO_BEFORE_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.SPACEBAR_LOGO.beforeDelegate()
}
internal val SPACEBAR_LOGO_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.SPACEBAR_LOGO.afterDelegate()
}

internal val gboardSpacebarLogoSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "在 SoftKeyView bind 前後委派空白鍵圖示顯示。",
    feature = GboardSoftKeyFamilyFeature.SPACEBAR_LOGO,
)
