package app.paresh.patches.plusmessenger.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

// ApplicationLoader.attachBaseContext — earliest app lifecycle hook, runs before
// Firebase initializes.
object ApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val restorePushPatch = bytecodePatch(
    name = "Restore push notifications",
    description = "Spoofs the original signing certificate so Firebase Cloud Messaging accepts the re-signed app and background notifications keep working."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)
    extendWith("extensions/extension.mpp")

    execute {
        ApplicationAttachBaseContextFingerprint.method.addInstructions(0, """
            invoke-static {}, Lapp/paresh/extension/plusmessenger/PushSignatureSpoof;->spoof()V
        """)
    }
}
