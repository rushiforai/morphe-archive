package mightymich.morphe.patches.com.gooddrama.idrama

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * iDrama (com.gooddrama.idrama) Unlock Premium — 1.36.5 verified.
 *
 * Client VIP probes present in dex:
 *  isVip, isVipNow, isVipVideo, isVipChannel, isVipBenefits,
 *  isVipSubscription, isVipSubscriptionSuccess, isVipExpired
 *
 * Beans: Lcom/gooddrama/idrama/business/base/bean/Vip;
 *         Lcom/gooddrama/idrama/mine/api/bean/VipInfo;
 *
 * Soft-success: does not fail the session if a subset of markers moved.
 * Server-locked episodes / DRM may still apply.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces local VIP checks (isVip / isVipVideo / benefits) so locked " +
        "episodes and VIP UI open on the client.",
    default = true,
) {
    compatibleWith(IDramaCompatibility.IDRAMA)

    execute {
        var hits = 0

        fun forceZ(definingClass: String, name: String, value: Boolean): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                val imm = if (value) "0x1" else "0x0"
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, $imm
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        val vipBean = "Lcom/gooddrama/idrama/business/base/bean/Vip;"
        val vipInfo = "Lcom/gooddrama/idrama/mine/api/bean/VipInfo;"
        val accountModel = "Lcom/gooddrama/idrama/app/shortvideo/provider/account/AccountModel;"
        val account = "Lcom/gooddrama/idrama/app/shortvideo/provider/account/Account;"

        val trueNames = listOf(
            "isVip",
            "isVipNow",
            "isVipVideo",
            "isVipChannel",
            "isVipBenefits",
            "isVipSubscription",
            "isVipSubscriptionSuccess",
            "getIsVip",
            "isSubscribe",
            "isSubscribed",
            "isMember",
            "isPaid",
        )
        val falseNames = listOf("isVipExpired", "isExpired")

        for (cls in listOf(vipBean, vipInfo, accountModel, account)) {
            for (name in trueNames) {
                if (forceZ(cls, name, true)) hits++
            }
            for (name in falseNames) {
                if (forceZ(cls, name, false)) hits++
            }
        }

        val forceTrue = trueNames.toSet()
        val forceFalse = falseNames.toSet()
        val markers = listOf(
            ", isVip=",
            ", isVipBenefits=",
            ", vipStatus=",
            "isVipNow",
            "isVipVideo",
            "isVipChannel",
            "isVipSubscription",
        )
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
                    t.startsWith("Lcom/google") || t.startsWith("Lcom/facebook") ||
                    t.startsWith("Lcom/bytedance") || t.startsWith("Lcom/android")
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

        // Soft success — partial unlock is better than failing the whole patch session.
    }
}
