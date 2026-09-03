package morningentree.morphe.patches.fylo.premium

import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.all.detection.pairip.disablePairipPatch
import morningentree.morphe.patches.fylo.shared.Constants
import morningentree.morphe.util.returnEarly

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks Fylo File Manager Pro",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disablePairipPatch)

    execute {
        DebugFeatureUnlockIsActiveFingerprint.method.returnEarly(true)
    }
}
