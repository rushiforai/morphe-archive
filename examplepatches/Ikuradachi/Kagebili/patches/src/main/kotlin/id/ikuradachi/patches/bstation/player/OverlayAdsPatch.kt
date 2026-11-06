package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applyOverlayAds() {
    OverlayAdGateFingerprint.method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """,
    )
}
