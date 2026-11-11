package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val hotstarAdFreePatch = bytecodePatch(
    name = "Ad-Free & Live Sports Ad-Block - JioHotstar",
    description = "Strips pre-roll, mid-roll, and live cricket match video ads (SSAI), and eliminates feed banners and sponsored cards in JioHotstar.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarAdFreeLogic(logger: Logger) {
    logger.info("Executing battle-tested Ad-Free & Live Sports Ad-Block patch for JioHotstar (in.startv.hotstar)...")

    // 1. SSAI & AdMetadata constructor hook
    // Force: disablePreRoll=true(p1), disableMidRoll=true(p2),
    //        hasPreRoll=false(p3), hasPlayablePreRoll=false(p4), enableMidRollLoad=false(p5)
    // Clear ssaiTag (p6) to completely eliminate live match SSAI (Server-Side Ad Insertion) ads
    try {
        AdMetadataConstructorFingerprint.method.addInstructions(
            0,
            """
            const/4 p1, 0x1
            const/4 p2, 0x1
            const/4 p3, 0x0
            const/4 p4, 0x0
            const/4 p5, 0x0
            const-string p6, ""
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Hooked AdMetadata constructor (pre-roll=0, mid-roll=0, ssaiTag='')")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] AdMetadataConstructorFingerprint failed: ${e.message}")
    }

    // 2. Neuter WatchLiveAdsViewModel session initializer
    try {
        WatchLiveAdsInitFingerprint.method.addInstructions(
            0,
            """
            return-void
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutered WatchLiveAdsViewModel live ad session initializer")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] WatchLiveAdsInitFingerprint failed: ${e.message}")
    }

    // 3. Hide home feed banner / display ads composable
    try {
        DisplayAdComposableFingerprint.method.addInstructions(
            0,
            """
            return-void
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutered DisplayAd composable")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] DisplayAdComposableFingerprint failed: ${e.message}")
    }

    // 4. Block SGAI (Server-Guided Ad Insertion) prefetcher — return empty list
    try {
        SgaiPrefetcherGetAdFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Blocked SGAI prefetcher live ad cache")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] SgaiPrefetcherGetAdFingerprint failed: ${e.message}")
    }

    // 5. Block LiveAdsManager ad processing loop
    try {
        LiveAdsManagerProcessFingerprint.method.addInstructions(
            0,
            """
            sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Blocked LiveAdsManager processing loop")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] LiveAdsManagerProcessFingerprint failed: ${e.message}")
    }

    // 6. Neutralize SGAI (Server-Guided Ad Insertion) and SCTE live cricket ad pods
    try {
        replaceMethod(
            LiveAdMetadataGetScteFetchAdUrlFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized LiveAdMetadata.getScteFetchAdUrl")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] LiveAdMetadataGetScteFetchAdUrlFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetSgaiConfigGetSgaiAdsUrlFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.SgaiConfig.getSgaiAdsUrl")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetSgaiConfigGetSgaiAdsUrlFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetSgaiConfigHasPrefetchNetworkConfigFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.SgaiConfig.hasPrefetchNetworkConfig")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetSgaiConfigHasPrefetchNetworkConfigFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetSgaiConfigHasSyncCallConfigFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.SgaiConfig.hasSyncCallConfig")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetSgaiConfigHasSyncCallConfigFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetLiveStreamAdDataGetAdServerUrlFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.LiveStreamAdData.getAdServerUrl")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetLiveStreamAdDataGetAdServerUrlFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetLiveStreamAdDataGetSgaiAdsUrlFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.LiveStreamAdData.getSgaiAdsUrl")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetLiveStreamAdDataGetSgaiAdsUrlFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetLiveStreamAdDataGetSsaiTagFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.LiveStreamAdData.getSsaiTag")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetLiveStreamAdDataGetSsaiTagFingerprint failed: ${e.message}")
    }

    try {
        replaceMethod(
            PlayerWidgetLiveStreamAdDataHasSgaiConfigFingerprint.method,
            registerCount = 2,
            smaliCode = """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        logger.info("[Hotstar AdBlock] Neutralized PlayerWidget.LiveStreamAdData.hasSgaiConfig")
    } catch (e: Exception) {
        logger.warning("[Hotstar AdBlock] PlayerWidgetLiveStreamAdDataHasSgaiConfigFingerprint failed: ${e.message}")
    }

    // 7. Comprehensive Google IMA SDK & FreeWheel suppression
    var hookedPoints = executeComprehensiveAdBlock(logger, "JioHotstar")

    // 10. Generic heuristics for any remaining ad widgets & state getters
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        val isAdRelated = tl.contains("ad") || tl.contains("ads") || tl.contains("preroll") ||
                tl.contains("midroll") || tl.contains("adpod") || tl.contains("freewheel") ||
                tl.contains("interactivemedia") || tl.contains("sponsored") || tl.contains("videoplayer")

        if (isAdRelated) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType

                val isAdFreeCheck = !isStatic && (
                    mName == "isadfree" ||
                    mName == "isadfreeuser" ||
                    mName == "hasadfreeexperience" ||
                    mName == "hasadfreesubscription"
                ) && retType == "Z"

                if (isAdFreeCheck) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }

                val isAdStatusCheck = !isStatic && (
                    mName == "isad" ||
                    mName == "isadplaying" ||
                    mName == "isadshowing" ||
                    mName == "isliveadplaying" ||
                    mName == "isadbreakplaying" ||
                    mName == "shouldshowads" ||
                    mName == "shouldplayad" ||
                    mName == "canplayad" ||
                    mName == "hasad" ||
                    mName == "hasadpod" ||
                    mName == "hasadbreak" ||
                    mName == "isadsupported"
                ) && retType == "Z"

                if (isAdStatusCheck) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }

                val isAdTrigger = !isStatic && (
                    mName == "loadad" ||
                    mName == "showad" ||
                    mName == "playad" ||
                    mName == "schedulead" ||
                    mName == "requestadpod" ||
                    mName == "requestads" ||
                    mName == "submitrequest" ||
                    mName == "startadplayback" ||
                    mName == "onadbreakstarted"
                ) && retType == "V"

                if (isAdTrigger) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void"
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    logger.info("[Hotstar AdBlock] Patch completed with $hookedPoints supplemental hooks.")
}
