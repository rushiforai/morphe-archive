package com.dmoniak.patches.windscribe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WINDSCRIBE
import java.util.logging.Logger

@Suppress("unused")
val windscribeDeclutterPatch = bytecodePatch(
    name = "Declutter UI & Hide Pro Upsells - Windscribe (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides Pro upgrade ribbons, promotional sales alerts, and persistent upgrade banners in the main location list.",
) {
    compatibleWith(COMPATIBILITY_WINDSCRIBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWindscribeDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeWindscribeDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI patch for Windscribe...")
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

            // Hide Pro promotion banners and sale cards
            if (!isStatic && (
                mName == "isupgradebannervisible" ||
                mName == "shouldshowpromobanner" ||
                mName == "shouldshowsalenotice" ||
                mName == "haspromotionalalert"
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
                    logger.info("[Windscribe Declutter] Hidden banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Windscribe Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Windscribe Declutter] Total declutter hooks applied: $hookedPoints")
}
