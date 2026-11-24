package app.morphe.patches.twine.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_TWINE
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val twinePremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces premium/subscribed state and disables provider premium gating."
) {
    compatibleWith(COMPATIBILITY_TWINE)

    execute {
        // --- Patch 1: rf0.a(Lfr1;)Ljava/lang/Object; → forced premium ---
        val methodA = mutableClassDefBy("Lrf0;")
            .methods.first { it.name == "a" && it.parameters == listOf("Lfr1;") }

        // Insert early return to avoid try/catch issues entirely
        methodA.addInstructions(
            0,
            """
            sget-object v0, Lwga;->a:Lwga;
            return-object v0
            """.trimIndent()
        )

        // --- Patch 1.2: rf0.c(Ler1;)Ljava/lang/Object; → return Boolean.TRUE ---
        val methodC = mutableClassDefBy("Lrf0;")
            .methods.first { it.name == "c" && it.parameters == listOf("Ler1;") }

        methodC.addInstructions(
            0,
            """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
            """.trimIndent()
        )

        // --- Patch 2: provider g()Z → false ---
        listOf("Lzw3;", "Lfc6;", "Lse0;", "Lp24;").forEach { classType ->
            mutableClassDefBy(classType)
                .methods.first { it.name == "g" && it.returnType == "Z" }
                .forceReturnBoolean(false)
        }

        // --- Patch 3: rf0.b() LIFETIME reporting ---
        val methodB = mutableClassDefBy("Lrf0;")
            .methods.first { it.name == "b" }

        // Find the instruction "aget p1, v1, p1"
        val targetIndex = methodB.instructions.indexOfFirst {
            it.opcode == Opcode.AGET && it.toString().contains("p1, v1, p1")
        }

        if (targetIndex != -1) {
            // We need to insert the override right after the aget instruction.
            // Since we can't easily find the exact :goto_3 label, we inject the LIFETIME override 
            // and a goto to skip the rest of the mapping logic.
            methodB.addInstructions(
                targetIndex + 1,
                """
                sget-object p1, Lb47;->p:Lb47;
                goto :goto_3
                """.trimIndent()
            )
        }
    }
}

/** Clear the method body and force return the specified boolean constant. */
private fun MutableMethod.forceReturnBoolean(value: Boolean) {
    val count = instructions.count()
    if (count > 0) {
        removeInstructions(0, count)
    }
    addInstructions(0, """
        const/4 v0, ${if (value) "0x1" else "0x0"}
        return v0
    """.trimIndent())
}