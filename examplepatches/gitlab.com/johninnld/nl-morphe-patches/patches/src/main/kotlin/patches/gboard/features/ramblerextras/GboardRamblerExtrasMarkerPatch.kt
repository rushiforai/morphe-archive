package patches.gboard.features.ramblerextras

import app.morphe.patcher.patch.resourcePatch
import patches.gboard.features.featureflags.applyFeatureMarker
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal const val RAMBLER_EXTRAS_FEATURE_MARKER = "dev.jason.gboardpatches.feature.rambler_extras"

/** Marks the optional Rambler toolbar/revert behaviour as present; the runtime reads this marker. */
internal val gboardRamblerExtrasMarkerPatch = resourcePatch(
    description = "Mark the Rambler toolbar and revert extras as present in the target APK.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyFeatureMarker(RAMBLER_EXTRAS_FEATURE_MARKER)
    }
}
