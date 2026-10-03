package app.morphe.patches.klikktv.device

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikktv.shared.Constants.COMPATIBILITY_KLIKKTV
import app.morphe.patches.klikktv.shared.patches.retrofit.response.deviceCheckResponse.getResultPatch

@Suppress("unused")
val bypassDeviceCheckPatch = bytecodePatch(
    name = "Bypass device check",
    description = "Force device check to succeed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKKTV)

    dependsOn(getResultPatch)
}