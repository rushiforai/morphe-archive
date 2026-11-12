package com.dmoniak.patches.macrodroid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MACRODROID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val macroDroidAdFreePatch = bytecodePatch(
    name = "Ad-Free and Remove Upgrade Nags - MacroDroid (Experimental)",
    description = "Removes banner and interstitial advertisements, disables Pro upgrade nag screens (AdvertActivity, MacroDroidProAdvertActivity2), and suppresses rewarded advert prompts across MacroDroid.",
) {
    compatibleWith(COMPATIBILITY_MACRODROID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMacroDroidAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeMacroDroidAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free and Remove Upgrade Nags patch for MacroDroid...")
    var hookedPoints = 0

    // 1. Comprehensive ad mediation SDK hook
    hookedPoints += executeComprehensiveAdBlock(logger, "MacroDroid")

    // 2. MacroDroid specific advert activities and nag screens
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType
                val params = method.parameterTypes

                // 2a. Neutralize advert activities onCreate or show logic
                if (!isStatic && retType == "V" && (
                    classDef.type.contains("AdvertActivity") ||
                    classDef.type.contains("MacroDroidProAdvertActivity") ||
                    classDef.type.contains("AlternativeAdvertActivity")
                ) && (
                    mName == "showadvert" ||
                    mName == "loadadvert" ||
                    mName == "displayadvert" ||
                    mName == "initadvert"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[MacroDroid AdBlock] Neutralized advert activity method: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2b. Disable ad condition getters -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "isrewardadvert" ||
                    mName == "isadvertenabled" ||
                    mName == "shouldshowadvert" ||
                    mName == "shouldshowupgradeadvert" ||
                    mName == "hasavailableadvert"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MacroDroid AdBlock] Disabled ad condition -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MacroDroid AdBlock] Total ad-blocking hooks applied: $hookedPoints")
}
