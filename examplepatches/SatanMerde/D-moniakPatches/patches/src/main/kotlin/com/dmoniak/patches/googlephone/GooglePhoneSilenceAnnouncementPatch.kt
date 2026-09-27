package com.dmoniak.patches.googlephone

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHONE
import java.util.logging.Logger

@Suppress("unused")
val googlePhoneSilenceAnnouncementPatch = bytecodePatch(
    name = "Silence Call Recording Warning - Phone by Google (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Mutes the audible 'This call is now being recorded' audio announcement tone when starting and stopping call recording.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHONE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhoneSilenceAnnouncementLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhoneSilenceAnnouncementLogic(logger: Logger) {
    logger.info("Executing Silence Call Recording Warning patch for Phone by Google...")
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

            // Hook playAnnouncement audio trigger
            if (!isStatic && (
                mName == "playrecordingannouncement" ||
                mName == "playdisclosurevoice" ||
                mName == "playcallrecordingwarning" ||
                mName == "speakdisclosure"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Google Phone] Muted announcement tone in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Phone] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Phone] Total silence announcement hooks applied: $hookedPoints")
}
