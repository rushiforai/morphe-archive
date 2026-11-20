package app.morphe.patches.picsart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val picsartRemoveAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes ads from Picsart.",
    default = true,
) {
    dependsOn(picsartBypassSignatureCheckPatch)
    compatibleWith(COMPATIBILITY_PICSART)

    execute {
        // g(): true => ads disabled. Callers (BU.i/l/m.a()) return early on true.
        AdsDisabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
