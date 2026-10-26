package mightymich.morphe.patches.com.zhiliaoapp.musically

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import java.util.Locale

/**
 * Force TikTok store/SIM region via store_region getters + option ISO code.
 */
@Suppress("unused")
val forceRegionPatch = bytecodePatch(
    name = "Force region",
    description = "Forces TikTok store_region-related getters to a chosen ISO country code.",
    default = true
) {
    compatibleWith(TikTokCompatibility.TIKTOK)

    val region by stringOption(
        key = "region",
        default = "US",
        title = "Region (ISO country)",
        description = "ISO-3166-1 alpha-2 country code to spoof (e.g. US, GB, JP, KR, PL)."
    )

    // ()Ljava/lang/String; methods that reference store_region
    val storeRegionFingerprint = Fingerprint(
        returnType = "Ljava/lang/String;",
        parameters = emptyList(),
        custom = { method, _ ->
            val text = method.implementation?.instructions
                ?.joinToString("\n") { it.toString() }
                ?: return@Fingerprint false
            text.contains("store_region")
        }
    )

    execute {
        val iso = region?.trim()?.uppercase(Locale.US)
            ?: throw PatchException("Region option is required (e.g. US).")
        if (iso.length != 2 || !iso.all { it in 'A'..'Z' }) {
            throw PatchException("Invalid region \"$iso\". Use 2-letter ISO code.")
        }

        val returnIso = """
            const-string v0, "$iso"
            return-object v0
        """

        var patched = 0

        try {
            storeRegionFingerprint.method.addInstructions(0, returnIso)
            patched++
        } catch (_: Exception) {
        }

        // Also force via classDefByStrings for related keys
        for (key in listOf("store_region", "priority_region", "current_region")) {
            val defs = try {
                classDefByStrings(key)
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
                    if (method.returnType != "Ljava/lang/String;") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    val text = method.implementation?.instructions
                        ?.joinToString("\n") { it.toString() }
                        ?: continue
                    if (!text.contains(key)) continue
                    if ((method.implementation?.instructions?.count() ?: 99) > 40) continue
                    try {
                        method.addInstructions(0, returnIso)
                        patched++
                    } catch (_: Exception) {
                    }
                }
            }
        }

        if (patched == 0) {
            throw PatchException(
                "Force region: no store_region hooks found. App structure may have changed."
            )
        }
    }
}
