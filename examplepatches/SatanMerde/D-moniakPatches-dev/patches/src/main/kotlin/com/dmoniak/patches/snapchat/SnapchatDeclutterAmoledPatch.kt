package com.dmoniak.patches.snapchat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.AdBlockHelper.executeComprehensiveAdBlock
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val snapchatDeclutterAmoledPatch = bytecodePatch(
    name = "AMOLED Dark Theme and Declutter - Snapchat (Experimental)",
    description = "Forces pure OLED black backgrounds for chats and conversation screens, disables commercial ad inserts in Stories and Spotlight, and hides sponsored Discover tiles. WARNING: Experimental patch with account suspension risks.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatDeclutterAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatDeclutterAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme and Declutter patch for Snapchat...")
    var hookedPoints = 0

    // 1. Comprehensive Ad-Blocking engine for ad mediation SDKs
    hookedPoints += executeComprehensiveAdBlock(logger, "Snapchat")

    // 2. Snapchat-specific UI color hooks and sponsored content suppression
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

                // 2a. Inject pure OLED pitch black (#000000) for dark theme backgrounds
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getchatbackgroundcolor" ||
                    mName == "getdarkmodebackground" ||
                    mName == "getsnapchatsurfacecolor" ||
                    mName == "getsurfacebackgroundcolor" ||
                    mName == "getconversationbackgroundcolor"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/high16 v0, -0x1000000
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Snapchat AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat AMOLED] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2b. Force dark theme / dark mode enabled -> true
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "isdarkmodeenabled" ||
                    mName == "isappdarkthemeenabled" ||
                    mName == "shouldusedarktheme" ||
                    mName == "isnightmodeactive"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Snapchat AMOLED] Forced dark mode flag -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat AMOLED] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2c. Suppress sponsored Discover tiles and Spotlight commercial ads -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "shouldshowsponsoredtile" ||
                    mName == "isspotlightadenabled" ||
                    mName == "isdiscoveradvisible" ||
                    mName == "shouldinsertadstory" ||
                    mName == "issponsoredcontentenabled" ||
                    mName == "iscommercialsnap" ||
                    mName == "haspromotedstories"
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
                        logger.info("[Snapchat Declutter] Suppressed sponsored ad -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Declutter] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Snapchat AMOLED and Declutter] Total hooks applied: $hookedPoints")
}
