package mightymich.morphe.patches.com.quvideo.vivacut

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks VivaCut Pro by forcing IapService.F()Z to return true. WARNING: May cause crashes.",
    default = true
) {
    compatibleWith(VivaCutCompatibility.VIVACUT)

    val iapFingerprint = Fingerprint(
        definingClass = "Lcom/quvideo/vivacut/iap/IapService;",
        name = "F",
        returnType = "Z"
    )

    execute {
        iapFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'F' in IapService.")
            method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
