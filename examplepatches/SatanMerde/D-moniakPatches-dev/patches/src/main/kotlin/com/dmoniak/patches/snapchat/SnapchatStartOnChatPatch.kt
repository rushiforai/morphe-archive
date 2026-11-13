package com.dmoniak.patches.snapchat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val snapchatStartOnChatPatch = bytecodePatch(
    name = "Start on Chat and Battery Saver - Snapchat (Experimental)",
    description = "Configures Snapchat to open directly on the Chat conversation feed instead of initializing the camera viewfinder on startup, saving battery. WARNING: Experimental patch with account suspension risks.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatStartOnChatLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatStartOnChatLogic(logger: Logger) {
    logger.info("Executing Start on Chat and Battery Saver patch for Snapchat...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Strings: PLUS_APP_START_CONFIG, NON_PLUS_FEATURE_GATING_THREE_TAB
    //   - Strings: THREE_TAB_ENABLED_OVERRIDE, FRIENDS_TAB_
    //   - Tab index: 1 (Chat/Friends tab) vs 2 (Camera)

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

                // 1. Hook default startup landing tab index -> return 1 (Chat / Friends feed)
                if (!isStatic && retType == "I" && params.isEmpty() && (
                    mName == "getdefaultstartuptab" ||
                    mName == "getinitialdestinationtab" ||
                    mName == "getlandingpageindex" ||
                    mName == "getstartuppageindex" ||
                    mName == "getdefaulttabposition"
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
                        logger.info("[Snapchat Start Tab] Forced Chat landing tab -> 1: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Start Tab] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Disable camera auto-start on app boot -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "iscamerastartupenabled" ||
                    mName == "shouldopencameraonlaunch" ||
                    mName == "shouldautostartcamera" ||
                    mName == "iscamerapreloadenabled"
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
                        logger.info("[Snapchat Start Tab] Disabled camera auto-start: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Snapchat Start Tab] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Snapchat Start on Chat] Total start tab hooks applied: $hookedPoints")
}
