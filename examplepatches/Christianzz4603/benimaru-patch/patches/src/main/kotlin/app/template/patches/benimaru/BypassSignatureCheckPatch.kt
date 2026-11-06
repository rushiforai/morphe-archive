package app.template.patches.benimaru

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

val COMPATIBILITY_BENIMARU_SIGNATURE = Compatibility(
    name = "Benimaru Tool",
    packageName = "com.benimaru.official"
)

/**
 * Private final verifyAppSignature() called from onCreate.
 * This method launches the coroutine that compares the APK signature
 * and shows "Unofficial APK detected! Closing app." on mismatch.
 */
object VerifyAppSignatureEntryFingerprint : Fingerprint(
    definingClass = "Lcom/benimaru/official/MainActivity;",
    name = "verifyAppSignature",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf()
)

@Suppress("unused")
val bypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass unofficial APK check",
    description = "Disables the 'Unofficial APK detected! Closing app.' signature check so the app no longer force-closes when the signing certificate does not match the official one.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BENIMARU_SIGNATURE)

    execute {
        val method = VerifyAppSignatureEntryFingerprint.method

        // Remove all existing instructions
        val size = method.implementation!!.instructions.size
        if (size > 0) {
            method.removeInstructions(0, size)
        }

        // Make the method an immediate no-op
        method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )
    }
}
