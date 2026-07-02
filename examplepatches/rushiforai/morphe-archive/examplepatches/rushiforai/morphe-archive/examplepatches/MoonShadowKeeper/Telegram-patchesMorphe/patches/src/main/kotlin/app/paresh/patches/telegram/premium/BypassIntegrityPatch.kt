package app.paresh.patches.telegram.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

object SpoofSignatureFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/AndroidUtilities;",
    name = "getCertificateSHA256Fingerprint",
)

object SafetyNetCheckFingerprint : Fingerprint(
    filters = listOf(
        string("basicIntegrity"),
        string("ctsProfileMatch")
    )
)

@Suppress("unused")
val bypassIntegrityPatch = bytecodePatch(
    name = "Bypass integrity",
    description = "Bypasses integrity check to allow login on patched app."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        // Spoof signature hash
        SpoofSignatureFingerprint.method.addInstructions(0, """
            const-string v0, "49C1522548EBACD46CE322B6FD47F6092BB745D0F88082145CAF35E14DCC38E1"
            return-object v0
        """)

        // Force basicIntegrity and ctsProfileMatch to true
        SafetyNetCheckFingerprint.method.apply {
            val instructions = implementation!!.instructions
            instructions.forEachIndexed { index, instruction ->
                val instStr = instruction.toString()
                if (instStr.contains("basicIntegrity") || instStr.contains("ctsProfileMatch")) {
                    // 2 instructions after the const-string is the move-result with the boolean
                    val patchIndex = index + 2
                    if (patchIndex < instructions.size) {
                        val reg = getInstruction<OneRegisterInstruction>(patchIndex).registerA
                        replaceInstruction(patchIndex, "const/4 v$reg, 0x1")
                    }
                }
            }
        }
    }
}
