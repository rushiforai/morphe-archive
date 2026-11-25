package patches.gboard.features.toprowswipe

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.afterDelegate
import patches.gboard.shared.beforeDelegate
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE.beforeDelegate()
}
internal val TOP_ROW_SWIPE_ENTRY_DELEGATE: String
    get() = TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE
internal val TOP_ROW_SWIPE_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE.afterDelegate()
}

internal val gboardTopRowSwipeSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Intercept the SoftKeyView bind and rewrite top-row key metadata from the custom page state.",
    feature = GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE,
)
