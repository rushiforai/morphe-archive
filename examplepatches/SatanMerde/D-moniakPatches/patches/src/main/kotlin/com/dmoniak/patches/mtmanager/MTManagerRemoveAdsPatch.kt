package com.dmoniak.patches.mtmanager

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MT_MANAGER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val mtManagerRemoveAdsPatch = bytecodePatch(
    name = "Remove Ads and Update Prompts - MT Manager (Experimental)",
    description = "Removes in-app promotional banners and interstitial advertisements, disables forced update dialogs, and suppresses upgrade nag screens across MT Manager.",
) {
    compatibleWith(COMPATIBILITY_MT_MANAGER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMTManagerRemoveAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeMTManagerRemoveAdsLogic(logger: Logger) {
    logger.info("Executing Remove Ads and Update Prompts patch for MT Manager...")
    var hookedPoints = executeComprehensiveAdBlock(logger, "MTManager")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.startsWith("lkotlin/") && !tl.startsWith("landroidx/") && !tl.startsWith("landroid/")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType
                val pTypes = method.parameterTypes

                // 1. Disable update checks returning Boolean -> false
                if (pTypes.isEmpty() && retType == "Z" && (
                    mName.contains("checkupdate") ||
                    mName == "isupdateavailable" ||
                    mName == "hasupdate" ||
                    mName == "needupdate"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager Ads/Update] Hooked update check -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager Ads/Update] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                    }
                }

                // 2. Disable update dialog triggers returning void -> return-void
                if (pTypes.isEmpty() && retType == "V" && (
                    mName == "showupdatedialog" ||
                    mName == "checkupdateversion" ||
                    mName == "checknewversion" ||
                    mName == "promptupdate"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = if (isStatic) 1 else 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[MTManager Ads/Update] Neutralized update dialog: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager Ads/Update] Failed to neutralize ${classDef.type}->${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MTManager Ads/Update] Total hooks applied: $hookedPoints")
}
