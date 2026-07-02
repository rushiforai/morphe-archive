package app.morphe.patches.aliexpress.security

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.aliexpress.utils.Constants.COMPATIBILITY_ALIEXPRESS

internal object TamperCheckFingerprint : Fingerprint(
    strings = listOf("may be malicious user illegally tamper data"),
    returnType = "Z",
)

val bypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypasses SecurityGuard integrity checks to restore login on patched APKs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        val method = TamperCheckFingerprint.methodOrNull ?: return@execute
        method.apply {
            addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }
    }
}
