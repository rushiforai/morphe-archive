package com.dmoniak.patches.brave

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BRAVE
import java.util.logging.Logger

@Suppress("unused")
val braveDisableRewardsWalletPatch = bytecodePatch(
    name = "Disable Rewards & Crypto Wallet - Brave (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables Brave Rewards (BAT), crypto wallet icon, Web3 onboarding prompts, and token badges for a cleaner UI.",
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBraveDisableRewardsWalletLogic(logger)
    }
}

fun BytecodePatchContext.executeBraveDisableRewardsWalletLogic(logger: Logger) {
    logger.info("Executing Disable Rewards & Crypto Wallet patch for Brave...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Neutralize Brave Rewards, Wallet and Web3 visibility
            if (!isStatic && (
                mName == "isbraverewardsenabled" ||
                mName == "isrewardssupported" ||
                mName == "shouldshowrewardstoolbarbutton" ||
                mName == "iswalletenabled" ||
                mName == "isbravewalletenabled" ||
                mName == "shouldshowwalletbutton" ||
                mName == "isweb3featureavailable"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Brave Rewards] Disabled feature check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Brave Rewards] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Rewards onboarding prompts
            if (!isStatic && (
                mName == "showrewardsonboarding" ||
                mName == "promotebravewallet" ||
                mName == "showwalletcreationdialog"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Brave Rewards] Suppressed onboarding dialog in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Brave Rewards] Failed to hook onboarding method: ${e.message}")
                }
            }
        }
    }

    logger.info("Disable Rewards & Crypto Wallet for Brave executed: $hookedPoints points hooked.")
}
