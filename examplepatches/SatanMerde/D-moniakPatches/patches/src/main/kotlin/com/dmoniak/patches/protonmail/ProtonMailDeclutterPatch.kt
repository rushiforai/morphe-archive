package com.dmoniak.patches.protonmail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_MAIL
import java.util.logging.Logger

@Suppress("unused")
val protonMailDeclutterPatch = bytecodePatch(
    name = "Declutter UI & Hide Upsells - Proton Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides storage upgrade alerts, Proton Unlimited promotion banners, and subscription upgrade reminders in Proton Mail.",
) {
    compatibleWith(COMPATIBILITY_PROTON_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonMailDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonMailDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI patch for Proton Mail...")
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

            // Hide storage upgrade and subscription promotional banners
            if (!isStatic && (
                mName == "isstoragebannervisible" ||
                mName == "shouldshowupgradealert" ||
                mName == "shouldshowpromotion" ||
                mName == "isupsellvisible"
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
                    logger.info("[Proton Mail Declutter] Hidden banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Mail Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Mail Declutter] Total declutter hooks applied: $hookedPoints")
}
