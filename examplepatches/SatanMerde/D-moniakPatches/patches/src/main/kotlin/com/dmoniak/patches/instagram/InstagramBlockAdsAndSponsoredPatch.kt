package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramBlockAdsAndSponsoredPatch = bytecodePatch(
    name = "Block Ads & Sponsored Content - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips sponsored feed posts, sponsored stories, promoted reels, and shopping tags in Instagram.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramAdBlockLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramAdBlockLogic(logger: Logger) {
    logger.info("Executing Block Ads & Sponsored Content patch for Instagram...")
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

            // Neutralize sponsored and ad item conditions
            if (!isStatic && (
                mName == "issponsored" ||
                mName == "iscommercialitem" ||
                mName == "haspromotedbadge" ||
                mName == "isadfeedunit" ||
                mName == "issponsoredstory" ||
                mName == "issponsoredreel"
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
                    logger.info("[Instagram AdBlock] Disabled sponsored item flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram AdBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Drop ad tracking payloads
            if (!isStatic && (
                mName == "getsponsoredadpayload" ||
                mName == "getadviewitem"
            ) && retType.startsWith("L") && !retType.startsWith("Ljava/lang/String")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return-object v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Instagram AdBlock] Neutralized ad payload in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram AdBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram AdBlock] Finished: $hookedPoints ad hook points injected.")
}
