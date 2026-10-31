package com.dmoniak.patches.cryptomator

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR_FREEMIUM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val cryptomatorAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme - Cryptomator (Experimental)",
    description = "⚠️ [Experimental / Untested] Enforces dark mode and pure pitch black #000000 surfaces across Cryptomator's vault explorer, settings, and dialogs for maximum OLED battery savings.",
) {
    compatibleWith(COMPATIBILITY_CRYPTOMATOR, COMPATIBILITY_CRYPTOMATOR_FREEMIUM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCryptomatorAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeCryptomatorAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme patch for Cryptomator...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        if (tl.contains("androidx") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. SharedPreferencesHandler: Force screenStyleMode -> 2 (MODE_NIGHT_YES)
        if (type.contains("SharedPreferencesHandler")) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if ((mName == "getScreenStyleMode" || mName == "screenStyleMode") && method.returnType == "I") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x2
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator Theme] Forced screenStyleMode -> MODE_NIGHT_YES (2)")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator Theme] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Generic theme boolean checks
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name.lowercase()
            val retType = method.returnType

            if ((
                mName == "isdarktheme" ||
                mName == "isdarkmode" ||
                mName == "shouldusedarktheme" ||
                mName == "isnightmode"
            ) && retType == "Z") {
                try {
                    mutableClass.replaceMethod(
                        method,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Cryptomator Theme] Forced dark mode in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Cryptomator Theme] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Cryptomator Theme] Total AMOLED theme hooks applied: $hookedPoints")
}
