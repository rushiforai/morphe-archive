package com.dmoniak.patches.altosadventure

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ALTOS_ADVENTURE
import java.util.logging.Logger

@Suppress("unused")
val altosAdventureInfiniteWingsuitPatch = bytecodePatch(
    name = "Infinite Wingsuit & Long Scarf - Alto's Adventure (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Provides unlimited wingsuit flight duration and keeps the scarf at maximum length without requiring endless trick combos in Alto's Adventure.",
) {
    compatibleWith(COMPATIBILITY_ALTOS_ADVENTURE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeAltosAdventureWingsuitLogic(logger)
    }
}

fun BytecodePatchContext.executeAltosAdventureWingsuitLogic(logger: Logger) {
    logger.info("Executing Infinite Wingsuit patch for Alto's Adventure...")
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

            // 1. Hook wingsuit active / unlocked status
            if (!isStatic && (
                mName == "iswingsuitactive" ||
                mName == "iswingsuitavailable" ||
                mName == "hasunlockedwingsuit"
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
                    logger.info("[Alto Wingsuit] Enforced wingsuit active: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Alto Wingsuit] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Wingsuit timer / remaining flight fuel (return high float)
            if (!isStatic && (
                mName == "getwingsuittimer" ||
                mName == "getwingsuitduration" ||
                mName == "getremainingwingsuittime"
            ) && retType == "F") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x42c80000
                        return v0
                        """.trimIndent() // 100.0f
                    )
                    hookedPoints++
                    logger.info("[Alto Wingsuit] Fixed wingsuit timer to 100.0f: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Alto Wingsuit] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Prevent scarf shrinkage / wingsuit deactivation
            if (!isStatic && (
                mName == "deactivatewingsuit" ||
                mName == "shrinkscarf"
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
                    logger.info("[Alto Wingsuit] Neutralized wingsuit deactivation: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Alto Wingsuit] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Alto Wingsuit] Total wingsuit hooks applied: $hookedPoints")
}
