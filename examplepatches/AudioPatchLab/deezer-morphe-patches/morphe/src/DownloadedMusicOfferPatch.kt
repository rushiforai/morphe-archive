package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val downloadedMusicOfferPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val page = mutableClassDefBy("LlIIllllIIIlI;").methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        val instructions = checkNotNull(page.implementation).instructions
        val subtitle = instructions.indices.single {
            (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140ab1
        }
        val bannerGate = (subtitle - 15 until subtitle).single { index ->
            val branch = instructions[index] as? BuilderInstruction21t
            branch?.opcode == Opcode.IF_EQZ && branch.target.location.index > subtitle &&
                instructions[index + 1].opcode == Opcode.NEW_INSTANCE
        }
        val branch = instructions[bannerGate] as BuilderInstruction21t
        // Use the page's existing no-banner branch, then build the downloaded collections normally.
        page.replaceInstruction(bannerGate, BuilderInstruction20t(Opcode.GOTO_16, branch.target))
    }
}
