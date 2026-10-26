package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val overlayAdsPatch = bytecodePatch(
    name = "Disable player overlay ads",
    description = "Disables video player in-stream bottom-right overlay ad banners.",
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        OverlayAdGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
