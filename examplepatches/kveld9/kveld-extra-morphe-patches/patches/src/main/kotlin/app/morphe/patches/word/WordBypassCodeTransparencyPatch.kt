package app.morphe.patches.word

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_WORD

@Suppress("unused")
val wordBypassCodeTransparencyPatch = bytecodePatch(
    name = "Bypass Code Transparency",
    description = "Bypasses the code transparency checks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WORD)

    execute {
        var patched = 0
        codeTransparencyCheckFingerprint.method.apply {
            addInstructions(0, """
                const/4 p3, 0x1
            """)
            patched++
        }
        println("[Bypass Code Transparency] Applied $patched hooks -> code transparency checks bypassed.")
    }
}
