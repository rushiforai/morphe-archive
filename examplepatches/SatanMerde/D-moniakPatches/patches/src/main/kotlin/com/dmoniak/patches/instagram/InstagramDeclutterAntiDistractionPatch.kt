package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramDeclutterAntiDistractionPatch = bytecodePatch(
    name = "Anti-Distraction UI & Declutter - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides Reels tab button, hides 'Suggested Posts' ('You're all caught up'), hides Shop tab, and hides explore distractions.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramDeclutterLogic(logger: Logger) {
    logger.info("Executing Anti-Distraction UI & Declutter patch for Instagram...")
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

            // Neutralize Reels tab, suggested posts, shopping tab, and explore distractions
            if (!isStatic && (
                mName == "isreelstabvisible" ||
                mName == "shouldshowsuggestedposts" ||
                mName == "isshoppingtabenabled" ||
                mName == "shouldshowfollowcarousels" ||
                mName == "isexploredistractionenabled"
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
                    logger.info("[Instagram Declutter] Disabled distraction element in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Declutter] Finished: $hookedPoints declutter hooks injected.")
}
