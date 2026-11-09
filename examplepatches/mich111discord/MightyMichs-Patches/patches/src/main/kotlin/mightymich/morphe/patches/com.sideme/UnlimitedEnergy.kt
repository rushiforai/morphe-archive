package mightymich.morphe.patches.com.sideme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Optional energy bypass for SideMe lessons.
 *
 * IMPORTANT: default is OFF. The previous version used very broad fingerprints
 * (short int getters + energy strings) that could rewrite unrelated methods and
 * crash the app on launch. Enable only if you still hit energy walls after
 * Unlock Premium.
 */
@Suppress("unused")
val unlimitedEnergyPatch = bytecodePatch(
    name = "Unlimited Energy",
    description = "Optional: tries to bypass lesson energy limits. Off by default " +
        "(aggressive matching previously caused startup crashes).",
    default = false,
) {
    compatibleWith(SideMeCompatibility.SIDEME)

    execute {
        // Only touch methods that both:
        //  - return boolean
        //  - contain the literal string "energy" in the method body
        //  - are short (< 20 instructions)
        // Never rewrite int getters globally.
        try {
            for (def in classDefByStrings("energy")) {
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    val impl = method.implementation ?: continue
                    val insns = impl.instructions.toList()
                    if (insns.size > 20) continue
                    val text = insns.joinToString("\n") { it.toString() }
                    if (!text.contains("energy")) continue
                    // Skip premium/subscription gates
                    if (text.contains("isActive") || text.contains("Subscription")) continue

                    try {
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x1
                                return v0
                            """,
                        )
                    } catch (_: Exception) {
                    }
                }
            }
        } catch (_: Exception) {
            // fully optional
        }
    }
}
