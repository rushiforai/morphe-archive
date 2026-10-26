package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Universal best-effort: no-op common ad load/show methods.
 */
@Suppress("unused")
val disableAdsBasicPatch = bytecodePatch(
    name = "Disable ads (basic)",
    description = "Best-effort no-op of common ad SDK load/show methods.",
    default = false
) {
    execute {
        val markers = listOf(
            "InterstitialAd",
            "RewardedAd",
            "loadAd",
            "AdView",
            "MobileAds"
        )
        val methodNames = setOf(
            "load", "loadAd", "show", "showAd", "display", "requestAd"
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
                    if (method.name !in methodNames) continue
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
