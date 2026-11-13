package com.dmoniak.patches.macrodroid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MACRODROID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val macroDroidAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots and Scenes Capture - MacroDroid (Experimental)",
    description = "Removes FLAG_SECURE window flags from MacroDroid password prompts, variable value dialogs, and custom scene screens, permitting screen captures and screen recording without black screen blocking.",
) {
    compatibleWith(COMPATIBILITY_MACRODROID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMacroDroidAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeMacroDroidAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots and Scenes Capture patch for MacroDroid...")
    var hookedPoints = 0

    // Key DEX evidence:
    //   - Lcom/arlosoft/macrodroid/PasswordPromptActivity;
    //   - Lcom/arlosoft/macrodroid/action/activities/DisableMacroDroidPasswordPromptActivity;
    //   - Lcom/arlosoft/macrodroid/action/activities/VariableValuePrompt;
    //   - Window FLAG_SECURE (0x2000 = 8192)

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

                // 1. Neutralize secure window / FLAG_SECURE setter methods
                if (!isStatic && retType == "V" && (
                    mName == "setflagsecure" ||
                    mName == "enforcesecurewindow" ||
                    mName == "disablescreenshots" ||
                    mName == "setsecureflag"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[MacroDroid Screenshots] Neutralized secure flag method: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Disable secure flag check getters -> false
                if (!isStatic && retType == "Z" && params.isEmpty() && (
                    mName == "isflagsecureset" ||
                    mName == "issecuredwindowenabled" ||
                    mName == "isscreencaptureblocked"
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
                        logger.info("[MacroDroid Screenshots] Disabled secure window check -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MacroDroid Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MacroDroid Screenshots] Total screenshot hooks applied: $hookedPoints")
}
