package patches.gboard.features.shiftdelete

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.features.featureflags.applyFeatureMarker

internal val gboardShiftDeleteFeatureMarkerPatch = resourcePatch(
    description = "Mark Shift + Backspace Forward Delete as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker("dev.jason.gboardpatches.feature.shift_forward_delete")
    }
}
