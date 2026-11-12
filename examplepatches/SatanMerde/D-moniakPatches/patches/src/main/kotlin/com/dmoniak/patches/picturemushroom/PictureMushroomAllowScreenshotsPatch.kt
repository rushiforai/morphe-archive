package com.dmoniak.patches.picturemushroom

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PICTURE_MUSHROOM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val pictureMushroomAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Recording - Picture Mushroom (Experimental)",
    description = "Disables Android FLAG_SECURE window restrictions to allow screenshots and screen recording across all Picture Mushroom identification screens and guides.",
) {
    compatibleWith(COMPATIBILITY_PICTURE_MUSHROOM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePictureMushroomAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executePictureMushroomAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Picture Mushroom (com.glority.picturemushroom)...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (!tl.contains("androidx") && !tl.contains("com/google")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

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
                        logger.info("[PictureMushroom Screenshots] Neutralized secure window setter in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[PictureMushroom Screenshots] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[PictureMushroom Screenshots] Total screenshot hooks applied: $hookedPoints")
}
