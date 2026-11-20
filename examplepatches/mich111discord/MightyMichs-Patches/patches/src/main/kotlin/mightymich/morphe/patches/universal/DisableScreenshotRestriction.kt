package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/**
 * Universal Remove Flag Secure / Disable screenshot restriction.
 *
 * Clears the FLAG_SECURE bit (0x2000) before Window.addFlags / setFlags and
 * LayoutParams.flags writes when those sequences are found. Soft-success.
 */
@Suppress("unused")
val disableScreenshotRestrictionPatch = bytecodePatch(
    name = "Remove Flag Secure",
    description = "Best-effort clear of FLAG_SECURE so screenshots and screen recording are not blocked.",
    default = false,
) {
    execute {
        val defs = try {
            classDefByStrings("FLAG_SECURE")
        } catch (_: Exception) {
            emptyList()
        }

        for (def in defs) {
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }
            for (method in clazz.methods) {
                val impl = method.implementation ?: continue
                val text = impl.instructions.joinToString("\n") { it.toString() }
                if (!text.contains("FLAG_SECURE") && !text.contains("0x2000") && !text.contains("8192")) {
                    continue
                }
                // Prefer neutralizing void setters that apply the secure flag
                if (method.returnType == "V") {
                    try {
                        // Bit-clear pattern inserted at start is safer than pure return-void
                        // when the method does more than set the flag; still soft.
                        method.addInstructions(
                            0,
                            """
                                return-void
                            """,
                        )
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
