package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.afterDelegate
import dev.jason.gboardpatches.patches.gboard.shared.beforeDelegate
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE.beforeDelegate()
}
internal val TOP_ROW_SWIPE_ENTRY_DELEGATE: String
    get() = TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE
internal val TOP_ROW_SWIPE_AFTER_BIND_DELEGATE by lazy {
    GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE.afterDelegate()
}

internal val gboardTopRowSwipeSoftKeyPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "攔 SoftKeyView bind，按 custom page 狀態改寫第一排 key metadata。",
    feature = GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE,
)
