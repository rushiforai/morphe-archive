package app.paresh.patches.docscanner.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.docscanner.shared.Constants.COMPATIBILITY_DOCSCANNER

@Suppress("unused")
val docScannerPremiumPatch = bytecodePatch(
    name = "Doc Scanner Premium",
    description = "Unlocks all premium features, removes ads, and enables pro themes."
) {
    compatibleWith(COMPATIBILITY_DOCSCANNER)

    execute {
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
