package patches.gboard.features.longpressquickactions

import patches.gboard.shared.GboardGestureFamilyFeature
import patches.gboard.shared.gboardGestureFamilyFeaturePatch

internal val gboardLongPressQuickActionsGesturePatch = gboardGestureFamilyFeaturePatch(
    description = "Consume owned globe-drag editing gestures before other gesture policies.",
    feature = GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS,
)
