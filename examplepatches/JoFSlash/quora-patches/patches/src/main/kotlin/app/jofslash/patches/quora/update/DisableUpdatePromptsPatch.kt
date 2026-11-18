package app.jofslash.patches.quora.update

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

internal object HandleAppUpdateInfoFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/QUpdateAppMessageHandler;",
    name = "handleAppUpdateInfo",
    returnType = "I",
    parameters = listOf("Lcom/google/android/play/core/appupdate/AppUpdateInfo;", "Z"),
)

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Stops the app from showing the Google Play update screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        // Always report UpdateAvailability.UPDATE_NOT_AVAILABLE (1), so the update flow never starts.
        HandleAppUpdateInfoFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
