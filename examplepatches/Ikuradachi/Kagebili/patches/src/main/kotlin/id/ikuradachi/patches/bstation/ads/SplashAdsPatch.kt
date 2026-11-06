package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applySplashAds() {
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
