package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val innerPushPatch = bytecodePatch(
    name = "Disable inner push banner",
    description = "Disables top slide-down promotional toast and inner-push banner notifications.",
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        InnerPushFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
