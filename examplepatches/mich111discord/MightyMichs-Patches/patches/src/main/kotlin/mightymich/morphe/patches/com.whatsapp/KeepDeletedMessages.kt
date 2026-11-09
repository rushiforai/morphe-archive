package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption

/**
 * Prevents "Delete for everyone" from wiping local message text.
 * Exact revoke/apply path is version-specific — refine after APK dump.
 */
@Suppress("unused")
val keepDeletedMessagesPatch = bytecodePatch(
    name = "Keep deleted messages",
    description = "Show messages that were deleted for everyone. " +
        "May need a fingerprint update after WhatsApp upgrades.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    val highlight by booleanOption(
        key = "highlight",
        default = true,
        title = "Highlight deleted messages",
        description = "Mark deleted messages so they are easier to spot.",
    )

    execute {
        val markers = listOf(
            "Delete for everyone",
            "delete_for_everyone",
            "revoked",
            "REVOKE",
            "message_revoked",
        )
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
                    val text = impl.instructions.joinToString("\n") { it.toString() }
                    // Heuristic: methods that clear text / set revoked flag
                    if (!text.contains("revoke", ignoreCase = true) &&
                        !text.contains(marker)
                    ) {
                        continue
                    }
                    if (impl.instructions.count() > 120) continue
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
                "WhatsApp: no delete-for-everyone / revoke handler matched. " +
                    "Provide APK analysis for this version.",
            )
        }
    }
}
