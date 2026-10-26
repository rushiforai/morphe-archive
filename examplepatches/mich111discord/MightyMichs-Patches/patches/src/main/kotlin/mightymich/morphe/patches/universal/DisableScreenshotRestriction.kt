package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Universal: neutralize Window FLAG_SECURE setters when found via string/const references.
 * Best-effort only.
 */
@Suppress("unused")
val disableScreenshotRestrictionPatch = bytecodePatch(
    name = "Disable screenshot restriction",
    description = "Best-effort bypass of FLAG_SECURE screenshot blocks.",
    default = false
) {
    execute {
        // Classes that mention FLAG_SECURE
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
                if (method.implementation == null) continue
                val text = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: continue
                // Methods that set secure flag
                if (!text.contains("FLAG_SECURE") && !text.contains("8192")) continue
                if (method.returnType != "V") continue
                try {
                    method.addInstructions(0, "return-void")
                } catch (_: Exception) {
                }
            }
        }
    }
}
