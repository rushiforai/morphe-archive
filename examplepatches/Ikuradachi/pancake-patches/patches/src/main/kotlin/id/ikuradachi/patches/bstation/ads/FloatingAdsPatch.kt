package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val floatingAdsPatch = bytecodePatch(
    name = "Disable floating ads",
    description = "Disables bottom-right promotional floating advertisement overlay.",
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        HomeFloatViewInfoIsValidFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
