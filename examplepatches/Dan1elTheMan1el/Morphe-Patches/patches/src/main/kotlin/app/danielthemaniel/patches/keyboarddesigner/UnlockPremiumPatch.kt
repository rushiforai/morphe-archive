package app.danielthemaniel.patches.keyboarddesigner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks premium in Custom+ Keyboard Designer (5.B8.8).
 *
 * Lu1/M0;->j()Z gates the Extended Design Package.
 * Lu1/M0;->k()Z gates the Extended Keyboard Package.
 * Lu1/H;->u1(I)I is the settings getter; index V(19) is the main premium flag.
 * O0.M()Z and O0.N()Z are billing stubs already returning false.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features, extended design package, and extended keyboard package.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KEYBOARD_DESIGNER)

    execute {
        // 1. Force Extended Design Package check to return true
        val m0Class = mutableClassDefBy("Lu1/M0;")
        m0Class.methods
            .firstOrNull { it.name == "j" && it.returnType == "Z" }
            ?.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent()
            )

        // 2. Force Extended Keyboard Package check to return true
        m0Class.methods
            .firstOrNull { it.name == "k" && it.returnType == "Z" }
            ?.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent()
            )

        // 3. Force main premium settings flag (index V=19) to return 1
        val hClass = mutableClassDefBy("Lu1/H;")
        hClass.methods
            .firstOrNull { it.name == "u1" && it.returnType == "I" }
            ?.addInstructions(
                0,
                """
                move v0, p0
                const/16 v1, 0x13
                if-lt v0, v1, :not_premium
                const/16 v1, 0x1a
                if-ge v0, v1, :not_premium
                const/4 v0, 0x1
                return v0
                :not_premium
                """.trimIndent()
            )
    }
}