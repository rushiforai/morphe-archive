package com.dmoniak.patches.simplex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIMPLEX
import java.util.logging.Logger

@Suppress("unused")
val simpleXUnlockProFeaturesPatch = bytecodePatch(
    name = "Unlock Pro & Multi-Profile Switching - SimpleX (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks instant multi-profile quick switching, quantum-resistant encryption toggles, and donor profile styling in SimpleX Chat.",
) {
    compatibleWith(COMPATIBILITY_SIMPLEX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSimpleXUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeSimpleXUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro & Multi-Profile Switching patch for SimpleX Chat...")
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

            // Hook multi-profile and pro features in SimpleX
            if (!isStatic && (
                mName == "ismultiprofileunlocked" ||
                mName == "isquantumresistanceenabled" ||
                mName == "issupportermodeactive" ||
                mName == "canuseadvancedrouting"
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
                    logger.info("[SimpleX Pro] Unlocked pro feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SimpleX Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SimpleX Unlock Pro] Total hooks applied: $hookedPoints")
}
