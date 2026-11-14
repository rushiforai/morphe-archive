package mightymich.morphe.patches.me.pou.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val unlimitedCoinsPatch = bytecodePatch(
    name = "Unlimited Coins",
    description = "Gives unlimited coins in Pou.",
    default = true,
) {
    compatibleWith(PouCompatibility.POU)

    execute {
        // Soft anchors for coin getters / spend checks
        for (marker in listOf("coins", "Coins", "getCoins", "coinCount")) {
            try {
                for (def in classDefByStrings(marker)) {
                    if (!def.type.contains("pou") && !def.type.contains("Pou")) continue
                    val clazz = try { mutableClassDefBy(def) } catch (_: Exception) { continue }
                    for (method in clazz.methods) {
                        if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                        if (method.returnType !in setOf("I", "J")) continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        val n = method.name.lowercase()
                        if ("coin" !in n && "money" !in n && "cash" !in n) continue
                        try {
                            method.addInstructions(
                                0,
                                """
                                    const v0, 0x5f5e100
                                    return v0
                                """,
                            )
                        } catch (_: Exception) {}
                    }
                }
            } catch (_: Exception) {}
        }
    }
}
