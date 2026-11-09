package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideTypingPatch = bytecodePatch(
    name = "Typing indicator",
    description = "If enabled, others won't see when you are typing.",
    default = false,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    execute {
        val markers = listOf("composing", "typing", "record_typing", "send_composing")
        var hits = 0
        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
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
                    if (method.returnType != "V") continue
                    val impl = method.implementation ?: continue
                    if (impl.instructions.count() > 80) continue
                    val text = impl.instructions.joinToString("\n") { it.toString() }
                    if (!text.contains(marker) && !text.contains("compos")) continue
                    try {
                        method.addInstructions(0, "return-void")
                        hits++
                    } catch (_: Exception) {
                    }
                }
            }
            if (hits > 0) break
        }
        if (hits == 0) {
            throw PatchException(
                "WhatsApp: no typing/composing send sites matched.",
            )
        }
    }
}
