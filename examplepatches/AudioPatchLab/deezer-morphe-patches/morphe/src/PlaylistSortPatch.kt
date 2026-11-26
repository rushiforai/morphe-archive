package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PLAYLIST_SOURCE = "LlIIlIllIIlIlI;->IIIlIIIllIlII:LlIIlIllIIlIlI;"
private const val ON_DEMAND_POLICY = "LIIllIIlllIIllll;->lIIIIIlllllIIIII(LlIIlIllIIlIlI;Ljava/lang/String;)Z"

internal val playlistSortPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val menu = mutableClassDefBy("LIIllIllIIlIIll;").methods.single {
            it.name == "lIIlIIlIlllllII" && it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }
        val instructions = checkNotNull(menu.implementation).instructions
        val source = instructions.indices.single { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.SGET_OBJECT &&
                (instruction as ReferenceInstruction).reference.toString() == PLAYLIST_SOURCE &&
                (instructions[index + 1] as? ReferenceInstruction)?.reference.toString() == ON_DEMAND_POLICY
        }
        val result = instructions[source + 2] as OneRegisterInstruction
        check(result.opcode == Opcode.MOVE_RESULT && instructions[source + 3].opcode == Opcode.IF_EQZ)

        // The next check excludes charts. Keep that check and the native sorting callback.
        menu.replaceInstruction(source + 1, "nop")
        menu.replaceInstruction(source + 2, "const/4 v${result.registerA}, 0x1")
    }
}
