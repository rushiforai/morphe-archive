package com.dmoniak.patches.shroomid

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHROOMID
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val shroomIDAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Recording - ShroomID (Experimental)",
    description = "Disables Android FLAG_SECURE window restrictions to allow screenshots and screen recording across all ShroomID mushroom identification and field guide screens.",
) {
    compatibleWith(COMPATIBILITY_SHROOMID)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShroomIDAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeShroomIDAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for ShroomID (com.shroomid)...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        if (!tl.contains("androidx") && !tl.contains("com/google")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            // 1. Hook React Native modal host view to prevent FLAG_SECURE enforcement
            if (type == "Lcom/facebook/react/views/modal/ReactModalHostView;") {
                for (method in classDef.methods.toList()) {
                    if (method.implementation == null) continue
                    if (method.name == "isFlagSecureSet" && method.returnType == "Z") {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    const/4 v0, 0x0
                                    return v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                            logger.info("[ShroomID Screenshots] Neutralized FLAG_SECURE check in ReactModalHostView")
                        } catch (e: Exception) {
                            logger.fine("[ShroomID Screenshots] Failed to hook isFlagSecureSet: ${e.message}")
                        }
                    }
                }
            }

            // 2. Neutralize any secure screen setters
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                val isSecureMethod = (
                    mName == "setsecurescreen" ||
                    mName == "setupsecurescreen" ||
                    mName == "enforcesecurescreen" ||
                    mName == "applyflagsecure"
                ) && retType == "V"

                if (isSecureMethod) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = "return-void",
                        )
                        hookedPoints++
                        logger.info("[ShroomID Screenshots] Neutralized secure window setter in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[ShroomID Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[ShroomID Screenshots] Total screenshot hooks applied: $hookedPoints")
}
