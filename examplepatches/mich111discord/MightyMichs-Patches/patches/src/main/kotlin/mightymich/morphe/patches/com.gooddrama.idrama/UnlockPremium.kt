package mightymich.morphe.patches.com.gooddrama.idrama

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Unlocks iDrama VIP / subscription-gated playback on the client.
 *
 * Targets boolean VIP probes found in 1.36.x builds:
 *  isVip, isVipNow, isVipVideo, isVipChannel, isVipBenefits, isVipSubscription
 * and forces isVipExpired → false.
 *
 * Server-side episode unlock / DRM may still apply for some titles.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces local VIP checks so locked episodes and VIP benefits open " +
        "(client-side; some titles may still need a server unlock).",
    default = true,
) {
    compatibleWith(IDramaCompatibility.IDRAMA)

    execute {
        val forceTrue = setOf(
            "isVip",
            "isVipNow",
            "isVipVideo",
            "isVipChannel",
            "isVipBenefits",
            "isVipSubscription",
            "isVipSubscriptionSuccess",
            "getIsVip",
            "isPremium",
            "isSubscribe",
            "isSubscribed",
            "isMember",
            "isPaid",
        )
        val forceFalse = setOf("isVipExpired", "isExpired")

        var hits = 0
        val markers = listOf("isVip", "VipStatus", "vipStatus", "isVipNow", "isVipVideo")

        val seen = mutableSetOf<String>()
        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
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

        // Player track VIP flag (ByteDance player kit)
        try {
            for (def in classDefByStrings("isVip")) {
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                if (!clazz.type.contains("Track") && !clazz.type.contains("player")) continue
                for (method in clazz.methods) {
                    if (method.name != "isVip") continue
                    if (method.returnType != "Z") continue
                    try {
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x1
                                return v0
                            """,
                        )
                        hits++
                    } catch (_: Exception) {
                    }
                }
            }
        } catch (_: Exception) {
        }

        if (hits == 0) {
            throw PatchException(
                "iDrama: no VIP boolean methods patched. Obfuscation may have changed; re-derive.",
            )
        }
    }
}
