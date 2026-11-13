package com.dmoniak.patches.snapchat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val snapchatAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots and Anti-Screen Security - Snapchat (Experimental)",
    description = "Removes FLAG_SECURE window restrictions and neutralizes client-side screenshot detection triggers on Snapchat chat and media viewers. WARNING: Snapchat enforces aggressive native integrity and attestation checks (libclient.so) with high risk of account suspension.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Snapchat...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Strings: ANDROID_SCREENSHOT_DETECTOR_DURABLE_FALLBACK_ENABLED
    //   - Strings: ANDROID_SCREENSHOT_DETECTOR_LEGACY_DEDUP_KILLSWITCH
    //   - Strings: SCREENSHOT_DETECTOR, SCREEN_CAPTURE, doesRequireSystemScreenShot
    //   - Window flag: FLAG_SECURE (0x2000 = 8192)

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

                // 1. Neutralize window secure / flag secure enforcement
                if (!isStatic && retType == "V" && (
                    mName == "setflagsecure" ||
                    mName == "protectwindowfromcapture" ||
                    mName == "disablescreenshots" ||
                    mName == "enforcesecurewindow" ||
                    mName == "applysecureflag" ||
                    mName == "setsecureflag"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[Snapchat Screenshots] Neutralized FLAG_SECURE method: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Disable screenshot detector and capture block flags -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "isscreencaptureblocked" ||
                    mName == "isscreenshotdetectionenabled" ||
                    mName == "shouldnotifyscreenshot" ||
                    mName == "requiresystemscreenshot" ||
                    mName == "doesrequiresystemscreenshot" ||
                    mName == "issecuredwindowenabled" ||
                    mName == "isflagsecureset"
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
                        logger.info("[Snapchat Screenshots] Disabled screenshot check flag -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 3. Neutralize screenshot notification dispatchers -> return-void
                if (!isStatic && retType == "V" && (
                    mName == "onscreenshotdetected" ||
                    mName == "dispatchescreenshotevent" ||
                    mName == "notifyscreenshottoserver" ||
                    mName == "reportscreenshottaken" ||
                    mName == "handlescreenshotcaptured"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[Snapchat Screenshots] Neutralized screenshot dispatch: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Snapchat Screenshots] Total screenshot hooks applied: $hookedPoints")
}
