package com.dmoniak.patches.tutamail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TUTA_MAIL
import java.util.logging.Logger

@Suppress("unused")
val tutaMailDeclutterPatch = bytecodePatch(
    name = "Declutter UI & Hide Upgrade Banners - Tuta Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides promotional subscription upgrade banners (Revolutionary / Legend), storage warning popups, and upsell alerts in Tuta Mail.",
) {
    compatibleWith(COMPATIBILITY_TUTA_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTutaMailDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeTutaMailDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI patch for Tuta Mail...")
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

            // Hook upgrade / subscription promotion visibility
            if (!isStatic && (
                mName == "isupgradebannervisible" ||
                mName == "shouldshowupgradenotice" ||
                mName == "shouldshowsubscriptionbanner" ||
                mName == "isstorageupsellvisible"
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
                    logger.info("[Tuta Declutter] Hidden banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Tuta Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Tuta Declutter] Total declutter hooks applied: $hookedPoints")
}
