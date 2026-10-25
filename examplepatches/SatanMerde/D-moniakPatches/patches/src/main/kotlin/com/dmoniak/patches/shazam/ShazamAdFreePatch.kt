package com.dmoniak.patches.shazam

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHAZAM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val shazamAdFreePatch = bytecodePatch(
    name = "Ad-Free & Clean Interface - Shazam",
    description = "Strips post-recognition promo cards, Apple Music targeted upsells, in-app survey banners, and announcement sheets in Shazam.",
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShazamAdFreeLogic(logger)
    }
}

fun BytecodePatchContext.executeShazamAdFreeLogic(logger: Logger) {
    logger.info("Executing Ad-Free & Clean Interface patch for Shazam...")
    var hooked = 0

    classDefForEach { classDef ->
        val type = classDef.type

        // 1. NPS Survey Banner
        if (type == "Lcom/shazam/server/response/config/AmpNpsSurveyBanner;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getEnabled" && method.returnType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Shazam AdBlock] Neutralized AmpNpsSurveyBanner.getEnabled -> false")
                    } catch (e: Exception) {
                        logger.fine("[Shazam AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Announcements results (empty list)
        if (type == "Lcom/shazam/server/response/announcement/Results;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getAnnouncements" && method.returnType == "Ljava/util/List;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            sget-object v0, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;
                            return-object v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Shazam AdBlock] Neutralized Results.getAnnouncements -> emptyList")
                    } catch (e: Exception) {
                        logger.fine("[Shazam AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 3. Announcements HSA resources (empty map)
        if (type == "Lcom/shazam/server/response/announcement/ResolvedHsaResources;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getAnnouncements" && method.returnType == "Ljava/util/Map;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            sget-object v0, Lkotlin/collections/EmptyMap;->INSTANCE:Lkotlin/collections/EmptyMap;
                            return-object v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Shazam AdBlock] Neutralized ResolvedHsaResources.getAnnouncements -> emptyMap")
                    } catch (e: Exception) {
                        logger.fine("[Shazam AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 4. Apple Music Targeted Upsell cards -> return null
        if (type == "Lcom/shazam/server/response/config/AmpAppleMusicTargetedUpsell;") {
            for (method in classDef.methods.toList()) {
                if (method.name.startsWith("get") && method.name != "getClass" && method.returnType.startsWith("L")) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return-object v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Shazam AdBlock] Neutralized AmpAppleMusicTargetedUpsell.${method.name} -> null")
                    } catch (e: Exception) {
                        logger.fine("[Shazam AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 5. Preview upsell dialogs -> return null
        if (type == "Lcom/shazam/server/response/config/AmpPreviewUpsell;") {
            for (method in classDef.methods.toList()) {
                if (method.name.startsWith("get") && method.name != "getClass" && method.returnType.startsWith("L")) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return-object v0
                            """.trimIndent()
                        )
                        hooked++
                        logger.info("[Shazam AdBlock] Neutralized AmpPreviewUpsell.${method.name} -> null")
                    } catch (e: Exception) {
                        logger.fine("[Shazam AdBlock] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Shazam AdBlock] Total promo & ad-blocking hooks applied: $hooked")
}
