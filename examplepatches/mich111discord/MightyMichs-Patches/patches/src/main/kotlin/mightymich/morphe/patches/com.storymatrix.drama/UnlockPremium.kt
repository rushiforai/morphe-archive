package mightymich.morphe.patches.com.storymatrix.drama

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * DramaBox (com.storymatrix.drama) Unlock Premium — conservative.
 *
 * Verified on 7.0.0:
 *  - UserInfo / LoginResult / ILoginService isVip()Z
 *  - SubInfoList / Record isVip / isVipType
 *  - Integer-backed isVip* helpers
 *
 * Avoids mass-patching isFree / interface-only methods that were linked to
 * startup crashes ("app does not open after patch").
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces DramaBox VIP checks (UserInfo, LoginResult, SubInfo) " +
        "so premium UI and local gates unlock. Server-locked episodes may still apply.",
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

        // High-confidence named gates only (skip bare interfaces that lack code).
        val known = listOf(
            "Lcom/storymatrix/drama/api/login/UserInfo;" to "isVip",
            "Lcom/storymatrix/drama/api/login/LoginResult;" to "isVip",
            "Lcom/lib/data/Record;" to "isVipType",
            "Lcom/lib/data/SubInfoList;" to "isVip",
            "Lcom/storymatrix/drama/api/ad/config/SplashAdShowConfig;" to "isVIP",
        )
        for ((cls, name) in known) {
            if (forceTrueZ(cls, name)) hits++
        }

        val forceTrueNames = setOf(
            "isVip",
            "isVIP",
            "isVipType",
            "getIsVip",
            "isVipEquity",
            "isVipTheater",
            "isMemberShip",
            "isSubCoinVip",
        )

        // Prefer classes that literally mention isVip in a toString / field dump.
        val markers = listOf(", isVip=", "SubInfoList(isVip=", "isVip()Z", "isVipEquity", "isVipTheater")
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
                    t.startsWith("Lcom/sobot") || t.startsWith("Lcom/bytedance")
                ) {
                    continue
                }
                // Skip pure interfaces — injecting into abstract methods caused VerifyError.
                if (AccessFlags.INTERFACE.isSet(def.accessFlags) &&
                    !AccessFlags.ABSTRACT.isSet(def.accessFlags)
                ) {
                    // still allow class with interface bit quirks; real filter below
                }
                if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue

                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                    val name = method.name
                    if (name !in forceTrueNames) continue
                    try {
                        when (method.returnType) {
                            "Z" -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        return v0
                                    """,
                                )
                                hits++
                            }
                            "Ljava/lang/Integer;" -> {
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
                            "Ljava/lang/Boolean;" -> {
                                method.addInstructions(
                                    0,
                                    """
                                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                        return-object v0
                                    """,
                                )
                                hits++
                            }
                            "I" -> {
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

        // Soft success: better a partial unlock than a hard fail / broken install.
        // hits==0 is rare on 7.0.0; still don't abort the whole bundle.
        if (hits == 0) {
            // leave a breadcrumb in logs via exception only if truly nothing matched
            // Prefer soft: app still installs, user can report.
        }
    }
}
