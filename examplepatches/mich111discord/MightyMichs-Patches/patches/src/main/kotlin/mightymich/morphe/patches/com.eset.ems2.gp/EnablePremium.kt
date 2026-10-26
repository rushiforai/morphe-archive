package mightymich.morphe.patches.com.eset.ems2.gp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Best-effort Enable Premium for ESET Mobile Security.
 * Forces client-side isPremium / isPremiumLicense boolean getters to true.
 * Native libems + server checks may still limit some features.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable premium license",
    description = "Best-effort unlock of ESET premium UI / client-side license flags. " +
        "Native libems + server checks may still limit some features.",
    default = true
) {
    compatibleWith(EsetCompatibility.EMS)

    execute {
        val returnTrue = """
            const/4 v0, 0x1
            return v0
        """
        var patched = 0

        // Prefer classes that embed isPremium markers in string constants
        val markers = listOf(
            ", isPremium=",
            "isPremiumLicense=",
            "TokenLicense(isPremium="
        )

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
                    if (AccessFlags.STATIC.isSet(method.accessFlags)) continue
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    // skip equals
                    if (method.name == "equals") continue
                    try {
                        method.addInstructions(0, returnTrue)
                        patched++
                    } catch (_: Exception) {
                    }
                }
            }
        }

        // Also force any ()Z that literally loads const-string "isPremium" in a short method
        val isPremiumDefs = try {
            classDefByStrings("isPremium")
        } catch (_: Exception) {
            emptyList()
        }
        for (def in isPremiumDefs) {
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }
            for (method in clazz.methods) {
                if (method.returnType != "Z") continue
                if (method.parameterTypes.isNotEmpty()) continue
                if (method.name == "equals") continue
                val text = method.implementation?.instructions
                    ?.joinToString("\n") { it.toString() }
                    ?: continue
                if (!text.contains("isPremium") && !text.contains("iget-boolean")) continue
                // keep short getters only
                if ((method.implementation?.instructions?.count() ?: 99) > 16) continue
                try {
                    method.addInstructions(0, returnTrue)
                    patched++
                } catch (_: Exception) {
                }
            }
        }

        if (patched == 0) {
            throw PatchException(
                "Enable premium: no isPremium hooks found. " +
                    "App structure may have changed; share Morphe log."
            )
        }
    }
}
