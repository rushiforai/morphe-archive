package patches.gboard.features.spacebarlogo

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.afterDelegate
import patches.gboard.shared.beforeDelegate
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val SPACEBAR_LOGO_BEFORE_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.SPACEBAR_LOGO.beforeDelegate()
}
internal val SPACEBAR_LOGO_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.SPACEBAR_LOGO.afterDelegate()
}

internal val gboardSpacebarLogoSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Delegate spacebar icon rendering around the SoftKeyView bind.",
    feature = GboardSoftKeyFamilyFeature.SPACEBAR_LOGO,
)
