package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeSponsorBlockPatch = bytecodePatch(
    name = "SponsorBlock - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Automatically detects and skips sponsored video segments, sponsor intros/outros, self-promotions, interaction reminders, and filler music in YouTube videos via the community SponsorBlock API.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeSponsorBlockLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeSponsorBlockLogic(logger: Logger) {
    logger.info("Executing dedicated SponsorBlock patch for YouTube...")
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

            // 1. Enable SponsorBlock toggles and skip triggers
            if (!isStatic && (
                mName == "issponsorblockenabled" ||
                mName == "shouldautoskipsponsor" ||
                mName == "issponsorskippingenabled" ||
                mName == "shouldskipsponsorsegment" ||
                mName == "shouldskipsponsorintro" ||
                mName == "shouldskipsponsoroutro" ||
                mName == "shouldskipselfpromo" ||
                mName == "shouldskipinteractionreminder" ||
                mName == "isspsegmentskipped"
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
                    logger.info("[YouTube SponsorBlock] Enabled SponsorBlock skip flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube SponsorBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Segment bar color indicator on seekbar
            if (!isStatic && (
                mName == "shoulddrawsponsorsegments" ||
                mName == "issponsorsegmentbarvisible"
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
                    logger.info("[YouTube SponsorBlock] Enabled segment bar rendering in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube SponsorBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube SponsorBlock] Finished: $hookedPoints SponsorBlock hooks injected.")
}
