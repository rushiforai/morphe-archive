package patches.gboard.features.toprowswipe

import patches.gboard.shared.GboardGestureFamilyFeature
import patches.gboard.shared.gboardGestureFamilyFeaturePatch

internal val gboardTopRowSwipeGesturePatch = gboardGestureFamilyFeaturePatch(
    description = "Consume the armed top-row swipe before gesture dispatch and block stale custom metadata dispatch.",
    feature = GboardGestureFamilyFeature.TOP_ROW_SWIPE,
)
