package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val profileCountPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val subtitle = mutableClassDefBy("LIIlllllIlIIIIlll;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("I", "I")
        }
        val instructions = checkNotNull(subtitle.implementation).instructions
        check((instructions[1] as? ReferenceInstruction)?.reference.toString() ==
            "LIIlllllIlIIIIlll;->lIIIIIlllllIIIII:I" &&
            (instructions[2] as? ReferenceInstruction)?.reference.toString() == "LIIlllllIlIIIIlll;->IllIlllIIIllIlII:I")

        // Normalize the masthead's display values before formatting the labels and plural forms.
        subtitle.addInstructionsWithLabels(
            1,
            """
                if-gez p1, :following
                const/4 p1, 0x0
                :following
                if-gez p2, :store
                const/4 p2, 0x0
                :store
                nop
            """.trimIndent(),
        )
    }
}
