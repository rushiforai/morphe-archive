package app.paresh.patches.ticktick.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

// TickTickApplicationBase.attachBaseContext — earliest app lifecycle hook, runs
// before Firebase initializes.
object ApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/TickTickApplicationBase;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val restorePushPatch = bytecodePatch(
    name = "Restore notifications",
    description = "Spoofs the original signing certificate so Firebase Cloud Messaging accepts the re-signed app and task/reminder notifications keep working."
) {
    compatibleWith(COMPATIBILITY_TICKTICK)
    extendWith("extensions/extension.mpp")

    execute {
        ApplicationAttachBaseContextFingerprint.method.addInstructions(0, """
            invoke-static {}, Lapp/paresh/extension/ticktick/PushSignatureSpoof;->spoof()V
        """)
    }
}
