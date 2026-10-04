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
val plagueIncUnlockAllPlaguesPatch = bytecodePatch(
    name = "Unlock All Plagues & Disease Types - Plague Inc. (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all standard disease types (Bacteria, Virus, Fungus, Parasite, Prion, Nano-Virus, Bio-Weapon) and special plagues (Neurax Worm, Necroa Virus, Simian Flu, Shadow Plague) without Brutal completion.",
) {
    compatibleWith(COMPATIBILITY_PLAGUE_INC, COMPATIBILITY_PLAGUE_INC_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePlagueIncUnlockPlaguesLogic(logger)
    }
}

fun BytecodePatchContext.executePlagueIncUnlockPlaguesLogic(logger: Logger) {
    logger.info("Executing Unlock All Plagues & Disease Types patch for Plague Inc...")
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

            // Hook disease type unlock verification
            if (!isStatic && (
                mName == "isdiseaseunlocked" ||
                mName == "isplagueunlocked" ||
                mName == "hasunlockeddiseasetype" ||
                mName == "isspecialplagueunlocked" ||
                mName == "canselectdisease"
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
                    logger.info("[Plague Inc.] Unlocked plague type in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Plague Inc.] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Plague Inc.] Finished: $hookedPoints plague unlock hooks injected.")
}
