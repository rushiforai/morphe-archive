package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PLAYBACK_SCOPE = "LIllIllIllIll;"

internal val recentlyPlayedPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val policy = mutableClassDefBy("LlIIllIlIIIlIlIl;").methods.single {
            it.name == "IllIlIlIIlIllIll" &&
                it.parameterTypes == listOf(PLAYBACK_SCOPE, "Ljava/lang/String;") && it.returnType == "Z"
        }
        val instructions = checkNotNull(policy.implementation).instructions
        check(instructions[1].opcode == Opcode.IF_NEZ && instructions[5].opcode == Opcode.SGET_OBJECT &&
            (instructions[5] as ReferenceInstruction).reference.toString() == "LIIlIlIIlIIIIlll;->IllIlIlIIlIllIll:[I")
        // The legacy row and playback use this policy for history. The native row still checks
        // whether the track itself is available before dispatching its full-track action.
        policy.addInstructionsWithLabels(
            0,
            """
                if-eqz p2, :original
                sget-object p2, LIllIllIllIll;->IlIlIIlIIllIlIlI:$PLAYBACK_SCOPE
                if-ne p1, p2, :original
                const/4 p2, 0x1
                return p2
                :original
                nop
            """.trimIndent(),
        )
    }
}
