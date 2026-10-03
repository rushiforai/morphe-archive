package app.morphe.patches.klikk.device

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikk.shared.Constants.COMPATIBILITY_KLIKK
import app.morphe.patches.klikk.shared.patches.api.response.deviceCheckResponse.getResultPatch
import app.morphe.patches.klikk.shared.patches.ui.activity.newDetailsAndDownloadActivity.deviceCheckFieldAccessPatch

@Suppress("unused")
val bypassDeviceCheckPatch = bytecodePatch(
    name = "Bypass device check",
    description = "Force device check to succeed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKK)

    dependsOn(getResultPatch, deviceCheckFieldAccessPatch)
}