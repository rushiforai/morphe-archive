package me.toidicakhia.patches.wedj

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import me.toidicakhia.patches.shared.Constants.WEDJ_COMPATIBILITY

@Suppress("unused")
val wedjDisableAnalyticsPatch = bytecodePatch(
    name = "Disable Analytics / Telemetry",
    description = "Stops WeDJ's Mobylog tracking client from uploading playback, " +
        "device-connection and startup app-check events.",
    default = true
) {
    compatibleWith(WEDJ_COMPATIBILITY)

    execute {
        MobylogUploadFingerprint.matchSingle().method.addInstructions(0, "return-void")
    }
}
