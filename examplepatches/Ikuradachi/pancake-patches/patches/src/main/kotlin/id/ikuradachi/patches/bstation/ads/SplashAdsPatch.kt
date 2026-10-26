package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val splashAdsPatch = bytecodePatch(
    name = "Disable splash ads",
    description = "Disables cold-start splash advertisement loading and countdown timer.",
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        ColdSplashAdUnitFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        SplashLoadTimeoutFingerprint.method.addInstructions(
            0,
            """
                const-wide/16 v0, 0x0
                return-wide v0
            """,
        )
    }
}
