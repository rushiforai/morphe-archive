package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val libraryFavoriteTrackSelectionPatch = patch {
    compatibleWith(deezerCompatibility)
    dependsOn(trackCellDisplayRightsPatch)

    execute {
        mutableClassDefBy("LIlIlIIlIIIllIlII;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }.showSelectableTrackCellsBeforeMapping(expectedCount = 2)

        val tap = mutableClassDefBy("LIlIIIlIIIIIlIllI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val instructions = checkNotNull(tap.implementation).instructions
        val favoritePlayback = instructions.indices.single { index ->
            (instructions[index] as? ReferenceInstruction)?.reference.toString() ==
                "LIlIlIIlII;->llIIIIIIlIIIIll(LIlIlIIlII;Ljava/lang/String;LlIllllllIllIlIl;LIlIlIllIlllllI;)Ljava/lang/Object;" &&
                instructions.getOrNull(index - 3)?.opcode == Opcode.IF_EQZ
        }
        // Start the favorites queue at the tapped track through the native on-demand path.
        tap.replaceInstruction(favoritePlayback - 3, "nop")
    }
}
