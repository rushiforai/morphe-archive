package com.dmoniak.patches.session

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SESSION
import java.util.logging.Logger

@Suppress("unused")
val sessionUnlockSupporterFeaturesPatch = bytecodePatch(
    name = "Unlock Pro & Supporter Themes - Session (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Session Supporter badges, animated community avatars, and custom premium accent themes in Session Private Messenger.",
) {
    compatibleWith(COMPATIBILITY_SESSION)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSessionUnlockSupporterLogic(logger)
    }
}

fun BytecodePatchContext.executeSessionUnlockSupporterLogic(logger: Logger) {
    logger.info("Executing Unlock Pro & Supporter Themes patch for Session...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook Session supporter badges and unlocked themes
            if (!isStatic && (
                mName == "issupporterbadgeenabled" ||
                mName == "haspremiumthemesunlocked" ||
                mName == "cansethighresavatar" ||
                mName == "issessiondonoractive"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Session Supporter] Unlocked supporter feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Session Supporter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Session Unlock Supporter] Total hooks applied: $hookedPoints")
}
