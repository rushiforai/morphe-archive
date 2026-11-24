package patches.dynamicspot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/**
 * dynamicSpot's notification listener registers a PACKAGE_ADDED receiver that silently appends
 * every newly installed package to the "prefNotifApps" allow-list, so the island immediately
 * starts showing notifications from apps the user never chose. Returning from onReceive before
 * the write keeps the list exactly what the user selected in the app's own picker.
 */
@Suppress("unused")
val stopAutoAppSelectionPatch = bytecodePatch(
    name = "Stop automatic app selection",
    description = "Newly installed apps are no longer added to the notification apps list " +
        "in the background; every app is only shown after you enable it yourself.",
) {
    compatibleWith(dynamicspot)
    dependsOn(patches.shared.originalInput(dynamicspot), fixPairipStartupPatch)

    execute {
        AutoEnrollReceiverFingerprint.method.addInstruction(0, "return-void")
    }
}
