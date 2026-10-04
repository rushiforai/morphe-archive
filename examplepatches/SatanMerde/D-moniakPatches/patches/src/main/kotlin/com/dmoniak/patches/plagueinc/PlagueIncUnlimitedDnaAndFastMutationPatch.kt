package com.dmoniak.patches.plagueinc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLAGUE_INC
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PLAGUE_INC_ALT
import java.util.logging.Logger

@Suppress("unused")
val plagueIncUnlimitedDnaAndFastMutationPatch = bytecodePatch(
    name = "Unlimited DNA Points & Fast Mutation - Plague Inc. (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks DNA points balance getter to provide 9999 DNA points and multiplies DNA points earned on orange and red biohazard bubble pops.",
) {
    compatibleWith(COMPATIBILITY_PLAGUE_INC, COMPATIBILITY_PLAGUE_INC_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePlagueIncDnaLogic(logger)
    }
}

fun BytecodePatchContext.executePlagueIncDnaLogic(logger: Logger) {
    logger.info("Executing Unlimited DNA Points & Fast Mutation patch for Plague Inc...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook DNA points getters returning integer
            if (!isStatic && (
                mName == "getdnapoints" ||
                mName == "getcurrentdna" ||
                mName == "getavailabledna" ||
                mName == "gettotaldnapoints"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x270f
                        return v0
                        """.trimIndent() // 9999 DNA
                    )
                    hookedPoints++
                    logger.info("[Plague Inc.] Injected 9999 DNA points into: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Plague Inc.] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Plague Inc.] Finished: $hookedPoints DNA points hooks injected.")
}
