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
        // --- Patch 1: v70.a(Lv81;)Ljava/lang/Object; → return me8.a (Subscribed) ---
        // --- Patch 1: v70.a(Lv81;)Ljava/lang/Object; → return me8.a (Subscribed) ---
        val methodA = mutableClassDefBy("Lv70;")
            .methods.first { it.name == "a" && it.parameters == listOf("Lv81;") }

        // Find the index of the original return-object instruction
        val returnIndex = methodA.instructions.indexOfFirst {
            it.opcode == Opcode.RETURN_OBJECT
        }

        if (returnIndex != -1) {
            // Replace ONLY the return instruction to preserve the try/catch exception table
            methodA.replaceInstructions(
                returnIndex,
                """
                sget-object v0, Lme8;->a:Lme8;
                return-object v0
                """.trimIndent()
            )
        }

        // --- Patch 1: v70.c(Lu81;)Ljava/lang/Object; → return Boolean.TRUE ---
        mutableClassDefBy("Lv70;")
            .methods.first { it.name == "c" && it.parameters == listOf("Lu81;") }
            .forceReturnObject("Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")

        // --- Patch 2: provider g()Z → false ---
        listOf("Lkz2;", "Lv55;", "Lv60;", "Lx43;").forEach { classType ->
            mutableClassDefBy(classType)
                .methods.first { it.name == "g" && it.returnType == "Z" }
                .forceReturnBoolean(false)
        }

        // --- Patch 3: Package_androidKt.toPackageType → LIFETIME ---
        mutableClassDefBy("Lcom/revenuecat/purchases/kmp/mappings/Package_androidKt;")
            .methods.first { it.name == "toPackageType" }
            .forceReturnObject(
                "Lcom/revenuecat/purchases/kmp/models/PackageType;->LIFETIME:Lcom/revenuecat/purchases/kmp/models/PackageType;"
            )
    }
}

/** Clear the method body and force return the specified static field. */
private fun MutableMethod.forceReturnObject(fieldRef: String) {
    val count = instructions.count()
    if (count > 0) {
        removeInstructions(0, count)
    }
    addInstructions(0, """
        sget-object v0, $fieldRef
        return-object v0
    """.trimIndent())
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