package mightymich.morphe.patches.com.zhiliaoapp.musically

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Best-effort ad removal for TikTok — no-ops common load/show methods
 * in classes found via ad-related string markers.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Disables common TikTok ad load/show methods (best-effort).",
    default = true
) {
    compatibleWith(TikTokCompatibility.TIKTOK)

    execute {
        val names = setOf(
            "load", "loadAd", "show", "showAd", "bind", "mount",
            "tryShow", "display", "fetchAd", "requestAd"
        )

        val markers = listOf(
            "commercialize",
            "openadsdk",
            "AdView",
            "feed_ad"
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
                    if (method.implementation == null) continue
                    if (method.name !in names && names.none { method.name.startsWith(it) }) continue
                    try {
                        when (method.returnType) {
                            "V" -> method.addInstructions(0, "return-void")
                            "Z" -> method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x0
                                    return v0
                                """
                            )
                            else -> method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x0
                                    return-object v0
                                """
                            )
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
