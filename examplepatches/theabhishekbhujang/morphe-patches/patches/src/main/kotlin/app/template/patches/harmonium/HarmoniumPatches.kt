package app.template.patches.harmonium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HARMONIUM

val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes all banner ads, interstitial ads, open app ads, and enables permanent ad-free status.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HARMONIUM)

    execute {
        // 1. Force G0.e.m() to return true (ad-free status)
        Fingerprint(
            definingClass = "LG0/e;",
            name = "m",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Force SAI.m() to return false (no interstitial available to show)
        Fingerprint(
            definingClass = "Lharmonium/music/gameg/real/harmoniumfree/SAI;",
            name = "m",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
