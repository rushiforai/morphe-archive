package mightymich.morphe.patches.com.dramawave.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks DramaWave VIP / VIP Pro client gates.
 *
 * 2.0.x builds expose isVip / isVipPro style flags across profile and playback.
 * Server-locked episodes may still require network entitlement.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces local VIP / VIP Pro checks for DramaWave playback and benefits.",
    default = true,
) {
    compatibleWith(DramaWaveCompatibility.DRAMAWAVE)

    execute {
        val forceTrue = setOf(
            "isVip",
            "isVipPro",
            "getIsVip",
            "getIsVipPro",
            "isPremium",
            "isSubscribe",
            "isSubscribed",
            "isMember",
            "isPaid",
            "hasVip",
        )
        val forceFalse = setOf("isVipExpired", "isExpired")

        var hits = 0
        val markers = listOf("isVip", "isVipPro", "VIP", "Vip")
        val seen = mutableSetOf<String>()

        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                // Prefer app / feature packages
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Ljava") || t.startsWith("Lkotlin")
                ) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    val name = method.name
                    try {
                        when {
                            name in forceTrue -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        return v0
                                    """,
                                )
                                hits++
                            }
                            name in forceFalse -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x0
                                        return v0
                                    """,
                                )
                                hits++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }

        if (hits == 0) {
            throw PatchException(
                "DramaWave: no VIP boolean methods patched. Re-derive for this version.",
            )
        }
    }
}
