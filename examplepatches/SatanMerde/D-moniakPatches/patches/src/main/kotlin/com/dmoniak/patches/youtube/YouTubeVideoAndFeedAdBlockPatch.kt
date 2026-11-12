package com.dmoniak.patches.youtube

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val youtubeVideoAndFeedAdBlockPatch = bytecodePatch(
    name = "Block Video and Feed Ads - YouTube (Experimental)",
    description = "Strips pre-roll and mid-roll video advertisements, home feed sponsored cards, search result ads, Shorts ads, and info card promos in YouTube.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeAdBlockLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeAdBlockLogic(logger: Logger) {
    logger.info("Executing Block Video and Feed Ads patch for YouTube...")
    var hookedPoints = 0

    // 1. Comprehensive ad-blocking engine for standard ad SDKs & mediation
    hookedPoints += executeComprehensiveAdBlock(logger, "YouTube")

    // 2. YouTube-specific ad playback conditions and models
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType

                // 2a. Neutralize ad playback getters -> false
                if (!isStatic && (
                    mName == "shouldshowad" ||
                    mName == "isadplaying" ||
                    mName == "hasadplaying" ||
                    mName == "isprerollad" ||
                    mName == "ismidrollad" ||
                    mName == "haspromotedcontent" ||
                    mName == "issponsored"
                ) && retType == "Z") {
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
                        logger.info("[YouTube AdBlock] Disabled ad condition in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[YouTube AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2b. Drop ad break models / responses returning null
                if (!isStatic && (
                    mName == "getadbreak" ||
                    mName == "getpromotedcontent" ||
                    mName == "getinterstitialad"
                ) && retType.startsWith("L") && !retType.startsWith("Ljava/lang/String")) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x0
                                return-object v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[YouTube AdBlock] Neutralized ad model getter in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[YouTube AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[YouTube AdBlock] Finished: $hookedPoints ad hook points injected.")
}
