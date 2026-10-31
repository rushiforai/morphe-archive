package mightymich.morphe.patches.me.pou.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val unlockEverythingPatch = bytecodePatch(
    name = "Unlock everything",
    description = "Sets shop item prices to zero and relaxes lock UI gates so " +
        "items can be obtained freely (works best with Unlimited coins).",
    default = true
) {
    compatibleWith(PouCompatibility.POU)

    dependsOn(unlimitedCoinsPatch)

    execute {
        var hits = 0

        // Shop list base references coin/coin_sm.png — zero cheap static ()I fees (e.g. 1999)
        for (marker in listOf("coin/coin_sm.png", "cash/cash_sm.png")) {
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
                    if (method.returnType != "I") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (method.implementation == null) continue
                    val n = method.implementation!!.instructions.count()
                    // Static small helpers or short price aggregators
                    if (AccessFlags.STATIC.isSet(method.accessFlags) && n <= 8) {
                        try {
                            method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x0
                                    return v0
                                """
                            )
                            hits++
                        } catch (_: Exception) {
                        }
                    }
                    // Instance net-price style ()I with moderate size
                    if (!AccessFlags.STATIC.isSet(method.accessFlags) && n in 5..40) {
                        try {
                            method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x0
                                    return v0
                                """
                            )
                            hits++
                        } catch (_: Exception) {
                        }
                    }
                }
            }
        }

        // Lock dialog class — force parameterless ()Z to true (unlocked path)
        val lockDefs = try {
            classDefByStrings("dialog/buy_locked.png")
        } catch (_: Exception) {
            emptyList()
        }
        for (def in lockDefs) {
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }
            for (method in clazz.methods) {
                if (method.returnType != "Z") continue
                if (method.parameterTypes.isNotEmpty()) continue
                if (method.implementation == null) continue
                try {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """
                    )
                    hits++
                } catch (_: Exception) {
                }
            }
        }

        if (hits == 0) {
            throw PatchException(
                "Pou: no price/lock hooks matched. Try Unlimited coins alone."
            )
        }
    }
}
