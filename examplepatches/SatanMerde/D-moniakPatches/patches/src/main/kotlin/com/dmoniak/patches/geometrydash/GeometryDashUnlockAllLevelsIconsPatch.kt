package com.dmoniak.patches.geometrydash

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GEOMETRY_DASH
import java.util.logging.Logger

@Suppress("unused")
val geometryDashUnlockAllLevelsIconsPatch = bytecodePatch(
    name = "Unlock All Levels & Icons - Geometry Dash (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all official levels (including Demon stages), custom icons, ships, balls, UFOs, waves, trails, and colors in Geometry Dash.",
) {
    compatibleWith(COMPATIBILITY_GEOMETRY_DASH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeometryDashUnlockAllLevelsIconsLogic(logger)
    }
}

fun BytecodePatchContext.executeGeometryDashUnlockAllLevelsIconsLogic(logger: Logger) {
    logger.info("Executing Unlock All Levels & Icons patch for Geometry Dash...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Icon & Level unlock queries
            if (!isStatic && (
                mName == "isiconunlocked" ||
                mName == "islevelunlocked" ||
                mName == "iscolortypeunlocked" ||
                mName == "isshipunlocked" ||
                mName == "isballunlocked" ||
                mName == "isbirdunlocked" ||
                mName == "isdartunlocked" ||
                mName == "isrobotunlocked" ||
                mName == "isspiderunlocked" ||
                mName == "isitemunlocked"
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
                    logger.info("[GeometryDash Unlocks] Unlocked icon/level in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[GeometryDash Unlocks] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Secret coins & star count booster (for unlocking vault rewards naturally)
            if (!isStatic && (
                mName == "getstars" ||
                mName == "getsecretcoins" ||
                mName == "getusercoins" ||
                mName == "getdemons" ||
                mName == "getdiamonds"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x3e7
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[GeometryDash Unlocks] Boosted currency in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[GeometryDash Unlocks] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[GeometryDash Unlocks] Total unlock hooks applied: $hookedPoints")
}
