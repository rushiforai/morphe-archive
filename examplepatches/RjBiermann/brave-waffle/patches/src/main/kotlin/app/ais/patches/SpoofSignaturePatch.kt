package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Every API request authenticates with a `hash` header: a JSON blob (via GSON,
 * which serializes FIELDS) that includes the SHA-256 digest of the app's
 * signing certificate. The server rejects unknown signing certificates with an
 * "Application Error - Please redownload" dialog.
 *
 * The digest is computed inline in `x93.b()`: `Signature.toByteArray()` ->
 * SHA-256 -> Base64 -> added to the signature list via the getter.
 *
 * Hooking that inline `Base64.encodeToString()` call and replacing the result
 * with the original app signature makes every patched build report the stock
 * certificate, no matter what key it was signed with.
 */
private const val ORIGINAL_SIGNATURE = "VQMyUhZdmnnwK5RVCbeGqu0HN020MEDUM44crQyL1zw="

object SignatureFingerprint : Fingerprint(
    definingClass = "Lx93;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/util/Base64;",
            name = "encodeToString"
        )
    )
)

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof app signature",
    description = "Reports the original app signature to the API so patched builds are not rejected.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        val match = SignatureFingerprint.match()
        // invoke-static {v6, v8}, Base64;->encodeToString([BI)  <- index     (35c, NOT one-register)
        // move-result-object v6                                 <- index + 1
        val index = match.instructionMatches.first().index
        val method = SignatureFingerprint.method
        val register = method.getInstruction<OneRegisterInstruction>(index + 1).registerA
        method.removeInstructions(index, 2)
        method.addInstruction(index, "const-string v$register, \"$ORIGINAL_SIGNATURE\"")
    }
}
