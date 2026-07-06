package app.paresh.patches.telegram.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM

object CheckAppUpdateFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    name = "checkAppUpdate",
    returnType = "V",
)

object BlockingUpdateViewShowFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/BlockingUpdateView;",
    name = "show",
    returnType = "V",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;", "Z"),
)

@Suppress("unused")
val disableAutoUpdatePatch = bytecodePatch(
    name = "Disable auto update",
    description = "Disables automatic app update checks."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        CheckAppUpdateFingerprint.method.addInstructions(0, "return-void")
        BlockingUpdateViewShowFingerprint.method.addInstructions(0, "return-void")
    }
}
