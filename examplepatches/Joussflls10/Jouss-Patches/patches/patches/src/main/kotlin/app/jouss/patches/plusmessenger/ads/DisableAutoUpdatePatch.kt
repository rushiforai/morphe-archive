package app.jouss.patches.plusmessenger.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object PlusCheckAppUpdateFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/update/PlusUpdater;",
    name = "checkAppUpdate",
    returnType = "V",
)

object IsUpdateEnabledFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ActionBar/PlusSettings;",
    name = "isUpdateEnabled",
    returnType = "Z",
    parameters = listOf(),
)

object LaunchCheckAppUpdateFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    name = "checkAppUpdate",
    returnType = "V",
)

@Suppress("unused")
val disableAutoUpdatePatch = bytecodePatch(
    name = "Disable auto update",
    description = "Disables automatic app update checks."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // Block Plus update checker
        PlusCheckAppUpdateFingerprint.method.addInstructions(0, "return-void")

        // Always report updates as disabled
        IsUpdateEnabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Block LaunchActivity update entry point
        LaunchCheckAppUpdateFingerprint.method.addInstructions(0, "return-void")
    }
}
