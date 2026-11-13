package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

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

    // 8. Enhanced Live-Stream SCTE-35 & SGAI Ad-Filler Neutralization
    // Surgical hooks for:
    // - CustomScteEventScheduler (Media3 & ExoPlayer2): disables live ad event scheduling & cue evaluation
    // - HlsCustomScteResolver: neutralizes SCTE-35 cue queueing
    // - AdFillerConfigsRepository: suppresses network fetching of filler ad configs
    // - AdFillerConfigsLocalDataSource: suppresses reading/writing local cached filler ads
    // - AdFillerConfigsJsonParser & AdFillerMediaConfigsDTO: returns empty filler media mapping
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (!tl.startsWith("landroidx/") && !tl.startsWith("lkotlin/") && !tl.startsWith("ljava/")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            var isCustomScteScheduler = false
            var isHlsCustomScteResolver = false
            var isAdFillerRepo = false
            var isAdFillerLocal = false
            var isAdFillerParser = false

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (ins in impl.instructions) {
                    val insStr = ins.toString()
                    if (insStr.contains("CustomScteEventScheduler")) isCustomScteScheduler = true
                    if (insStr.contains("HlsCustomScteResolver")) isHlsCustomScteResolver = true
                    if (insStr.contains("AdFillerConfigsRepository")) isAdFillerRepo = true
                    if (insStr.contains("AdFillerConfigsLocalDataSource")) isAdFillerLocal = true
                    if (insStr.contains("FILLER_TYPES") || insStr.contains("AdFillerMediaConfigsDTO")) isAdFillerParser = true
                }
            }

            // 8.1 CustomScteEventScheduler: neutralize scheduling and firing of live ad breaks
            if (isCustomScteScheduler) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val pTypes = method.parameterTypes
                    val retType = method.returnType

                    if ((pTypes.size == 1 && pTypes[0].toString() == "Ljava/lang/String;" && retType == "V") ||
                        (pTypes.isEmpty() && retType == "V" && (method.name == "c" || method.name == "f0"))
                    ) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = "return-void",
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized CustomScteEventScheduler.${method.name} in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip scheduler hook: ${e.message}")
                        }
                    }
                }
            }

            // 8.2 HlsCustomScteResolver: neutralize SCTE-35 cue tag enqueuing
            if (isHlsCustomScteResolver) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val pTypes = method.parameterTypes
                    val retType = method.returnType

                    if (pTypes.size == 2 && pTypes[0].toString() == "J" && pTypes[1].toString() == "Ljava/lang/String;" && retType == "V") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = "return-void",
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized HlsCustomScteResolver.${method.name} in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip resolver hook: ${e.message}")
                        }
                    }
                }
            }

            // 8.3 AdFillerConfigsRepository: suppress network fetching of filler ads
            if (isAdFillerRepo) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val pTypes = method.parameterTypes
                    val retType = method.returnType

                    if (pTypes.size == 2 && pTypes[0].toString() == "Ljava/lang/String;" && retType == "Ljava/lang/Object;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized AdFillerConfigsRepository.${method.name} in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip repo hook: ${e.message}")
                        }
                    }
                }
            }

            // 8.4 AdFillerConfigsLocalDataSource: suppress reading/writing cached filler ads
            if (isAdFillerLocal) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val pTypes = method.parameterTypes
                    val retType = method.returnType

                    if (pTypes.size == 1 && retType == "Ljava/lang/String;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized AdFillerConfigsLocalDataSource.${method.name} (read)")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip local read hook: ${e.message}")
                        }
                    }

                    if (pTypes.size == 2 && pTypes[0].toString() == "Ljava/lang/String;" && retType == "Ljava/lang/Object;") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized AdFillerConfigsLocalDataSource.${method.name} (write)")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip local write hook: ${e.message}")
                        }
                    }
                }
            }

            // 8.5 AdFillerConfigsJsonParser: return empty filler config mapping
            if (isAdFillerParser) {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    val pTypes = method.parameterTypes
                    val retType = method.returnType

                    if (pTypes.size == 1 && pTypes[0].toString() == "Ljava/lang/String;" && retType.startsWith("LFe/")) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 3,
                                smaliCode = """
                                    new-instance v0, $retType
                                    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;
                                    move-result-object v1
                                    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;
                                    move-result-object v2
                                    invoke-direct {v0, v1, v2}, $retType-><init>(Ljava/util/Map;Ljava/util/Map;)V
                                    return-object v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                            logger.info("[Hotstar LiveAd] Neutralized AdFillerConfigsJsonParser.${method.name} in ${classDef.type}")
                        } catch (e: Exception) {
                            logger.fine("[Hotstar LiveAd] Skip parser hook: ${e.message}")
                        }
                    }
                }
            }
        }
    }

    // 9. Generic heuristics for any remaining ad widgets & state getters
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (!tl.startsWith("landroidx/") && !tl.startsWith("lkotlin/") && !tl.startsWith("ljava/")) {
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
                        } catch (e: Exception) {}
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
                        } catch (e: Exception) {}
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
                        } catch (e: Exception) {}
                    }
                }
            }
        }
    }

    logger.info("[Hotstar AdBlock] Patch completed with $hookedPoints total hooks.")
}
