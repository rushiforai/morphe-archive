package com.dmoniak.patches.geometrydash

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GEOMETRY_DASH
import java.util.logging.Logger

@Suppress("unused")
val geometryDashPracticeMusicBypassPatch = bytecodePatch(
    name = "Practice Music Hack & Bypass - Geometry Dash (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Plays the real level soundtrack instead of the default repetitive practice loop song when playing in Practice Mode.",
) {
    compatibleWith(COMPATIBILITY_GEOMETRY_DASH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGeometryDashPracticeMusicBypassLogic(logger)
    }
}

fun BytecodePatchContext.executeGeometryDashPracticeMusicBypassLogic(logger: Logger) {
    logger.info("Executing Practice Music Hack & Bypass patch for Geometry Dash...")
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

            // 1. Should play practice music check
            if (!isStatic && (
                mName == "shouldplaypracticemusic" ||
                mName == "ispracticemusicon" ||
                mName == "usespracticemusic"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[GeometryDash Music] Bypassed practice music check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[GeometryDash Music] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Suppress playPracticeMusic calls
            if (!isStatic && (
                mName == "playpracticemusic" ||
                mName == "startpracticemusic"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[GeometryDash Music] Muted practice music loop in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[GeometryDash Music] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[GeometryDash Music] Total practice music bypass hooks applied: $hookedPoints")
}
