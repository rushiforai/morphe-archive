package mightymich.morphe.patches.com.storymatrix.drama

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * DramaBox (com.storymatrix.drama) Unlock Premium.
 *
 * Verified structure on 7.0.0:
 *  - com.storymatrix.drama.api.login.UserInfo.isVip()Z
 *  - com.storymatrix.drama.api.login.LoginResult.isVip()Z
 *  - com.storymatrix.drama.api.login.ILoginService.isVip()Z
 *  - several obfuscated isVip()Z helpers (Hf/a, xf/a, dl/f)
 *  - Record.isVipType()Z, ChapterListBeanKt.isFree()Z
 *
 * Integer-backed fields (SubInfo.isVip():Integer) are also forced where possible.
 * Server-locked episodes / coin gates may still apply.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces DramaBox VIP checks (UserInfo / LoginService / isVip helpers) " +
        "so premium content unlocks on the client.",
    default = true,
) {
    compatibleWith(DramaBoxCompatibility.DRAMABOX)

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

        // Named login / user VIP gates
        val known = listOf(
            "Lcom/storymatrix/drama/api/login/UserInfo;" to "isVip",
            "Lcom/storymatrix/drama/api/login/LoginResult;" to "isVip",
            "Lcom/storymatrix/drama/api/login/ILoginService;" to "isVip",
            "Lcom/storymatrix/drama/api/ad/config/SplashAdShowConfig;" to "isVIP",
            "Lcom/lib/data/Record;" to "isVipType",
            "Lcom/lib/data/ChapterListBeanKt;" to "isFree",
        )
        for ((cls, name) in known) {
            if (forceTrueZ(cls, name)) hits++
        }

        // Broad: isVip / isVIP / isVipType ()Z on app + lib packages
        val forceTrueNames = setOf(
            "isVip",
            "isVIP",
            "isVipType",
            "getIsVip",
            "isPremium",
            "isMemberShip",
            "isSubscribed",
        )
        val markers = listOf("isVip", "isVipTheater", "isVipEquity", "updateVipStatus", ", isVip=")
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
                    t.startsWith("Lcom/google") || t.startsWith("Lcom/facebook") ||
                    t.startsWith("Lkotlin") || t.startsWith("Ljava") ||
                    t.startsWith("Lcom/sobot")
                ) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.parameterTypes.isNotEmpty()) continue
                    val name = method.name
                    try {
                        when {
                            method.returnType == "Z" && name in forceTrueNames -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        return v0
                                    """,
                                )
                                hits++
                            }
                            // Integer VIP flags: return Integer.valueOf(1)
                            method.returnType == "Ljava/lang/Integer;" &&
                                name in setOf("isVip", "isVipEquity", "isVipTheater") -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                                        move-result-object v0
                                        return-object v0
                                    """,
                                )
                                hits++
                            }
                            method.returnType == "Ljava/lang/Boolean;" &&
                                name in setOf("getVip", "isVip") -> {
                                method.addInstructions(
                                    0,
                                    """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """,
                                )
                                hits++
                            }
                            method.returnType == "I" && name in setOf("getIsVip", "isVipTheater") -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
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
                "DramaBox: no isVip methods patched. Obfuscation may have changed; re-derive.",
            )
        }
    }
}
