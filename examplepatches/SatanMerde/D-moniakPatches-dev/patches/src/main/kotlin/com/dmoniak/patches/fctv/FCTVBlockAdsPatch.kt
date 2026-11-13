package com.dmoniak.patches.fctv

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV_TV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE_TV
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fctvBlockAdsPatch = bytecodePatch(
    name = "Block Pre-Roll Video Ads & Interstitials - FCTV33 & RBTV+",
    description = "Completely strips pre-roll video ads, loading countdown shades, direct link popups, and banner ads before live stream playback on FCTV33 & RBTV+ (Mobile & TV).",
) {
    compatibleWith(COMPATIBILITY_FCTV, COMPATIBILITY_FCTV_TV, COMPATIBILITY_RBLIVE, COMPATIBILITY_RBLIVE_TV)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFCTVBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeFCTVBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Pre-Roll Video Ads & Interstitials patch for FCTV33...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        if (type.startsWith("Landroidx/") || type.startsWith("Landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Mobile & Android TV PlayerActivity pre-roll ad trigger & countdown shade
        if (type == "Lcom/rblive/app/ui/player/PlayerActivity;" || type == "Lcom/rblive/tv/ui/player/PlayerActivity;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "i" && method.returnType == "V" && method.parameterTypes.contains("Lsc/l;")) {
                    try {
                        val isMobile = type == "Lcom/rblive/app/ui/player/PlayerActivity;"
                        val smali = if (isMobile) {
                            """
                                invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                move-result-object v0
                                check-cast v0, Lpa/b;
                                if-eqz v0, :cond_shade
                                iget-object v0, v0, Lpa/b;->l:Landroid/widget/FrameLayout;
                                if-eqz v0, :cond_shade
                                const/16 v1, 8
                                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                                :cond_shade
                                if-eqz p1, :cond_0
                                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                invoke-interface {p1, v0}, Lsc/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                                :cond_0
                                return-void
                            """.trimIndent()
                        } else {
                            """
                                invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                move-result-object v0
                                check-cast v0, Ldb/d;
                                if-eqz v0, :cond_shade
                                iget-object v0, v0, Ldb/d;->c:Landroid/widget/FrameLayout;
                                if-eqz v0, :cond_shade
                                const/16 v1, 8
                                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                                :cond_shade
                                if-eqz p1, :cond_0
                                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                invoke-interface {p1, v0}, Lsc/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                                :cond_0
                                return-void
                            """.trimIndent()
                        }
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = smali
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Neutralized pre-roll shade and ad prompt in $type->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook $type->${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Master ADManager switch
        if (type == "Lcom/rblive/common/manager/ADManager;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "isEnableAD" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Disabled master ad flag in ADManager->isEnableAD")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook ADManager->isEnableAD: ${e.message}")
                    }
                } else if (method.name == "getBannerConfig") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x0
                                return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Disabled banner config in ADManager->getBannerConfig")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook ADManager->getBannerConfig: ${e.message}")
                    }
                }
            }
        }

        // 3. AdMavenManager Interstitials & Preloaders
        if (type == "Lcom/rblive/common/manager/AdMavenManager;") {
            for (method in classDef.methods.toList()) {
                when (method.name) {
                    "showPlayerInterstitial" -> {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    if-eqz p2, :cond_0
                                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                                    invoke-interface {p2, v0}, Lsc/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                                    :cond_0
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Ads] Neutralized AdMavenManager->showPlayerInterstitial")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Ads] Failed to hook AdMavenManager->showPlayerInterstitial: ${e.message}")
                        }
                    }
                    "preloadPlayerInterstitial", "showReadyInterstitial" -> {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 1,
                                smaliCode = """
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Ads] Neutralized AdMavenManager->${method.name}")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Ads] Failed to hook AdMavenManager->${method.name}: ${e.message}")
                        }
                    }
                }
            }
        }

        // 4. AppEnv global ad flag
        if (type == "Lcom/rblive/common/AppEnv;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getAD_ENABLE" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Disabled AppEnv->getAD_ENABLE")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook AppEnv->getAD_ENABLE: ${e.message}")
                    }
                }
            }
        }

        // 5. DirectLinkManager popups
        if (type == "Lcom/rblive/common/manager/DirectLinkManager;") {
            for (method in classDef.methods.toList()) {
                if ((method.name == "loadAdsByTV" || method.name == "loadDirectLinkByApp") && method.returnType == "Lgc/g;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                new-instance v0, Lgc/g;
                                sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                                const/4 v2, 0x0
                                invoke-direct {v0, v1, v2}, Lgc/g;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
                                return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Disabled DirectLink popup in DirectLinkManager->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook DirectLinkManager->${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 6. ParamsManager Monetag config
        if (type == "Lcom/rblive/common/manager/ParamsManager;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getMONETAGCon" && method.returnType == "Ljava/lang/String;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const-string v0, ""
                                return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Neutralized ParamsManager->getMONETAGCon")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook ParamsManager->getMONETAGCon: ${e.message}")
                    }
                }
            }
        }

        // 7. WebViewManager ad injections
        if (type == "Lcom/rblive/common/manager/WebViewManager;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getWebviewActive" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Disabled WebViewManager->getWebviewActive")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook WebViewManager->getWebviewActive: ${e.message}")
                    }
                } else if (method.name == "isDisableWeb" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Enforced WebViewManager->isDisableWeb = true")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook WebViewManager->isDisableWeb: ${e.message}")
                    }
                }
            }
        }

        // 8. Signature verification bypass (anti-tamper)
        if (type == "Lcom/rblive/common/utils/SignatureUtils;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getSignature" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Ads] Bypassed SignatureUtils->getSignature anti-tamper")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Ads] Failed to hook SignatureUtils->getSignature: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[FCTV Block Ads] Total hooks applied: $hookedPoints")
}
