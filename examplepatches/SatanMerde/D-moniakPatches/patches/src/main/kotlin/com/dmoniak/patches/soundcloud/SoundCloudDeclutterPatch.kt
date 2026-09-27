package com.dmoniak.patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SOUNDCLOUD
import java.util.logging.Logger

@Suppress("unused")
val soundCloudDeclutterPatch = bytecodePatch(
    name = "Declutter UI & Hide Go+ Upsells - SoundCloud (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides persistent 'Try SoundCloud Go+' upgrade promotions, subscription nag cards, and declutters stream navigation.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSoundCloudDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeSoundCloudDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter UI & Hide Go+ Upsells patch for SoundCloud...")
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

            // 1. Hide Go+ upgrade / subscription banners
            if (!isStatic && (
                mName == "isupsellbannervisible" ||
                mName == "isgopluspromovisible" ||
                mName == "shouldshowupgradecard" ||
                mName == "isupgradenagenabled" ||
                mName == "hasactivesubscriptionbanner" ||
                mName == "shouldpromotego"
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
                    logger.info("[SoundCloud Declutter] Hidden Go+ promo/upsell: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SoundCloud Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SoundCloud Declutter] Total declutter hooks applied: $hookedPoints")
}
