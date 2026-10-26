package id.ikuradachi.patches.carbitlink.umeng

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.carbitlink.shared.Constants.COMPATIBILITY_CARBIT_LINK

@Suppress("unused")
val disableUmengPatch = bytecodePatch(
    name = "Disable tracking and analytics (Experimental)",
    description = "Attempts to block background telemetry and trackers. Not guaranteed to stop 100% of data collection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CARBIT_LINK)

    execute {
        listOf(
            UmengInitFingerprint,
            UmengDispatchFingerprint,
            UmengSpyInitializerFingerprint,
        ).map { it.matchAll(1..1).single().method }.forEach { method ->
            method.addInstruction(0, "return-void")
        }
    }
}
