package com.dmoniak.patches.cryptomator

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CRYPTOMATOR_FREEMIUM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val cryptomatorAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Recording - Cryptomator (Experimental)",
    description = "⚠️ [Experimental / Untested] Disables Android FLAG_SECURE window protection in Cryptomator, allowing screenshots, screen recordings, and vault previews in the recent tasks overview.",
) {
    compatibleWith(COMPATIBILITY_CRYPTOMATOR, COMPATIBILITY_CRYPTOMATOR_FREEMIUM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCryptomatorAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeCryptomatorAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots & Screen Recording patch for Cryptomator...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        if (tl.contains("androidx") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. SharedPreferencesHandler.secureScreen -> false
        if (type.contains("SharedPreferencesHandler")) {
            for (method in classDef.methods.toList()) {
                if (method.name == "secureScreen" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Cryptomator Screenshots] Hooked SharedPreferencesHandler.secureScreen -> false")
                    } catch (e: Exception) {
                        logger.fine("[Cryptomator Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. BaseActivity / BaseDialog / BaseBottomSheet: neutralize secure screen setups
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val mName = method.name.lowercase()
            val retType = method.returnType

            val isSecureScreenMethod = (
                mName == "setupsecurescreen" ||
                mName == "setsecurescreen" ||
                mName == "updatesecurescreen" ||
                mName == "enforcesecurescreen" ||
                mName == "applyflagsecure"
            ) && retType == "V"

            if (isSecureScreenMethod) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        smaliCode = "return-void"
                    )
                    hookedPoints++
                    logger.info("[Cryptomator Screenshots] Neutralized secure window setter in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Cryptomator Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Cryptomator Screenshots] Total screenshot hooks applied: $hookedPoints")
}
