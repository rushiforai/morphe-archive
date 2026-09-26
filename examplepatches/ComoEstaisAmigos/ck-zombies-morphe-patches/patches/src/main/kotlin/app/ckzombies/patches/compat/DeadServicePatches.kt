package app.ckzombies.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GWALLET = "Lcom/glu/platform/gwallet/GWalletJNI;"

/**
 * Both send a request to PlayHaven, and both start by reading device identifiers through
 * `PHConstants.findDeviceInfo()`. From targetSdk 23 that throws unless READ_PHONE_STATE was
 * granted at runtime, which this game never asks for. They only run when the engine asks for
 * publisher content, so the crash arrives long after launch rather than at startup.
 */
internal object PublisherContentRequestFingerprint : Fingerprint(
    definingClass = "Lcom/glu/android/GluPlayHaven;",
    name = "startPublisherContentRequest",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z", "Z"),
)

internal object PublisherOpenRequestFingerprint : Fingerprint(
    definingClass = "Lcom/glu/android/GluPlayHaven;",
    name = "startPublisherOpenRequest",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Sends the wallet request to Glu's gWallet over Apache HTTP. The server is gone, so the call
 * can only time out, and the engine waits for the callback that the response would produce.
 */
internal object GWalletGetContentFingerprint : Fingerprint(
    definingClass = GWALLET,
    name = "GetContent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

/**
 * Stops the two requests to servers that no longer answer.
 *
 * The PlayHaven requests return at once, before they read any device identifier. `GetContent`
 * reports an empty response through the callback the native side waits for, which is the same
 * thing a failed request would end up doing, only without the wait.
 *
 * The bodies are left in place behind the return. Dalvik and ART resolve a class reference only
 * when the instruction runs, so code that cannot be reached costs nothing.
 */
internal val deadServiceRequestsPatch = bytecodePatch {
    execute {
        PublisherContentRequestFingerprint.method.addInstruction(0, "return-void")
        PublisherOpenRequestFingerprint.method.addInstruction(0, "return-void")

        // The engine waits for onHandleResponse, so the reply has to come even when nothing is
        // sent: an empty body and a zero status, which is what a failure produces anyway.
        GWalletGetContentFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                const/4 v1, 0x0
                invoke-static {v0, v1}, $GWALLET->onHandleResponse(Ljava/lang/String;I)V
                return-void
            """,
        )
    }
}
