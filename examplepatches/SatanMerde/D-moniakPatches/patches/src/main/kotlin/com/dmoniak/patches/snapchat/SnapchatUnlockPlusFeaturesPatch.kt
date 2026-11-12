package com.dmoniak.patches.snapchat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val snapchatUnlockPlusFeaturesPatch = bytecodePatch(
    name = "Unlock Snapchat+ Features - Snapchat (Experimental)",
    description = "Unlocks client-side Snapchat+ UI features including custom app icons, post-view emojis, best friends pin badges, and dark appearance controls. Server-side features remain unverified. WARNING: Experimental patch with account suspension risks.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock Snapchat+ Features patch for Snapchat...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Enums: SUBSCRIPTION_TIER_SNAPCHAT_PLUS, SUBSCRIPTION_TIER_SNAPCHAT_PLUS_AD_FREE
    //   - Enums: SNAPCHAT_PLUS, SNAPCHAT_PLUS_LENS_PASS, SNAPCHAT_PLUS_BASIC
    //   - Store: SnapUserStore
    //   - Strings: NEW_TO_SNAPCHAT_PLUS, SCREENSHOT_PLUS

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

                // 1. Hook client-side Snapchat+ feature availability and subscriber flags -> true
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "issnapchatplusactive" ||
                    mName == "issnapchatplussubscriber" ||
                    mName == "hassnapplusfeatures" ||
                    mName == "canusesnapplusbadge" ||
                    mName == "ispostviewemojienabled" ||
                    mName == "canusecustomappicons" ||
                    mName == "issnapplusenabled" ||
                    mName == "issnapchatplusmember" ||
                    mName == "canusepinbestfriend" ||
                    mName == "hasplusbadging"
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
                        logger.info("[Snapchat Plus] Unlocked Snap+ feature flag -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Plus] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Subscription tier enum ordinal -> 1 (SNAPCHAT_PLUS tier)
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getsubscriptiontier" ||
                    mName == "getsnapchatplustier" ||
                    mName == "getplusmembershiplevel"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Snapchat Plus] Set Plus tier ordinal -> 1: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Plus] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Snapchat Unlock Plus] Total Plus hooks applied: $hookedPoints")
}
