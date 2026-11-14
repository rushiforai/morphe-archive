package mightymich.morphe.patches.com.dramawave.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * DramaWave (com.dramawave.app) Unlock Premium.
 *
 * Verified strings on 2.0.70:
 *  - isVip / isVipPro / wasVip / newIsVip on shared models
 *  - Lcom/dramawave/shared/models/UserInfo;
 *
 * Client-side only; server episode locks may remain.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces DramaWave VIP / VIP Pro local checks (UserInfo and related flags).",
    default = true,
) {
    compatibleWith(DramaWaveCompatibility.DRAMAWAVE)

    execute {
        var hits = 0

        fun forceTrueZ(definingClass: String, name: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceFalseZ(definingClass: String, name: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        val userInfo = "Lcom/dramawave/shared/models/UserInfo;"
        for (name in listOf("isVip", "isVipPro", "wasVip", "newIsVip", "getIsVip", "getIsVipPro")) {
            if (forceTrueZ(userInfo, name)) hits++
        }
        for (name in listOf("isVipExpired", "isExpired")) {
            if (forceFalseZ(userInfo, name)) hits++
        }

        val forceTrue = setOf(
            "isVip",
            "isVipPro",
            "getIsVip",
            "getIsVipPro",
            "wasVip",
            "newIsVip",
            "isPremium",
            "isSubscribe",
            "isSubscribed",
            "isMember",
            "isPaid",
            "hasVip",
        )
        val forceFalse = setOf("isVipExpired", "isExpired")

        val markers = listOf(", isVip=", ", wasVip=", "isVipPro", "newIsVip", "isVipExpired")
        val seen = mutableSetOf<String>()

        for (marker in markers) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                if (!seen.add(def.type)) continue
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Ljava") || t.startsWith("Lkotlin") ||
                    t.startsWith("Lcom/google") || t.startsWith("Lcom/bytedance") ||
                    t.startsWith("Lcom/facebook")
                ) {
                    continue
                }
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue

                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
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

        // Soft success — do not fail the whole session if markers moved.
    }
}
