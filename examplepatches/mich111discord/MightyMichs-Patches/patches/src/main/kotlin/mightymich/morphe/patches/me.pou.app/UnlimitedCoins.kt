package mightymich.morphe.patches.me.pou.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val unlimitedCoinsPatch = bytecodePatch(
    name = "Unlimited coins",
    description = "Forces Pou's coin balance getter to a very large value so " +
        "shop and unlock checks always pass (local save).",
    default = true
) {
    compatibleWith(PouCompatibility.POU)

    execute {
        var patched = false

        // Wallet class holds IAP ids me.pou.coins.* and totals coins in a virtual ()I
        val defs = try {
            classDefByStrings("me.pou.coins.two_thousand")
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
                if (AccessFlags.STATIC.isSet(method.accessFlags)) continue
                if (method.returnType != "I") continue
                if (method.parameterTypes.isNotEmpty()) continue
                if (method.implementation == null) continue
                // Skip trivial helpers (const + return only)
                if (method.implementation!!.instructions.count() <= 4) continue
                try {
                    method.addInstructions(
                        0,
                        """
                            const v0, 0x3B9AC9FF
                            return v0
                        """
                    )
                    patched = true
                } catch (_: Exception) {
                }
            }
        }

        if (!patched) {
            throw PatchException(
                "Pou: coin balance method not found (me.pou.coins.two_thousand)."
            )
        }
    }
}
