package mightymich.morphe.patches.com.spaceship.screen.textcopy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Screen Translate (com.spaceship.screen.textcopy) — Unlock Premium.
 *
 * 7.3+ R8 renames PremiumUtilsKt.isPremium / isPurchased to short static
 * methods on Lcom/spaceship/screen/translate/utils/premium/d; (a()Z, b()Z).
 * Also disables Config feature gates (home key / gesture / manga).
 *
 * Fixes #32: old fingerprint required instruction text referencing
 * PremiumUtilsKt$isPremium which no longer appears after obfuscation.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Screen Translate Premium features and disables premium-only gates.",
    default = true,
) {
    compatibleWith(ScreenTranslateCompatibility.SCREEN_TRANSLATE)

    execute {
        var hits = 0

        // 1) Known obfuscated PremiumUtils holder (7.3.x / 7.5.x)
        for (cls in listOf(
            "Lcom/spaceship/screen/translate/utils/premium/d;",
            "Lcom/spaceship/screen/translate/utils/premium/PremiumUtilsKt;",
        )) {
            for (name in listOf("a", "b", "isPremium", "isPurchased")) {
                try {
                    val fp = Fingerprint(
                        definingClass = cls,
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
                    hits++
                } catch (_: Exception) {
                }
            }
        }

        // 2) Any static ()Z under utils/premium (source file PremiumUtils.kt)
        try {
            for (def in classDefByStrings("PremiumUtils.kt")) {
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                if (!clazz.type.contains("/utils/premium/")) continue
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (!AccessFlags.STATIC.isSet(method.accessFlags)) continue
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

        // 3) Config "need premium" gates → false (stable Kotlin property names)
        for (name in listOf(
            "getHomeKeyActionNeedPremium",
            "getGestureControlNeedPremium",
            "getMangaNeedPremium",
        )) {
            try {
                val fp = Fingerprint(
                    definingClass = "Lcom/spaceship/screen/translate/manager/config/Config;",
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
                hits++
            } catch (_: Exception) {
            }
        }

        // 4) Fallback: spaceship classes with isPremium / isPurchased / short a|b
        if (hits < 2) {
            for (marker in listOf("isPremium", "isPurchased", "PremiumUtils.kt")) {
                val defs = try {
                    classDefByStrings(marker)
                } catch (_: Exception) {
                    emptyList()
                }
                for (def in defs) {
                    if (!def.type.contains("spaceship")) continue
                    val clazz = try {
                        mutableClassDefBy(def)
                    } catch (_: Exception) {
                        continue
                    }
                    for (method in clazz.methods) {
                        if (method.returnType != "Z") continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        if (method.name !in setOf("isPremium", "isPurchased", "a", "b")) continue
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
            }
        }

        if (hits == 0) {
            throw PatchException(
                "Screen Translate: no premium methods patched. " +
                    "utils/premium and Config gates may have moved; re-derive for this version.",
            )
        }
    }
}
