package mightymich.morphe.patches.com.teslacoilsw.launcher.UnlockPrime

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import mightymich.morphe.patches.com.teslacoilsw.launcher.NovaLauncherCompatibility

object SetPrimeFromPreferencesFingerprint : Fingerprint(
    strings = listOf("android.os.SystemProperties"),
    filters = listOf(
        string("1"),
        literal(0),
        methodCall(name = "getInt"),
        opcode(Opcode.MOVE_RESULT)
    )
)

@Suppress("unused")
val enablePrimePatch = bytecodePatch(
    name = "Enable Prime (Experimental)",
    description = "Enables Nova Launcher Prime WARNING: May cause crashes. ",
    default = true
) {
    compatibleWith(NovaLauncherCompatibility.NOVA_LAUNCHER)

    execute {
        SetPrimeFromPreferencesFingerprint.let { fingerprint ->
            val matches = fingerprint.instructionMatches
                ?: throw PatchException("Fingerprint returned no instruction matches.")

            if (matches.isEmpty()) {
                throw PatchException("Fingerprint matched no instructions.")
            }

            val lastMatch = matches.last()
            val primeReg = lastMatch.getInstruction<OneRegisterInstruction>().registerA

            fingerprint.method.addInstructions(
                lastMatch.index + 1,
                """
                    const/16 v$primeReg, 0x200
                """.trimIndent()
            )
        }
    }
}
