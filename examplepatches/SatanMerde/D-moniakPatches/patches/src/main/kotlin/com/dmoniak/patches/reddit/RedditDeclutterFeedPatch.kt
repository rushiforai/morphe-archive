package com.dmoniak.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

@Suppress("unused")
val redditDeclutterFeedPatch = bytecodePatch(
    name = "Declutter Feed & Hide Recommendations - Reddit (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides 'Because you visited...', 'Communities you may like', 'Popular near you', awards animations, and live RPAN stream banners in Reddit.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRedditDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeRedditDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter Feed & Hide Recommendations patch for Reddit...")
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

            // Neutralize recommendations and suggested community carousels
            if (!isStatic && (
                mName == "isrecommendationitem" ||
                mName == "iscommunityrecommendation" ||
                mName == "shouldshowtrendingcarousel" ||
                mName == "shouldshowpopularnearyou" ||
                mName == "haslivestreambanner" ||
                mName == "isawardsanimationenabled"
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
                    logger.info("[Reddit Declutter] Suppressed clutter element in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Reddit Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Reddit Declutter] Finished: $hookedPoints declutter hooks injected.")
}
